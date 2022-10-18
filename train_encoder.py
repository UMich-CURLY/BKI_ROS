import os
import pdb
import time
import json
import yaml
os.environ["CUDA_LAUNCH_BLOCKING"] = "1"

import numpy as np

# Torch imports
import torch
from torch import nn
import torch.optim as optim
from torch.utils.data import Dataset, DataLoader
from torch.utils.tensorboard import SummaryWriter

# Custom Imports
from Data.utils import *
from Models.model_utils import *
from Models.ConvBKI import *
from Data.Rellis3D import Rellis3dDataset
from chamferdist import ChamferDistance

MODEL_NAME = "Encoder"

device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
print("device is ", device)
print("Model is", MODEL_NAME)

model_params_file = os.path.join(os.getcwd(), "Config", MODEL_NAME + ".yaml")

with open(model_params_file, "r") as stream:
    try:
        model_params = yaml.safe_load(stream)
        dataset = model_params["dataset"]
        SAVE_NAME = model_params["save_dir"]
    except yaml.YAMLError as exc:
        print(exc)

# CONSTANTS
SEED = model_params["seed"]
DEBUG_MODE = model_params["debug_mode"]
NUM_FRAMES = model_params["num_frames"]
MODEL_RUN_DIR = os.path.join("Models", "Runs", SAVE_NAME)
NUM_WORKERS = model_params["num_workers"]
FLOAT_TYPE = torch.float32
LABEL_TYPE = torch.uint8

if not os.path.exists(MODEL_RUN_DIR):
    os.makedirs(MODEL_RUN_DIR)

# Data Parameters
data_params_file = os.path.join(os.getcwd(), "Config", dataset + ".yaml")
with open(data_params_file, "r") as stream:
    try:
        data_params = yaml.safe_load(stream)
        NUM_CLASSES = data_params["num_classes"]
        class_frequencies = np.asarray([data_params["class_counts"][i] for i in range(NUM_CLASSES)])
        TRAIN_DIR = data_params["data_dir"]
    except yaml.YAMLError as exc:
        print(exc)

epsilon_w = 1e-5  # eps to avoid zero division
weights = np.zeros(class_frequencies.shape)
weights[1:] = (1 / np.log(class_frequencies[1:] + epsilon_w) )
weights = torch.from_numpy(weights).to(dtype=FLOAT_TYPE, device=device)
scenes = [ s for s in sorted(os.listdir(TRAIN_DIR)) if s.isdigit() ]

# Load model
lr = model_params["train"]["lr"]
motion_weight = model_params["train"]["motion_weight"]
BETA1 = model_params["train"]["BETA1"]
BETA2 = model_params["train"]["BETA2"]
decayRate = model_params["train"]["decayRate"]
B = model_params["train"]["B"]
EPOCH_NUM = model_params["train"]["num_epochs"]
model_params["device"] = device
model_params["num_classes"] = NUM_CLASSES
model_params["datatype"] = FLOAT_TYPE
model = get_model(MODEL_NAME, model_params=model_params)

if dataset == "rellis":
    train_ds = Rellis3dDataset(model_params["train"]["grid_params"], directory=TRAIN_DIR, device=device,
                               num_frames=NUM_FRAMES, remap=True, use_aug=False)
    val_ds = Rellis3dDataset(model_params["train"]["grid_params"], directory=TRAIN_DIR, device=device,
                             num_frames=NUM_FRAMES, remap=True, use_aug=False, data_split="val")

dataloader_train = DataLoader(train_ds, batch_size=B, shuffle=True, collate_fn=train_ds.collate_fn, num_workers=NUM_WORKERS)
dataloader_val = DataLoader(val_ds, batch_size=B, shuffle=False, collate_fn=val_ds.collate_fn, num_workers=NUM_WORKERS)

trial_dir = MODEL_RUN_DIR
save_dir = os.path.join("Models", "Weights", SAVE_NAME)
if not DEBUG_MODE:
    if os.path.exists(save_dir):
        print("Error: path already exists")
        exit()

if not os.path.exists(trial_dir):
    os.makedirs(trial_dir)
if not os.path.exists(save_dir):
    os.makedirs(save_dir)

writer = SummaryWriter(MODEL_RUN_DIR)

# Optimizer setup
setup_seed(SEED)
if model_params["train"]["opt"] == "Adam":
    optimizer = optim.Adam(model.parameters(), lr=lr, betas=(BETA1, BETA2))
else:
    optimizer = optim.SGD(model.parameters(), lr=lr)
my_lr_scheduler = torch.optim.lr_scheduler.ExponentialLR(optimizer=optimizer, gamma=decayRate)
torch.optim.lr_scheduler.CosineAnnealingLR(optimizer=optimizer, T_max=100, eta_min=1e-4, verbose=True)

train_count = 0
min_bound_torch = torch.from_numpy(train_ds.min_bound).to(device=device)
grid_dims_torch = torch.from_numpy(train_ds.grid_dims).to(dtype=torch.int, device=device)
voxel_sizes_torch = torch.from_numpy(train_ds.voxel_sizes).to(device=device)

semantic_loss_fun = nn.CrossEntropyLoss(weight=weights, ignore_index=0)
chamfer_fun = ChamferDistance()


def downsample_pc(points, num=10000):
    idx = torch.randperm(points.shape[0])[:num]
    return points[idx, :]


