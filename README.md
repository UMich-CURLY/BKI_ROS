## Preprocess Poses
We use LIO-SAM to preprocess poses - https://github.com/TixiaoShan/LIO-SAM

## Dependency

- [ROS](http://wiki.ros.org/ROS/Installation) (tested with Kinetic and Melodic. Refer to [#206](https://github.com/TixiaoShan/LIO-SAM/issues/206) for Noetic)
  ```
  sudo apt-get install -y ros-kinetic-navigation
  sudo apt-get install -y ros-kinetic-robot-localization
  sudo apt-get install -y ros-kinetic-robot-state-publisher
  ```
- [gtsam](https://gtsam.org/get_started/) (Georgia Tech Smoothing and Mapping library)
  ```
  sudo add-apt-repository ppa:borglab/gtsam-release-4.0
  sudo apt install libgtsam-dev libgtsam-unstable-dev
  ```
- [TorchSparse](https://github.com/mit-han-lab/torchsparse) (for SPVNAS segmentation network)
  ```
  sudo apt-get install libsparsehash-dev
  ```
  
## Install

Use the following commands to download and compile the package.

```
git clone https://github.com/UMich-CURLY/BKI_ROS.git
mv ~/BKI_ROS/lio-sam/liorf ~/catkin_ws/src
cd ~/catkin_ws
catkin_make
```

We also provide an environment.yml which you can use to create a conda environment (This is only tested on Ubuntu 20)
```
cd ~/BKI_ROS/EndToEnd
conda env create -f environment.yml
conda activate bkiros
```

## Prepare lidar data

The user needs to prepare the point cloud data in the correct format for cloud deskewing, which is mainly done in "imageProjection.cpp". The two requirements are:
  - **Provide point time stamp**. LIO-SAM uses IMU data to perform point cloud deskew. Thus, the relative point time in a scan needs to be known. The up-to-date Velodyne ROS driver should output this information directly. Here, we assume the point time channel is called "time." The definition of the point type is located at the top of the "imageProjection.cpp." "deskewPoint()" function utilizes this relative time to obtain the transformation of this point relative to the beginning of the scan. When the lidar rotates at 10Hz, the timestamp of a point should vary between 0 and 0.1 seconds. If you are using other lidar sensors, you may need to change the name of this time channel and make sure that it is the relative time in a scan.
  - **Provide point ring number**. LIO-SAM uses this information to organize the point correctly in a matrix. The ring number indicates which channel of the sensor that this point belongs to. The definition of the point type is located at the top of "imageProjection.cpp." The up-to-date Velodyne ROS driver should output this information directly. Again, if you are using other lidar sensors, you may need to rename this information. Note that only mechanical lidars are supported by the package currently.

## Prepare IMU data

  - **IMU requirement**. Like the original LOAM implementation, LIO-SAM only works with a 9-axis IMU, which gives roll, pitch, and yaw estimation. The roll and pitch estimation is mainly used to initialize the system at the correct attitude. The yaw estimation initializes the system at the right heading when using GPS data. Theoretically, an initialization procedure like VINS-Mono will enable LIO-SAM to work with a 6-axis IMU. (**New**: [liorf](https://github.com/YJZLuckyBoy/liorf) has added support for 6-axis IMU.) The performance of the system largely depends on the quality of the IMU measurements. The higher the IMU data rate, the better the system accuracy. We use Microstrain 3DM-GX5-25, which outputs data at 500Hz. We recommend using an IMU that gives at least a 200Hz output rate. Note that the internal IMU of Ouster lidar is an 6-axis IMU.

  - **IMU alignment**. LIO-SAM transforms IMU raw data from the IMU frame to the Lidar frame, which follows the ROS REP-105 convention (x - forward, y - left, z - upward). To make the system function properly, the correct extrinsic transformation needs to be provided in "params.yaml" file. **The reason why there are two extrinsics is that in the original IMU used for testing (Microstrain 3DM-GX5-25) acceleration and attitude have different cooridinates. Depend on your IMU manufacturer, the two extrinsics for your IMU may or may not be the same**. Using our setup as an example:
    - we need to set the readings of x-z acceleration and gyro negative to transform the IMU data in the lidar frame, which is indicated by "extrinsicRot" in "params.yaml."
    - The transformation of attitude readings might be slightly different. IMU's attitude measurement `q_wb` usually means the rotation of points in the IMU coordinate system to the world coordinate system (e.g. ENU). However, the algorithm requires `q_wl`, the rotation from lidar to world. So we need a rotation from lidar to IMU `q_bl`, where `q_wl = q_wb * q_bl`. For convenience, the user only needs to provide `q_lb` as "extrinsicRPY" in "params.yaml" (same as the "extrinsicRot" if acceleration and attitude have the same coordinate).
    
## Run the package

1. Run the launch file:
```
cd ~/catkin_ws/src/liorf/launch
roslaunch liorf run_lio_sam_ouster.launch
```

2. Play existing bag files:
```
rosbag play your-bag.bag
```

3. Call the save map service to create new rosbag:
```
rosservice call /liorf/save_map "{}"
```

**Before creating rosbag** change line 392 in ~/catkin_ws/src/liorf/src/mapOptimization.cpp to bag.open("/your/directory/lidarPoses.bag", rosbag::bagmode::Write);
 

For a more detailed setup guide to LIO-SAM, please see https://github.com/TixiaoShan/LIO-SAM and https://github.com/YJZLuckyBoy/liorf

## Mapping with rosbag

You can run the mapping module which will create a ros publisher that publish the map and can be visualized on rviz.
```
cd ~/BKI_ROS/EndToEnd
python ros_node.py
```

Parameters can be set in the yaml config file, and it can be found in EndtoEnd/Configs

#### YAML Parameters
* pc_topic - the name of the pointcloud topic to subscribe to
* pose_topic - the name of the pose topic to subscribe to
* num_classes - number of semantic classes

* grid_size, min_bound, max_bound, voxel_sizes - parameters for convbki layer
* f - convbki layer kernel size
* res, cr - parameters for SPVNAS segmentation net
* seg_path - saved weights for SPVNAS segmentation net
* model_path - saved weights for convbki layer



