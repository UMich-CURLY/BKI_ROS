import os
import os.path

import numpy as np
from torchsparse import SparseTensor
from torchsparse.utils.collate import sparse_collate_fn
from torchsparse.utils.quantize import sparse_quantize

from nuscenes.nuscenes import NuScenes
from nuscenes.utils.data_classes import LidarSegPointCloud

data_dir = '/home/tigeriv/Data/nuscenes_mnet'
nusc = NuScenes(version='v1.0-trainval', dataroot=data_dir, verbose=True)

__all__ = ['nuScenes']

label_name_mapping = nusc.lidarseg_idx2name_mapping

kept_labels = ['noise', 'animal', 'human.pedestrian.adult', 'human.pedestrian.child',
               'human.pedestrian.construction_worker', 'human.pedestrian.personal_mobility',
               'human.pedestrian.police_officer', 'human.pedestrian.stroller', 'human.pedestrian.wheelchair',
               'movable_object.barrier', 'movable_object.debris', 'movable_object.pushable_pullable',
               'movable_object.trafficcone', 'static_object.bicycle_rack', 'vehicle.bicycle', 'vehicle.bus.bendy',
               'vehicle.bus.rigid', 'vehicle.car', 'vehicle.construction', 'vehicle.emergency.ambulance',
               'vehicle.emergency.police', 'vehicle.motorcycle', 'vehicle.trailer', 'vehicle.truck',
               'flat.driveable_surface', 'flat.other', 'flat.sidewalk', 'flat.terrain', 'static.manmade',
               'static.other', 'static.vegetation', 'vehicle.ego']

labels_remap = {
    "noise": 0,  # Outlier
    "animal": 0,  # Outlier
    "human.pedestrian.adult": 1,  # Human
    "human.pedestrian.child": 1,  # Human
    "human.pedestrian.construction_worker": 1,  # Human
    "human.pedestrian.personal_mobility": 1,  # Human
    "human.pedestrian.police_officer": 1,  # Human
    "human.pedestrian.stroller": 1,  # Human
    "human.pedestrian.wheelchair": 1,  # Human,
    "movable_object.barrier": 2,  # Static structure
    "movable_object.debris": 2,  # Static structure
    "movable_object.pushable_pullable": 2,  # Static structure
    "movable_object.trafficcone": 2,  # Static structure
    "static_object.bicycle_rack": 2,  # Static structure
    "vehicle.bicycle": 3,  # Bicycle
    "vehicle.bus.bendy": 4,  # Other vehicle
    "vehicle.bus.rigid": 4,  # Other vehicle
    "vehicle.car": 5,  # Car
    "vehicle.construction": 4,  # Other vehicle
    "vehicle.emergency.ambulance": 4,  # Other vehicle
    "vehicle.emergency.police": 4,  # Other vehicle
    "vehicle.motorcycle": 6,  # Motorcycle
    "vehicle.trailer": 4,  # Other vehicle
    "vehicle.truck": 7,  # Truck
    "flat.driveable_surface": 8,  # Road
    "flat.other": 9,  # Other ground
    "flat.sidewalk": 10,  # Sidewalk
    "flat.terrain": 11,  # Terrain
    "static.manmade": 2,  # Static structure
    "static.other": 2,  # Static structure
    "static.vegetation": 12,  # Nature
    "vehicle.ego": 0,  # Outlier
}


def get_paths(curr_sample, root):
    # Lidar
    lidar_data = nusc.get('sample_data', curr_sample['data']['LIDAR_TOP'])
    lidar_fpath = os.path.join(root, lidar_data['filename'])
    # Labels
    label_data = nusc.get('lidarseg', curr_sample['data']['LIDAR_TOP'])
    label_fpath = os.path.join(root, label_data['filename'])
    return lidar_fpath, label_fpath


class nuScenes(dict):

    def __init__(self, root, voxel_size, num_points):
        super().__init__({
            'train':
                nuScenesInternal(root,
                                      voxel_size,
                                      num_points,
                                      split='train'),
            'test':
                nuScenesInternal(root,
                                      voxel_size,
                                      num_points,
                                      split='test')
        })


class nuScenesInternal:

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
        if split == 'train':
            self.seqs = nusc.scene[:700]
        elif self.split == 'val':
            self.seqs = nusc.scene[700:850]
        elif self.split == 'test':
            self.seqs = nusc.scene[700:850]

        # Loop over all data
        label_paths = []
        lidar_paths = []
        for curr_scene in self.seqs:
            first_sample_token = curr_scene['first_sample_token']
            curr_sample = nusc.get('sample', first_sample_token)
            while curr_sample['next'] != '':
                lidar_fpath, label_fpath = get_paths(curr_sample, self.root)
                lidar_paths.append(lidar_fpath)
                label_paths.append(label_fpath)
                # Next sample
                curr_sample = nusc.get('sample', curr_sample['next'])
            lidar_fpath, label_fpath = get_paths(curr_sample, self.root)
            lidar_paths.append(lidar_fpath)
            label_paths.append(label_fpath)
        self.label_paths = label_paths
        self.lidar_paths = lidar_paths

        reverse_label_name_mapping = {}
        self.label_map = np.zeros(260)
        cnt = 0
        for label_id in label_name_mapping:
            if remap:  # Remap to downsampled classes
                label_name = label_name_mapping[label_id]
                self.label_map[label_id] = labels_remap[label_name]
            elif label_name_mapping[label_id] in kept_labels:
                self.label_map[label_id] = cnt
                reverse_label_name_mapping[
                    label_name_mapping[label_id]] = cnt
                cnt += 1
            else:
                self.label_map[label_id] = 255

        self.reverse_label_name_mapping = reverse_label_name_mapping
        self.num_classes = cnt
        self.angle = 0.0

    def set_angle(self, angle):
        self.angle = angle

    def __len__(self):
        return len(self.lidar_paths)

    def __getitem__(self, index):
        labeled_pc = LidarSegPointCloud(points_path=self.lidar_paths[index], labels_path=self.label_paths[index])
        block_ = labeled_pc.points.astype(np.float32)

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

        try:
            all_labels = labeled_pc.labels.astype(np.int32)
        except:
            all_labels = np.zeros(pc_.shape[0]).astype(np.int32)

        labels_ = self.label_map[all_labels & 0xFFFF].astype(np.int64)

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
            'file_name': self.lidar_paths[index]
        }

    @staticmethod
    def collate_fn(inputs):
        return sparse_collate_fn(inputs)
