;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::FusedCostMapLossyMsg)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'FusedCostMapLossyMsg (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::FUSEDCOSTMAPLOSSYMSG")
  (make-package "SCENE_UNDERSTANDING::FUSEDCOSTMAPLOSSYMSG"))

(in-package "ROS")
;;//! \htmlinclude FusedCostMapLossyMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass scene_understanding::FusedCostMapLossyMsg
  :super ros::object
  :slots (_mapheader _uuid _xc _yc _cost ))

(defmethod scene_understanding::FusedCostMapLossyMsg
  (:init
   (&key
    ((:mapheader __mapheader) (instance scene_understanding::MapHeader :init))
    ((:uuid __uuid) (instance std_msgs::String :init))
    ((:xc __xc) 0.0)
    ((:yc __yc) 0.0)
    ((:cost __cost) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _mapheader __mapheader)
   (setq _uuid __uuid)
   (setq _xc (float __xc))
   (setq _yc (float __yc))
   (setq _cost __cost)
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
    ;; uint8[] _cost
    (* 1    (length _cost)) 4
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
     ;; uint8[] _cost
     (write-long (length _cost) s)
     (princ _cost s)
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
   ;; uint8[] _cost
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _cost (make-array n :element-type :char))
     (replace _cost buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(setf (get scene_understanding::FusedCostMapLossyMsg :md5sum-) "0836f33df280efa4c6fdc7b6fafbcab2")
(setf (get scene_understanding::FusedCostMapLossyMsg :datatype-) "scene_understanding/FusedCostMapLossyMsg")
(setf (get scene_understanding::FusedCostMapLossyMsg :definition-)
      "# This type is a DTO for the uxi_costmap/FusedCostmap type. The members here
# should be able to exactly mimic the class's internal structure, without loss
# of information

scene_understanding/MapHeader mapheader
std_msgs/String     uuid

# Look at the FusedCostMap class for a definition on what this means
float64 xc
float64 yc

# All of these maps are stored in column major format.
uint8[] cost

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



(provide :scene_understanding/FusedCostMapLossyMsg "0836f33df280efa4c6fdc7b6fafbcab2")


