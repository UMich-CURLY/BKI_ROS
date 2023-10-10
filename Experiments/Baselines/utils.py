import torch
import numpy as np
import random
import torch.nn as nn
import torch.nn.functional as F
from torchsparse import SparseTensor
from torchsparse.utils.quantize import sparse_quantize
from torchsparse.utils.collate import sparse_collate
from torch_scatter import scatter_max
import time

import rospy
from visualization_msgs.msg import *
from geometry_msgs.msg import Point32
from std_msgs.msg import ColorRGBA


# Remove classifier layer
class Identity(nn.Module):
    def __init__(self):
        super(Identity, self).__init__()

    def forward(self, x):
        return x


def remove_classifier(seg_net):
    seg_net.classifier = Identity()
    return seg_net


def setup_seed(seed=42):
    torch.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    np.random.seed(seed)
    random.seed(seed)


def iou_one_frame(pred, target, n_classes=23):
    pred = pred.view(-1).detach().cpu().numpy()
    target = target.view(-1).detach().cpu().numpy()
    intersection = np.zeros(n_classes)
    union = np.zeros(n_classes)

    for cls in range(n_classes):
        intersection[cls] = np.sum((pred == cls) & (target == cls))
        union[cls] = np.sum((pred == cls) | (target == cls))
    return intersection, union


def generate_seg_in(lidar, res, device="cuda"):
    # Create input data
    coords = np.round(lidar[:, :3] / res)
    coords -= coords.min(0, keepdims=1)
    feats = lidar
    # Filter out duplicate points
    coords, indices, inverse = sparse_quantize(coords, return_index=True, return_inverse=True)
    coords = torch.tensor(coords, dtype=torch.int)
    feats = torch.tensor(feats[indices], dtype=torch.float)

    inputs = SparseTensor(coords=coords, feats=feats)
    inputs = sparse_collate([inputs]).to(device)
    return inputs, inverse


def points_to_voxels(lidar, point_features, carla_ds):
    # Mask inliers
    points = lidar[:, :3]
    valid_point_mask = np.all((points < carla_ds.max_bound) & (points >= carla_ds.min_bound), axis=1)
    point_features = point_features[valid_point_mask, :]
    points = points[valid_point_mask, :]
    # Convert to voxels
    voxels = np.floor((points - carla_ds.min_bound) / carla_ds.voxel_sizes).astype(np.int)
    # Clamp to account for any floating point errors
    maxes = np.reshape(carla_ds.grid_dims - 1, (1, 3))
    mins = np.zeros_like(maxes)
    voxels = np.clip(voxels, mins, maxes).astype(np.int)
    return voxels, point_features


def transform_lidar(points, relative_pose):
    points = np.dot(relative_pose[:3, :3], points.T).T + relative_pose[:3, 3]
    return points


def create_bev(lidar, point_features, carla_ds, data_params, device):
    voxels, point_features = points_to_voxels(lidar, point_features, carla_ds)

    # Get highest xy
    height = voxels[:, 2] + 1000
    bev_index = voxels[:, 0] + data_params["x_dim"] * voxels[:, 1]

    bev_index = torch.from_numpy(bev_index).to(device).long()
    height = torch.from_numpy(height).to(device)
    flat_highest_z = torch.zeros(data_params["x_dim"] * data_params["y_dim"], device=device).long()
    flat_highest_z, argmax_flat_spatial_map = scatter_max(
        height,
        bev_index,
        dim=0,
        out=flat_highest_z
    )
    voxels = torch.from_numpy(voxels).to(device).long()
    highest_indices = argmax_flat_spatial_map[argmax_flat_spatial_map != point_features.shape[0]]
    # Create input
    highest_voxels = voxels[highest_indices, :]
    highest_x = highest_voxels[:, 0]
    highest_y = highest_voxels[:, 1]
    highest_feats = point_features[highest_indices, :]

    bev_features = torch.zeros((data_params["x_dim"], data_params["y_dim"], point_features.shape[1]), device=device)
    bev_features[highest_x, highest_y, :] = highest_feats

    mask_inliers = torch.zeros((data_params["x_dim"], data_params["y_dim"]), device=device)
    mask_inliers[highest_x, highest_y] = 1
    return bev_features, mask_inliers


