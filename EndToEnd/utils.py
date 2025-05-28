from Segmentation.spvcnn import *
import torch
from ConvBKI.ConvBKI import *
from Propagation.mapping_utils import *
from BKINet import *

from geometry_msgs.msg import Point32
from std_msgs.msg import ColorRGBA
import rospy
from visualization_msgs.msg import MarkerArray, Marker

import sensor_msgs.point_cloud2 as pcl2
from sensor_msgs.msg import PointCloud2, PointField
from std_msgs.msg import Header


def load_model(model_params, dev):
    # Segmentation network

    # KITTI
    if model_params["num_classes"] == 11:
        seg_net = SPVCNN(
            num_classes=19,
            cr=model_params["cr"],
            pres=model_params["res"],
            vres=model_params["res"]).to(dev)
        seg_net.load_state_dict(torch.load(model_params["seg_path"]))
    else: # RELLIS
        seg_net = SPVCNN(
            num_classes=model_params["num_classes"],
            cr=model_params["cr"],
            pres=model_params["res"],
            vres=model_params["res"]).to(dev)
        seg_net.load_state_dict(torch.load(model_params["seg_path"])['model'])

    prop_net = TransformWorldStatic(torch.tensor(model_params["voxel_sizes"]).to(dev))

    grid_size = torch.tensor(model_params["grid_size"]).to(dev)
    min_bound = torch.tensor(model_params["min_bound"]).to(dev)
    max_bound = torch.tensor(model_params["max_bound"]).to(dev)
    num_classes = model_params["num_classes"]
    f = model_params["f"]
    remap = model_params["remap"]
    
    free = model_params["free"]
    if free:
        num_classes += 1

    bki_layer = ConvBKI(grid_size, min_bound, max_bound,
                        filter_size=f, num_classes=num_classes, device=dev)
    # Free space kernel
    if free:
        with torch.no_grad():
            bki_layer.ell_h[-1] = 0.05
            bki_layer.ell_z[-1] = 0.05
    
    # Load weights if they already exist
    if model_params["model_path"]:
        weights = torch.load(model_params["model_path"])
        ell_h = weights["ell_h"]
        ell_z = weights["ell_z"]
        N = ell_h.shape[0]
        with torch.no_grad():
            bki_layer.ell_h[:N] = ell_h
            bki_layer.ell_z[:N] = ell_z

    e2e_net = BKINet(seg_net, bki_layer, prop_net, grid_size, device=dev, num_classes=num_classes, remap=remap, free=free)
    return e2e_net


def publish_local_map(labeled_grid, centroids, voxel_dims, colors, next_map, translation, ignore_label=None):
    next_map.markers.clear()
    marker = Marker()
    marker.id = 0
    marker.ns = "Local Semantic Map"
    marker.header.frame_id = "map"
    marker.type = Marker.CUBE_LIST
    marker.action = Marker.ADD
    marker.lifetime.secs = 0
    marker.header.stamp = rospy.Time.now()

    marker.pose.orientation.x = 0.0
    marker.pose.orientation.y = 0.0
    marker.pose.orientation.z = 0.0
    marker.pose.orientation.w = 1

    marker.scale.x = voxel_dims[0]
    marker.scale.y = voxel_dims[1]
    marker.scale.z = voxel_dims[2]

    X, Y, Z, C = labeled_grid.shape
    semantic_labels = labeled_grid.view(-1, C).detach().cpu().numpy()
    centroids = centroids.detach().cpu().numpy()

    # Remove high variance points
    semantic_sums = np.sum(semantic_labels, axis=-1, keepdims=False)
    valid_mask = semantic_sums >= 0.1

    semantic_labels = semantic_labels[valid_mask, :]
    centroids = centroids[valid_mask, :]

    semantic_labels = np.argmax(semantic_labels / np.sum(semantic_labels, axis=-1, keepdims=True), axis=-1)
    semantic_labels = semantic_labels.reshape(-1, 1)

    # Filter out ignore label
    if ignore_label:
        keep_mask = semantic_labels.squeeze() != ignore_label
        semantic_labels = semantic_labels[keep_mask, :]
        centroids = centroids[keep_mask, :]
        if centroids.shape[0] <= 1:
            return next_map

    # Offset to global coords
    centroids = centroids + translation.view(1, -1).detach().cpu().numpy()

    for i in range(semantic_labels.shape[0]):
        pred = semantic_labels.squeeze()[i]
        point = Point32()
        color = ColorRGBA()
        point.x = centroids[i, 0]
        point.y = centroids[i, 1]
        point.z = centroids[i, 2]
        color.r, color.g, color.b = colors[pred]
        color.r = color.r / 255.
        color.g = color.g / 255.
        color.b = color.b / 255.

        color.a = 1.0
        marker.points.append(point)
        marker.colors.append(color)

    next_map.markers.append(marker)
    return next_map


