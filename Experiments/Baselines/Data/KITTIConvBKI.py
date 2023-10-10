import os
import numpy as np
import random
import json

import torch
import torch.nn.functional as F
from torch.utils.data import Dataset


class KITTIDataset(Dataset):
    """Carla Simulation Dataset for 3D mapping project
    Access to the processed data, including evaluation labels predictions velodyne poses times
    """

    def __init__(self, directory, eval_param,
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
        self._eval_param = eval_param
        self._num_frames = num_frames
        self.remap = remap
        self.bev_gt = bev

        self.labels_dict = {
            1: [12],
            2: [13],
            3: [],
            4: [5, 6, 7],
            5: [17, 18],
            6: [8, 9],
            7: [11, 16],
            8: [10],
            9: [14, 15],
            10: [0, 1, 2, 3, 4]
        }

        self._out_dim = self._eval_param['num_channels']
        self._grid_size = self._eval_param['grid_size']
        self.grid_dims = np.asarray(self._grid_size)
        self._eval_size = list(np.uint32(self._grid_size))

        self.coor_ranges = self._eval_param['min_bound'] + self._eval_param['max_bound']
        self.voxel_sizes = [abs(self.coor_ranges[3] - self.coor_ranges[0]) / self._grid_size[0],
                            abs(self.coor_ranges[4] - self.coor_ranges[1]) / self._grid_size[1],
                            abs(self.coor_ranges[5] - self.coor_ranges[2]) / self._grid_size[2]]
        self.min_bound = np.asarray(self.coor_ranges[:3])
        self.max_bound = np.asarray(self.coor_ranges[3:])
        self.voxel_sizes = np.asarray(self.voxel_sizes)

        self._velodyne_list = []
        self._frames_list = []
        self._poses = np.empty((0,12))
        self._Tr = np.empty((0,12))

        velodyne_dir = os.path.join(self._directory, 'velodyne')

        frames_list = [os.path.splitext(filename)[0] for filename in sorted(os.listdir(velodyne_dir))]
        self._frames_list.extend(frames_list)
        self._velodyne_list.extend(
            [os.path.join(velodyne_dir, str(frame).zfill(6) + '.bin') for frame in frames_list])
        pose = np.loadtxt(os.path.join(self._directory, 'poses.txt'))
        Tr = np.genfromtxt(os.path.join(self._directory, 'calib.txt'))[-1,1:]
        Tr = np.repeat(np.expand_dims(Tr, axis=1).T, pose.shape[0], axis=0)
        self._Tr = np.vstack((self._Tr, Tr))
        self._poses = np.vstack((self._poses, pose))

        self.total_frames = len(os.listdir(velodyne_dir))

    # Use all frames, if there is no data then zero pad
    def __len__(self):
        return self.total_frames

    def collate_fn(self, data):
        horizon_batch = [bi[0] for bi in data]
        pose_batch = [bi[1] for bi in data]
        return horizon_batch, pose_batch, None

    def get_pose(self, frame_id):
        pose = np.zeros((4, 4))
        pose[3, 3] = 1
        pose[:3, :4] = self._poses[frame_id,:].reshape(3, 4)

        Tr = np.zeros((4, 4))
        Tr[3, 3] = 1
        Tr[:3, :4] = self._Tr[frame_id,:].reshape(3,4)

        Tr = Tr.astype(np.float32)
        pose = pose.astype(np.float32)
        global_pose = np.matmul(np.linalg.inv(Tr), np.matmul(pose, Tr))

        return global_pose

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
                dists = np.linalg.norm(points[:, :3], axis=1)
                non_ego = dists > 3
                points = points[non_ego, :]
                to_world = self.get_pose(i)
                relative_pose = np.matmul(to_ego, to_world)
                relative_poses.append(relative_pose)

            current_horizon.append(points)
            t_i += 1

        return current_horizon, relative_poses

    def find_horizon(self, idx):
        end_idx = idx
        idx_range = np.arange(idx - self._num_frames, idx) + 1
        diffs = np.asarray([int(self._frames_list[end_idx]) - int(self._frames_list[i]) for i in idx_range])
        good_difs = -1 * (np.arange(-self._num_frames, 0) + 1)

        idx_range[good_difs != diffs] = -1

        return idx_range
