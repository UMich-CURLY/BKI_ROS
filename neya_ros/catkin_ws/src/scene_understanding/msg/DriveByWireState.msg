Header header

string name

# These match what is in the uxi_controller/include/uxiController_Enumerations.h
int32 REVERSE=0
int32 NEUTRAL=1
int32 HIGH_GEAR=2
int32 LOW_GEAR=3
int32 CUSTOM=4

int32 commanded_gear
int32 measured_gear

int32 mode

float64 commanded_steering_perc
float64 measured_steering_perc

float64 commanded_gasbrake_perc
float64 measured_gasbrake_perc

# Indicates the vehicle is ignoring planner commands due to being under manual operator control.
bool is_manual
