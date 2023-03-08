;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::VoxelData)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'VoxelData (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::VOXELDATA")
  (make-package "SCENE_UNDERSTANDING::VOXELDATA"))

(in-package "ROS")
;;//! \htmlinclude VoxelData.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass scene_understanding::VoxelData
  :super ros::object
  :slots (_header _resolution _data ))

(defmethod scene_understanding::VoxelData
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:resolution __resolution) 0.0)
    ((:data __data) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _resolution (float __resolution))
   (setq _data __data)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:resolution
   (&optional __resolution)
   (if __resolution (setq _resolution __resolution)) _resolution)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _resolution
    8
    ;; scene_understanding/VoxelValue[] _data
    (apply #'+ (send-all _data :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _resolution
       (sys::poke _resolution (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; scene_understanding/VoxelValue[] _data
     (write-long (length _data) s)
     (dolist (elem _data)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _resolution
     (setq _resolution (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; scene_understanding/VoxelValue[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (let (r) (dotimes (i n) (push (instance scene_understanding::VoxelValue :init) r)) r))
     (dolist (elem- _data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get scene_understanding::VoxelData :md5sum-) "ef47bab6b7887fe67691b47c4525189e")
(setf (get scene_understanding::VoxelData :datatype-) "scene_understanding/VoxelData")
(setf (get scene_understanding::VoxelData :definition-)
      "Header header

float64 resolution # The resolution of the voxel data in meters

VoxelValue[] data  # The list of voxel data. Positions are the center of the voxel

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

================================================================================
MSG: scene_understanding/VoxelValue
float64 x
float64 y
float64 z

float32 density
float32 density_confidence

float32 rgb

uint8 material

")



(provide :scene_understanding/VoxelData "ef47bab6b7887fe67691b47c4525189e")


