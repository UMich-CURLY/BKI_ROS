import os
import os.path

import numpy as np

from torch.utils.data import Dataset

__all__ = ['KITTI']


class KITTI(Dataset):
    def __init__(self,
                 root,
                 split,
                 get_gt=False):
        self.root = root
        self.split = split
        self._directory = root
        self.get_gt = get_gt

        self._scenes = sorted(os.listdir(self._directory))

        self._num_scenes = len(self._scenes)
        self._num_frames_scene = []

        self._velodyne_list = []
        self._frames_list = []
        self._poses = np.empty((0, 12))
        self._Tr = np.empty((0, 12))
        self.scene_nums = []

        for scene in self._scenes:
            velodyne_dir = os.path.join(self.root, scene, 'velodyne')
            self._num_frames_scene.append(len(os.listdir(velodyne_dir)))

            frames_list = [os.path.splitext(filename)[0] for filename in sorted(os.listdir(velodyne_dir))]
            self._frames_list.extend(frames_list)
            self._velodyne_list.extend(
                [os.path.join(velodyne_dir, str(frame).zfill(6) + '.bin') for frame in frames_list])
            pose = np.loadtxt(os.path.join(self._directory, scene, 'poses.txt'))
            Tr = np.genfromtxt(os.path.join(self._directory, scene, 'calib.txt'))[-1, 1:]
            Tr = np.repeat(np.expand_dims(Tr, axis=1).T, pose.shape[0], axis=0)
            self._Tr = np.vstack((self._Tr, Tr))
            self._poses = np.vstack((self._poses, pose))
            self.scene_nums += [int(scene)] * len(os.listdir(velodyne_dir))

    def __len__(self):
        return len(self.scene_nums)

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

    def __getitem__(self, index):
        points = np.fromfile(self._velodyne_list[index], dtype=np.float32).reshape(-1, 4)
        to_world = self.get_pose(index)
        if self.get_gt:
            label_file=self._velodyne_list[index].replace('velodyne', 'labels').replace(
                '.bin', '.label')
            if os.path.exists(label_file):
                with open(label_file, 'rb') as a:
                    all_labels = np.fromfile(a, dtype=np.int32).reshape(-1)
            else:
                all_labels = np.zeros(points.shape[0]).astype(np.int32)

            return {
                'lidar': [points],
                'poses': [to_world],
                'gt': [all_labels]
        }

        return {
            'lidar': [points],
            'poses': [to_world]
        }

    @staticmethod
    def collate_fn(inputs):
        return inputs
