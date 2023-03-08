; Auto-generated. Do not edit!


(cl:in-package scene_understanding-msg)


;//! \htmlinclude BooleanMap.msg.html

(cl:defclass <BooleanMap> (roslisp-msg-protocol:ros-message)
  ((data_exists
    :reader data_exists
    :initarg :data_exists
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass BooleanMap (<BooleanMap>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BooleanMap>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BooleanMap)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name scene_understanding-msg:<BooleanMap> is deprecated: use scene_understanding-msg:BooleanMap instead.")))

(cl:ensure-generic-function 'data_exists-val :lambda-list '(m))
(cl:defmethod data_exists-val ((m <BooleanMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:data_exists-val is deprecated.  Use scene_understanding-msg:data_exists instead.")
  (data_exists m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BooleanMap>) ostream)
  "Serializes a message object of type '<BooleanMap>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data_exists))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'data_exists))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BooleanMap>) istream)
  "Deserializes a message object of type '<BooleanMap>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data_exists) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data_exists)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BooleanMap>)))
  "Returns string type for a message object of type '<BooleanMap>"
  "scene_understanding/BooleanMap")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BooleanMap)))
  "Returns string type for a message object of type 'BooleanMap"
  "scene_understanding/BooleanMap")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BooleanMap>)))
  "Returns md5sum for a message object of type '<BooleanMap>"
  "87a3648defa41ca2572ff6541da77b0b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BooleanMap)))
  "Returns md5sum for a message object of type 'BooleanMap"
  "87a3648defa41ca2572ff6541da77b0b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BooleanMap>)))
  "Returns full string definition for message of type '<BooleanMap>"
  (cl:format cl:nil "#MapHeader mapheader~%int8[] data_exists~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BooleanMap)))
  "Returns full string definition for message of type 'BooleanMap"
  (cl:format cl:nil "#MapHeader mapheader~%int8[] data_exists~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BooleanMap>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data_exists) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BooleanMap>))
  "Converts a ROS message object to a list"
  (cl:list 'BooleanMap
    (cl:cons ':data_exists (data_exists msg))
))
