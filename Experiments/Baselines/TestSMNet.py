import sys

import torch
from torch.utils.data import Dataset, DataLoader
import torch.optim as optim
import numpy as np
import os
from torch.utils.tensorboard import SummaryWriter
import yaml
# from Data.CarlaConvBKI import *
from Data.CarlaSMNet import *
from Data.KITTISMNet import *
from SemanticMapNet.Model import *
from torch_scatter import scatter_max

import sys
sys.path.append("../EndToEnd/")
from Segmentation.spvcnn import *

from torchsparse import SparseTensor
from utils import *

MODEL_CONFIG = "SMNet"
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
remap = data_params["remap"]
ds = model_params["ego_downsample"]
mem_feat_dim = model_params["mem_feat_dim"]
ego_feat_dim = model_params["ego_feat_dim"]
test_dir = data_params["test_dir"]
num_workers = data_params["num_workers"]
n_obj_classes = data_params["num_classes"]
seed = model_params["seed"]
mem_type = model_params["mem_type"]

coor_ranges = data_params['min_bound'] + data_params['max_bound']
voxel_sizes = [abs(coor_ranges[3] - coor_ranges[0]) / data_params["x_dim"],
              abs(coor_ranges[4] - coor_ranges[1]) / data_params["y_dim"],
              abs(coor_ranges[5] - coor_ranges[2]) / data_params["z_dim"]]

model = SMNet(ego_feat_dim, mem_feat_dim, n_obj_classes, ds, device, model_type=mem_type).to(device)

# Test set
if DATA_CONFIG == "Carla":
    test_ds = CarlaDataset(directory=test_dir, num_frames=T,  remap=remap)
else:
    if "Transfer" in MODEL_CONFIG:
        test_ds = KITTIDataset(test_dir, data_params["eval_params"], num_frames=T, remap=remap, get_gt=False, transfer=True)
    else:
        test_ds = KITTIDataset(test_dir, data_params["eval_params"], num_frames=T, remap=remap, get_gt=False)

dataloader_test = DataLoader(test_ds, batch_size=1, shuffle=False, collate_fn=test_ds.collate_fn, num_workers=num_workers)

if device == "cuda":
    torch.cuda.empty_cache()

setup_seed(seed)

if "Transfer" in MODEL_CONFIG:
    num_classes = 19
else:
    num_classes = data_params["num_classes"]

model.load_state_dict(torch.load(model_params["model_path"]))
model.eval()

# Testing
model.eval()
with torch.no_grad():
    index_num = 0
    for horizon_batch, pose_batch, feats, output_batch in dataloader_test:
        print(index_num)
        all_feats, all_inliers = \
            generate_smnet_input(pose_batch, horizon_batch, test_ds, n_obj_classes, None, device, model_params,
                                 data_params, input_feats=feats)
        semmap, observed_masks = model(all_feats, all_inliers)
        B, C, H, W = semmap.shape
        preds = semmap.view(C, H, W).permute(1, 2, 0)
        preds = torch.nn.functional.softmax(preds, dim=2)
        mask = observed_masks.view(H, W)

        fname = test_ds._velodyne_list[index_num]

        data_dir, file_num = fname.split("/velodyne/")
        # For BEV predictions
        pred_dir = os.path.join(data_dir, MODEL_CONFIG)
        if not os.path.exists(pred_dir):
            os.makedirs(pred_dir)
        save_path = os.path.join(pred_dir, file_num)
        # For visible mask
        mask_dir = os.path.join(data_dir, "mask")
        if not os.path.exists(mask_dir):
            os.makedirs(mask_dir)
        mask_path = os.path.join(mask_dir, file_num)

        preds_np = preds.detach().cpu().numpy().astype(np.float32)
        mask_np = mask.detach().cpu().numpy().astype(np.uint8)

        preds_np.tofile(save_path)
        mask_np.tofile(mask_path)

        index_num += 1
