# This is the type that will transmit a costmap containing information from a sensor.
#
# This is used to send into the fusedCostmapGenerator, which will accumulate these costmaps into the fusedCostmap.

# Header for this map.
# The time is set from the original measurement time.
scene_understanding/MapHeader mapheader

# Costmap Params
float64 sigma_x
float64 sigma_y
float64 mean_x
float64 mean_y

# Actual data
float64[] cost
float64[] height_avg
float64[] height_sum
float64[] height_count
float64[] num_ground_points
float64[] num_obstacle_points

