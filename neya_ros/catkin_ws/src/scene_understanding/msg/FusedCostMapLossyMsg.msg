# This type is a DTO for the uxi_costmap/FusedCostmap type. The members here
# should be able to exactly mimic the class's internal structure, without loss
# of information

scene_understanding/MapHeader mapheader
std_msgs/String     uuid

# Look at the FusedCostMap class for a definition on what this means
float64 xc
float64 yc

# All of these maps are stored in column major format.
uint8[] cost
