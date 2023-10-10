import sys

import torch
from torch.utils.data import Dataset, DataLoader
import torch.optim as optim
import numpy as np
import os
from torch.utils.tensorboard import SummaryWriter
import yaml
from Data.CarlaConvBKI import *
from SemanticMapNet.Model import *
from torch_scatter import scatter_max

import sys
sys.path.append("../EndToEnd/")
from Segmentation.spvcnn import *

from torchsparse import SparseTensor
from utils import *

MODEL_CONFIG = "SMNetT1"
DATA_CONFIG = "Carla"


model_params_file = os.path.join(os.getcwd(), "Configs", MODEL_CONFIG + ".yaml")
print(model_params_file)
with open(model_params_file, "r") as stream:
    try:
        model_params = yaml.safe_load(stream)
    except yaml.YAMLError as exc:
        print(exc)

data_params_file = os.path.join(os.getcwd(), "Configs", DATA_CONFIG + ".yaml")
with open(data_params_file, "r") as stream:
    try:
        data_params = yaml.safe_load(stream)
    except yaml.YAMLError as exc:
        print(exc)

device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

T = model_params["T"]
ds = model_params["ego_downsample"]
mem_feat_dim = model_params["mem_feat_dim"]
ego_feat_dim = model_params["ego_feat_dim"]
train_dir = data_params["train_dir"]
val_dir = data_params["val_dir"]
test_dir = data_params["test_dir"]
num_workers = data_params["num_workers"]
n_obj_classes = data_params["num_classes"]
remap = data_params["remap"]
seed = model_params["seed"]
B = model_params["B"]
momentum = model_params["momentum"]
decay = model_params["decay"]
lr = model_params["lr"]
epoch_num = model_params["epoch_num"]
decayRate = model_params["decayRate"]

coor_ranges = data_params['min_bound'] + data_params['max_bound']
voxel_sizes = [abs(coor_ranges[3] - coor_ranges[0]) / data_params["x_dim"],
              abs(coor_ranges[4] - coor_ranges[1]) / data_params["y_dim"],
              abs(coor_ranges[5] - coor_ranges[2]) / data_params["z_dim"]]

model = SMNet(ego_feat_dim, mem_feat_dim, n_obj_classes, ds, device).to(device)
counts = data_params["counts"]
# weights = torch.from_numpy(1 / np.log(np.array(counts) + 1e-6)).to(torch.float32)
criterion = nn.CrossEntropyLoss(ignore_index=0)

carla_ds = CarlaDataset(directory=train_dir, num_frames=T, remap=remap)
dataloader = DataLoader(carla_ds, batch_size=B, shuffle=True, collate_fn=carla_ds.collate_fn, num_workers=num_workers)
val_ds = CarlaDataset(directory=val_dir,num_frames=T, remap=remap)
dataloader_val = DataLoader(val_ds, batch_size=B, shuffle=True, collate_fn=val_ds.collate_fn, num_workers=num_workers)
test_ds = CarlaDataset(directory=val_dir, num_frames=T,  remap=remap)
dataloader_test = DataLoader(test_ds, batch_size=1, shuffle=False, collate_fn=test_ds.collate_fn, num_workers=num_workers)

writer = SummaryWriter("./Models/Runs/" + MODEL_CONFIG)
save_dir = "./Models/Weights/" + MODEL_CONFIG

if not os.path.exists(save_dir):
    os.makedirs(save_dir)

if device == "cuda":
    torch.cuda.empty_cache()

setup_seed(seed)
optimizer = optim.SGD(model.parameters(), lr=lr, momentum=momentum, weight_decay=decay)
# optimizer = optim.Adam(model.parameters(), lr=lr, betas=(0.9, 0.999))
my_lr_scheduler = torch.optim.lr_scheduler.ExponentialLR(optimizer=optimizer, gamma=decayRate)

# Segmentation
seg_net = SPVCNN(
    num_classes=n_obj_classes,
    cr=model_params["cr"],
    pres=model_params["pres"],
    vres=model_params["vres"]).to(device)

