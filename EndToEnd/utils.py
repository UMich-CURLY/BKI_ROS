from Segmentation.spvcnn import *
import torch
from ConvBKI.ConvBKI import *
from Propagation.mapping_utils import *
from BKINet import *

from geometry_msgs.msg import Point32
from std_msgs.msg import ColorRGBA
import rospy
from visualization_msgs.msg import MarkerArray, Marker


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

    bki_layer = ConvBKI(grid_size, min_bound, max_bound,
                        filter_size=f, num_classes=num_classes, device=dev)
    bki_layer.load_state_dict(torch.load(model_params["model_path"]))

    e2e_net = BKINet(seg_net, bki_layer, prop_net, grid_size, device=dev, num_classes=num_classes)
    return e2e_net


def publish_local_map(labeled_grid, centroids, voxel_dims, colors, next_map, translation, ignore_label=0):
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


def publish_var_map(labeled_grid, centroids, voxel_dims, colors, var_map, translation, ignore_label=0,
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


def reset_vis(map_pub):
    marker_array_msg = MarkerArray()
    marker = Marker()
    marker.id = 0
    marker.ns = "Local Semantic Map"
    marker.action = Marker.DELETEALL
    marker_array_msg.markers.append(marker)
    map_pub.publish(marker_array_msg)