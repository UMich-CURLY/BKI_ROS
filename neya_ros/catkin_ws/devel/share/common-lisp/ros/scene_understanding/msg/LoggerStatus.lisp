; Auto-generated. Do not edit!


(cl:in-package scene_understanding-msg)


;//! \htmlinclude LoggerStatus.msg.html

(cl:defclass <LoggerStatus> (roslisp-msg-protocol:ros-message)
  ((logging
    :reader logging
    :initarg :logging
    :type cl:boolean
    :initform cl:nil)
   (status
    :reader status
    :initarg :status
    :type cl:fixnum
    :initform 0))
)

(cl:defclass LoggerStatus (<LoggerStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoggerStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoggerStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name scene_understanding-msg:<LoggerStatus> is deprecated: use scene_understanding-msg:LoggerStatus instead.")))

(cl:ensure-generic-function 'logging-val :lambda-list '(m))
(cl:defmethod logging-val ((m <LoggerStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:logging-val is deprecated.  Use scene_understanding-msg:logging instead.")
  (logging m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <LoggerStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:status-val is deprecated.  Use scene_understanding-msg:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<LoggerStatus>)))
    "Constants for message type '<LoggerStatus>"
  '((:NOMINAL . 0)
    (:CONSOLIDATING . 1)
    (:PARAMETER_ERROR . 2)
    (:DIRECTORY_ERROR . 3)
    (:DISK_SPACE_ERROR . 4)
    (:SYNC_ERROR . 5))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'LoggerStatus)))
    "Constants for message type 'LoggerStatus"
  '((:NOMINAL . 0)
    (:CONSOLIDATING . 1)
    (:PARAMETER_ERROR . 2)
    (:DIRECTORY_ERROR . 3)
    (:DISK_SPACE_ERROR . 4)
    (:SYNC_ERROR . 5))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoggerStatus>) ostream)
  "Serializes a message object of type '<LoggerStatus>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'logging) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoggerStatus>) istream)
  "Deserializes a message object of type '<LoggerStatus>"
    (cl:setf (cl:slot-value msg 'logging) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoggerStatus>)))
  "Returns string type for a message object of type '<LoggerStatus>"
  "scene_understanding/LoggerStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoggerStatus)))
  "Returns string type for a message object of type 'LoggerStatus"
  "scene_understanding/LoggerStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoggerStatus>)))
  "Returns md5sum for a message object of type '<LoggerStatus>"
  "b41f30f09dc0b31930675744564ab05c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoggerStatus)))
  "Returns md5sum for a message object of type 'LoggerStatus"
  "b41f30f09dc0b31930675744564ab05c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoggerStatus>)))
  "Returns full string definition for message of type '<LoggerStatus>"
  (cl:format cl:nil "# Status enum~%int8 NOMINAL=0~%int8 CONSOLIDATING=1~%int8 PARAMETER_ERROR=2~%int8 DIRECTORY_ERROR=3~%int8 DISK_SPACE_ERROR=4~%int8 SYNC_ERROR=5~%~%# Logger Status~%bool logging~%int8 status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoggerStatus)))
  "Returns full string definition for message of type 'LoggerStatus"
  (cl:format cl:nil "# Status enum~%int8 NOMINAL=0~%int8 CONSOLIDATING=1~%int8 PARAMETER_ERROR=2~%int8 DIRECTORY_ERROR=3~%int8 DISK_SPACE_ERROR=4~%int8 SYNC_ERROR=5~%~%# Logger Status~%bool logging~%int8 status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoggerStatus>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoggerStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'LoggerStatus
    (cl:cons ':logging (logging msg))
    (cl:cons ':status (status msg))
))