seg_net.load_state_dict(torch.load(model_params["weights_path"])['model'])
seg_net = remove_classifier(seg_net)
seg_net.eval()

train_count = 0
for epoch in range(epoch_num):
    model.train()
    for horizon_batch, pose_batch, output_batch in dataloader:
        optimizer.zero_grad()
        with torch.no_grad():
            all_feats, all_indices, all_inliers = \
                generate_smnet_input(pose_batch, horizon_batch, carla_ds, n_obj_classes, seg_net, device, model_params,
                                     data_params)
        semmap, observed_masks = model(all_feats, all_indices, all_inliers)
        output = torch.tensor(np.array(output_batch)).to(device)

        preds_masked = semmap.permute(0, 2, 3, 1)[observed_masks]
        output_masked = output[observed_masks]

        loss = criterion(preds_masked, output_masked)
        loss.backward()
        optimizer.step()

# Accuracy
        with torch.no_grad():
            probs = torch.nn.functional.softmax(preds_masked, dim=1)
            preds_masked = np.argmax(probs.detach().cpu().numpy(), axis=1)
            outputs_np = output_masked.detach().cpu().numpy()
            print("PRED:", np.unique(preds_masked, return_counts=True))
            print("GT:", np.unique(outputs_np, return_counts=True))
            accuracy = np.sum(preds_masked == outputs_np) / outputs_np.shape[0]

        # Record
        writer.add_scalar(MODEL_CONFIG + '/Loss/Train', loss.item(), train_count)
        writer.add_scalar(MODEL_CONFIG + '/Accuracy/Train', accuracy, train_count)

        train_count += all_feats.shape[0]

    # Save model, decrease learning rate
    my_lr_scheduler.step()
    torch.save(model.state_dict(), os.path.join(save_dir, "Epoch" + str(epoch) + ".pt"))

    # Validation
    model.eval()
    with torch.no_grad():
        running_loss = 0.0
        counter = 0
        num_correct = 0
        num_total = 0
        all_intersections = np.zeros(data_params["num_classes"])
        all_unions = np.zeros(data_params["num_classes"]) + 1e-6  # SMOOTHING

        for horizon_batch, pose_batch, output_batch in dataloader_val:
            with torch.no_grad():
                all_feats, all_indices, all_inliers = \
                    generate_smnet_input(pose_batch, horizon_batch, carla_ds, n_obj_classes, seg_net, device,
                                         model_params,
                                         data_params)
            semmap, observed_masks = model(all_feats, all_indices, all_inliers)
            output = torch.tensor(np.array(output_batch)).to(device)

            preds = semmap.permute(0, 2, 3, 1)[observed_masks]
            output = output[observed_masks]

            # Remove zero
            mask = output != 0
            output_masked = output[mask]
            preds_masked = preds[mask]
            loss = criterion(preds_masked, output_masked)

            running_loss += loss.item()
            counter += all_feats.shape[0]

            # Accuracy
            probs = torch.nn.functional.softmax(preds_masked, dim=1)
            preds_masked = np.argmax(probs.detach().cpu().numpy(), axis=1)
            outputs_np = output_masked.detach().cpu().numpy()
            num_correct += np.sum(preds_masked == outputs_np)
            num_total += outputs_np.shape[0]

            intersection, union = iou_one_frame(torch.tensor(preds_masked), torch.tensor(output_masked),
                                                n_classes=data_params["num_classes"])
            all_intersections += intersection
            all_unions += union

        print(f'Eppoch Num: {epoch} ------ average val loss: {running_loss / counter}')
        print(f'Eppoch Num: {epoch} ------ average val accuracy: {num_correct / num_total}')
        print(f'Eppoch Num: {epoch} ------ val miou: {np.mean(all_intersections / all_unions)}')
        writer.add_scalar(MODEL_CONFIG + '/Loss/Val', running_loss / counter, epoch)
        writer.add_scalar(MODEL_CONFIG + '/Accuracy/Val', num_correct / num_total, epoch)
        writer.add_scalar(MODEL_CONFIG + '/mIoU/Val', np.mean(all_intersections / all_unions), epoch)

writer.close()
