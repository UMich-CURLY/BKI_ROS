#!/usr/bin/env python3
import numpy as np
import torch
import torch.nn.functional as F
from cv_bridge import CvBridge
import rospy
from PIL import Image
import message_filters
import yaml
from sensor_msgs.msg import Image, PointCloud2, CameraInfo
from sensor_msgs import point_cloud2
import tf2_ros
import tf
from tf.transformations import *
from util import *
import cv2


def image_callback(image_msg: Image, lidar_msg: PointCloud2):
    # Convert input image to tensor, run it through semantic segmentation model, convert it back
    cv_image = bridge.imgmsg_to_cv2(image_msg, "passthrough")
    tensor_image = torch.from_numpy(np.copy(cv_image)).float().flip(dims=[0]).type(torch.float32)/255.0    
    tensor_image = torch.stack((tensor_image, tensor_image, tensor_image), dim = 0)[None, :, :, :].cuda()
    pred = model(tensor_image)
    pred = get_labels(pred)
    CFG = yaml.safe_load(open('config/rellis.yaml', 'r'))
    id_color_map = CFG["color_map"]
    color_label = convert_color(pred, id_color_map)
    ros_image = bridge.cv2_to_imgmsg(color_label, encoding="rgb8")

    rgb_image = np.zeros((color_label.shape[0], color_label.shape[1], 3), dtype=np.uint8)
    rgb_image[:68, :128, 0] = 255
    rgb_image[:68, 128:, 1] = 255
    rgb_image[68:, :128, 2] = 255
    rgb_image[68:, 128:, :] = 255
    ros_image = bridge.cv2_to_imgmsg(rgb_image, encoding="rgb8")

    # pub.publish(ros_image)

    # Transform the point cloud into the RGB camera frame
    data = np.array(list(point_cloud2.read_points(lidar_msg)))[:,:3]
    data = np.dot(R, data.T).T + t



    # Project points onto camera image plane
    projected_points = np.dot(cam_intrinsics, data.T)
    projected_points = projected_points[:2, :] / projected_points[2, :]


    # Undistort the points
    points2d = cv2.undistortPoints(projected_points, cam_intrinsics, distortion_coef).squeeze()

    mask = np.ones(data[:, 2].shape, dtype = np.int8)
    mask[np.where(data[:, 2]<=0)[0]] = 0
    mask[np.where(0 > points2d[:, 0])[0]] = 0
    mask[np.where(image_msg.width <= points2d[:, 0])[0]] = 0
    mask[np.where(0 > points2d[:, 1])[0]] = 0
    mask[np.where(image_msg.height <= points2d[:, 0])[0]] = 0
    rospy.loginfo(data[np.where(mask==1)[0]])

    data = data[np.where(mask==1)[0]]
    points = np.zeros(data.shape[0], dtype=[('x', np.float32), ('y', np.float32), ('z', np.float32)])
    points['x'] = data[:, 0]
    points['y'] = data[:, 1]
    points['z'] = data[:, 2]
    bytearray_data = np.asarray(points).tobytes()
    cloud = PointCloud2()
    cloud.header = lidar_msg.header
    cloud.fields = lidar_msg.fields
    cloud.is_bigendian = False
    cloud.point_step = 12 # 3 floats * 4 bytes/float
    cloud.row_step = cloud.point_step * data.shape[0]
    cloud.width = data.shape[0]
    cloud.height = 1
    cloud.data = bytearray_data
    pub.publish(cloud)





   
if __name__ == '__main__':
    rospy.init_node("semantics_node")

    # Load model
    bridge = CvBridge()
    model = load_model()
    model.eval().cuda()


    # Get transformations from lidar to camera frame
    tf_buffer = tf2_ros.Buffer()
    tf_listener = tf2_ros.TransformListener(tf_buffer)
    tf_buffer.can_transform("mrzr/perception/stereo/front_center_multisense/left_camera_frame", "os1_lidar", rospy.Time(), rospy.Duration(1.0))
    transform = tf_buffer.lookup_transform("mrzr/perception/stereo/front_center_multisense/left_camera_frame", "os1_lidar", rospy.Time())
    q = np.array([transform.transform.rotation.x, 
              transform.transform.rotation.y, 
              transform.transform.rotation.z, 
              transform.transform.rotation.w])
    t = np.array([transform.transform.translation.x, 
              transform.transform.translation.y, 
              transform.transform.translation.z])
    R = tf.transformations.quaternion_matrix(q)[:3,:3]
    t = np.array(t)

    # Set up camera intrinsics
    intrinsics_msg = rospy.wait_for_message('/mrzr/perception/stereo/front_center_multisense/left/image_rect/camera_info', CameraInfo)
    cam_intrinsics = np.array(intrinsics_msg.K).reshape((3,3)) # Camera intrinsics matrix
    distortion_coef = np.array(intrinsics_msg.D) # Camera distortion coefficients

    

    # Set up subscribers
    img_sub = message_filters.Subscriber('/mrzr/perception/stereo/front_center_multisense/left/image_rect', Image)
    lidar_sub = message_filters.Subscriber('/mrzr/perception/lidar/front/point_cloud', PointCloud2)
    # pub = rospy.Publisher('/test/tester', Image, queue_size=15)
    pub = rospy.Publisher('/test/tester', PointCloud2, queue_size=15)


    ts = message_filters.ApproximateTimeSynchronizer([img_sub, lidar_sub], queue_size=10, slop=0.1)
    ts.registerCallback(image_callback)

    rospy.spin()
