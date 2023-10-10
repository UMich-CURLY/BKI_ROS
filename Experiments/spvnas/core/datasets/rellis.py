import os
import os.path

import numpy as np
from torchsparse import SparseTensor
from torchsparse.utils.collate import sparse_collate_fn
from torchsparse.utils.quantize import sparse_quantize

__all__ = ['Rellis']

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


class Rellis(dict):

    def __init__(self, root, voxel_size, num_points):
        super().__init__({
            'train':
                rellisInternal(root,
                                      voxel_size,
                                      num_points,
                                      split='train'),
            'val':
                rellisInternal(root,
                                 voxel_size,
                                 num_points,
                                 split='val'),
            'test':
                rellisInternal(root,
                                      voxel_size,
                                      num_points,
                                      split='test')
        })


class rellisInternal:

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

        self.split_dir = os.path.join(self.root, "pt_" + split + ".lst")

        self._frames_list = []
        self._velodyne_list = []
        self._label_list = []
        with open(self.split_dir, 'r') as split_file:
            for line in split_file:
                image_path = line.strip().split(' ')
                image_path_lst = image_path[0].split('/')
                frame_index = int(image_path_lst[2][0:6])
                self._frames_list.append(frame_index)
                self._velodyne_list.append(os.path.join(self.root, image_path[0]))
                self._label_list.append(os.path.join(self.root, image_path[1]))

        max_label = max([i for i in LABELS_REMAP.keys()])
        self.label_map = np.zeros(max_label+1, dtype=np.uint32)
        for v,k in LABELS_REMAP.items():
            self.label_map[v] = k
        self.num_classes = 15
        self.angle = 0.0

    def set_angle(self, angle):
        self.angle = angle

    def __len__(self):
        return len(self._velodyne_list)

    def __getitem__(self, index):
        block_ = np.fromfile(self._velodyne_list[index], dtype=np.float32).reshape(-1, 4)
        all_labels = np.fromfile(self._label_list[index], dtype=np.uint32).reshape(-1)

        block = np.zeros_like(block_)

        if 'train' in self.split:
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

        labels_ = self.label_map[all_labels].astype(np.int64)

        feat_ = block

        _, inds, inverse_map = sparse_quantize(pc_,
                                               return_index=True,
                                               return_inverse=True)

        if 'train' in self.split:
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
