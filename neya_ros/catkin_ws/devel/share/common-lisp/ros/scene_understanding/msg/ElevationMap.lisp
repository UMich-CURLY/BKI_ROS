; Auto-generated. Do not edit!


(cl:in-package scene_understanding-msg)


;//! \htmlinclude ElevationMap.msg.html

(cl:defclass <ElevationMap> (roslisp-msg-protocol:ros-message)
  ((mapheader
    :reader mapheader
    :initarg :mapheader
    :type scene_understanding-msg:MapHeader
    :initform (cl:make-instance 'scene_understanding-msg:MapHeader))
   (elevation
    :reader elevation
    :initarg :elevation
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (confidence_map
    :reader confidence_map
    :initarg :confidence_map
    :type scene_understanding-msg:ConfidenceMap
    :initform (cl:make-instance 'scene_understanding-msg:ConfidenceMap))
   (bool_map
    :reader bool_map
    :initarg :bool_map
    :type scene_understanding-msg:BooleanMap
    :initform (cl:make-instance 'scene_understanding-msg:BooleanMap)))
)

(cl:defclass ElevationMap (<ElevationMap>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ElevationMap>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ElevationMap)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name scene_understanding-msg:<ElevationMap> is deprecated: use scene_understanding-msg:ElevationMap instead.")))

(cl:ensure-generic-function 'mapheader-val :lambda-list '(m))
(cl:defmethod mapheader-val ((m <ElevationMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:mapheader-val is deprecated.  Use scene_understanding-msg:mapheader instead.")
  (mapheader m))

(cl:ensure-generic-function 'elevation-val :lambda-list '(m))
(cl:defmethod elevation-val ((m <ElevationMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:elevation-val is deprecated.  Use scene_understanding-msg:elevation instead.")
  (elevation m))

(cl:ensure-generic-function 'confidence_map-val :lambda-list '(m))
(cl:defmethod confidence_map-val ((m <ElevationMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:confidence_map-val is deprecated.  Use scene_understanding-msg:confidence_map instead.")
  (confidence_map m))

(cl:ensure-generic-function 'bool_map-val :lambda-list '(m))
(cl:defmethod bool_map-val ((m <ElevationMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:bool_map-val is deprecated.  Use scene_understanding-msg:bool_map instead.")
  (bool_map m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ElevationMap>) ostream)
  "Serializes a message object of type '<ElevationMap>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'mapheader) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'elevation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'elevation))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'confidence_map) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'bool_map) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ElevationMap>) istream)
  "Deserializes a message object of type '<ElevationMap>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'mapheader) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'elevation) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'elevation)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'confidence_map) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'bool_map) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ElevationMap>)))
  "Returns string type for a message object of type '<ElevationMap>"
  "scene_understanding/ElevationMap")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ElevationMap)))
  "Returns string type for a message object of type 'ElevationMap"
  "scene_understanding/ElevationMap")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ElevationMap>)))
  "Returns md5sum for a message object of type '<ElevationMap>"
  "3f681330e1ad68ab131ebe44e6c923fc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ElevationMap)))
  "Returns md5sum for a message object of type 'ElevationMap"
  "3f681330e1ad68ab131ebe44e6c923fc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ElevationMap>)))
  "Returns full string definition for message of type '<ElevationMap>"
  (cl:format cl:nil "MapHeader mapheader~%float32[] elevation~%ConfidenceMap confidence_map~%BooleanMap bool_map~%~%================================================================================~%MSG: scene_understanding/MapHeader~%Header header~%~%float64 originx~%float64 originy~%~%int32 num_rows~%int32 num_cols~%float64 cell_size~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: scene_understanding/ConfidenceMap~%#MapHeader mapheader~%float32[] confidence~%~%================================================================================~%MSG: scene_understanding/BooleanMap~%#MapHeader mapheader~%int8[] data_exists~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ElevationMap)))
  "Returns full string definition for message of type 'ElevationMap"
  (cl:format cl:nil "MapHeader mapheader~%float32[] elevation~%ConfidenceMap confidence_map~%BooleanMap bool_map~%~%================================================================================~%MSG: scene_understanding/MapHeader~%Header header~%~%float64 originx~%float64 originy~%~%int32 num_rows~%int32 num_cols~%float64 cell_size~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: scene_understanding/ConfidenceMap~%#MapHeader mapheader~%float32[] confidence~%~%================================================================================~%MSG: scene_understanding/BooleanMap~%#MapHeader mapheader~%int8[] data_exists~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ElevationMap>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'mapheader))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'elevation) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'confidence_map))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'bool_map))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ElevationMap>))
  "Converts a ROS message object to a list"
  (cl:list 'ElevationMap
    (cl:cons ':mapheader (mapheader msg))
    (cl:cons ':elevation (elevation msg))
    (cl:cons ':confidence_map (confidence_map msg))
    (cl:cons ':bool_map (bool_map msg))
))
