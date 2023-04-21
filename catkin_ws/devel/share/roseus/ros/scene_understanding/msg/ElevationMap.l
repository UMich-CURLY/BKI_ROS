;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::ElevationMap)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'ElevationMap (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::ELEVATIONMAP")
  (make-package "SCENE_UNDERSTANDING::ELEVATIONMAP"))

(in-package "ROS")
;;//! \htmlinclude ElevationMap.msg.html


(defclass scene_understanding::ElevationMap
  :super ros::object
  :slots (_mapheader _elevation _confidence_map _bool_map ))

(defmethod scene_understanding::ElevationMap
  (:init
   (&key
    ((:mapheader __mapheader) (instance scene_understanding::MapHeader :init))
    ((:elevation __elevation) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:confidence_map __confidence_map) (instance scene_understanding::ConfidenceMap :init))
    ((:bool_map __bool_map) (instance scene_understanding::BooleanMap :init))
    )
   (send-super :init)
   (setq _mapheader __mapheader)
   (setq _elevation __elevation)
   (setq _confidence_map __confidence_map)
   (setq _bool_map __bool_map)
   self)
  (:mapheader
   (&rest __mapheader)
   (if (keywordp (car __mapheader))
       (send* _mapheader __mapheader)
     (progn
       (if __mapheader (setq _mapheader (car __mapheader)))
       _mapheader)))
  (:elevation
   (&optional __elevation)
   (if __elevation (setq _elevation __elevation)) _elevation)
  (:confidence_map
   (&rest __confidence_map)
   (if (keywordp (car __confidence_map))
       (send* _confidence_map __confidence_map)
     (progn
       (if __confidence_map (setq _confidence_map (car __confidence_map)))
       _confidence_map)))
  (:bool_map
   (&rest __bool_map)
   (if (keywordp (car __bool_map))
       (send* _bool_map __bool_map)
     (progn
       (if __bool_map (setq _bool_map (car __bool_map)))
       _bool_map)))
  (:serialization-length
   ()
   (+
    ;; scene_understanding/MapHeader _mapheader
    (send _mapheader :serialization-length)
    ;; float32[] _elevation
    (* 4    (length _elevation)) 4
    ;; scene_understanding/ConfidenceMap _confidence_map
    (send _confidence_map :serialization-length)
    ;; scene_understanding/BooleanMap _bool_map
    (send _bool_map :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; scene_understanding/MapHeader _mapheader
       (send _mapheader :serialize s)
     ;; float32[] _elevation
     (write-long (length _elevation) s)
     (dotimes (i (length _elevation))
       (sys::poke (elt _elevation i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; scene_understanding/ConfidenceMap _confidence_map
       (send _confidence_map :serialize s)
     ;; scene_understanding/BooleanMap _bool_map
       (send _bool_map :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; scene_understanding/MapHeader _mapheader
     (send _mapheader :deserialize buf ptr-) (incf ptr- (send _mapheader :serialization-length))
   ;; float32[] _elevation
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _elevation (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _elevation i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; scene_understanding/ConfidenceMap _confidence_map
     (send _confidence_map :deserialize buf ptr-) (incf ptr- (send _confidence_map :serialization-length))
   ;; scene_understanding/BooleanMap _bool_map
     (send _bool_map :deserialize buf ptr-) (incf ptr- (send _bool_map :serialization-length))
   ;;
   self)
  )

(setf (get scene_understanding::ElevationMap :md5sum-) "3f681330e1ad68ab131ebe44e6c923fc")
(setf (get scene_understanding::ElevationMap :datatype-) "scene_understanding/ElevationMap")
(setf (get scene_understanding::ElevationMap :definition-)
      "MapHeader mapheader
float32[] elevation
ConfidenceMap confidence_map
BooleanMap bool_map

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
MSG: scene_understanding/ConfidenceMap
#MapHeader mapheader
float32[] confidence

================================================================================
MSG: scene_understanding/BooleanMap
#MapHeader mapheader
int8[] data_exists

")



(provide :scene_understanding/ElevationMap "3f681330e1ad68ab131ebe44e6c923fc")


