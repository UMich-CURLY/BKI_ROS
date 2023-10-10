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
model.load_state_dict(torch.load(model_params["model_path"]))
model.eval()

test_ds = CarlaDataset(directory=test_dir, device=device, num_frames=T,  remap=remap, binary_counts=binary_counts, transform_pose=transform_pose)
dataloader_test = DataLoader(test_ds, batch_size=1, shuffle=False, collate_fn=test_ds.collate_fn, num_workers=num_workers)

if device == "cuda":
    torch.cuda.empty_cache()

setup_seed(seed)


# Testing
model.eval()
with torch.no_grad():
    index_num = 0
    for input_data, __ in dataloader_test:
        input_data = torch.tensor(np.array(input_data)).to(device)
        preds = model(input_data)
        preds = torch.permute(preds, (0, 2, 3, 1))
        B, H, W, C = preds.shape
        probs = torch.nn.functional.softmax(preds, dim=3).view(H, W, C)

        fname = test_ds._velodyne_list[index_num]

        data_dir, file_num = fname.split("/velodyne/")
        pred_dir = os.path.join(data_dir, MODEL_CONFIG)
        if not os.path.exists(pred_dir):
            os.makedirs(pred_dir)
        save_path = os.path.join(pred_dir, file_num)

        preds_np = probs.detach().cpu().numpy().astype(np.float32)
        # pred_label = torch.argmax(probs, dim=2)
        # preds_np = pred_label.detach().cpu().numpy().astype(np.uint8)

        preds_np.tofile(save_path)
        index_num += 1