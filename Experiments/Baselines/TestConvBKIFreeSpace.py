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
from ConvBKI.ConvBKI import *

from torchsparse import SparseTensor
from utils import *

MODEL_CONFIG = "ConvBKI"
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

T = model_params["T_test"]
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

# Test set
test_ds = CarlaDataset(directory=test_dir, num_frames=T,  remap=remap, bev=False)
dataloader_test = DataLoader(test_ds, batch_size=1, shuffle=False, collate_fn=test_ds.collate_fn, num_workers=num_workers)

if device == "cuda":
    torch.cuda.empty_cache()

setup_seed(seed)

# Segmentation
seg_net = SPVCNN(
    num_classes=data_params["num_classes"],
    cr=model_params["cr"],
    pres=model_params["pres"],
    vres=model_params["vres"]).to(device)

seg_net.load_state_dict(torch.load(model_params["weights_path"], map_location=device)['model'])
seg_net.eval()

model.load_state_dict(torch.load(model_params["model_path"], map_location=device))
model.eval()

# TODO: Create a free space class
temp_model = ConvBKI(grid_size, min_bound, max_bound,
                    filter_size=model_params["f"], num_classes=data_params["num_classes"] + 1, device=device).to(device)
with torch.no_grad():
    temp_model.ell_h[:-1] = model.ell_h
    temp_model.ell_z[:-1] = model.ell_z
    temp_model.ell_h[-1] = 0.1
    temp_model.ell_z[-1] = 0.1
model = temp_model

height, bev_index, indices = voxel_indices(grid_size, device)

# Testing
model.eval()
with torch.no_grad():
    index_num = 0
    for horizon_batch, pose_batch, output_batch in dataloader_test:
        print(index_num)
        torch.cuda.empty_cache()
        all_points, batch_labels = gen_convbki_input(pose_batch, horizon_batch, seg_net, device, model_params, freespace=True)
        b = 0
        current_map = torch.zeros(model.grid_size[0], model.grid_size[1], model.grid_size[2],
                                  model.num_classes, device=model.device, requires_grad=True,
                                  dtype=torch.float32) + model.prior
        for t in range(len(all_points[b])):
            pc_np = all_points[b][t]
            all_labels = batch_labels[b][t]
            pc_torch = torch.from_numpy(pc_np).to(device)
            labeled_pc_torch = torch.hstack((pc_torch, all_labels)).to(torch.float32)
            current_map = model(current_map, labeled_pc_torch)
        preds = current_map

        # Traverse down the map to generate BEV
        BEV_preds = convbki_preds(preds, model_params, height, bev_index, indices, data_params, device,
                                  free_label=data_params["num_classes"])

        fname = test_ds._velodyne_list[index_num]

        data_dir, file_num = fname.split("/velodyne/")
        pred_dir = os.path.join(data_dir, MODEL_CONFIG)
        if not os.path.exists(pred_dir):
            os.makedirs(pred_dir)
        save_path = os.path.join(pred_dir, file_num)

        preds_np = BEV_preds.detach().cpu().numpy().astype(np.float32)

        preds_np.tofile(save_path) # Note that the predictions are dirichlet parameters, not probability distributions
        index_num += 1
