;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::DriveByWireState)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'DriveByWireState (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::DRIVEBYWIRESTATE")
  (make-package "SCENE_UNDERSTANDING::DRIVEBYWIRESTATE"))

(in-package "ROS")
;;//! \htmlinclude DriveByWireState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*REVERSE*" (find-package "SCENE_UNDERSTANDING::DRIVEBYWIRESTATE"))
(shadow '*REVERSE* (find-package "SCENE_UNDERSTANDING::DRIVEBYWIRESTATE"))
(defconstant scene_understanding::DriveByWireState::*REVERSE* 0)
(intern "*NEUTRAL*" (find-package "SCENE_UNDERSTANDING::DRIVEBYWIRESTATE"))
(shadow '*NEUTRAL* (find-package "SCENE_UNDERSTANDING::DRIVEBYWIRESTATE"))
(defconstant scene_understanding::DriveByWireState::*NEUTRAL* 1)
(intern "*HIGH_GEAR*" (find-package "SCENE_UNDERSTANDING::DRIVEBYWIRESTATE"))
(shadow '*HIGH_GEAR* (find-package "SCENE_UNDERSTANDING::DRIVEBYWIRESTATE"))
(defconstant scene_understanding::DriveByWireState::*HIGH_GEAR* 2)
(intern "*LOW_GEAR*" (find-package "SCENE_UNDERSTANDING::DRIVEBYWIRESTATE"))
(shadow '*LOW_GEAR* (find-package "SCENE_UNDERSTANDING::DRIVEBYWIRESTATE"))
(defconstant scene_understanding::DriveByWireState::*LOW_GEAR* 3)
(intern "*CUSTOM*" (find-package "SCENE_UNDERSTANDING::DRIVEBYWIRESTATE"))
(shadow '*CUSTOM* (find-package "SCENE_UNDERSTANDING::DRIVEBYWIRESTATE"))
(defconstant scene_understanding::DriveByWireState::*CUSTOM* 4)

(defun scene_understanding::DriveByWireState-to-symbol (const)
  (cond
        ((= const 0) 'scene_understanding::DriveByWireState::*REVERSE*)
        ((= const 1) 'scene_understanding::DriveByWireState::*NEUTRAL*)
        ((= const 2) 'scene_understanding::DriveByWireState::*HIGH_GEAR*)
        ((= const 3) 'scene_understanding::DriveByWireState::*LOW_GEAR*)
        ((= const 4) 'scene_understanding::DriveByWireState::*CUSTOM*)
        (t nil)))

(defclass scene_understanding::DriveByWireState
  :super ros::object
  :slots (_header _name _commanded_gear _measured_gear _mode _commanded_steering_perc _measured_steering_perc _commanded_gasbrake_perc _measured_gasbrake_perc _is_manual ))

(defmethod scene_understanding::DriveByWireState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:name __name) "")
    ((:commanded_gear __commanded_gear) 0)
    ((:measured_gear __measured_gear) 0)
    ((:mode __mode) 0)
    ((:commanded_steering_perc __commanded_steering_perc) 0.0)
    ((:measured_steering_perc __measured_steering_perc) 0.0)
    ((:commanded_gasbrake_perc __commanded_gasbrake_perc) 0.0)
    ((:measured_gasbrake_perc __measured_gasbrake_perc) 0.0)
    ((:is_manual __is_manual) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _name (string __name))
   (setq _commanded_gear (round __commanded_gear))
   (setq _measured_gear (round __measured_gear))
   (setq _mode (round __mode))
   (setq _commanded_steering_perc (float __commanded_steering_perc))
   (setq _measured_steering_perc (float __measured_steering_perc))
   (setq _commanded_gasbrake_perc (float __commanded_gasbrake_perc))
   (setq _measured_gasbrake_perc (float __measured_gasbrake_perc))
   (setq _is_manual __is_manual)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:commanded_gear
   (&optional __commanded_gear)
   (if __commanded_gear (setq _commanded_gear __commanded_gear)) _commanded_gear)
  (:measured_gear
   (&optional __measured_gear)
   (if __measured_gear (setq _measured_gear __measured_gear)) _measured_gear)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:commanded_steering_perc
   (&optional __commanded_steering_perc)
   (if __commanded_steering_perc (setq _commanded_steering_perc __commanded_steering_perc)) _commanded_steering_perc)
  (:measured_steering_perc
   (&optional __measured_steering_perc)
   (if __measured_steering_perc (setq _measured_steering_perc __measured_steering_perc)) _measured_steering_perc)
  (:commanded_gasbrake_perc
   (&optional __commanded_gasbrake_perc)
   (if __commanded_gasbrake_perc (setq _commanded_gasbrake_perc __commanded_gasbrake_perc)) _commanded_gasbrake_perc)
  (:measured_gasbrake_perc
   (&optional __measured_gasbrake_perc)
   (if __measured_gasbrake_perc (setq _measured_gasbrake_perc __measured_gasbrake_perc)) _measured_gasbrake_perc)
  (:is_manual
   (&optional (__is_manual :null))
   (if (not (eq __is_manual :null)) (setq _is_manual __is_manual)) _is_manual)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _name
    4 (length _name)
    ;; int32 _commanded_gear
    4
    ;; int32 _measured_gear
    4
    ;; int32 _mode
    4
    ;; float64 _commanded_steering_perc
    8
    ;; float64 _measured_steering_perc
    8
    ;; float64 _commanded_gasbrake_perc
    8
    ;; float64 _measured_gasbrake_perc
    8
    ;; bool _is_manual
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; int32 _commanded_gear
       (write-long _commanded_gear s)
     ;; int32 _measured_gear
       (write-long _measured_gear s)
     ;; int32 _mode
       (write-long _mode s)
     ;; float64 _commanded_steering_perc
       (sys::poke _commanded_steering_perc (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _measured_steering_perc
       (sys::poke _measured_steering_perc (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _commanded_gasbrake_perc
       (sys::poke _commanded_gasbrake_perc (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _measured_gasbrake_perc
       (sys::poke _measured_gasbrake_perc (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _is_manual
       (if _is_manual (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _commanded_gear
     (setq _commanded_gear (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _measured_gear
     (setq _measured_gear (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _mode
     (setq _mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _commanded_steering_perc
     (setq _commanded_steering_perc (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _measured_steering_perc
     (setq _measured_steering_perc (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _commanded_gasbrake_perc
     (setq _commanded_gasbrake_perc (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _measured_gasbrake_perc
     (setq _measured_gasbrake_perc (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _is_manual
     (setq _is_manual (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get scene_understanding::DriveByWireState :md5sum-) "0c127bccc7e2a0a354cd5647b95069bf")
(setf (get scene_understanding::DriveByWireState :datatype-) "scene_understanding/DriveByWireState")
(setf (get scene_understanding::DriveByWireState :definition-)
      "Header header

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

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :scene_understanding/DriveByWireState "0c127bccc7e2a0a354cd5647b95069bf")


