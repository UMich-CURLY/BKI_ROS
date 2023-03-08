# This type is a DTO for the uxi_costmap/FusedCostmap type. The members here
# should be able to exactly mimic the class's internal structure, without loss
# of information

scene_understanding/MapHeader mapheader
std_msgs/String     uuid

# Look at the FusedCostMap class for a definition on what this means
float64 xc
float64 yc

# All of these maps are stored in column major format.
float64[] cost
float64[] weight
# guassian_weights is not included.
float64[] num_ground_points
float64[] num_obstacle_points
float64[] ground_elevation
float64[] ground_elevation_confidence
int8[]    updated_cells
