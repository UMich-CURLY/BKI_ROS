; Auto-generated. Do not edit!


(cl:in-package scene_understanding-msg)


;//! \htmlinclude AutonomyState.msg.html

(cl:defclass <AutonomyState> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type cl:fixnum
    :initform 0))
)

(cl:defclass AutonomyState (<AutonomyState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AutonomyState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AutonomyState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name scene_understanding-msg:<AutonomyState> is deprecated: use scene_understanding-msg:AutonomyState instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <AutonomyState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:state-val is deprecated.  Use scene_understanding-msg:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<AutonomyState>)))
    "Constants for message type '<AutonomyState>"
  '((:DISABLE_AUTONOMY . 0)
    (:ENABLE_AUTONOMY . 1)
    (:ENABLE_AUTONOMY_HYBRID . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'AutonomyState)))
    "Constants for message type 'AutonomyState"
  '((:DISABLE_AUTONOMY . 0)
    (:ENABLE_AUTONOMY . 1)
    (:ENABLE_AUTONOMY_HYBRID . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AutonomyState>) ostream)
  "Serializes a message object of type '<AutonomyState>"
  (cl:let* ((signed (cl:slot-value msg 'state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AutonomyState>) istream)
  "Deserializes a message object of type '<AutonomyState>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AutonomyState>)))
  "Returns string type for a message object of type '<AutonomyState>"
  "scene_understanding/AutonomyState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutonomyState)))
  "Returns string type for a message object of type 'AutonomyState"
  "scene_understanding/AutonomyState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AutonomyState>)))
  "Returns md5sum for a message object of type '<AutonomyState>"
  "360e23629954382a9bc44f0eb38bc373")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AutonomyState)))
  "Returns md5sum for a message object of type 'AutonomyState"
  "360e23629954382a9bc44f0eb38bc373")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AutonomyState>)))
  "Returns full string definition for message of type '<AutonomyState>"
  (cl:format cl:nil "# Autonomy States~%# Note: This message is used to transition between autonomy states on the MRZR.~%# Note: Hybrid mode is not recommended in most cases.~%int8 DISABLE_AUTONOMY=0~%int8 ENABLE_AUTONOMY=1~%int8 ENABLE_AUTONOMY_HYBRID=2~%~%int8 state~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AutonomyState)))
  "Returns full string definition for message of type 'AutonomyState"
  (cl:format cl:nil "# Autonomy States~%# Note: This message is used to transition between autonomy states on the MRZR.~%# Note: Hybrid mode is not recommended in most cases.~%int8 DISABLE_AUTONOMY=0~%int8 ENABLE_AUTONOMY=1~%int8 ENABLE_AUTONOMY_HYBRID=2~%~%int8 state~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AutonomyState>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AutonomyState>))
  "Converts a ROS message object to a list"
  (cl:list 'AutonomyState
    (cl:cons ':state (state msg))
))
