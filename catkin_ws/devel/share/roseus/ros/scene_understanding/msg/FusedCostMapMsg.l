;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::FusedCostMapMsg)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'FusedCostMapMsg (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::FUSEDCOSTMAPMSG")
  (make-package "SCENE_UNDERSTANDING::FUSEDCOSTMAPMSG"))

(in-package "ROS")
;;//! \htmlinclude FusedCostMapMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass scene_understanding::FusedCostMapMsg
  :super ros::object
  :slots (_mapheader _uuid _xc _yc _cost _weight _num_ground_points _num_obstacle_points _ground_elevation _ground_elevation_confidence _updated_cells ))

(defmethod scene_understanding::FusedCostMapMsg
  (:init
   (&key
    ((:mapheader __mapheader) (instance scene_understanding::MapHeader :init))
    ((:uuid __uuid) (instance std_msgs::String :init))
    ((:xc __xc) 0.0)
    ((:yc __yc) 0.0)
    ((:cost __cost) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:weight __weight) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:num_ground_points __num_ground_points) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:num_obstacle_points __num_obstacle_points) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:ground_elevation __ground_elevation) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:ground_elevation_confidence __ground_elevation_confidence) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:updated_cells __updated_cells) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _mapheader __mapheader)
   (setq _uuid __uuid)
   (setq _xc (float __xc))
   (setq _yc (float __yc))
   (setq _cost __cost)
   (setq _weight __weight)
   (setq _num_ground_points __num_ground_points)
   (setq _num_obstacle_points __num_obstacle_points)
   (setq _ground_elevation __ground_elevation)
   (setq _ground_elevation_confidence __ground_elevation_confidence)
   (setq _updated_cells __updated_cells)
   self)
  (:mapheader
   (&rest __mapheader)
   (if (keywordp (car __mapheader))
       (send* _mapheader __mapheader)
     (progn
       (if __mapheader (setq _mapheader (car __mapheader)))
       _mapheader)))
  (:uuid
   (&rest __uuid)
   (if (keywordp (car __uuid))
       (send* _uuid __uuid)
     (progn
       (if __uuid (setq _uuid (car __uuid)))
       _uuid)))
  (:xc
   (&optional __xc)
   (if __xc (setq _xc __xc)) _xc)
  (:yc
   (&optional __yc)
   (if __yc (setq _yc __yc)) _yc)
  (:cost
   (&optional __cost)
   (if __cost (setq _cost __cost)) _cost)
  (:weight
   (&optional __weight)
   (if __weight (setq _weight __weight)) _weight)
  (:num_ground_points
   (&optional __num_ground_points)
   (if __num_ground_points (setq _num_ground_points __num_ground_points)) _num_ground_points)
  (:num_obstacle_points
   (&optional __num_obstacle_points)
   (if __num_obstacle_points (setq _num_obstacle_points __num_obstacle_points)) _num_obstacle_points)
  (:ground_elevation
   (&optional __ground_elevation)
   (if __ground_elevation (setq _ground_elevation __ground_elevation)) _ground_elevation)
  (:ground_elevation_confidence
   (&optional __ground_elevation_confidence)
   (if __ground_elevation_confidence (setq _ground_elevation_confidence __ground_elevation_confidence)) _ground_elevation_confidence)
  (:updated_cells
   (&optional __updated_cells)
   (if __updated_cells (setq _updated_cells __updated_cells)) _updated_cells)
  (:serialization-length
   ()
   (+
    ;; scene_understanding/MapHeader _mapheader
    (send _mapheader :serialization-length)
    ;; std_msgs/String _uuid
    (send _uuid :serialization-length)
    ;; float64 _xc
    8
    ;; float64 _yc
    8
    ;; float64[] _cost
    (* 8    (length _cost)) 4
    ;; float64[] _weight
    (* 8    (length _weight)) 4
    ;; float64[] _num_ground_points
    (* 8    (length _num_ground_points)) 4
    ;; float64[] _num_obstacle_points
    (* 8    (length _num_obstacle_points)) 4
    ;; float64[] _ground_elevation
    (* 8    (length _ground_elevation)) 4
    ;; float64[] _ground_elevation_confidence
    (* 8    (length _ground_elevation_confidence)) 4
    ;; int8[] _updated_cells
    (* 1    (length _updated_cells)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; scene_understanding/MapHeader _mapheader
       (send _mapheader :serialize s)
     ;; std_msgs/String _uuid
       (send _uuid :serialize s)
     ;; float64 _xc
       (sys::poke _xc (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yc
       (sys::poke _yc (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[] _cost
     (write-long (length _cost) s)
     (dotimes (i (length _cost))
       (sys::poke (elt _cost i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _weight
     (write-long (length _weight) s)
     (dotimes (i (length _weight))
       (sys::poke (elt _weight i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _num_ground_points
     (write-long (length _num_ground_points) s)
     (dotimes (i (length _num_ground_points))
       (sys::poke (elt _num_ground_points i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _num_obstacle_points
     (write-long (length _num_obstacle_points) s)
     (dotimes (i (length _num_obstacle_points))
       (sys::poke (elt _num_obstacle_points i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _ground_elevation
     (write-long (length _ground_elevation) s)
     (dotimes (i (length _ground_elevation))
       (sys::poke (elt _ground_elevation i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _ground_elevation_confidence
     (write-long (length _ground_elevation_confidence) s)
     (dotimes (i (length _ground_elevation_confidence))
       (sys::poke (elt _ground_elevation_confidence i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; int8[] _updated_cells
     (write-long (length _updated_cells) s)
     (dotimes (i (length _updated_cells))
       (write-byte (elt _updated_cells i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; scene_understanding/MapHeader _mapheader
     (send _mapheader :deserialize buf ptr-) (incf ptr- (send _mapheader :serialization-length))
   ;; std_msgs/String _uuid
     (send _uuid :deserialize buf ptr-) (incf ptr- (send _uuid :serialization-length))
   ;; float64 _xc
     (setq _xc (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yc
     (setq _yc (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[] _cost
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _cost (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _cost i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _weight
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _weight (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _weight i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _num_ground_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _num_ground_points (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _num_ground_points i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _num_obstacle_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _num_obstacle_points (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _num_obstacle_points i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _ground_elevation
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ground_elevation (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _ground_elevation i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _ground_elevation_confidence
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ground_elevation_confidence (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _ground_elevation_confidence i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; int8[] _updated_cells
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _updated_cells (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _updated_cells i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _updated_cells i) 127) (setf (elt _updated_cells i) (- (elt _updated_cells i) 256)))
     ))
   ;;
   self)
  )

(setf (get scene_understanding::FusedCostMapMsg :md5sum-) "7ecf15e3087d12c28ef312a1e88c8e1f")
(setf (get scene_understanding::FusedCostMapMsg :datatype-) "scene_understanding/FusedCostMapMsg")
(setf (get scene_understanding::FusedCostMapMsg :definition-)
      "# This type is a DTO for the uxi_costmap/FusedCostmap type. The members here
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
MSG: std_msgs/String
string data

")



(provide :scene_understanding/FusedCostMapMsg "7ecf15e3087d12c28ef312a1e88c8e1f")


