import sys

from torch.utils.data import Dataset, DataLoader
import torch.optim as optim
import numpy as np
import os
from torch.utils.tensorboard import SummaryWriter
import yaml
from Data.Carla import *
from MotionNet.Model import *
from utils import *

MODEL_CONFIG = "MotionNet"
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
train_dir = data_params["train_dir"]
val_dir = data_params["val_dir"]
test_dir = data_params["test_dir"]
num_workers = data_params["num_workers"]
remap = data_params["remap"]
voxelize_input = model_params["voxelize_input"]
binary_counts = model_params["binary_counts"]
transform_pose = model_params["transform_pose"]
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

model = MotionNet(height_feat_size=data_params["z_dim"], num_classes=data_params["num_classes"]).to(device)
criterion = nn.CrossEntropyLoss(ignore_index=0)

carla_ds = CarlaDataset(directory=train_dir, device=device, num_frames=T, random_flips=True, remap=remap, binary_counts=binary_counts, transform_pose=transform_pose)
dataloader = DataLoader(carla_ds, batch_size=B, shuffle=True, collate_fn=carla_ds.collate_fn, num_workers=num_workers)
val_ds = CarlaDataset(directory=val_dir, device=device, num_frames=T, remap=remap, binary_counts=binary_counts, transform_pose=transform_pose)
dataloader_val = DataLoader(val_ds, batch_size=B, shuffle=True, collate_fn=val_ds.collate_fn, num_workers=num_workers)
test_ds = CarlaDataset(directory=val_dir, device=device, num_frames=T,  remap=remap, binary_counts=binary_counts, transform_pose=transform_pose)
dataloader_test = DataLoader(test_ds, batch_size=1, shuffle=False, collate_fn=test_ds.collate_fn, num_workers=num_workers)

writer = SummaryWriter("./Models/Runs/" + MODEL_CONFIG)
save_dir = "./Models/Weights/" + MODEL_CONFIG

if not os.path.exists(save_dir):
    os.makedirs(save_dir)

if device == "cuda":
    torch.cuda.empty_cache()

setup_seed(seed)
optimizer = optim.Adam(model.parameters(), lr=lr, betas=(BETA1, BETA2))
my_lr_scheduler = torch.optim.lr_scheduler.ExponentialLR(optimizer=optimizer, gamma=decayRate)

train_count = 0
for epoch in range(epoch_num):
    # Training
    model.train()
    for input_data, output in dataloader:
        optimizer.zero_grad()
        input_data = torch.tensor(np.array(input_data)).to(device)
        output = torch.tensor(np.array(output)).to(device)
        preds = model(input_data) # B, C, H, W
        preds = torch.permute(preds, (0, 2, 3, 1))

        output = output.view(-1).long()
        preds = preds.contiguous().view(-1, preds.shape[3])

        # Remove zero
        mask = output != 0
        output_masked = output[mask]
        preds_masked = preds[mask]

        loss = criterion(preds_masked, output_masked)
        loss.backward()
        optimizer.step()

        # Accuracy
        with torch.no_grad():
            probs = torch.nn.functional.softmax(preds_masked, dim=1)
            preds_masked = np.argmax(probs.detach().cpu().numpy(), axis=1)
            outputs_np = output_masked.detach().cpu().numpy()
            accuracy = np.sum(preds_masked == outputs_np) / outputs_np.shape[0]

        # Record
        writer.add_scalar(MODEL_CONFIG + '/Loss/Train', loss.item(), train_count)
        writer.add_scalar(MODEL_CONFIG + '/Accuracy/Train', accuracy, train_count)

        train_count += input_data.shape[0]

    # Save model, decreaser learning rate
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

        for input_data, output in dataloader_val:
            optimizer.zero_grad()
            input_data = torch.tensor(np.array(input_data)).to(device)
            output = torch.tensor(np.array(output)).to(device)
            preds = model(input_data)
            preds = torch.permute(preds, (0, 2, 3, 1))

            output = output.view(-1).long()
            preds = preds.contiguous().view(-1, preds.shape[3])

            # Remove zero
            mask = output != 0
            output_masked = output[mask]
            preds_masked = preds[mask]
            loss = criterion(preds_masked, output_masked)

            running_loss += loss.item()
            counter += input_data.shape[0]

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