import pdb
import os

import torch
torch.backends.cudnn.deterministic = True
import torch.nn.functional as F
import torch.nn as nn
import torch
import numpy as np
from Models.STPN_utils import *


# Input: time series of points and their poses
# Output: predictions of the motion and semantic label of the last frame
class MotionEncoder(torch.nn.Module):
    def __init__(self, grid_size, min_bound, max_bound,
                 num_classes=21, device="cpu", datatype=torch.float32):
        '''\
        Input:
            grid_size: (x, y, z) int32 array, number of voxels
            min_bound: (x, y, z) float32 array, lower bound on local map
            max_bound: (x, y, z) float32 array, upper bound on local map
            filter_size: int, dimension of the kernel on each axis (must be odd)
            num_classes: int, number of classes
            device: cpu or gpu
        '''
        super().__init__()
        self.min_bound = min_bound.view(-1, 3).to(device)
        self.max_bound = max_bound.view(-1, 3).to(device)
        self.grid_size = grid_size
        self.dtype = datatype

        self.device = device
        self.num_classes = num_classes
        
        self.voxel_sizes = (self.max_bound.view(-1) - self.min_bound.view(-1)) / self.grid_size.to(self.device)
        
        [xs, ys, zs] = [(max_bound[i]-min_bound[i])/(2*grid_size[i]) + 
                        torch.linspace(min_bound[i], max_bound[i], device=device, steps=grid_size[i]+1)[:-1] 
                        for i in range(3)]
        self.centroids = torch.cartesian_prod(xs, ys, zs).to(device)

        # Pre-processing layers
        self.conv_pre_1 = nn.Conv2d(int(self.grid_size[2]), 32, kernel_size=3, stride=1, padding=1, device=self.device)
        self.conv_pre_2 = nn.Conv2d(32, 32, kernel_size=3, stride=1, padding=1, device=self.device)
        self.bn_pre_1 = nn.BatchNorm2d(32, device=self.device)
        self.bn_pre_2 = nn.BatchNorm2d(32, device=self.device)
        # Down Block 1
        self.conv3d_1 = Conv3D(64, 64, kernel_size=(3, 1, 1), stride=1, padding=(0, 0, 0)).to(self.device)
        self.conv1_1 = nn.Conv2d(32, 64, kernel_size=3, stride=2, padding=1, device=self.device)
        self.conv1_2 = nn.Conv2d(64, 64, kernel_size=3, stride=1, padding=1, device=self.device)
        self.bn1_1 = nn.BatchNorm2d(64, device=self.device)
        self.bn1_2 = nn.BatchNorm2d(64, device=self.device)
        # Down Block 2
        self.conv3d_2 = Conv3D(128, 128, kernel_size=(3, 1, 1), stride=1, padding=(0, 0, 0)).to(self.device)
        self.conv2_1 = nn.Conv2d(64, 128, kernel_size=3, stride=2, padding=1, device=self.device)
        self.conv2_2 = nn.Conv2d(128, 128, kernel_size=3, stride=1, padding=1, device=self.device)
        self.bn2_1 = nn.BatchNorm2d(128, device=self.device)
        self.bn2_2 = nn.BatchNorm2d(128, device=self.device)
        # Up Block 1
        self.conv3_1 = nn.Conv2d(128 + 64, 64, kernel_size=3, stride=1, padding=1, device=self.device)
        self.conv3_2 = nn.Conv2d(64, 64, kernel_size=3, stride=1, padding=1, device=self.device)
        self.bn3_1 = nn.BatchNorm2d(64, device=self.device)
        self.bn3_2 = nn.BatchNorm2d(64, device=self.device)
        # Up Block 2
        self.conv4_1 = nn.Conv2d(64 + 32, 32, kernel_size=3, stride=1, padding=1, device=self.device)
        self.conv4_2 = nn.Conv2d(32, 32, kernel_size=3, stride=1, padding=1, device=self.device)
        self.bn4_1 = nn.BatchNorm2d(32, device=self.device)
        self.bn4_2 = nn.BatchNorm2d(32, device=self.device)

        self.semantic_head = SegmentationHead(1, 8, self.num_classes, [1, 2, 3]).to(device)
        self.motion_head = SegmentationHead(1, 8, 3, [1, 2, 3]).to(device)
    
    def grid_ind(self, input_pc, min_bound=None, max_bound=None):
        '''
        Input:
            input_xyz: N * (x, y, z, c) float32 array, point cloud
        Output:
            grid_inds: N' * (x, y, z, c) int32 array, point cloud mapped to voxels
        '''
        if min_bound is None:
            min_bound = self.min_bound
        if max_bound is None:
            max_bound = self.max_bound
        input_xyz   = input_pc[:, :3]
        labels      = input_pc[:, 3:]
        
        valid_input_mask = torch.all((input_xyz < max_bound) & (input_xyz >= min_bound), axis=1)
        
        valid_xyz = input_xyz[valid_input_mask]
        valid_labels = labels[valid_input_mask]
        
        grid_inds = torch.floor((valid_xyz - min_bound) / self.voxel_sizes)
        maxes = (self.grid_size - 1).view(1, 3)
        clipped_inds = torch.clamp(grid_inds, torch.zeros_like(maxes), maxes)
        
        return torch.hstack( (clipped_inds, valid_labels) )

    def to_occupancy(self, points):
        empty_grid = torch.zeros(self.grid_size.int().tolist(), device=self.device, dtype=self.dtype)
        if points is None:
            return empty_grid
        grid_pc = self.grid_ind(points)
        unique_inds, counts = torch.unique(grid_pc.to(torch.long), return_counts=True, dim=0)
        empty_grid[unique_inds] = 1.0
        return empty_grid

    def transform_pc(self, point_clouds, poses):
        ego_pose = torch.from_numpy(poses[-1]).to(self.device)
        to_ego = torch.linalg.inv(ego_pose)
        occupancy_grids = []
        for i in range(len(poses)):
            if poses[i] is None:
                occupancy_grids.append(self.to_occupancy(None))
            else:
                pose = torch.from_numpy(poses[i]).to(self.device)
                points = torch.from_numpy(point_clouds[i]).to(self.device)
                relative_pose = torch.matmul(to_ego, pose).float()
                transformed_points = torch.matmul(relative_pose[:3, :3], points.T).T + relative_pose[:3, 3]
                occupancy_grids.append(self.to_occupancy(transformed_points))
        return torch.stack(occupancy_grids)

    def squeeze_batch(self, x):
        return x.view(-1, x.size(-3), x.size(-2), x.size(-1))

    def unsqueeze_batch(self, x, batch):
        return x.view(batch, -1, x.size(1), x.size(2), x.size(3)).contiguous()

    def label_points(self, grid, points):
        vox_inds = self.grid_ind(points).to(int)
        point_preds = grid[vox_inds[:, 0], vox_inds[:, 1], vox_inds[:, 2], :]
        valid_input_mask = torch.all((points < self.max_bound) & (points >= self.min_bound), axis=1)
        return point_preds, valid_input_mask

    def forward(self, point_clouds, poses):
        '''
        Input:
            point_clouds: list of T (x, y, z) float32 arrays, point clouds
            poses: T float32 arrays of pose
        Output:
            label_preds: NxC float32 array of semantic predictions
            flow_preds: Nx3 float32 array of flow predictions
        '''
        preds = None

        # First, transform point clouds using pose data
        with torch.no_grad():
            occupancy_batch = []
            for b in range(len(poses)):
                occupancy_grids = self.transform_pc(point_clouds[b], poses[b])
                occupancy_batch.append(occupancy_grids)
            x_in = torch.stack(occupancy_batch)
            x = torch.permute(x_in, [0, 1, 4, 2, 3])
            batch, seq, z, h, w = x.size()

        # Block 0: Pre-processing
        x = self.squeeze_batch(x)
        x = F.relu(self.bn_pre_1(self.conv_pre_1(x)))
        x = F.relu(self.bn_pre_2(self.conv_pre_2(x)))

        # Block 1
        x_1 = F.relu(self.bn1_1(self.conv1_1(x)))
        x_1 = F.relu(self.bn1_2(self.conv1_2(x_1)))
        x_1 = self.unsqueeze_batch(x_1, batch)
        x_1 = self.conv3d_1(x_1)
        x_1 = self.squeeze_batch(x_1)

        # Block 2
        x_2 = F.relu(self.bn2_1(self.conv2_1(x_1)))
        x_2 = F.relu(self.bn2_2(self.conv2_2(x_2)))
        x_2 = self.unsqueeze_batch(x_2, batch)
        x_2 = self.conv3d_2(x_2)
        x_2 = self.squeeze_batch(x_2)

        # Temporal Pooling
        x = TemporalPooling(x, batch)
        x_1 = TemporalPooling(x_1, batch)

        # Up block 1
        x_3 = F.relu(self.bn3_1(self.conv3_1(torch.cat((F.interpolate(x_2, scale_factor=(2, 2)), x_1), dim=1))))
        x_3 = F.relu(self.bn3_2(self.conv3_2(x_3)))

        # Up block 1
        x_4 = F.relu(self.bn4_1(self.conv4_1(torch.cat((F.interpolate(x_3, scale_factor=(2, 2)), x), dim=1))))
        x_4 = F.relu(self.bn4_2(self.conv4_2(x_4)))

        # Outputs
        semantic_preds = self.semantic_head(x_4).permute(0, 3, 4, 2, 1)
        motion_preds = self.motion_head(x_4).permute(0, 3, 4, 2, 1)

        return semantic_preds, motion_preds