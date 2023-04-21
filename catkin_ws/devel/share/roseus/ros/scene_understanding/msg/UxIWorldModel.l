;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::UxIWorldModel)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'UxIWorldModel (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::UXIWORLDMODEL")
  (make-package "SCENE_UNDERSTANDING::UXIWORLDMODEL"))

(in-package "ROS")
;;//! \htmlinclude UxIWorldModel.msg.html


(defclass scene_understanding::UxIWorldModel
  :super ros::object
  :slots (_mapheader _costmap _ground_elevation_map ))

(defmethod scene_understanding::UxIWorldModel
  (:init
   (&key
    ((:mapheader __mapheader) (instance scene_understanding::MapHeader :init))
    ((:costmap __costmap) (instance scene_understanding::Costmap :init))
    ((:ground_elevation_map __ground_elevation_map) (instance scene_understanding::ElevationMap :init))
    )
   (send-super :init)
   (setq _mapheader __mapheader)
   (setq _costmap __costmap)
   (setq _ground_elevation_map __ground_elevation_map)
   self)
  (:mapheader
   (&rest __mapheader)
   (if (keywordp (car __mapheader))
       (send* _mapheader __mapheader)
     (progn
       (if __mapheader (setq _mapheader (car __mapheader)))
       _mapheader)))
  (:costmap
   (&rest __costmap)
   (if (keywordp (car __costmap))
       (send* _costmap __costmap)
     (progn
       (if __costmap (setq _costmap (car __costmap)))
       _costmap)))
  (:ground_elevation_map
   (&rest __ground_elevation_map)
   (if (keywordp (car __ground_elevation_map))
       (send* _ground_elevation_map __ground_elevation_map)
     (progn
       (if __ground_elevation_map (setq _ground_elevation_map (car __ground_elevation_map)))
       _ground_elevation_map)))
  (:serialization-length
   ()
   (+
    ;; scene_understanding/MapHeader _mapheader
    (send _mapheader :serialization-length)
    ;; scene_understanding/Costmap _costmap
    (send _costmap :serialization-length)
    ;; scene_understanding/ElevationMap _ground_elevation_map
    (send _ground_elevation_map :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; scene_understanding/MapHeader _mapheader
       (send _mapheader :serialize s)
     ;; scene_understanding/Costmap _costmap
       (send _costmap :serialize s)
     ;; scene_understanding/ElevationMap _ground_elevation_map
       (send _ground_elevation_map :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; scene_understanding/MapHeader _mapheader
     (send _mapheader :deserialize buf ptr-) (incf ptr- (send _mapheader :serialization-length))
   ;; scene_understanding/Costmap _costmap
     (send _costmap :deserialize buf ptr-) (incf ptr- (send _costmap :serialization-length))
   ;; scene_understanding/ElevationMap _ground_elevation_map
     (send _ground_elevation_map :deserialize buf ptr-) (incf ptr- (send _ground_elevation_map :serialization-length))
   ;;
   self)
  )

(setf (get scene_understanding::UxIWorldModel :md5sum-) "cb62fd2200fd1ee960df6a33acdf4318")
(setf (get scene_understanding::UxIWorldModel :datatype-) "scene_understanding/UxIWorldModel")
(setf (get scene_understanding::UxIWorldModel :definition-)
      "MapHeader mapheader
Costmap costmap
ElevationMap ground_elevation_map
#ElevationMap max_elevation_map

================================================================================
MSG: scene_understanding/MapHeader
Header header

float64 originx
float64 originy

int32 num_rows
int32 num_cols
float64 cell_size

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
MSG: scene_understanding/Costmap
MapHeader mapheader
uint8[] cost

#Enum for type of update
int8 NO_CHANGE = 0
int8 CHANGED   = 1
int8[] updated_cells

ConfidenceMap confidence_map

================================================================================
MSG: scene_understanding/ConfidenceMap
#MapHeader mapheader
float32[] confidence

================================================================================
MSG: scene_understanding/ElevationMap
MapHeader mapheader
float32[] elevation
ConfidenceMap confidence_map
BooleanMap bool_map

================================================================================
MSG: scene_understanding/BooleanMap
#MapHeader mapheader
int8[] data_exists

")



(provide :scene_understanding/UxIWorldModel "cb62fd2200fd1ee960df6a33acdf4318")