def transform_points(points_a, pose_a, pose_b):
    ego_pose = torch.from_numpy(pose_b).to(device)
    to_ego = torch.linalg.inv(ego_pose)
    pose = torch.from_numpy(pose_a).to(device)
    points = torch.from_numpy(points_a).to(device)
    relative_pose = torch.matmul(to_ego, pose).float()
    transformed_points = torch.matmul(relative_pose[:3, :3], points.T).T + relative_pose[:3, 3]
    return transformed_points


# Calculate self-supervised scene flow loss, ego-motion compensated
# pip3 install chamferdist https://github.com/krrish94/chamferdist
def criterion_motion(points, poses, pred_motion):
    batch_a = []
    batch_b = []
    for b in range(len(points)):
        points_a, points_b = [points[b][-2], points[b][-1]]
        pose_a, pose_b = [poses[b][-2], poses[b][-1]]
        if pose_a is None:
            continue
        points_a_ego = transform_points(points_a, pose_a, pose_b)
        motion_pc, motion_mask = model.label_points(pred_motion[b], points_a_ego)
        pc_a_masked = points_a_ego[motion_mask, :]
        points_a_moved = pc_a_masked + motion_pc
        points_b = torch.from_numpy(points_b).to(device)
        batch_a.append(downsample_pc(points_a_moved))
        batch_b.append(downsample_pc(points_b))
    if len(batch_a) < 1:
        return 0
    chamf_dist = chamfer_fun(torch.stack(batch_a), torch.stack(batch_b), bidirectional=True)
    return chamf_dist / len(batch_a)


def criterion_semantic(semantic_preds, gt_labels, poses, points):
    batch_preds = torch.zeros((0, NUM_CLASSES), device=device, dtype=FLOAT_TYPE)
    batch_gt = torch.zeros((0, 1), device=device, dtype=LABEL_TYPE)
    for b in range(len(poses)):
        semantic_pred_b, semantic_mask = model.label_points(semantic_preds[b],
                                                            torch.from_numpy(points[b][-1]).to(device))
        gt_b = gt_labels[b]
        valid_gt_b = torch.tensor(gt_b).to(device)[semantic_mask]
        batch_gt = torch.vstack((batch_gt, valid_gt_b))
        batch_preds = torch.vstack((batch_preds, semantic_pred_b))

    batch_gt = batch_gt.reshape(-1)
    # Remove ignore labels
    loss_semantic = semantic_loss_fun(batch_preds, batch_gt.long())
    return loss_semantic, batch_gt, batch_preds


def semantic_loop(dataloader, epoch, train_count=None, training=False):
    num_correct = 0
    num_total = 0
    all_intersections = np.zeros(NUM_CLASSES)
    all_unions = np.zeros(NUM_CLASSES) + 1e-6  # SMOOTHING

    for points, gt_labels, poses in dataloader:
        optimizer.zero_grad()

        semantic_preds, motion_preds = model(points, poses)

        loss_motion = motion_weight * criterion_motion(points, poses, motion_preds)
        loss_semantic, batch_gt, batch_preds = criterion_semantic(semantic_preds, gt_labels, poses, points)
        loss = loss_motion + loss_semantic

        if training:
            loss.backward()
            optimizer.step()

        non_zero = batch_gt != 0
        batch_gt = batch_gt[non_zero]
        batch_preds = batch_preds[non_zero, :]

        # Accuracy
        with torch.no_grad():
            # Softmax on expectation
            probs = nn.functional.softmax(batch_preds, dim=1)
            max_batch_preds = torch.argmax(probs, dim=-1)
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
            writer.add_scalar(SAVE_NAME + '/Loss_Motion/Train', loss_motion.item(), train_count)
            writer.add_scalar(SAVE_NAME + '/Loss_Semantic/Train', loss_semantic.item(), train_count)
            writer.add_scalar(SAVE_NAME + '/Accuracy/Train', accuracy, train_count)
            writer.add_scalar(SAVE_NAME + '/mIoU/Train', np.mean(inter[1:] / union[1:]), train_count)

            train_count += len(points)

    # Save model, decrease learning rate
    if training:
        my_lr_scheduler.step()
        print("Epoch ", epoch, " out of ", EPOCH_NUM, " complete.")

    if not training:
        all_intersections = all_intersections[1:]
        all_unions = all_unions[1:]
        print(f'Epoch Num: {epoch} ------ average val accuracy: {num_correct/num_total}')
        print(f'Epoch Num: {epoch} ------ val miou: {np.mean(all_intersections / all_unions)}')
        writer.add_scalar(SAVE_NAME + '/Accuracy/Val', num_correct/num_total, epoch)
        writer.add_scalar(SAVE_NAME + '/mIoU/Val', np.mean(all_intersections / all_unions), epoch)

    return model, train_count


model.eval()
with torch.no_grad():
    semantic_loop(dataloader_val, 0, training=False)

for epoch in range(EPOCH_NUM):
    # Training
    model.train()
    idx = 0
    model, train_count = semantic_loop(dataloader_train, epoch, train_count=train_count, training=True)

    # Validation
    model.eval()
    with torch.no_grad():
        semantic_loop(dataloader_val, epoch+1, training=False)

    # Save weights
    if not DEBUG_MODE:
        torch.save(model, os.path.join("Models", "Weights", SAVE_NAME, "filters" + str(epoch+1) + ".pt"))

writer.close()