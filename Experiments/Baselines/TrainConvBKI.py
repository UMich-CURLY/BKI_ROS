import sys

import torch
from torch.utils.data import Dataset, DataLoader
import torch.optim as optim
import numpy as np
import os
from torch.utils.tensorboard import SummaryWriter
import yaml
from Data.CarlaConvBKI import *
from Data.RellisConvBKI import *
from SemanticMapNet.Model import *
from torch_scatter import scatter_max

import sys
sys.path.append("../EndToEnd/")
from Segmentation.spvcnn import *
from ConvBKI.ConvBKI import *

from torchsparse import SparseTensor
from utils import *

MODEL_CONFIG = "ConvBKIRellis"
DATA_CONFIG = "Rellis"


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
train_dir = data_params["train_dir"]
val_dir = data_params["val_dir"]
test_dir = data_params["test_dir"]
num_workers = data_params["num_workers"]
remap = model_params["remap"]
seed = model_params["seed"]
B = model_params["B"]
BETA1 = model_params["BETA1"]
BETA2 = model_params["BETA2"]
decayRate = model_params["DECAY"]
lr = model_params["lr"]
epoch_num = model_params["epoch_num"]

coor_ranges = data_params['min_bound'] + data_params['max_bound']
voxel_sizes = [abs(coor_ranges[3] - coor_ranges[0]) / data_params["x_dim"],
              abs(coor_ranges[4] - coor_ranges[1]) / data_params["y_dim"],
              abs(coor_ranges[5] - coor_ranges[2]) / data_params["z_dim"]]
grid_size = torch.tensor((model_params["x_dim"], model_params["y_dim"], model_params["z_dim"])).to(device)
min_bound = torch.tensor(data_params["min_bound"]).to(device)
max_bound = torch.tensor(data_params["max_bound"]).to(device)

model = ConvBKI(grid_size, min_bound, max_bound,
                    filter_size=model_params["f"], num_classes=data_params["num_classes"], device=device).to(device)

epsilon_w = 1e-5  # eps to avoid zero division
class_frequencies = np.array(data_params["counts"], dtype=np.float32)
weights = np.zeros(class_frequencies.shape)
weights[1:] = (1 / np.log(class_frequencies[1:] + epsilon_w) )
weights = torch.from_numpy(weights).to(device=device, non_blocking=True).float()
# criterion = nn.NLLLoss()
criterion = nn.NLLLoss(weight=weights, ignore_index=0)

# Train on a subset of val
if DATA_CONFIG == "Carla":
    train_ds = CarlaDataset(directory=train_dir, num_frames=T, remap=remap, bev=False)
    val_ds = CarlaDataset(directory=val_dir, num_frames=T, remap=remap, bev=False)
    test_ds = CarlaDataset(directory=test_dir, num_frames=T, remap=remap, bev=False)
elif DATA_CONFIG == "Rellis":
    train_ds = RellisDataset(directory=train_dir, num_frames=T, remap=remap, bev=False)
    val_ds = RellisDataset(directory=val_dir, num_frames=T, remap=remap, bev=False)
    test_ds = RellisDataset(directory=test_dir, num_frames=T, remap=remap, bev=False)
# val_ds = CarlaDataset(directory=val_dir, num_frames=T, remap=remap, bev=False)
dataloader_train = DataLoader(train_ds, batch_size=B, shuffle=True, collate_fn=train_ds.collate_fn, num_workers=num_workers)
# Validate on another subset of val
dataloader_val = DataLoader(val_ds, batch_size=B, shuffle=False, collate_fn=val_ds.collate_fn, num_workers=num_workers)
# Test set
dataloader_test = DataLoader(test_ds, batch_size=1, shuffle=False, collate_fn=test_ds.collate_fn, num_workers=num_workers)

writer = SummaryWriter("./Models/Runs/" + MODEL_CONFIG)
save_dir = "./Models/Weights/" + MODEL_CONFIG

if not os.path.exists(save_dir):
    os.makedirs(save_dir)

if device == "cuda":
    torch.cuda.empty_cache()

setup_seed(seed)
# optimizer = optim.SGD(model.parameters(), lr=lr, momentum=momentum, weight_decay=decay)
optimizer = optim.Adam(model.parameters(), lr=lr, betas=(BETA1, BETA2))
my_lr_scheduler = torch.optim.lr_scheduler.ExponentialLR(optimizer=optimizer, gamma=decayRate)

# Segmentation
seg_net = SPVCNN(
    num_classes=data_params["num_classes"],
    cr=model_params["cr"],
    pres=model_params["pres"],
    vres=model_params["vres"]).to(device)

seg_net.load_state_dict(torch.load(model_params["weights_path"])['model'])
seg_net.eval()


