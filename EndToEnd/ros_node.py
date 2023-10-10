import yaml
import os
import torch
from Segmentation.utils import *
from utils import *
import time
import rospy
import ros_numpy
from visualization_msgs.msg import MarkerArray
from sensor_msgs.msg import PointCloud2
from geometry_msgs.msg import PoseStamped
from tf.transformations import quaternion_matrix
import message_filters


class lidar_poses_subscriber:

    def __init__(self, pc_topic, pose_topic, res, e2e_net, dev,
                 dtype, voxel_sizes, color, publish=False):

        print("Initializing the instance!")

        # initialize the subscriber node now.
        # here we deal with messages of type pointcloud 2 and poses2
        self.map_pub = rospy.Publisher('SemMap_global', MarkerArray, queue_size=10)
        self.next_map = MarkerArray()
        self.var_pub = rospy.Publisher('VarMap_global', MarkerArray, queue_size=10)
        self.var_map = MarkerArray()
        self.frame_count = 0
        self.publish = publish

        self.pc_sub = message_filters.Subscriber(pc_topic, 
                                          PointCloud2)
        self.poses_sub = message_filters.Subscriber(pose_topic, 
                                          PoseStamped)
        ts = message_filters.TimeSynchronizer([self.pc_sub, self.poses_sub], 10)
        ts.registerCallback(self.callback)

        self.lidar = None
        self.res = res
        self.seg_input = None
        self.inv = None
        self.lidar_pose = None
        self.e2e_net = e2e_net
        self.dev = dev
        self.dtype = dtype
        self.voxel_sizes = voxel_sizes
        self.color = color
        print("Subscribed to pointcloud topic: {}, pose topic: {}".format(pc_topic, pose_topic))

    def callback(self, pc_sub, poses_sub):

        # Conversion from PointCloud2 msg to np array.
        lidar_pc = ros_numpy.point_cloud2.pointcloud2_to_xyz_array(pc_sub)
        self.lidar = np.zeros((lidar_pc.shape[0],4))
        self.lidar[:,:3] = lidar_pc
        
        pose_t = np.array([poses_sub.pose.position.x, poses_sub.pose.position.y, poses_sub.pose.position.z])
        pose_quat = np.array([poses_sub.pose.orientation.x, poses_sub.pose.orientation.y, poses_sub.pose.orientation.z, poses_sub.pose.orientation.w])
        self.lidar_pose = quaternion_matrix(pose_quat)
        self.lidar_pose[:3,3] = pose_t
        
        with torch.no_grad():
            self.seg_input, self.inv = generate_seg_in(self.lidar, self.res)

            input_data = [torch.tensor(self.lidar_pose).to(self.dev).type(self.dtype), torch.tensor(self.lidar).to(self.dev).type(self.dtype),
                            self.seg_input, torch.tensor(self.inv).to(self.dev)]

            start_t = time.time()
            self.e2e_net(input_data)
            end_t = time.time()
            print("Inference completed in %.2f seconds" % (end_t - start_t))

            if self.publish:
                self.next_map = publish_local_map(self.e2e_net.grid, self.e2e_net.convbki_net.centroids, self.voxel_sizes, self.color, self.next_map, self.e2e_net.propagation_net.translation)
                self.map_pub.publish(self.next_map)

                self.var_map = publish_var_map(self.e2e_net.grid, self.e2e_net.convbki_net.centroids, self.voxel_sizes, self.color, self.var_map, self.e2e_net.propagation_net.translation)
                self.var_pub.publish(self.var_map)


  
def main():
    MODEL_CONFIG = "KITTI"

    # Model Parameters
    model_params_file = os.path.join(os.getcwd(), "Configs", MODEL_CONFIG + ".yaml")
    with open(model_params_file, "r") as stream:
        try:
            model_params = yaml.safe_load(stream)
        except yaml.YAMLError as exc:
            print(exc)

    dev = 'cuda' if torch.cuda.is_available() else 'cpu'
    dtype = torch.float32

    e2e_net = load_model(model_params, dev)

    # Subscribe 
    sub = lidar_poses_subscriber(model_params["pc_topic"], model_params["pose_topic"], model_params["res"], e2e_net, dev,
                                 dtype, model_params["voxel_sizes"], model_params["colors"], publish=model_params["publish"])
    rospy.init_node('listener', anonymous=True)

    rospy.spin()


if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
