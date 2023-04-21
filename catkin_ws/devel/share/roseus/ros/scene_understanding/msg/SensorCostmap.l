;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::SensorCostmap)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'SensorCostmap (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::SENSORCOSTMAP")
  (make-package "SCENE_UNDERSTANDING::SENSORCOSTMAP"))

(in-package "ROS")
;;//! \htmlinclude SensorCostmap.msg.html


(defclass scene_understanding::SensorCostmap
  :super ros::object
  :slots (_mapheader _sigma_x _sigma_y _mean_x _mean_y _cost _height_avg _height_sum _height_count _num_ground_points _num_obstacle_points ))

(defmethod scene_understanding::SensorCostmap
  (:init
   (&key
    ((:mapheader __mapheader) (instance scene_understanding::MapHeader :init))
    ((:sigma_x __sigma_x) 0.0)
    ((:sigma_y __sigma_y) 0.0)
    ((:mean_x __mean_x) 0.0)
    ((:mean_y __mean_y) 0.0)
    ((:cost __cost) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:height_avg __height_avg) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:height_sum __height_sum) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:height_count __height_count) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:num_ground_points __num_ground_points) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:num_obstacle_points __num_obstacle_points) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _mapheader __mapheader)
   (setq _sigma_x (float __sigma_x))
   (setq _sigma_y (float __sigma_y))
   (setq _mean_x (float __mean_x))
   (setq _mean_y (float __mean_y))
   (setq _cost __cost)
   (setq _height_avg __height_avg)
   (setq _height_sum __height_sum)
   (setq _height_count __height_count)
   (setq _num_ground_points __num_ground_points)
   (setq _num_obstacle_points __num_obstacle_points)
   self)
  (:mapheader
   (&rest __mapheader)
   (if (keywordp (car __mapheader))
       (send* _mapheader __mapheader)
     (progn
       (if __mapheader (setq _mapheader (car __mapheader)))
       _mapheader)))
  (:sigma_x
   (&optional __sigma_x)
   (if __sigma_x (setq _sigma_x __sigma_x)) _sigma_x)
  (:sigma_y
   (&optional __sigma_y)
   (if __sigma_y (setq _sigma_y __sigma_y)) _sigma_y)
  (:mean_x
   (&optional __mean_x)
   (if __mean_x (setq _mean_x __mean_x)) _mean_x)
  (:mean_y
   (&optional __mean_y)
   (if __mean_y (setq _mean_y __mean_y)) _mean_y)
  (:cost
   (&optional __cost)
   (if __cost (setq _cost __cost)) _cost)
  (:height_avg
   (&optional __height_avg)
   (if __height_avg (setq _height_avg __height_avg)) _height_avg)
  (:height_sum
   (&optional __height_sum)
   (if __height_sum (setq _height_sum __height_sum)) _height_sum)
  (:height_count
   (&optional __height_count)
   (if __height_count (setq _height_count __height_count)) _height_count)
  (:num_ground_points
   (&optional __num_ground_points)
   (if __num_ground_points (setq _num_ground_points __num_ground_points)) _num_ground_points)
  (:num_obstacle_points
   (&optional __num_obstacle_points)
   (if __num_obstacle_points (setq _num_obstacle_points __num_obstacle_points)) _num_obstacle_points)
  (:serialization-length
   ()
   (+
    ;; scene_understanding/MapHeader _mapheader
    (send _mapheader :serialization-length)
    ;; float64 _sigma_x
    8
    ;; float64 _sigma_y
    8
    ;; float64 _mean_x
    8
    ;; float64 _mean_y
    8
    ;; float64[] _cost
    (* 8    (length _cost)) 4
    ;; float64[] _height_avg
    (* 8    (length _height_avg)) 4
    ;; float64[] _height_sum
    (* 8    (length _height_sum)) 4
    ;; float64[] _height_count
    (* 8    (length _height_count)) 4
    ;; float64[] _num_ground_points
    (* 8    (length _num_ground_points)) 4
    ;; float64[] _num_obstacle_points
    (* 8    (length _num_obstacle_points)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; scene_understanding/MapHeader _mapheader
       (send _mapheader :serialize s)
     ;; float64 _sigma_x
       (sys::poke _sigma_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _sigma_y
       (sys::poke _sigma_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _mean_x
       (sys::poke _mean_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _mean_y
       (sys::poke _mean_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[] _cost
     (write-long (length _cost) s)
     (dotimes (i (length _cost))
       (sys::poke (elt _cost i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _height_avg
     (write-long (length _height_avg) s)
     (dotimes (i (length _height_avg))
       (sys::poke (elt _height_avg i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _height_sum
     (write-long (length _height_sum) s)
     (dotimes (i (length _height_sum))
       (sys::poke (elt _height_sum i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _height_count
     (write-long (length _height_count) s)
     (dotimes (i (length _height_count))
       (sys::poke (elt _height_count i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; scene_understanding/MapHeader _mapheader
     (send _mapheader :deserialize buf ptr-) (incf ptr- (send _mapheader :serialization-length))
   ;; float64 _sigma_x
     (setq _sigma_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _sigma_y
     (setq _sigma_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _mean_x
     (setq _mean_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _mean_y
     (setq _mean_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[] _cost
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _cost (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _cost i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _height_avg
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _height_avg (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _height_avg i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _height_sum
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _height_sum (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _height_sum i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _height_count
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _height_count (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _height_count i) (sys::peek buf ptr- :double)) (incf ptr- 8)
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
   ;;
   self)
  )

(setf (get scene_understanding::SensorCostmap :md5sum-) "067947cf4710194efd3f47bce3fab1f9")
(setf (get scene_understanding::SensorCostmap :datatype-) "scene_understanding/SensorCostmap")
(setf (get scene_understanding::SensorCostmap :definition-)
      "# This is the type that will transmit a costmap containing information from a sensor.
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

")



(provide :scene_understanding/SensorCostmap "067947cf4710194efd3f47bce3fab1f9")


