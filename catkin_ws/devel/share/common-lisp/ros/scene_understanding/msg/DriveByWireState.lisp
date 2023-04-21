; Auto-generated. Do not edit!


(cl:in-package scene_understanding-msg)


;//! \htmlinclude DriveByWireState.msg.html

(cl:defclass <DriveByWireState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (commanded_gear
    :reader commanded_gear
    :initarg :commanded_gear
    :type cl:integer
    :initform 0)
   (measured_gear
    :reader measured_gear
    :initarg :measured_gear
    :type cl:integer
    :initform 0)
   (mode
    :reader mode
    :initarg :mode
    :type cl:integer
    :initform 0)
   (commanded_steering_perc
    :reader commanded_steering_perc
    :initarg :commanded_steering_perc
    :type cl:float
    :initform 0.0)
   (measured_steering_perc
    :reader measured_steering_perc
    :initarg :measured_steering_perc
    :type cl:float
    :initform 0.0)
   (commanded_gasbrake_perc
    :reader commanded_gasbrake_perc
    :initarg :commanded_gasbrake_perc
    :type cl:float
    :initform 0.0)
   (measured_gasbrake_perc
    :reader measured_gasbrake_perc
    :initarg :measured_gasbrake_perc
    :type cl:float
    :initform 0.0)
   (is_manual
    :reader is_manual
    :initarg :is_manual
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass DriveByWireState (<DriveByWireState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DriveByWireState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DriveByWireState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name scene_understanding-msg:<DriveByWireState> is deprecated: use scene_understanding-msg:DriveByWireState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DriveByWireState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:header-val is deprecated.  Use scene_understanding-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <DriveByWireState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:name-val is deprecated.  Use scene_understanding-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'commanded_gear-val :lambda-list '(m))
(cl:defmethod commanded_gear-val ((m <DriveByWireState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:commanded_gear-val is deprecated.  Use scene_understanding-msg:commanded_gear instead.")
  (commanded_gear m))

(cl:ensure-generic-function 'measured_gear-val :lambda-list '(m))
(cl:defmethod measured_gear-val ((m <DriveByWireState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:measured_gear-val is deprecated.  Use scene_understanding-msg:measured_gear instead.")
  (measured_gear m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <DriveByWireState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:mode-val is deprecated.  Use scene_understanding-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'commanded_steering_perc-val :lambda-list '(m))
(cl:defmethod commanded_steering_perc-val ((m <DriveByWireState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:commanded_steering_perc-val is deprecated.  Use scene_understanding-msg:commanded_steering_perc instead.")
  (commanded_steering_perc m))

(cl:ensure-generic-function 'measured_steering_perc-val :lambda-list '(m))
(cl:defmethod measured_steering_perc-val ((m <DriveByWireState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:measured_steering_perc-val is deprecated.  Use scene_understanding-msg:measured_steering_perc instead.")
  (measured_steering_perc m))

(cl:ensure-generic-function 'commanded_gasbrake_perc-val :lambda-list '(m))
(cl:defmethod commanded_gasbrake_perc-val ((m <DriveByWireState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:commanded_gasbrake_perc-val is deprecated.  Use scene_understanding-msg:commanded_gasbrake_perc instead.")
  (commanded_gasbrake_perc m))

(cl:ensure-generic-function 'measured_gasbrake_perc-val :lambda-list '(m))
(cl:defmethod measured_gasbrake_perc-val ((m <DriveByWireState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:measured_gasbrake_perc-val is deprecated.  Use scene_understanding-msg:measured_gasbrake_perc instead.")
  (measured_gasbrake_perc m))

(cl:ensure-generic-function 'is_manual-val :lambda-list '(m))
(cl:defmethod is_manual-val ((m <DriveByWireState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:is_manual-val is deprecated.  Use scene_understanding-msg:is_manual instead.")
  (is_manual m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<DriveByWireState>)))
    "Constants for message type '<DriveByWireState>"
  '((:REVERSE . 0)
    (:NEUTRAL . 1)
    (:HIGH_GEAR . 2)
    (:LOW_GEAR . 3)
    (:CUSTOM . 4))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'DriveByWireState)))
    "Constants for message type 'DriveByWireState"
  '((:REVERSE . 0)
    (:NEUTRAL . 1)
    (:HIGH_GEAR . 2)
    (:LOW_GEAR . 3)
    (:CUSTOM . 4))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DriveByWireState>) ostream)
  "Serializes a message object of type '<DriveByWireState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let* ((signed (cl:slot-value msg 'commanded_gear)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'measured_gear)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'commanded_steering_perc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'measured_steering_perc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'commanded_gasbrake_perc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'measured_gasbrake_perc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_manual) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DriveByWireState>) istream)
  "Deserializes a message object of type '<DriveByWireState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'commanded_gear) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'measured_gear) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'commanded_steering_perc) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'measured_steering_perc) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'commanded_gasbrake_perc) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'measured_gasbrake_perc) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'is_manual) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DriveByWireState>)))
  "Returns string type for a message object of type '<DriveByWireState>"
  "scene_understanding/DriveByWireState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DriveByWireState)))
  "Returns string type for a message object of type 'DriveByWireState"
  "scene_understanding/DriveByWireState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DriveByWireState>)))
  "Returns md5sum for a message object of type '<DriveByWireState>"
  "0c127bccc7e2a0a354cd5647b95069bf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DriveByWireState)))
  "Returns md5sum for a message object of type 'DriveByWireState"
  "0c127bccc7e2a0a354cd5647b95069bf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DriveByWireState>)))
  "Returns full string definition for message of type '<DriveByWireState>"
  (cl:format cl:nil "Header header~%~%string name~%~%# These match what is in the uxi_controller/include/uxiController_Enumerations.h~%int32 REVERSE=0~%int32 NEUTRAL=1~%int32 HIGH_GEAR=2~%int32 LOW_GEAR=3~%int32 CUSTOM=4~%~%int32 commanded_gear~%int32 measured_gear~%~%int32 mode~%~%float64 commanded_steering_perc~%float64 measured_steering_perc~%~%float64 commanded_gasbrake_perc~%float64 measured_gasbrake_perc~%~%# Indicates the vehicle is ignoring planner commands due to being under manual operator control.~%bool is_manual~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DriveByWireState)))
  "Returns full string definition for message of type 'DriveByWireState"
  (cl:format cl:nil "Header header~%~%string name~%~%# These match what is in the uxi_controller/include/uxiController_Enumerations.h~%int32 REVERSE=0~%int32 NEUTRAL=1~%int32 HIGH_GEAR=2~%int32 LOW_GEAR=3~%int32 CUSTOM=4~%~%int32 commanded_gear~%int32 measured_gear~%~%int32 mode~%~%float64 commanded_steering_perc~%float64 measured_steering_perc~%~%float64 commanded_gasbrake_perc~%float64 measured_gasbrake_perc~%~%# Indicates the vehicle is ignoring planner commands due to being under manual operator control.~%bool is_manual~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DriveByWireState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'name))
     4
     4
     4
     8
     8
     8
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DriveByWireState>))
  "Converts a ROS message object to a list"
  (cl:list 'DriveByWireState
    (cl:cons ':header (header msg))
    (cl:cons ':name (name msg))
    (cl:cons ':commanded_gear (commanded_gear msg))
    (cl:cons ':measured_gear (measured_gear msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':commanded_steering_perc (commanded_steering_perc msg))
    (cl:cons ':measured_steering_perc (measured_steering_perc msg))
    (cl:cons ':commanded_gasbrake_perc (commanded_gasbrake_perc msg))
    (cl:cons ':measured_gasbrake_perc (measured_gasbrake_perc msg))
    (cl:cons ':is_manual (is_manual msg))
))
