; Auto-generated. Do not edit!


(cl:in-package lio_sam-srv)


;//! \htmlinclude save_map-request.msg.html

(cl:defclass <save_map-request> (roslisp-msg-protocol:ros-message)
  ((resolution
    :reader resolution
    :initarg :resolution
    :type cl:float
    :initform 0.0)
   (destination
    :reader destination
    :initarg :destination
    :type cl:string
    :initform ""))
)

(cl:defclass save_map-request (<save_map-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <save_map-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'save_map-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lio_sam-srv:<save_map-request> is deprecated: use lio_sam-srv:save_map-request instead.")))

(cl:ensure-generic-function 'resolution-val :lambda-list '(m))
(cl:defmethod resolution-val ((m <save_map-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-srv:resolution-val is deprecated.  Use lio_sam-srv:resolution instead.")
  (resolution m))

(cl:ensure-generic-function 'destination-val :lambda-list '(m))
(cl:defmethod destination-val ((m <save_map-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-srv:destination-val is deprecated.  Use lio_sam-srv:destination instead.")
  (destination m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <save_map-request>) ostream)
  "Serializes a message object of type '<save_map-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'resolution))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'destination))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'destination))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <save_map-request>) istream)
  "Deserializes a message object of type '<save_map-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'resolution) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'destination) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'destination) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<save_map-request>)))
  "Returns string type for a service object of type '<save_map-request>"
  "lio_sam/save_mapRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'save_map-request)))
  "Returns string type for a service object of type 'save_map-request"
  "lio_sam/save_mapRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<save_map-request>)))
  "Returns md5sum for a message object of type '<save_map-request>"
  "9b82c64d089149d300598523af304f22")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'save_map-request)))
  "Returns md5sum for a message object of type 'save_map-request"
  "9b82c64d089149d300598523af304f22")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<save_map-request>)))
  "Returns full string definition for message of type '<save_map-request>"
  (cl:format cl:nil "float32 resolution~%string destination~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'save_map-request)))
  "Returns full string definition for message of type 'save_map-request"
  (cl:format cl:nil "float32 resolution~%string destination~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <save_map-request>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'destination))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <save_map-request>))
  "Converts a ROS message object to a list"
  (cl:list 'save_map-request
    (cl:cons ':resolution (resolution msg))
    (cl:cons ':destination (destination msg))
))
;//! \htmlinclude save_map-response.msg.html

(cl:defclass <save_map-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass save_map-response (<save_map-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <save_map-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'save_map-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lio_sam-srv:<save_map-response> is deprecated: use lio_sam-srv:save_map-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <save_map-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-srv:success-val is deprecated.  Use lio_sam-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <save_map-response>) ostream)
  "Serializes a message object of type '<save_map-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <save_map-response>) istream)
  "Deserializes a message object of type '<save_map-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<save_map-response>)))
  "Returns string type for a service object of type '<save_map-response>"
  "lio_sam/save_mapResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'save_map-response)))
  "Returns string type for a service object of type 'save_map-response"
  "lio_sam/save_mapResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<save_map-response>)))
  "Returns md5sum for a message object of type '<save_map-response>"
  "9b82c64d089149d300598523af304f22")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'save_map-response)))
  "Returns md5sum for a message object of type 'save_map-response"
  "9b82c64d089149d300598523af304f22")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<save_map-response>)))
  "Returns full string definition for message of type '<save_map-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'save_map-response)))
  "Returns full string definition for message of type 'save_map-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <save_map-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <save_map-response>))
  "Converts a ROS message object to a list"
  (cl:list 'save_map-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'save_map)))
  'save_map-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'save_map)))
  'save_map-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'save_map)))
  "Returns string type for a service object of type '<save_map>"
  "lio_sam/save_map")