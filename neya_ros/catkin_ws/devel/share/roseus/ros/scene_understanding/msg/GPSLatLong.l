;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::GPSLatLong)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'GPSLatLong (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::GPSLATLONG")
  (make-package "SCENE_UNDERSTANDING::GPSLATLONG"))

(in-package "ROS")
;;//! \htmlinclude GPSLatLong.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass scene_understanding::GPSLatLong
  :super ros::object
  :slots (_header _latitude _longitude ))

(defmethod scene_understanding::GPSLatLong
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _latitude
    4
    ;; float32 _longitude
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _latitude
     (setq _latitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _longitude
     (setq _longitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get scene_understanding::GPSLatLong :md5sum-) "79197bb5a58d33017c590e24adb874d5")
(setf (get scene_understanding::GPSLatLong :datatype-) "scene_understanding/GPSLatLong")
(setf (get scene_understanding::GPSLatLong :definition-)
      "Header header
float32 latitude
float32 longitude 

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



(provide :scene_understanding/GPSLatLong "79197bb5a58d33017c590e24adb874d5")


