## Maintainer: Arthur Zhang #####
## Contact: arthurzh@umich.edu #####

import os
import pdb
import math
import numpy as np
import random
import json
import yaml
from sklearn.metrics import homogeneity_completeness_v_measure

import torch
from torch import gt
import torch.nn.functional as F
from torch.utils.data import Dataset

from scipy.spatial.transform import Rotation as R
from Data.utils import *

def unpack(compressed):
    ''' given a bit encoded voxel grid, make a normal voxel grid out of it.  '''
    uncompressed = np.zeros(compressed.shape[0] * 8, dtype=np.uint8)
    uncompressed[::8] = compressed[:] >> 7 & 1
    uncompressed[1::8] = compressed[:] >> 6 & 1
    uncompressed[2::8] = compressed[:] >> 5 & 1
    uncompressed[3::8] = compressed[:] >> 4 & 1
    uncompressed[4::8] = compressed[:] >> 3 & 1
    uncompressed[5::8] = compressed[:] >> 2 & 1
    uncompressed[6::8] = compressed[:] >> 1 & 1
    uncompressed[7::8] = compressed[:] & 1

    return uncompressed


class Rellis3dDataset(Dataset):
    """Rellis3D Dataset for Neural BKI project
    
    Access to the processed data, including evaluation labels predictions velodyne poses times
    """
    def __init__(self,
        grid_params,
        directory,
        device='cuda',
        num_frames=20,
        remap=True,
        use_aug=True,
        apply_transform=True,
        data_split="train"
        ):
        '''Constructor.
        Parameters:
            directory: directory to the dataset
        '''

        self._directory = directory
        self._num_frames = num_frames
        self.device = device
        self.remap = remap
        self.use_aug = use_aug
        self.apply_transform = apply_transform

        split_dir = os.path.join(self._directory, "pt_"+data_split+".lst")

        data_params_file = os.path.join(os.getcwd(), "Config", "rellis.yaml")
        with open(data_params_file, "r") as stream:
            try:
                data_params = yaml.safe_load(stream)
                self._num_labels = data_params["num_classes"]
                max_label = max([i for i in data_params["LABELS_REMAP"].keys()])
                self.LABELS_REMAP = np.zeros(max_label + 1, dtype=np.long)
                for v,k in data_params["LABELS_REMAP"].items():
                    self.LABELS_REMAP[v] = k
            except yaml.YAMLError as exc:
                print(exc)

        self._grid_size = grid_params['grid_size']
        self.grid_dims = np.asarray(self._grid_size)

        self.coor_ranges = grid_params['min_bound'] + grid_params['max_bound']
        self.voxel_sizes = np.asarray([abs(self.coor_ranges[3] - self.coor_ranges[0]) / self._grid_size[0],
                            abs(self.coor_ranges[4] - self.coor_ranges[1]) / self._grid_size[1],
                            abs(self.coor_ranges[5] - self.coor_ranges[2]) / self._grid_size[2]])
        self.min_bound = np.asarray(self.coor_ranges[:3])
        self.max_bound = np.asarray(self.coor_ranges[3:])

        # Generate list of scenes and indices to iterate over
        self._scenes_list = []
        self._index_list = []
        self._velo_list = []
        self._label_list = []
        self._sub_scene_list = []
        self._poses = []

        scene_poses = []
        for scene in range(5):
            scene_pose = np.loadtxt(os.path.join(self._directory, str(scene).zfill(5), 'poses.txt')).reshape(-1, 12)
            scene_poses.append(scene_pose)

        sub_scene_num = 0
        with open(split_dir, 'r') as split_file:
            for line in split_file:
                line = line.replace('\n', '')
                image_path = line.split(' ')
                image_path_lst = image_path[0].split('/')
                self._velo_list.append(os.path.join(self._directory, image_path[0]))
                self._label_list.append(os.path.join(self._directory, image_path[1]))
                self._scenes_list.append(image_path_lst[0])
                self._index_list.append(image_path_lst[-1].split(".")[0])
                pose = np.eye(4)
                pose[:3, :4] = scene_poses[int(self._scenes_list[-1])][int(self._index_list[-1]), :].reshape(3, 4)
                self._poses.append(pose)
                # Check if new scene
                if len(self._index_list) > 1:
                    if self._scenes_list[-1] != self._scenes_list[-2] or int(self._index_list[-1]) != int(self._index_list[-2]) + 1:
                        sub_scene_num += 1
                self._sub_scene_list.append(sub_scene_num)

        # Get number of frames to iterate over
        self._size = len(self._index_list)

    # Use all frames, if there is no data then zero pad
    def __len__(self):
        return self._size
    
    def collate_fn(self, data):
        points_batch = [bi[0] for bi in data]
        gt_label_batch = [bi[1] for bi in data]
        poses_batch = [bi[2] for bi in data]
        return points_batch, gt_label_batch, poses_batch

    def get_file_path(self, idx):
        print(self._frames_list[idx])

    def get_aug_matrix(self, trans):
        """
            trans - 1 or 2 specifies reflection about XZ or YZ plane
                    any other value gives rotation matrix
                    Double checked with rotation matrix calculator
        """
        if trans==1:
            trans = np.eye(3)
            trans[1][1] = -1
        elif trans==2:
            trans = np.eye(3)
            trans[0][0] = -1
        else:
            if trans==0:
                angle = 0
            else:
                angle = (trans-2)*90
            trans = R.from_euler('z', angle, degrees=True).as_matrix()

        return trans
    
    def __getitem__(self, idx):
        idx_range = self.find_horizon(idx)

        current_points = []
        poses = []

        gt_labels = None
        for i in idx_range:
            pose = None
            if i == -1: # Zero pad
                points = np.zeros((1, 3), dtype=np.float16)
                labels = np.zeros((1,), dtype=np.uint8)
            else:
                points = np.fromfile(self._velo_list[i], dtype=np.float32).reshape(-1,4)[:, :3]

                pose = self._poses[i]

                temp_labels = np.fromfile(self._label_list[i], dtype=np.uint32).reshape((-1)).astype(np.uint8)
                
                if self.remap:
                    temp_labels = self.LABELS_REMAP[temp_labels].astype(np.uint8)

                if i == idx_range[-1]:
                    gt_labels = temp_labels.reshape(-1, 1)

                points = points.astype(np.float32) #[:, [1, 0, 2]]

            current_points.append(points)
            poses.append(pose)

        return current_points, gt_labels, poses

    def find_horizon(self, idx):
        subscene = self._sub_scene_list[idx]
        idx_range = np.arange(idx - self._num_frames + 1, idx + 1)
        for i in range(self._num_frames):
            temp_idx = idx - self._num_frames + i + 1
            if temp_idx < 0 or self._sub_scene_list[temp_idx] != subscene:
                idx_range[i] = -1
        return idx_range