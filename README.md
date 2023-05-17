## Preprocess Poses
We use LIO-SAM to preprocess poses - https://github.com/TixiaoShan/LIO-SAM

  
## Install
See LIO-SAM documentation for software and hardware dependency information.
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

#### Run mapping

You can run the mapping module which will create a ros publisher that publish the map and can be visualized on rviz.

1. Run ros_node.py:
```
cd ~/BKI_ROS/EndToEnd
python ros_node.py
```
2. Play processed rosbag:
```
rosbag play your-bag.bag
```

#### YAML Parameters

Parameters can be set in the yaml config file, and it can be found in EndtoEnd/Configs

* pc_topic - the name of the pointcloud topic to subscribe to
* pose_topic - the name of the pose topic to subscribe to
* num_classes - number of semantic classes

* grid_size, min_bound, max_bound, voxel_sizes - parameters for convbki layer
* f - convbki layer kernel size
* res, cr - parameters for SPVNAS segmentation net
* seg_path - saved weights for SPVNAS segmentation net
* model_path - saved weights for convbki layer

#### Model Weights

Weights for SPVNAS segmentation network and convbki layer are located in EndtoEnd/weights, currently the weights are trained on [Rellis3D dataset](https://github.com/unmannedlab/RELLIS-3D). If you have other pretrained weights, you should store them here and change the seg_path and model_path in the config file accordingly. 


