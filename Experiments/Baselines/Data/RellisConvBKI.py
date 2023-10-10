import os
import numpy as np
import random
import json

import torch
import torch.nn.functional as F
from torch.utils.data import Dataset

LABELS_REMAP = {0: 0, #"void"
              1: 0, #"dirt"
              3: 1, #"grass"
              4: 2, #"tree"
              5: 3, #"pole"
              6: 4, #"water"
              7: 0, #"sky"
              8: 5, #"vehicle"
              9: 0, #"object"
              10: 0, #"asphalt"
              12: 0, #"building"
              15: 6, #"log"
              17: 7, #"person"
              18: 8, #"fence"
              19: 9, #"bush"
              23: 10, #"concrete"
              27: 11, #"barrier"
              31: 12, #"puddle"
              33: 13, #"mud"
              34: 14 #"rubble"
}


class RellisDataset(Dataset):
    """Carla Simulation Dataset for 3D mapping project

    Access to the processed data, including evaluation labels predictions velodyne poses times
    """

    def __init__(self, directory,
                 num_frames=20,
                 remap=False,
                 get_gt=True,
                 bev=True
                 ):
        '''Constructor.
        Parameters:
            directory: directory to the dataset
        '''
        self.get_gt = get_gt
        self._directory = directory
        self._num_frames = num_frames
        self.remap = remap
        self.bev_gt = bev

        self._scenes = sorted(os.listdir(self._directory))

        self._num_scenes = len(self._scenes)
        self._num_frames_scene = []

        self._velodyne_list = []
        self._label_list = []
        self._pred_list = []
        self._bev_labels = []
        self._frames_list = []
        self._timestamps = []
        self._poses = np.empty((0,12))

        for scene in self._scenes:
            velodyne_dir = os.path.join(self._directory, scene, 'os1_cloud_node_kitti_bin')
            label_dir = os.path.join(self._directory, scene, 'os1_cloud_node_semantickitti_label_id')

            self._num_frames_scene.append(len(os.listdir(velodyne_dir)))

            frames_list = [os.path.splitext(filename)[0] for filename in sorted(os.listdir(velodyne_dir))]
            self._frames_list.extend(frames_list)
            self._velodyne_list.extend(
                [os.path.join(velodyne_dir, str(frame).zfill(6) + '.bin') for frame in frames_list])
            self._label_list.extend([os.path.join(label_dir, str(frame).zfill(6) + '.label') for frame in frames_list])
            pose = np.loadtxt(os.path.join(self._directory, scene, 'poses.txt')).reshape(-1, 12)
            self._poses = np.vstack((self._poses, pose))

        self._cum_num_frames = np.cumsum(np.array(self._num_frames_scene) - self._num_frames + 1)

        max_label = max([i for i in LABELS_REMAP.keys()])
        self.label_map = np.zeros(max_label+1, dtype=np.int32)
        for v,k in LABELS_REMAP.items():
            self.label_map[v] = k
        self.num_classes = 15

    # Use all frames, if there is no data then zero pad
    def __len__(self):
        return sum(self._num_frames_scene)

    def collate_fn(self, data):
        horizon_batch = [bi[0] for bi in data]
        pose_batch = [bi[1] for bi in data]
        output_batch = [bi[2] for bi in data]
        return horizon_batch, pose_batch, output_batch

    def points_to_voxels(self, voxel_grid, points, t_i):
        # Valid voxels (make sure to clip)
        valid_point_mask = np.all(
            (points < self.max_bound) & (points >= self.min_bound), axis=1)
        valid_points = points[valid_point_mask, :]
        voxels = np.floor((valid_points - self.min_bound) / self.voxel_sizes).astype(np.int)
        # Clamp to account for any floating point errors
        maxes = np.reshape(self.grid_dims - 1, (1, 3))
        mins = np.zeros_like(maxes)
        voxels = np.clip(voxels, mins, maxes).astype(np.int)
        # This line is needed to create a mask with number of points, not just binary occupied
        if self.binary_counts:
            voxel_grid[t_i, voxels[:, 0], voxels[:, 1], voxels[:, 2]] += 1
        else:
            unique_voxels, counts = np.unique(voxels, return_counts=True, axis=0)
            unique_voxels = unique_voxels.astype(np.int)
            voxel_grid[t_i, unique_voxels[:, 0], unique_voxels[:, 1], unique_voxels[:, 2]] += counts
        return voxel_grid

    def get_pose(self, idx):
        pose = np.zeros((4, 4))
        pose[3, 3] = 1
        pose[:3, :4] = self._poses[idx].reshape(3, 4)
        return pose

    def __getitem__(self, idx):
        # -1 indicates no data
        # the final index is the output
        idx_range = self.find_horizon(idx)

        ego_pose = self.get_pose(idx_range[-1])
        to_ego = np.linalg.inv(ego_pose)
        relative_poses = []

        current_horizon = []
        t_i = 0

        for i in idx_range:
            if i == -1:  # Zero pad
                points = np.zeros((1, 4), dtype=np.float32)
                relative_poses.append(None)

            else:
                points = np.fromfile(self._velodyne_list[i], dtype=np.float32).reshape(-1, 4)
                to_world = self.get_pose(i)
                relative_pose = np.matmul(to_ego, to_world)
                relative_poses.append(relative_pose)

            current_horizon.append(points)
            t_i += 1

        if self.get_gt:
            if not self.bev_gt:
                output = np.fromfile(self._label_list[idx_range[-1]], dtype=np.uint32)
            else:
                output = np.fromfile(self._bev_labels[idx_range[-1]], dtype=np.uint8).reshape(self._eval_size[0], self._eval_size[1])
            if self.remap:
                output = self.label_map[output].astype(np.uint8)
        else:
            output = None

        return current_horizon, relative_poses, output

        # no enough frames

    def find_horizon(self, idx):
        end_idx = idx
        idx_range = np.arange(idx - self._num_frames, idx) + 1
        diffs = np.asarray([int(self._frames_list[end_idx]) - int(self._frames_list[i]) for i in idx_range])
        good_difs = -1 * (np.arange(-self._num_frames, 0) + 1)

        idx_range[good_difs != diffs] = -1

        return idx_range