def pack_rgb(r, g, b):
    return np.array([r, g, b, 0], dtype=np.uint8).view(np.float32)[0]

def pack_rgb_array(rgb):
    rgb_uint8 = rgb.astype(np.uint8)
    rgb_packed = np.left_shift(rgb_uint8[:, 0].astype(np.uint32), 16) \
               | np.left_shift(rgb_uint8[:, 1].astype(np.uint32), 8) \
               | rgb_uint8[:, 2].astype(np.uint32)
    return rgb_packed.view(np.float32)


def publish_semantic_points(labeled_grid, centroids, voxel_dims, colors, next_map, translation, ignore_label=None):
    fields = [
        PointField('x', 0, PointField.FLOAT32, 1),
        PointField('y', 4, PointField.FLOAT32, 1),
        PointField('z', 8, PointField.FLOAT32, 1),
        PointField('rgb', 12, PointField.FLOAT32, 1)
    ]
    header = Header()
    header.stamp = rospy.Time.now()
    header.frame_id = "map"  # or "base_link", etc.

    X, Y, Z, C = labeled_grid.shape
    semantic_labels = labeled_grid.view(-1, C)
    centroids = centroids

    # Remove high variance points
    semantic_sums = torch.sum(semantic_labels, dim=-1, keepdims=False)
    valid_mask = semantic_sums >= 0.1

    semantic_labels = semantic_labels[valid_mask, :]
    centroids = centroids[valid_mask, :]

    semantic_labels = torch.argmax(semantic_labels / torch.sum(semantic_labels, dim=-1, keepdims=True), dim=-1)
    semantic_labels = semantic_labels.reshape(-1, 1)

    # Filter out ignore label
    if ignore_label:
        keep_mask = semantic_labels.squeeze() != ignore_label
        semantic_labels = semantic_labels[keep_mask, :]
        centroids = centroids[keep_mask, :]
        if centroids.shape[0] <= 1:
            return next_map

    # Offset to global coords
    centroids = centroids + translation.view(1, -1)
    color_labels = []
    for ordered_key in sorted(list(colors.keys())):
        color_labels.append(colors[ordered_key])
    color_labels = torch.tensor(color_labels)
    colors = color_labels[semantic_labels.squeeze(1)].detach().cpu().numpy().astype(np.uint8)
    
    rgb_packed = pack_rgb_array(colors).reshape(-1, 1)

    cloud_msg = pcl2.create_cloud(header, fields, np.hstack((centroids.detach().cpu().numpy(), rgb_packed)))
    return cloud_msg