def generate_smnet_input(pose_batch, horizon_batch, carla_ds, n_obj_classes, seg_net, device, model_params, data_params,
                         input_feats=None):
    B = len(pose_batch)
    T = len(pose_batch[0])
    H = int(carla_ds.grid_dims[0])
    W = int(carla_ds.grid_dims[1])
    C = model_params["ego_feat_dim"]
    all_feats = torch.zeros((B, T, H, W, C), device=device)
    all_inliers = torch.zeros((B, T, H, W), device=device).int()
    for b_i in range(len(pose_batch)):
        for t_i in range(len(pose_batch[b_i])):
            lidar = horizon_batch[b_i][t_i]
            if lidar.shape[0] == 1:
                continue
            else:
                with torch.no_grad():
                    if input_feats is None:
                        seg_input, inv = generate_seg_in(lidar, model_params["vres"])
                        point_features = seg_net(seg_input.to(device))[inv]
                    else:
                        point_features = torch.tensor(input_feats[b_i][t_i], device=device)
                    transformed_points = transform_lidar(lidar[:, :3], pose_batch[b_i][t_i])
                    bev_features, mask_inliers = \
                        create_bev(transformed_points, point_features, carla_ds, data_params, device)
                    all_feats[b_i, t_i, :, :, :] = bev_features
                    all_inliers[b_i, t_i, :, :] = mask_inliers.int()
    return all_feats, all_inliers


def gen_convbki_input(pose_batch, horizon_batch, seg_net, device, model_params, freespace=False, free_dist=0.5):
    all_labels = []
    all_points = []
    for b_i in range(len(pose_batch)):
        labels_b = []
        points_b = []
        for t_i in range(len(pose_batch[b_i])):
            lidar = horizon_batch[b_i][t_i]
            if lidar.shape[0] == 1:
                continue
            else:
                with torch.no_grad():
                    seg_input, inv = generate_seg_in(lidar, model_params["vres"], device=device)
                    point_labels = F.softmax(seg_net(seg_input.to(device))[inv], dim=1)
                    transformed_points = transform_lidar(lidar[:, :3], pose_batch[b_i][t_i])
                    if freespace:
                        point_labels = torch.hstack((point_labels, torch.zeros((point_labels.shape[0], 1), device=device)))
                        free_samples, free_labels = ray_trace_batch(transformed_points, free_dist)
                        point_labels = torch.vstack((point_labels, free_labels))
                        transformed_points = np.vstack((transformed_points, free_samples.detach().cpu().numpy()))
                    labels_b.append(point_labels)
                    points_b.append(transformed_points)
        all_labels.append(labels_b)
        all_points.append(points_b)
    return all_points, all_labels


def points_to_voxels_torch(voxel_grid, points, min_bound, grid_dims, voxel_sizes):
    voxels = torch.floor((points - min_bound) / voxel_sizes).to(dtype=torch.int)
    # Clamp to account for any floating point errors
    maxes = (grid_dims - 1).reshape(1, 3)
    mins = torch.zeros_like(maxes)
    voxels = torch.clip(voxels, mins, maxes).to(dtype=torch.long)

    voxel_grid = voxel_grid[voxels[:, 0], voxels[:, 1], voxels[:, 2]]
    return voxel_grid


def remap_colors(colors):
    # color
    colors_temp = np.zeros((len(colors), 3))
    for i in range(len(colors)):
        colors_temp[i, :] = colors[i]
    colors = colors_temp.astype("int")
    colors = colors / 255.0
    return colors


def publish_local_map(labeled_grid, centroids, max_dim, min_dim, grid_dims, colors, next_map):
    next_map.markers.clear()
    marker = Marker()
    marker.id = 0
    marker.ns = "Local Semantic Map"
    marker.header.frame_id = "map"
    marker.type = marker.CUBE_LIST
    marker.action = marker.ADD
    marker.lifetime.secs = 0
    marker.header.stamp = rospy.Time.now()

    marker.pose.orientation.x = 0.0
    marker.pose.orientation.y = 0.0
    marker.pose.orientation.z = 0.0
    marker.pose.orientation.w = 1

    marker.scale.x = (max_dim[0] - min_dim[0]) / grid_dims[0]
    marker.scale.y = (max_dim[1] - min_dim[1]) / grid_dims[1]
    marker.scale.z = (max_dim[2] - min_dim[2]) / grid_dims[2]

    X, Y, Z, C = labeled_grid.shape
    semantic_labels = labeled_grid.view(-1, C).detach().cpu().numpy()
    centroids = centroids.detach().cpu().numpy()

    semantic_sums = np.sum(semantic_labels, axis=-1, keepdims=False)
    valid_mask = semantic_sums >= 1

    semantic_labels = semantic_labels[valid_mask, :]
    centroids = centroids[valid_mask, :]

    semantic_labels = np.argmax(semantic_labels / np.sum(semantic_labels, axis=-1, keepdims=True), axis=-1)
    semantic_labels = semantic_labels.reshape(-1, 1)

    for i in range(semantic_labels.shape[0]):
        pred = semantic_labels[i]
        point = Point32()
        color = ColorRGBA()
        point.x = centroids[i, 0]
        point.y = centroids[i, 1]
        point.z = centroids[i, 2]
        color.r, color.g, color.b = colors[pred].squeeze()

        color.a = 1.0
        marker.points.append(point)
        marker.colors.append(color)

    next_map.markers.append(marker)
    return next_map


