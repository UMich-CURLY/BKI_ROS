; Auto-generated. Do not edit!


(cl:in-package scene_understanding-msg)


;//! \htmlinclude FusedCostMapLossyMsg.msg.html

(cl:defclass <FusedCostMapLossyMsg> (roslisp-msg-protocol:ros-message)
  ((mapheader
    :reader mapheader
    :initarg :mapheader
    :type scene_understanding-msg:MapHeader
    :initform (cl:make-instance 'scene_understanding-msg:MapHeader))
   (uuid
    :reader uuid
    :initarg :uuid
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (xc
    :reader xc
    :initarg :xc
    :type cl:float
    :initform 0.0)
   (yc
    :reader yc
    :initarg :yc
    :type cl:float
    :initform 0.0)
   (cost
    :reader cost
    :initarg :cost
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass FusedCostMapLossyMsg (<FusedCostMapLossyMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FusedCostMapLossyMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FusedCostMapLossyMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name scene_understanding-msg:<FusedCostMapLossyMsg> is deprecated: use scene_understanding-msg:FusedCostMapLossyMsg instead.")))

(cl:ensure-generic-function 'mapheader-val :lambda-list '(m))
(cl:defmethod mapheader-val ((m <FusedCostMapLossyMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:mapheader-val is deprecated.  Use scene_understanding-msg:mapheader instead.")
  (mapheader m))

(cl:ensure-generic-function 'uuid-val :lambda-list '(m))
(cl:defmethod uuid-val ((m <FusedCostMapLossyMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:uuid-val is deprecated.  Use scene_understanding-msg:uuid instead.")
  (uuid m))

(cl:ensure-generic-function 'xc-val :lambda-list '(m))
(cl:defmethod xc-val ((m <FusedCostMapLossyMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:xc-val is deprecated.  Use scene_understanding-msg:xc instead.")
  (xc m))

(cl:ensure-generic-function 'yc-val :lambda-list '(m))
(cl:defmethod yc-val ((m <FusedCostMapLossyMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:yc-val is deprecated.  Use scene_understanding-msg:yc instead.")
  (yc m))

(cl:ensure-generic-function 'cost-val :lambda-list '(m))
(cl:defmethod cost-val ((m <FusedCostMapLossyMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:cost-val is deprecated.  Use scene_understanding-msg:cost instead.")
  (cost m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FusedCostMapLossyMsg>) ostream)
  "Serializes a message object of type '<FusedCostMapLossyMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'mapheader) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'uuid) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'xc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'yc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'cost))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'cost))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FusedCostMapLossyMsg>) istream)
  "Deserializes a message object of type '<FusedCostMapLossyMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'mapheader) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'uuid) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xc) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yc) (roslisp-utils:decode-double-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'cost) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'cost)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FusedCostMapLossyMsg>)))
  "Returns string type for a message object of type '<FusedCostMapLossyMsg>"
  "scene_understanding/FusedCostMapLossyMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FusedCostMapLossyMsg)))
  "Returns string type for a message object of type 'FusedCostMapLossyMsg"
  "scene_understanding/FusedCostMapLossyMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FusedCostMapLossyMsg>)))
  "Returns md5sum for a message object of type '<FusedCostMapLossyMsg>"
  "0836f33df280efa4c6fdc7b6fafbcab2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FusedCostMapLossyMsg)))
  "Returns md5sum for a message object of type 'FusedCostMapLossyMsg"
  "0836f33df280efa4c6fdc7b6fafbcab2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FusedCostMapLossyMsg>)))
  "Returns full string definition for message of type '<FusedCostMapLossyMsg>"
  (cl:format cl:nil "# This type is a DTO for the uxi_costmap/FusedCostmap type. The members here~%# should be able to exactly mimic the class's internal structure, without loss~%# of information~%~%scene_understanding/MapHeader mapheader~%std_msgs/String     uuid~%~%# Look at the FusedCostMap class for a definition on what this means~%float64 xc~%float64 yc~%~%# All of these maps are stored in column major format.~%uint8[] cost~%~%================================================================================~%MSG: scene_understanding/MapHeader~%Header header~%~%float64 originx~%float64 originy~%~%int32 num_rows~%int32 num_cols~%float64 cell_size~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FusedCostMapLossyMsg)))
  "Returns full string definition for message of type 'FusedCostMapLossyMsg"
  (cl:format cl:nil "# This type is a DTO for the uxi_costmap/FusedCostmap type. The members here~%# should be able to exactly mimic the class's internal structure, without loss~%# of information~%~%scene_understanding/MapHeader mapheader~%std_msgs/String     uuid~%~%# Look at the FusedCostMap class for a definition on what this means~%float64 xc~%float64 yc~%~%# All of these maps are stored in column major format.~%uint8[] cost~%~%================================================================================~%MSG: scene_understanding/MapHeader~%Header header~%~%float64 originx~%float64 originy~%~%int32 num_rows~%int32 num_cols~%float64 cell_size~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FusedCostMapLossyMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'mapheader))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'uuid))
     8
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'cost) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FusedCostMapLossyMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'FusedCostMapLossyMsg
    (cl:cons ':mapheader (mapheader msg))
    (cl:cons ':uuid (uuid msg))
    (cl:cons ':xc (xc msg))
    (cl:cons ':yc (yc msg))
    (cl:cons ':cost (cost msg))
))