def publish_var_map(labeled_grid, centroids, voxel_dims, colors, var_map, translation, ignore_label=None,
                    min_var=0, mid_var=0.25, max_var=0.25, color_max=255):
    var_map.markers.clear()
    marker = Marker()
    marker.id = 0
    marker.ns = "Local Variance Map"
    marker.header.frame_id = "map"
    marker.type = Marker.CUBE_LIST
    marker.action = Marker.ADD
    marker.lifetime.secs = 0
    marker.header.stamp = rospy.Time.now()

    marker.pose.orientation.x = 0.0
    marker.pose.orientation.y = 0.0
    marker.pose.orientation.z = 0.0
    marker.pose.orientation.w = 1

    marker.scale.x = voxel_dims[0]
    marker.scale.y = voxel_dims[1]
    marker.scale.z = voxel_dims[2]

    X, Y, Z, C = labeled_grid.shape
    semantic_labels = labeled_grid.view(-1, C).detach().cpu().numpy()
    centroids = centroids.detach().cpu().numpy()

    # Offset to global coords
    centroids = centroids + translation.view(1, -1).detach().cpu().numpy()

    # Remove high variance points
    semantic_sums = np.sum(semantic_labels, axis=-1, keepdims=False)
    valid_mask = semantic_sums >= 0.5
    point_sums = semantic_sums[valid_mask]
    semantic_labels = semantic_labels[valid_mask, :]
    centroids = centroids[valid_mask, :]

    max_labels = np.argmax(semantic_labels, axis=-1)
    point_consts = np.amax(semantic_labels, axis=-1) / point_sums
    point_vars = point_consts * (1 - point_consts) / (1 + point_sums)

    # Filter out ignore label
    if ignore_label:
        keep_mask = max_labels != ignore_label
        point_vars = point_vars[keep_mask]
        semantic_labels = semantic_labels[keep_mask]
        # print(np.mean(sigmoid(point_vars)), np.min(sigmoid(point_vars)), np.max(sigmoid(point_vars)))
        centroids = centroids[keep_mask, :]
        if centroids.shape[0] <= 1:
            return var_map

    for i in range(semantic_labels.shape[0]):
        var = point_vars[i]
        point = Point32()
        color = ColorRGBA()
        if var >= max_var:
            color.r = 1.0
            color.g = 0.0
            color.b = 0
        else:
            color.r = var/max_var # sigmoid(var)
            color.g = 0.7 * (1 - var/max_var) # 0.6 * (1 - sigmoid(var))
            color.b = 1 - var/max_var # 1 - sigmoid(var)

        point.x = centroids[i, 0]
        point.y = centroids[i, 1]
        point.z = centroids[i, 2]

        color.a = 1.0
        marker.points.append(point)
        marker.colors.append(color)

    var_map.markers.append(marker)
    return var_map


def publish_var_points(labeled_grid, centroids, voxel_dims, colors, var_map, translation, ignore_label=None,
                    min_var=0, mid_var=0.25, max_var=0.25, color_max=255):
    fields = [
        PointField('x', 0, PointField.FLOAT32, 1),
        PointField('y', 4, PointField.FLOAT32, 1),
        PointField('z', 8, PointField.FLOAT32, 1),
        PointField('rgb', 12, PointField.FLOAT32, 1)
    ]
    header = Header()
    header.stamp = rospy.Time.now()
    header.frame_id = "map"  # or "base_link", etc.

    X, Y, Z, C = labeled_grid.shape
    semantic_labels = labeled_grid.view(-1, C)
    centroids = centroids

    # Remove high variance points
    semantic_sums = torch.sum(semantic_labels, dim=-1, keepdims=False)
    valid_mask = semantic_sums >= 0.1
    point_sums = semantic_sums[valid_mask]
    semantic_labels = semantic_labels[valid_mask, :]
    centroids = centroids[valid_mask, :]

    semantic_labels = torch.argmax(semantic_labels, dim=-1)
    point_consts = torch.amax(semantic_labels, dim=-1) / point_sums
    point_vars = point_consts * (1 - point_consts) / (1 + point_sums)

    # Filter out ignore label
    if ignore_label:
        keep_mask = semantic_labels.view(-1) != ignore_label
        semantic_labels = semantic_labels[keep_mask]
        centroids = centroids[keep_mask, :]
        point_vars = point_vars[keep_mask]
        if centroids.shape[0] <= 1:
            return var_map

    # Offset to global coords
    centroids = centroids + translation.view(1, -1)

    # Variance
    colors = torch.zeros([centroids.shape[0], 3])
    colors[:, 0] = point_vars/max_var
    colors[:, 1] = 0.7 * (1 - point_vars/max_var)
    colors[:, 2] = 1 - point_vars / max_var
    max_mask = point_vars > max_var   
    colors[max_mask, 0] = 1.0
    colors[max_mask, 1] = 0.0
    colors[max_mask, 2] = 0.0 
    colors = (255 * torch.clip(colors, min=0, max=1)).detach().cpu().numpy().astype(np.uint8)
    
    rgb_packed = pack_rgb_array(colors).reshape(-1, 1)

    cloud_msg = pcl2.create_cloud(header, fields, np.hstack((centroids.detach().cpu().numpy(), rgb_packed)))
    return cloud_msg


def reset_vis(map_pub):
    marker_array_msg = MarkerArray()
    marker = Marker()
    marker.id = 0
    marker.ns = "Local Semantic Map"
    marker.action = Marker.DELETEALL
    marker_array_msg.markers.append(marker)
    map_pub.publish(marker_array_msg)