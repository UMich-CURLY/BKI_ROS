import os
import os.path

import numpy as np
from torchsparse import SparseTensor
from torchsparse.utils.collate import sparse_collate_fn
from torchsparse.utils.quantize import sparse_quantize

__all__ = ['Carla']


LABELS_REMAP = np.array([
    0, # Free
    1, # Building
    2, # Barrier
    3, # Other
    4, # Pedestrian
    5, # Pole or Traffic Light/Sign
    6, # Roadline -> Road
    6, # Road
    8, # Sidewalk
    9, # Vegetation
    10, # Vehicles
    2, # Wall -> Barrier
    5, # Traffic Sign -> Pole
    3, # Sky -> Other
    7, # Ground
    3, # Bridge -> Other
    3, # Railtrack -> Other
    2, # GuardRail -> Barrier
    5, # Traffic Light -> Pole
    3, # Static -> Other
    3, # Dynamic -> Other
    3, # Water -> Other
    7, # Terrain -> Ground
])


class Carla(dict):

    def __init__(self, root, voxel_size, num_points):
        super().__init__({
            'train':
                carlaInternal(root,
                                      voxel_size,
                                      num_points,
                                      split='Train'),
            'val':
                carlaInternal(root,
                                 voxel_size,
                                 num_points,
                                 split='Val'),
            'test':
                carlaInternal(root,
                                      voxel_size,
                                      num_points,
                                      split='Test')
        })


class carlaInternal:

    def __init__(self,
                 root,
                 voxel_size,
                 num_points,
                 split,
                 remap=True):
        self.root = root
        self.split = split
        self.voxel_size = voxel_size
        self.num_points = num_points
        self.seqs = []

        self.split_dir = os.path.join(self.root, self.split)
        self.scenes = sorted(os.listdir(self.split_dir))



        # Loop over all data
        self._frames_list = []
        self._velodyne_list = []
        self._label_list = []
        for curr_scene in self.scenes:
            velodyne_dir = os.path.join(self.split_dir, curr_scene, 'cartesian', 'velodyne')
            label_dir = os.path.join(self.split_dir, curr_scene, 'cartesian', 'labels')

            frames_list = [os.path.splitext(filename)[0] for filename in sorted(os.listdir(velodyne_dir))]
            self._velodyne_list.extend(
                [os.path.join(velodyne_dir, str(frame).zfill(6) + '.bin') for frame in frames_list])
            self._label_list.extend([os.path.join(label_dir, str(frame).zfill(6) + '.label') for frame in frames_list])

        self.label_map = LABELS_REMAP
        self.num_classes = 11
        self.angle = 0.0

    def set_angle(self, angle):
        self.angle = angle

    def __len__(self):
        return len(self._velodyne_list)

    def __getitem__(self, index):
        block_ = np.fromfile(self._velodyne_list[index], dtype=np.float32).reshape(-1, 4)
        all_labels = np.fromfile(self._label_list[index], dtype=np.uint32).reshape(-1)

        block = np.zeros_like(block_)

        if 'Train' in self.split:
            theta = np.random.uniform(0, 2 * np.pi)
            scale_factor = np.random.uniform(0.95, 1.05)
            rot_mat = np.array([[np.cos(theta), np.sin(theta), 0],
                                [-np.sin(theta),
                                 np.cos(theta), 0], [0, 0, 1]])

            block[:, :3] = np.dot(block_[:, :3], rot_mat) * scale_factor
        else:
            theta = self.angle
            transform_mat = np.array([[np.cos(theta),
                                       np.sin(theta), 0],
                                      [-np.sin(theta),
                                       np.cos(theta), 0], [0, 0, 1]])
            block[...] = block_[...]
            block[:, :3] = np.dot(block[:, :3], transform_mat)

        block[:, 3] = block_[:, 3]
        pc_ = np.round(block[:, :3] / self.voxel_size).astype(np.int32)
        pc_ -= pc_.min(0, keepdims=1)

        labels_ = self.label_map[all_labels & 0xFFFF].astype(np.int64)

        feat_ = block

        _, inds, inverse_map = sparse_quantize(pc_,
                                               return_index=True,
                                               return_inverse=True)

        if 'Train' in self.split:
            if len(inds) > self.num_points:
                inds = np.random.choice(inds, self.num_points, replace=False)

        pc = pc_[inds]
        feat = feat_[inds]
        labels = labels_[inds]
        lidar = SparseTensor(feat, pc)
        labels = SparseTensor(labels, pc)
        labels_ = SparseTensor(labels_, pc_)
        inverse_map = SparseTensor(inverse_map, pc_)

        return {
            'lidar': lidar,
            'targets': labels,
            'targets_mapped': labels_,
            'inverse_map': inverse_map,
            'file_name': self._velodyne_list[index]
        }

    @staticmethod
    def collate_fn(inputs):
        return sparse_collate_fn(inputs)
