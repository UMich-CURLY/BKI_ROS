import open3d as o3d
import time
import numpy as np
import os
import json
import pdb
import yaml
from NuScenes import *

LABEL_COLORS = np.array([
    (0, 0, 0),  # None
    (70, 70, 70),  # Building
    (100, 40, 40),  # Fences
    (55, 90, 80),  # Other
    (255, 255, 0),  # Pedestrian
    (153, 153, 153),  # Pole
    (157, 234, 50),  # RoadLines
    (0, 0, 255),  # Road
    (255, 255, 255),  # Sidewalk
    (0, 155, 0),  # Vegetation
    (255, 0, 0),  # Vehicle
    (102, 102, 156),  # Wall
    (220, 220, 0),  # TrafficSign
    (70, 130, 180),  # Sky
    (0, 0, 0),  # Ground
    (150, 100, 100),  # Bridge
    (230, 150, 140),  # RailTrack
    (180, 165, 180),  # GuardRail
    (250, 170, 30),  # TrafficLight
    (110, 190, 160),  # Static
    (170, 120, 50),  # Dynamic
    (45, 60, 150),  # Water
    (145, 170, 100),  # Terrain
]) / 255.0  # normalize each channel [0-1] since is what Open3D uses


# vectorized point generation
def gen_points(dataset, idx, global_coord=True, prev_pose=None):
    """
        min_dim     -
        max_dim     -
        steps       1x3
        c
    """
    in_dict = dataset[idx]
    pc = in_dict["lidar"][0]
    labels = in_dict["targets"][0]
    pose = in_dict["poses"][0]

    if global_coord:
        pc = np.dot(pose[:3, :3], pc[:, :3].T).T + pose[:3, 3]
    else:
        if prev_pose is None:
            pc = pc[:, :3]
        else:
            ego_to_map = np.dot(np.linalg.inv(prev_pose), pose)
            pc = np.dot(ego_to_map[:3, :3], pc[:, :3].T).T + ego_to_map[:3, 3]
            print(pc.shape)

    # add to point lists
    point_list = o3d.geometry.PointCloud()
    point_list.points = o3d.utility.Vector3dVector(pc)
    point_list.colors = o3d.utility.Vector3dVector(LABEL_COLORS[labels])
    return point_list, pose


# test code

def main(yaml_loc, global_coord):
    vis = o3d.visualization.Visualizer()
    print(yaml_loc)
    with open(yaml_loc, "r") as stream:
        try:
            data_params = yaml.safe_load(stream)
        except yaml.YAMLError as exc:
            print(exc)
    print(data_params)

    dataset = nuScenes(data_params["root"], "val", data_params["num_frames"], data_params["labels_remap"],
                       data_params["kept_labels"], remap=True)

    try:
        vis.create_window(
            window_name='Segmented Scene',
            width=960,
            height=540,
            left=480,
            top=270)
        vis.get_render_option().background_color = [0.0, 0.0, 0.0]
        vis.get_render_option().point_size = 3

        # Load frames
        frame = 0
        point_list, prev_pose = gen_points(dataset, frame, global_coord=global_coord, prev_pose=None)
        cur_seq = dataset.scene_nums[frame]
        geometry = o3d.geometry.PointCloud(point_list)
        vis.add_geometry(geometry)
        while True:
            print("frame:", frame)

            if cur_seq == dataset.scene_nums[frame]:
                new_list, pose = gen_points(dataset, frame, global_coord=global_coord, prev_pose=prev_pose)
                point_list = point_list + new_list
            else:
                new_list, pose = gen_points(dataset, frame, global_coord=global_coord, prev_pose=None)
                prev_pose = pose
                point_list = new_list
                cur_seq = dataset.scene_nums[frame]

            geometry.points = point_list.points
            geometry.colors = point_list.colors

            vis.update_geometry(geometry)

            for i in range(10):
                vis.poll_events()
                vis.update_renderer()
                time.sleep(0.005)

            frame += 1

    finally:
        vis.destroy_window()


if __name__ == "__main__":
    try:
        main("/home/tigeriv/Code/NuScenesConvBKI/EndToEnd/Configs/nuscenes/MotionNet.yaml", False)
    except KeyboardInterrupt:
        print(' - Exited by user.')