# Welcome!

Thank you for your interest in Convolutional Bayesian Kernel Inference (ConvBKI).
ConvBKI is an optimized semantic mapping algorithm which combines the best of 
probabilistic mapping and learning-based mapping. ConvBKI was previously presented
at ICRA 2023, which you can read more about [here](https://arxiv.org/abs/2209.10663) or 
explore the code from [here](https://github.com/UMich-CURLY/NeuralBKI). 

In this repository and subsequent paper, we further accelerate ConvBKI and test
on more challenging test cases with perceptually difficult scenarios including
real-world military vehicles. An example from the real-world testing is playing below.

![Alt Text](./video.gif)

ConvBKI runs as an end-to-end network which you can test using this repository! To test ConvBKI,
clone the repository and have your pre-processed ROS2 bags ready.

Next, simply navigate to the EndToEnd directory and run ros2_node.py. Once the 
network is up and running as a ROS2 node, begin playing the ROS2 bag. Note that you will need
to open RVIZ2 if you want to visualize the results.
We use SPVCNN as the backbone, which you can find installation instructions on [here](https://github.com/mit-han-lab/spvnas).
As an alternative, we provide a configuration file to create a conda environment, tested on Ubuntu 22.

The bottleneck of the ROS2 node is the visualization, since each map contains hundreds
of thousand of voxels. We decided not to optimize this, since the most likely use case is to
send the semantic and variance map as a custom ROS2 message. To run without visualization,
simply set "Publish" in the yaml file to False. If running with "Publish" as True,
we recommend playing the data at a slower rate with the -r <rate> setting to a value such as 0.1
so RVIZ2 can keep up with the data. 

For more information, please see the below sections on how we preprocessed poses,
and more information on parameters. Unfortunately, we are unable to publish 
the perceptually challenging data due to proprietary restrictions. However, all code
used in the process is made public along with samples on open source data sets
which we create in the notebook CreateBag.ipynb. 

### Note
This branch provides a ROS2 wrapper (ROS2 Humble) for ConvBKI, whereas the main branch supports ROS1. The primary intention of this work was to have ROS2 wrapper for the 3D Mapping, though we do provide resources how localization can be supported with this wrapper.

## Install

### Localization (for pre-processing the poses)
You can ignore the Localization instructions if you already have the pre-processed pose data in a ROS2 bag file.

See LIO-SAM documentation for software and hardware dependency information.

- If using ROS1 (in which case you'll likely use ros1bridge to talk to ros2_node), use the following commands to download and compile the package.

```
git clone -b ros2 https://github.com/UMich-CURLY/BKI_ROS.git
mv ~/BKI_ROS/lio-sam/liorf ~/catkin_ws/src
cd ~/catkin_ws
catkin_make
```

- If using ROS2, use the ros2 branch of- https://github.com/TixiaoShan/LIO-SAM

### Mapping

- Option 1: We provide an environment.yml which you can use to create a conda environment. It has all the dependencies from the working environment. But NOT RECOMMENDED since it always caused dependency conflicts (But just for reference we're providing it)
```
git clone -b ros2 https://github.com/UMich-CURLY/BKI_ROS.git
cd ~/BKI_ROS/EndToEnd/backup_env_yml
conda env create -f environment.yml
conda activate bkiros2
```

- Option 2: RECOMMENDED (tested on Ubuntu 22.04)
```
git clone -b ros2 https://github.com/UMich-CURLY/BKI_ROS.git
cd ~/BKI_ROS/EndToEnd
conda env create -f environment.yml
conda activate bkiros2
conda install nvidia/label/cuda-11.8.0::cuda-toolkit
conda install pytorch==2.3.0 torchvision==0.18.0 torchaudio==2.3.0 pytorch-cuda=11.8 -c pytorch -c nvidia
sudo apt-get install libsparsehash-dev
pip install --upgrade git+https://github.com/mit-han-lab/torchsparse.git@v1.4.0
```

## Mapping with ros2 bag

#### Run mapping

You can run the mapping module which will create a ros2 publisher that publish the map and can be visualized on rviz2.

1. Run ros2_node.py:
```
cd ~/BKI_ROS/EndToEnd
python ros2_node.py
```
2. Play processed ros2 bag:
```
ros2 bag play your-bag.db3
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

Weights for SPVNAS segmentation network and convbki layer are located in EndtoEnd/weights, currently the weights are trained on [Rellis3D dataset](https://github.com/unmannedlab/RELLIS-3D) for off-road driving and Semantic KITTI [1] for on-road driving. If you have other pretrained weights, you should store them here and change the seg_path and model_path in the config file accordingly. 
  
## Run the package (with ROS1 only)

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
