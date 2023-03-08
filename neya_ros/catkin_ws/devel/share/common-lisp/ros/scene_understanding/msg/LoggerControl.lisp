; Auto-generated. Do not edit!


(cl:in-package scene_understanding-msg)


;//! \htmlinclude LoggerControl.msg.html

(cl:defclass <LoggerControl> (roslisp-msg-protocol:ros-message)
  ((directory
    :reader directory
    :initarg :directory
    :type cl:string
    :initform "")
   (experiment
    :reader experiment
    :initarg :experiment
    :type cl:string
    :initform "")
   (log_data
    :reader log_data
    :initarg :log_data
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LoggerControl (<LoggerControl>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoggerControl>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoggerControl)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name scene_understanding-msg:<LoggerControl> is deprecated: use scene_understanding-msg:LoggerControl instead.")))

(cl:ensure-generic-function 'directory-val :lambda-list '(m))
(cl:defmethod directory-val ((m <LoggerControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:directory-val is deprecated.  Use scene_understanding-msg:directory instead.")
  (directory m))

(cl:ensure-generic-function 'experiment-val :lambda-list '(m))
(cl:defmethod experiment-val ((m <LoggerControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:experiment-val is deprecated.  Use scene_understanding-msg:experiment instead.")
  (experiment m))

(cl:ensure-generic-function 'log_data-val :lambda-list '(m))
(cl:defmethod log_data-val ((m <LoggerControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:log_data-val is deprecated.  Use scene_understanding-msg:log_data instead.")
  (log_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoggerControl>) ostream)
  "Serializes a message object of type '<LoggerControl>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'directory))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'directory))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'experiment))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'experiment))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'log_data) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoggerControl>) istream)
  "Deserializes a message object of type '<LoggerControl>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'directory) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'directory) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'experiment) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'experiment) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'log_data) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoggerControl>)))
  "Returns string type for a message object of type '<LoggerControl>"
  "scene_understanding/LoggerControl")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoggerControl)))
  "Returns string type for a message object of type 'LoggerControl"
  "scene_understanding/LoggerControl")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoggerControl>)))
  "Returns md5sum for a message object of type '<LoggerControl>"
  "c6ce9bb3e388aa19d3b944e0c92c892a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoggerControl)))
  "Returns md5sum for a message object of type 'LoggerControl"
  "c6ce9bb3e388aa19d3b944e0c92c892a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoggerControl>)))
  "Returns full string definition for message of type '<LoggerControl>"
  (cl:format cl:nil "string directory~%string experiment~%bool log_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoggerControl)))
  "Returns full string definition for message of type 'LoggerControl"
  (cl:format cl:nil "string directory~%string experiment~%bool log_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoggerControl>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'directory))
     4 (cl:length (cl:slot-value msg 'experiment))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoggerControl>))
  "Converts a ROS message object to a list"
  (cl:list 'LoggerControl
    (cl:cons ':directory (directory msg))
    (cl:cons ':experiment (experiment msg))
    (cl:cons ':log_data (log_data msg))
))
