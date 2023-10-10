import os
import os.path

import numpy as np

from torch.utils.data import Dataset

__all__ = ['Rellis']


class Rellis(Dataset):
    def __init__(self,
                 root,
                 split):
        self.root = root
        self.split = split
        self._directory = root

        self._scenes = sorted(os.listdir(self._directory))

        self._num_scenes = len(self._scenes)
        self._num_frames_scene = []

        self._velodyne_list = []
        self._label_list = []
        self._pred_list = []
        self._bev_labels = []
        self._frames_list = []
        self._timestamps = []
        self._poses = []
        self.scene_nums = []

        for scene in self._scenes:
            velodyne_dir = os.path.join(self.root, scene, 'os1_cloud_node_kitti_bin')
            label_dir = os.path.join(self._directory, scene, 'os1_cloud_node_semantickitti_label_id')

            self._num_frames_scene.append(len(os.listdir(velodyne_dir)))

            frames_list = [os.path.splitext(filename)[0] for filename in sorted(os.listdir(velodyne_dir))]
            self._frames_list.extend(frames_list)
            self._velodyne_list.extend(
                [os.path.join(velodyne_dir, str(frame).zfill(6) + '.bin') for frame in frames_list])
            self._label_list.extend([os.path.join(label_dir, str(frame).zfill(6) + '.label') for frame in frames_list])
            self._poses.append(np.loadtxt(os.path.join(self._directory, scene, 'poses.txt')))
            self.scene_nums += [int(scene)] * len(os.listdir(velodyne_dir))
            # for poses and timestamps
        self._poses = np.array(self._poses).reshape(sum(self._num_frames_scene), 12)
    def __len__(self):
        return len(self.scene_nums)

    def get_pose(self, idx):
        pose = np.zeros((4, 4))
        pose[3, 3] = 1
        pose[:3, :4] = self._poses[idx].reshape(3, 4)
        return pose

    def __getitem__(self, index):
        points = np.fromfile(self._velodyne_list[index], dtype=np.float32).reshape(-1, 4)
        to_world = self.get_pose(index)

        return {
            'lidar': [points],
            'poses': [to_world]
        }

    @staticmethod
    def collate_fn(inputs):
        return inputs
