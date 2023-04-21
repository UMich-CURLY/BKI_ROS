;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::Costmap)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'Costmap (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::COSTMAP")
  (make-package "SCENE_UNDERSTANDING::COSTMAP"))

(in-package "ROS")
;;//! \htmlinclude Costmap.msg.html


(intern "*NO_CHANGE*" (find-package "SCENE_UNDERSTANDING::COSTMAP"))
(shadow '*NO_CHANGE* (find-package "SCENE_UNDERSTANDING::COSTMAP"))
(defconstant scene_understanding::Costmap::*NO_CHANGE* 0)
(intern "*CHANGED*" (find-package "SCENE_UNDERSTANDING::COSTMAP"))
(shadow '*CHANGED* (find-package "SCENE_UNDERSTANDING::COSTMAP"))
(defconstant scene_understanding::Costmap::*CHANGED* 1)

(defun scene_understanding::Costmap-to-symbol (const)
  (cond
        ((= const 0) 'scene_understanding::Costmap::*NO_CHANGE*)
        ((= const 1) 'scene_understanding::Costmap::*CHANGED*)
        (t nil)))

(defclass scene_understanding::Costmap
  :super ros::object
  :slots (_mapheader _cost _updated_cells _confidence_map ))

(defmethod scene_understanding::Costmap
  (:init
   (&key
    ((:mapheader __mapheader) (instance scene_understanding::MapHeader :init))
    ((:cost __cost) (make-array 0 :initial-element 0 :element-type :char))
    ((:updated_cells __updated_cells) (make-array 0 :initial-element 0 :element-type :integer))
    ((:confidence_map __confidence_map) (instance scene_understanding::ConfidenceMap :init))
    )
   (send-super :init)
   (setq _mapheader __mapheader)
   (setq _cost __cost)
   (setq _updated_cells __updated_cells)
   (setq _confidence_map __confidence_map)
   self)
  (:mapheader
   (&rest __mapheader)
   (if (keywordp (car __mapheader))
       (send* _mapheader __mapheader)
     (progn
       (if __mapheader (setq _mapheader (car __mapheader)))
       _mapheader)))
  (:cost
   (&optional __cost)
   (if __cost (setq _cost __cost)) _cost)
  (:updated_cells
   (&optional __updated_cells)
   (if __updated_cells (setq _updated_cells __updated_cells)) _updated_cells)
  (:confidence_map
   (&rest __confidence_map)
   (if (keywordp (car __confidence_map))
       (send* _confidence_map __confidence_map)
     (progn
       (if __confidence_map (setq _confidence_map (car __confidence_map)))
       _confidence_map)))
  (:serialization-length
   ()
   (+
    ;; scene_understanding/MapHeader _mapheader
    (send _mapheader :serialization-length)
    ;; uint8[] _cost
    (* 1    (length _cost)) 4
    ;; int8[] _updated_cells
    (* 1    (length _updated_cells)) 4
    ;; scene_understanding/ConfidenceMap _confidence_map
    (send _confidence_map :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; scene_understanding/MapHeader _mapheader
       (send _mapheader :serialize s)
     ;; uint8[] _cost
     (write-long (length _cost) s)
     (princ _cost s)
     ;; int8[] _updated_cells
     (write-long (length _updated_cells) s)
     (dotimes (i (length _updated_cells))
       (write-byte (elt _updated_cells i) s)
       )
     ;; scene_understanding/ConfidenceMap _confidence_map
       (send _confidence_map :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; scene_understanding/MapHeader _mapheader
     (send _mapheader :deserialize buf ptr-) (incf ptr- (send _mapheader :serialization-length))
   ;; uint8[] _cost
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _cost (make-array n :element-type :char))
     (replace _cost buf :start2 ptr-) (incf ptr- n))
   ;; int8[] _updated_cells
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _updated_cells (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _updated_cells i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _updated_cells i) 127) (setf (elt _updated_cells i) (- (elt _updated_cells i) 256)))
     ))
   ;; scene_understanding/ConfidenceMap _confidence_map
     (send _confidence_map :deserialize buf ptr-) (incf ptr- (send _confidence_map :serialization-length))
   ;;
   self)
  )

(setf (get scene_understanding::Costmap :md5sum-) "9acced72310966aa2bc4a0a7a5019bf8")
(setf (get scene_understanding::Costmap :datatype-) "scene_understanding/Costmap")
(setf (get scene_understanding::Costmap :definition-)
      "MapHeader mapheader
uint8[] cost

#Enum for type of update
int8 NO_CHANGE = 0
int8 CHANGED   = 1
int8[] updated_cells

ConfidenceMap confidence_map

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

")



(provide :scene_understanding/Costmap "9acced72310966aa2bc4a0a7a5019bf8")