def training_loop(dataloader, NUM_CLASSES, train_count, SAVE_NAME, epoch, training=True):
    num_correct = 0
    num_total = 0
    all_intersections = np.zeros(NUM_CLASSES)
    all_unions = np.zeros(NUM_CLASSES) + 1e-6  # SMOOTHING

    if training:
        model.train()
    else:
        model.eval()
    num_samples = 0
    for horizon_batch, pose_batch, output_batch in dataloader:
        optimizer.zero_grad()
        batch_gt = torch.zeros((0, 1), device=device, dtype=torch.int32)
        batch_preds = torch.zeros((0, data_params["num_classes"]), device=device, dtype=torch.float32)

        with torch.no_grad():
            all_points, batch_labels = gen_convbki_input(pose_batch, horizon_batch, seg_net, device, model_params)
        for b in range(len(all_points)):
            current_map = torch.zeros(model.grid_size[0], model.grid_size[1], model.grid_size[2],
                                   model.num_classes, device=model.device, requires_grad=True,
                                   dtype=torch.float32) + model.prior
            pc_np = np.vstack(np.array(all_points[b]))
            all_labels = torch.vstack(batch_labels[b])
            # For one-hot encoding
            if model_params["argmax"]:
                all_labels = torch.argmax(all_labels, dim=1).reshape(-1, 1)
            pc_torch = torch.from_numpy(pc_np).to(device)
            labeled_pc_torch = torch.hstack((pc_torch, all_labels)).to(torch.float32)

            preds = model(current_map, labeled_pc_torch)
            gt_sem_labels = torch.from_numpy(output_batch[b]).to(device, non_blocking=True)

            last_pc_torch = torch.from_numpy(horizon_batch[b][-1]).to(device, non_blocking=True)[:, :3]
            # Check which are in bounds
            valid_point_mask = torch.all((last_pc_torch < max_bound) & (last_pc_torch >= min_bound), axis=1)
            last_pc_torch = last_pc_torch[valid_point_mask]
            gt_sem_labels = gt_sem_labels[valid_point_mask]
            # Make predictions
            sem_preds = points_to_voxels_torch(preds, last_pc_torch, model.min_bound, model.grid_size, model.voxel_sizes)
            sem_preds = sem_preds / torch.sum(sem_preds, dim=-1, keepdim=True)

            non_void_mask = gt_sem_labels != 0
            batch_gt = torch.vstack((batch_gt, gt_sem_labels[non_void_mask].view(-1, 1)))
            batch_preds = torch.vstack((batch_preds, sem_preds[non_void_mask, :]))

        batch_gt = batch_gt.reshape(-1)
        # Remove ignore labels
        not_ignore_mask = batch_gt != 0
        batch_preds = batch_preds[not_ignore_mask, :]
        batch_gt = batch_gt[not_ignore_mask]
        loss = criterion(torch.log(batch_preds), batch_gt.long())

        if training:
            print("Z:", model.ell_z)
            print("H:", model.ell_h)
            loss.backward()
            optimizer.step()
            for p in model.parameters():
                p.data.clamp_(0.01, 1.0)

        # Accuracy
        with torch.no_grad():
            # Softmax on expectation
            max_batch_preds = torch.argmax(batch_preds, dim=-1)
            preds_masked = max_batch_preds.cpu().numpy()
            voxels_np = batch_gt.detach().cpu().numpy()
            num_correct += np.sum(preds_masked == voxels_np)
            num_total += voxels_np.shape[0]
            accuracy = np.sum(preds_masked == voxels_np) / voxels_np.shape[0]

            inter, union = iou_one_frame(max_batch_preds, batch_gt, n_classes=NUM_CLASSES)
            union += 1e-6
            all_intersections += inter
            all_unions += union

        # Record
        if training:
            writer.add_scalar(SAVE_NAME + '/Loss/Train', loss.item(), train_count)
            writer.add_scalar(SAVE_NAME + '/Accuracy/Train', accuracy, train_count)
            writer.add_scalar(SAVE_NAME + '/mIoU/Train', np.mean(inter / union), train_count)

            train_count += len(horizon_batch)

    # Save model, decrease learning rate
    if training:
        my_lr_scheduler.step()
        print("Epoch ", epoch)

    if not training:
        all_intersections = all_intersections[all_unions > 0]
        all_unions = all_unions[all_unions > 0]
        print(f'Epoch Num: {epoch} ------ average val accuracy: {num_correct / num_total}')
        print(f'Epoch Num: {epoch} ------ val miou: {np.mean(all_intersections / all_unions)}')
        writer.add_scalar(SAVE_NAME + '/Accuracy/Val', num_correct / num_total, epoch)
        writer.add_scalar(SAVE_NAME + '/mIoU/Val', np.mean(all_intersections / all_unions), epoch)

    return model, train_count


train_count = 0
# training_loop(dataloader_val, data_params["num_classes"], train_count, "./Models/Runs/" + MODEL_CONFIG, 0, training=False)
for i in range(model_params["epoch_num"]):
    torch.save(model.state_dict(), os.path.join(save_dir, "Epoch" + str(i) + ".pt"))
    model.train()
    __, train_count = training_loop(dataloader_train, data_params["num_classes"], train_count, "./Models/Runs/" + MODEL_CONFIG, i, training=True)
    model.eval()
    training_loop(dataloader_val, data_params["num_classes"], train_count, "./Models/Runs/" + MODEL_CONFIG, i + 1, training=False)

