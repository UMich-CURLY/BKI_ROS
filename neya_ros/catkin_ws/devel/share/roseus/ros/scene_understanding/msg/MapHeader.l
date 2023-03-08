;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::MapHeader)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'MapHeader (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::MAPHEADER")
  (make-package "SCENE_UNDERSTANDING::MAPHEADER"))

(in-package "ROS")
;;//! \htmlinclude MapHeader.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass scene_understanding::MapHeader
  :super ros::object
  :slots (_header _originx _originy _num_rows _num_cols _cell_size ))

(defmethod scene_understanding::MapHeader
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:originx __originx) 0.0)
    ((:originy __originy) 0.0)
    ((:num_rows __num_rows) 0)
    ((:num_cols __num_cols) 0)
    ((:cell_size __cell_size) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _originx (float __originx))
   (setq _originy (float __originy))
   (setq _num_rows (round __num_rows))
   (setq _num_cols (round __num_cols))
   (setq _cell_size (float __cell_size))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:originx
   (&optional __originx)
   (if __originx (setq _originx __originx)) _originx)
  (:originy
   (&optional __originy)
   (if __originy (setq _originy __originy)) _originy)
  (:num_rows
   (&optional __num_rows)
   (if __num_rows (setq _num_rows __num_rows)) _num_rows)
  (:num_cols
   (&optional __num_cols)
   (if __num_cols (setq _num_cols __num_cols)) _num_cols)
  (:cell_size
   (&optional __cell_size)
   (if __cell_size (setq _cell_size __cell_size)) _cell_size)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _originx
    8
    ;; float64 _originy
    8
    ;; int32 _num_rows
    4
    ;; int32 _num_cols
    4
    ;; float64 _cell_size
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _originx
       (sys::poke _originx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _originy
       (sys::poke _originy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _num_rows
       (write-long _num_rows s)
     ;; int32 _num_cols
       (write-long _num_cols s)
     ;; float64 _cell_size
       (sys::poke _cell_size (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _originx
     (setq _originx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _originy
     (setq _originy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _num_rows
     (setq _num_rows (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _num_cols
     (setq _num_cols (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _cell_size
     (setq _cell_size (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get scene_understanding::MapHeader :md5sum-) "3f32797868801a9f5a26fc67434cd215")
(setf (get scene_understanding::MapHeader :datatype-) "scene_understanding/MapHeader")
(setf (get scene_understanding::MapHeader :definition-)
      "Header header

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



(provide :scene_understanding/MapHeader "3f32797868801a9f5a26fc67434cd215")


