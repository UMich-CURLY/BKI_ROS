; Auto-generated. Do not edit!


(cl:in-package scene_understanding-srv)


;//! \htmlinclude SetCostMapAroundVehicle-request.msg.html

(cl:defclass <SetCostMapAroundVehicle-request> (roslisp-msg-protocol:ros-message)
  ((height
    :reader height
    :initarg :height
    :type cl:float
    :initform 0.0)
   (width
    :reader width
    :initarg :width
    :type cl:float
    :initform 0.0)
   (cost
    :reader cost
    :initarg :cost
    :type cl:float
    :initform 0.0))
)

(cl:defclass SetCostMapAroundVehicle-request (<SetCostMapAroundVehicle-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetCostMapAroundVehicle-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetCostMapAroundVehicle-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name scene_understanding-srv:<SetCostMapAroundVehicle-request> is deprecated: use scene_understanding-srv:SetCostMapAroundVehicle-request instead.")))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <SetCostMapAroundVehicle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-srv:height-val is deprecated.  Use scene_understanding-srv:height instead.")
  (height m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <SetCostMapAroundVehicle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-srv:width-val is deprecated.  Use scene_understanding-srv:width instead.")
  (width m))

(cl:ensure-generic-function 'cost-val :lambda-list '(m))
(cl:defmethod cost-val ((m <SetCostMapAroundVehicle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-srv:cost-val is deprecated.  Use scene_understanding-srv:cost instead.")
  (cost m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetCostMapAroundVehicle-request>) ostream)
  "Serializes a message object of type '<SetCostMapAroundVehicle-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cost))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetCostMapAroundVehicle-request>) istream)
  "Deserializes a message object of type '<SetCostMapAroundVehicle-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'height) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'width) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cost) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetCostMapAroundVehicle-request>)))
  "Returns string type for a service object of type '<SetCostMapAroundVehicle-request>"
  "scene_understanding/SetCostMapAroundVehicleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetCostMapAroundVehicle-request)))
  "Returns string type for a service object of type 'SetCostMapAroundVehicle-request"
  "scene_understanding/SetCostMapAroundVehicleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetCostMapAroundVehicle-request>)))
  "Returns md5sum for a message object of type '<SetCostMapAroundVehicle-request>"
  "8c4553ce63e1ff713460885fc9f3430a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetCostMapAroundVehicle-request)))
  "Returns md5sum for a message object of type 'SetCostMapAroundVehicle-request"
  "8c4553ce63e1ff713460885fc9f3430a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetCostMapAroundVehicle-request>)))
  "Returns full string definition for message of type '<SetCostMapAroundVehicle-request>"
  (cl:format cl:nil "float32 height~%float32 width~%float32 cost~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetCostMapAroundVehicle-request)))
  "Returns full string definition for message of type 'SetCostMapAroundVehicle-request"
  (cl:format cl:nil "float32 height~%float32 width~%float32 cost~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetCostMapAroundVehicle-request>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetCostMapAroundVehicle-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetCostMapAroundVehicle-request
    (cl:cons ':height (height msg))
    (cl:cons ':width (width msg))
    (cl:cons ':cost (cost msg))
))
;//! \htmlinclude SetCostMapAroundVehicle-response.msg.html

(cl:defclass <SetCostMapAroundVehicle-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass SetCostMapAroundVehicle-response (<SetCostMapAroundVehicle-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetCostMapAroundVehicle-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetCostMapAroundVehicle-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name scene_understanding-srv:<SetCostMapAroundVehicle-response> is deprecated: use scene_understanding-srv:SetCostMapAroundVehicle-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetCostMapAroundVehicle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-srv:success-val is deprecated.  Use scene_understanding-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetCostMapAroundVehicle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-srv:message-val is deprecated.  Use scene_understanding-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetCostMapAroundVehicle-response>) ostream)
  "Serializes a message object of type '<SetCostMapAroundVehicle-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetCostMapAroundVehicle-response>) istream)
  "Deserializes a message object of type '<SetCostMapAroundVehicle-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetCostMapAroundVehicle-response>)))
  "Returns string type for a service object of type '<SetCostMapAroundVehicle-response>"
  "scene_understanding/SetCostMapAroundVehicleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetCostMapAroundVehicle-response)))
  "Returns string type for a service object of type 'SetCostMapAroundVehicle-response"
  "scene_understanding/SetCostMapAroundVehicleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetCostMapAroundVehicle-response>)))
  "Returns md5sum for a message object of type '<SetCostMapAroundVehicle-response>"
  "8c4553ce63e1ff713460885fc9f3430a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetCostMapAroundVehicle-response)))
  "Returns md5sum for a message object of type 'SetCostMapAroundVehicle-response"
  "8c4553ce63e1ff713460885fc9f3430a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetCostMapAroundVehicle-response>)))
  "Returns full string definition for message of type '<SetCostMapAroundVehicle-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetCostMapAroundVehicle-response)))
  "Returns full string definition for message of type 'SetCostMapAroundVehicle-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetCostMapAroundVehicle-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetCostMapAroundVehicle-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetCostMapAroundVehicle-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetCostMapAroundVehicle)))
  'SetCostMapAroundVehicle-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetCostMapAroundVehicle)))
  'SetCostMapAroundVehicle-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetCostMapAroundVehicle)))
  "Returns string type for a service object of type '<SetCostMapAroundVehicle>"
  "scene_understanding/SetCostMapAroundVehicle")