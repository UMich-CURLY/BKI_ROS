# Welcome!
Thank you for your interest in Convolutional Bayesian Kernel Inference (ConvBKI).
ConvBKI is an optimized semantic mapping algorithm which combines the best of 
probabilistic mapping and learning-based mapping. ConvBKI was previously presented
at ICRA 2023, which you can read more about [here](https://arxiv.org/abs/2209.10663) or 
explore the code from [here](https://github.com/UMich-CURLY/NeuralBKI). 

In this repository and subsequent paper, we further accelerate ConvBKI and test
on more challenging test cases with perceptually difficult scenarios including
real-world military vehicles. An example of these test is playing in the video below.

![Alt Text](./video.gif)

ConvBKI runs as an end-to-end network which you can test using this repository! To test ConvBKI,
clone the repository and download pre-processed ROS bags from the following links:

[KITTI](https://curly-dataset-public.s3.us-east-2.amazonaws.com/Joey/ConvBKI/Kitti/kitti.bag)

[RELLIS-3D](https://curly-dataset-public.s3.us-east-2.amazonaws.com/Joey/ConvBKI/Rellis/rellis.bag)

Next, simply navigate to the EndToEnd directory and run ros_node.py. Once the 
network is up and running as a ROS node, begin playing the ROS bag. Note that you will need
to ensure there is a ROS core, and open RVIZ if you want to visualize the results.
We use SPVCNN as the backbone, which you can find installation instructions on [here](https://github.com/mit-han-lab/spvnas).
As an alternative, we provide a configuration file to create a conda environment, tested on Ubuntu 20.

The bottleneck of the ROS node is the visualization, since each map contains hundreds
of thousand of voxels. We decided not to optimize this, since the most likely use case is to
send the semantic and variance map as a custom ROS message. To run without visualization,
simply set "Publish" in the yaml file to False. If running with "Publish" as True,
we recommend playing the data at a slower rate with the -r <rate> setting to a value such as 0.1
so RVIZ can keep up with the data. 

For more information, please see the below sections on how we preprocessed poses,
and more information on parameters. Unfortunately, we are unable to publish 
the perceptually challenging data due to proprietary restrictions. However, all code
used in the process is made public along with samples on open source data sets
which we create in the notebook CreateBag.ipynb. 


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


## Acknowledgement
We utilize data and code from: 
- [1] [SemanticKITTI](http://www.semantic-kitti.org/)
- [2] [RELLIS-3D](https://arxiv.org/abs/2011.12954)
- [3] [SPVNAS](https://github.com/mit-han-lab/spvnas)
- [4] [LIO-SAM](https://github.com/YJZLuckyBoy/liorf)
- [5] [Semantic MapNet](https://github.com/vincentcartillier/Semantic-MapNet)

## Reference
If you find our work useful in your research work, consider citing [our paper](https://arxiv.org/abs/2209.10663)
```
@ARTICLE{wilson2022convolutional,
  title={Convolutional Bayesian Kernel Inference for 3D Semantic Mapping},
  author={Wilson, Joey and Fu, Yuewei and Zhang, Arthur and Song, Jingyu and Capodieci, Andrew and Jayakumar, Paramsothy and Barton, Kira and Ghaffari, Maani},
  journal={arXiv preprint arXiv:2209.10663},
  year={2022}
}
```
Bayesian Spatial Kernel Smoothing for Scalable Dense Semantic Mapping ([PDF](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=8954837))
```
@ARTICLE{gan2019bayesian,
author={L. {Gan} and R. {Zhang} and J. W. {Grizzle} and R. M. {Eustice} and M. {Ghaffari}},
journal={IEEE Robotics and Automation Letters},
title={Bayesian Spatial Kernel Smoothing for Scalable Dense Semantic Mapping},
year={2020},
volume={5},
number={2},
pages={790-797},
keywords={Mapping;semantic scene understanding;range sensing;RGB-D perception},
doi={10.1109/LRA.2020.2965390},
ISSN={2377-3774},
month={April},}

```
