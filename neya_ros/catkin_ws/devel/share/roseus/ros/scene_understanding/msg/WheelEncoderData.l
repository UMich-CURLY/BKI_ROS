;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::WheelEncoderData)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'WheelEncoderData (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::WHEELENCODERDATA")
  (make-package "SCENE_UNDERSTANDING::WHEELENCODERDATA"))

(in-package "ROS")
;;//! \htmlinclude WheelEncoderData.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass scene_understanding::WheelEncoderData
  :super ros::object
  :slots (_header _distance _velocity ))

(defmethod scene_understanding::WheelEncoderData
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:distance __distance) 0.0)
    ((:velocity __velocity) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _distance (float __distance))
   (setq _velocity (float __velocity))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _distance
    8
    ;; float64 _velocity
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity
     (setq _velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get scene_understanding::WheelEncoderData :md5sum-) "9619d558d5e225001aea81c89858a324")
(setf (get scene_understanding::WheelEncoderData :datatype-) "scene_understanding/WheelEncoderData")
(setf (get scene_understanding::WheelEncoderData :definition-)
      "Header header
# Distance traveled in meters
float64 distance

# Velocity in meters / second
float64 velocity
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



(provide :scene_understanding/WheelEncoderData "9619d558d5e225001aea81c89858a324")


