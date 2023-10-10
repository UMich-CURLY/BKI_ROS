import os
import os.path

import numpy as np

from nuscenes.nuscenes import NuScenes
from nuscenes.utils.data_classes import LidarSegPointCloud
from pyquaternion import Quaternion
from nuscenes.utils.geometry_utils import transform_matrix

from torch.utils.data import Dataset

__all__ = ['nuScenes']


def get_paths(curr_sample, root, nusc):
    # Lidar
    lidar_data = nusc.get('sample_data', curr_sample['data']['LIDAR_TOP'])
    lidar_fpath = os.path.join(root, lidar_data['filename'])
    # Pose
    pose_token = lidar_data['ego_pose_token']
    cal_token = lidar_data['calibrated_sensor_token']
    # Labels
    label_data = nusc.get('lidarseg', curr_sample['data']['LIDAR_TOP'])
    label_fpath = os.path.join(root, label_data['filename'])
    return lidar_fpath, label_fpath, pose_token, cal_token


def gen_data(seqs, root, nusc):
    # Loop over all data
    label_paths = []
    lidar_paths = []
    pose_tokens = []
    cal_tokens = []
    scene_nums = []
    scene_num = 0
    for curr_scene in seqs:
        first_sample_token = curr_scene['first_sample_token']
        curr_sample = nusc.get('sample', first_sample_token)
        while curr_sample['next'] != '':
            lidar_fpath, label_fpath, pose_token, cal_token = get_paths(curr_sample, root, nusc)
            lidar_paths.append(lidar_fpath)
            label_paths.append(label_fpath)
            scene_nums.append(scene_num)
            pose_tokens.append(pose_token)
            cal_tokens.append(cal_token)
            # Next sample
            curr_sample = nusc.get('sample', curr_sample['next'])
        lidar_fpath, label_fpath, pose_token, cal_token = get_paths(curr_sample, root, nusc)
        lidar_paths.append(lidar_fpath)
        label_paths.append(label_fpath)
        scene_nums.append(scene_num)
        pose_tokens.append(pose_token)
        cal_tokens.append(cal_token)
        scene_num += 1
    return lidar_paths, label_paths, pose_tokens, cal_tokens, scene_nums


def gen_label_mapping(label_name_mapping, labels_remap, kept_labels, remap=True):
    reverse_label_name_mapping = {}
    label_map = np.zeros(260)
    cnt = 0
    for label_id in label_name_mapping:
        if remap:  # Remap to downsampled classes
            label_name = label_name_mapping[label_id]
            label_map[label_id] = labels_remap[label_name]
        elif label_name_mapping[label_id] in kept_labels:
            label_map[label_id] = cnt
            reverse_label_name_mapping[
                label_name_mapping[label_id]] = cnt
            cnt += 1
        else:
            label_map[label_id] = 255
    reverse_label_name_mapping = reverse_label_name_mapping

    return label_map, reverse_label_name_mapping, cnt


class nuScenes(Dataset):
    def __init__(self,
                 root,
                 split,
                 num_frames,
                 labels_remap,
                 kept_labels,
                 remap=True):
        self.root = root
        self.split = split
        self.num_frames = num_frames
        self.labels_remap = labels_remap
        self.kept_labels = kept_labels

        self.nusc = NuScenes(version='v1.0-trainval', dataroot=root, verbose=True)
        label_name_mapping = self.nusc.lidarseg_idx2name_mapping

        self.seqs = []
        if split == 'train':
            self.seqs = self.nusc.scene[:700]
        elif self.split == 'val':
            self.seqs = self.nusc.scene[700:850]
        elif self.split == 'test':
            self.seqs = self.nusc.scene[700:850]

        self.lidar_paths, self.label_paths, self.pose_tokens, self.cal_tokens, self.scene_nums = \
            gen_data(self.seqs, root, self.nusc)
        self.label_map, self.reverse_label_name_mapping, self.num_classes = \
            gen_label_mapping(label_name_mapping, labels_remap, kept_labels, remap)

        self.angle = 0.0

    def set_angle(self, angle):
        self.angle = angle

    def __len__(self):
        return len(self.lidar_paths)

    def __getitem__(self, index):
        lidar = []
        labels = []
        poses = []

        if 'train' in self.split:
            theta = np.random.uniform(0, 2 * np.pi)
            scale_factor = np.random.uniform(0.95, 1.05)
            transform_mat = np.array([[np.cos(theta), np.sin(theta), 0],
                                [-np.sin(theta),
                                 np.cos(theta), 0], [0, 0, 1]])
        else:
            theta = self.angle
            transform_mat = np.array([[np.cos(theta),
                                       np.sin(theta), 0],
                                      [-np.sin(theta),
                                       np.cos(theta), 0], [0, 0, 1]])
            scale_factor = 1

        start_scene = self.scene_nums[index]
        for i in range(self.num_frames):
            temp_index = index + i
            if temp_index >= len(self.lidar_paths) or self.scene_nums[temp_index] != start_scene:
                break
            labeled_pc = LidarSegPointCloud(points_path=self.lidar_paths[index], labels_path=self.label_paths[index])
            block_ = labeled_pc.points.astype(np.float32)
            block = np.zeros_like(block_)
            block[:, :3] = np.dot(block_[:, :3], transform_mat) * scale_factor
            if 'train' in self.split or 'val' in self.split:
                all_labels = labeled_pc.labels.astype(np.int32)
                label = self.label_map[all_labels & 0xFFFF].astype(np.int64)
            else:
                label = None
            cal_sensor = self.nusc.get('calibrated_sensor', self.cal_tokens[index])
            ego_pose = self.nusc.get('ego_pose', self.pose_tokens[index])
            car_from_sensor = transform_matrix(translation=cal_sensor['translation'],
                                          rotation=Quaternion(cal_sensor['rotation']))
            global_from_car = transform_matrix(translation=ego_pose['translation'],
                                          rotation=Quaternion(ego_pose['rotation']))
            global_from_sensor = np.dot(global_from_car, car_from_sensor)

            poses.append(global_from_sensor)
            labels.append(label)
            lidar.append(block)

        return {
            'lidar': lidar,
            'targets': labels,
            'poses': poses
        }

    @staticmethod
    def collate_fn(inputs):
        return inputs
