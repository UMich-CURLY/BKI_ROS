; Auto-generated. Do not edit!


(cl:in-package scene_understanding-msg)


;//! \htmlinclude Costmap.msg.html

(cl:defclass <Costmap> (roslisp-msg-protocol:ros-message)
  ((mapheader
    :reader mapheader
    :initarg :mapheader
    :type scene_understanding-msg:MapHeader
    :initform (cl:make-instance 'scene_understanding-msg:MapHeader))
   (cost
    :reader cost
    :initarg :cost
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (updated_cells
    :reader updated_cells
    :initarg :updated_cells
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (confidence_map
    :reader confidence_map
    :initarg :confidence_map
    :type scene_understanding-msg:ConfidenceMap
    :initform (cl:make-instance 'scene_understanding-msg:ConfidenceMap)))
)

(cl:defclass Costmap (<Costmap>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Costmap>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Costmap)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name scene_understanding-msg:<Costmap> is deprecated: use scene_understanding-msg:Costmap instead.")))

(cl:ensure-generic-function 'mapheader-val :lambda-list '(m))
(cl:defmethod mapheader-val ((m <Costmap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:mapheader-val is deprecated.  Use scene_understanding-msg:mapheader instead.")
  (mapheader m))

(cl:ensure-generic-function 'cost-val :lambda-list '(m))
(cl:defmethod cost-val ((m <Costmap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:cost-val is deprecated.  Use scene_understanding-msg:cost instead.")
  (cost m))

(cl:ensure-generic-function 'updated_cells-val :lambda-list '(m))
(cl:defmethod updated_cells-val ((m <Costmap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:updated_cells-val is deprecated.  Use scene_understanding-msg:updated_cells instead.")
  (updated_cells m))

(cl:ensure-generic-function 'confidence_map-val :lambda-list '(m))
(cl:defmethod confidence_map-val ((m <Costmap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:confidence_map-val is deprecated.  Use scene_understanding-msg:confidence_map instead.")
  (confidence_map m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Costmap>)))
    "Constants for message type '<Costmap>"
  '((:NO_CHANGE . 0)
    (:CHANGED . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Costmap)))
    "Constants for message type 'Costmap"
  '((:NO_CHANGE . 0)
    (:CHANGED . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Costmap>) ostream)
  "Serializes a message object of type '<Costmap>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'mapheader) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'cost))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'cost))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'updated_cells))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'updated_cells))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'confidence_map) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Costmap>) istream)
  "Deserializes a message object of type '<Costmap>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'mapheader) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'cost) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'cost)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'updated_cells) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'updated_cells)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256)))))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'confidence_map) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Costmap>)))
  "Returns string type for a message object of type '<Costmap>"
  "scene_understanding/Costmap")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Costmap)))
  "Returns string type for a message object of type 'Costmap"
  "scene_understanding/Costmap")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Costmap>)))
  "Returns md5sum for a message object of type '<Costmap>"
  "9acced72310966aa2bc4a0a7a5019bf8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Costmap)))
  "Returns md5sum for a message object of type 'Costmap"
  "9acced72310966aa2bc4a0a7a5019bf8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Costmap>)))
  "Returns full string definition for message of type '<Costmap>"
  (cl:format cl:nil "MapHeader mapheader~%uint8[] cost~%~%#Enum for type of update~%int8 NO_CHANGE = 0~%int8 CHANGED   = 1~%int8[] updated_cells~%~%ConfidenceMap confidence_map~%~%================================================================================~%MSG: scene_understanding/MapHeader~%Header header~%~%float64 originx~%float64 originy~%~%int32 num_rows~%int32 num_cols~%float64 cell_size~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: scene_understanding/ConfidenceMap~%#MapHeader mapheader~%float32[] confidence~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Costmap)))
  "Returns full string definition for message of type 'Costmap"
  (cl:format cl:nil "MapHeader mapheader~%uint8[] cost~%~%#Enum for type of update~%int8 NO_CHANGE = 0~%int8 CHANGED   = 1~%int8[] updated_cells~%~%ConfidenceMap confidence_map~%~%================================================================================~%MSG: scene_understanding/MapHeader~%Header header~%~%float64 originx~%float64 originy~%~%int32 num_rows~%int32 num_cols~%float64 cell_size~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: scene_understanding/ConfidenceMap~%#MapHeader mapheader~%float32[] confidence~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Costmap>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'mapheader))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'cost) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'updated_cells) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'confidence_map))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Costmap>))
  "Converts a ROS message object to a list"
  (cl:list 'Costmap
    (cl:cons ':mapheader (mapheader msg))
    (cl:cons ':cost (cost msg))
    (cl:cons ':updated_cells (updated_cells msg))
    (cl:cons ':confidence_map (confidence_map msg))
))