def voxel_indices(grid_size, device):
    [xs, ys, zs] = [torch.arange(grid_size[i], device=device)
                    for i in range(3)]
    indices = torch.cartesian_prod(xs, ys, zs).to(device)

    height = indices[:, 2]
    bev_index = indices[:, 0] + grid_size[0] * indices[:, 1]
    bev_index = bev_index.long()

    return height, bev_index, indices


def convbki_preds(preds, model_params, height, bev_index, indices, data_params, device, free_label=None):
    H, W, Z, C = preds.shape
    valid_mask = (torch.sum(preds, dim=3) > model_params["MIN_THRESH"]).view(-1)

    flat_preds = preds.view(-1, C)
    valid_height = height[valid_mask]
    valid_bev = bev_index[valid_mask]
    valid_preds = flat_preds[valid_mask]
    valid_indices = indices[valid_mask]

    if free_label:
        max_label = torch.argmax(valid_preds, dim=1)
        occupied_mask = max_label != free_label
        valid_height = valid_height[occupied_mask]
        valid_bev = valid_bev[occupied_mask]
        valid_preds = valid_preds[occupied_mask]
        valid_indices = valid_indices[occupied_mask]

    flat_highest_z = torch.zeros(data_params["x_dim"] * data_params["y_dim"], device=device).long()
    flat_highest_z, argmax_flat_spatial_map = scatter_max(
        valid_height + 1000,
        valid_bev,
        dim=0,
        out=flat_highest_z
    )

    N = valid_preds.shape[0]
    highest_indices = argmax_flat_spatial_map[argmax_flat_spatial_map != N]

    bev_mask = valid_indices[highest_indices]

    bev_preds = torch.zeros(H, W, C).to(device)
    bev_preds[bev_mask[:, 0], bev_mask[:, 1], :] = valid_preds[highest_indices]
    return bev_preds


def ray_trace_batch(points, sample_spacing, max_dist=50, free_label=11, num_classes=11, device="cuda"):
    # Compute samples using array broadcasting
    start_t = time.time()
    points = torch.from_numpy(points).to(device)
    vec_norms = torch.linalg.norm(points, axis=1).view(-1, 1)
    vec_angles = points / vec_norms
    difs = torch.arange(sample_spacing, max_dist, sample_spacing, device=device).view(1, -1, 1)
    difs = vec_angles.view(-1, 1, 3) * difs
    new_samples = points.view(-1, 1, 3) - difs

    # Remove points with dist < 0
    vec_dists = new_samples / vec_angles.view(-1, 1, 3)
    free_samples = new_samples[vec_dists[:, :, 0] > 0].view(-1, 3)
    free_labels = torch.zeros((free_samples.shape[0], num_classes+1), device=device)
    free_labels[:, free_label] = 1

    return free_samples, free_labels


def count_params(model):
    pp = 0
    for p in list(model.parameters()):
        nn = 1
        for s in list(p.size()):
            nn = nn * s
        pp += nn
    print(pp)


def measure_inf_time(model, inputs):
    total_time = 0
    total_iters = 0
    for i in range(1000):
        start = torch.cuda.Event(enable_timing=True)
        end = torch.cuda.Event(enable_timing=True)
        start.record()
        preds = model(inputs[0], inputs[1])
        end.record()
        torch.cuda.synchronize()
        total_time += start.elapsed_time(end)
        total_iters += 1
    avg_time = (total_time / total_iters) / 1000
    print(1 / avg_time)