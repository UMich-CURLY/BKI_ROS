cmake_minimum_required(VERSION 3.0.2)
project(scene_understanding)


find_package(catkin REQUIRED COMPONENTS
    message_generation
    nav_msgs
    sensor_msgs
    std_msgs
)
	
add_message_files(
    FILES
    AutonomyState.msg
    BooleanMap.msg
    ConfidenceMap.msg
    Control.msg
    Costmap.msg
    DriveByWireState.msg
    ElevationMap.msg
    Eulers.msg
    FusedCostMapLossyMsg.msg
    FusedCostMapMsg.msg
    GPSHeading.msg
    GPSLatLong.msg
    LatLonHeading.msg
    LoggerControl.msg
    LoggerStatus.msg
    MapHeader.msg
    PIQDInfo.msg
    PointCloudWithOdom.msg
    SensorCostmap.msg
    StereoImagePair.msg
    StereoImagePair_old.msg
    UxIWorldModel.msg
    VoxelData.msg
    VoxelValue.msg
    WheelEncoderData.msg
)

add_service_files(
  FILES
  SetCostMapAroundVehicle.srv
)

generate_messages(
    DEPENDENCIES
    nav_msgs
    sensor_msgs
    std_msgs
)

catkin_package(
    CATKIN_DEPENDS
    message_runtime
    nav_msgs
    sensor_msgs
    std_msgs
)
