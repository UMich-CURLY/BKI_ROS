; Auto-generated. Do not edit!


(cl:in-package scene_understanding-msg)


;//! \htmlinclude ConfidenceMap.msg.html

(cl:defclass <ConfidenceMap> (roslisp-msg-protocol:ros-message)
  ((confidence
    :reader confidence
    :initarg :confidence
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ConfidenceMap (<ConfidenceMap>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConfidenceMap>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConfidenceMap)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name scene_understanding-msg:<ConfidenceMap> is deprecated: use scene_understanding-msg:ConfidenceMap instead.")))

(cl:ensure-generic-function 'confidence-val :lambda-list '(m))
(cl:defmethod confidence-val ((m <ConfidenceMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:confidence-val is deprecated.  Use scene_understanding-msg:confidence instead.")
  (confidence m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConfidenceMap>) ostream)
  "Serializes a message object of type '<ConfidenceMap>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'confidence))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'confidence))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConfidenceMap>) istream)
  "Deserializes a message object of type '<ConfidenceMap>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'confidence) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'confidence)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConfidenceMap>)))
  "Returns string type for a message object of type '<ConfidenceMap>"
  "scene_understanding/ConfidenceMap")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConfidenceMap)))
  "Returns string type for a message object of type 'ConfidenceMap"
  "scene_understanding/ConfidenceMap")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConfidenceMap>)))
  "Returns md5sum for a message object of type '<ConfidenceMap>"
  "1dbbe1023d82ebb797244da71216a266")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConfidenceMap)))
  "Returns md5sum for a message object of type 'ConfidenceMap"
  "1dbbe1023d82ebb797244da71216a266")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConfidenceMap>)))
  "Returns full string definition for message of type '<ConfidenceMap>"
  (cl:format cl:nil "#MapHeader mapheader~%float32[] confidence~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConfidenceMap)))
  "Returns full string definition for message of type 'ConfidenceMap"
  (cl:format cl:nil "#MapHeader mapheader~%float32[] confidence~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConfidenceMap>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'confidence) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConfidenceMap>))
  "Converts a ROS message object to a list"
  (cl:list 'ConfidenceMap
    (cl:cons ':confidence (confidence msg))
))
