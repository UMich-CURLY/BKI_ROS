;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::GPSHeading)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'GPSHeading (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::GPSHEADING")
  (make-package "SCENE_UNDERSTANDING::GPSHEADING"))

(in-package "ROS")
;;//! \htmlinclude GPSHeading.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass scene_understanding::GPSHeading
  :super ros::object
  :slots (_header _heading_deg ))

(defmethod scene_understanding::GPSHeading
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:heading_deg __heading_deg) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _heading_deg (float __heading_deg))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:heading_deg
   (&optional __heading_deg)
   (if __heading_deg (setq _heading_deg __heading_deg)) _heading_deg)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _heading_deg
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _heading_deg
       (sys::poke _heading_deg (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _heading_deg
     (setq _heading_deg (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get scene_understanding::GPSHeading :md5sum-) "3cf6fb6acd86d7f29e5238051c7a5ee6")
(setf (get scene_understanding::GPSHeading :datatype-) "scene_understanding/GPSHeading")
(setf (get scene_understanding::GPSHeading :definition-)
      "Header header
float32 heading_deg

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



(provide :scene_understanding/GPSHeading "3cf6fb6acd86d7f29e5238051c7a5ee6")


