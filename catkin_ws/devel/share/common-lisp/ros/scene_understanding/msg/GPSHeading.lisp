; Auto-generated. Do not edit!


(cl:in-package scene_understanding-msg)


;//! \htmlinclude GPSHeading.msg.html

(cl:defclass <GPSHeading> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (heading_deg
    :reader heading_deg
    :initarg :heading_deg
    :type cl:float
    :initform 0.0))
)

(cl:defclass GPSHeading (<GPSHeading>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GPSHeading>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GPSHeading)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name scene_understanding-msg:<GPSHeading> is deprecated: use scene_understanding-msg:GPSHeading instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <GPSHeading>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:header-val is deprecated.  Use scene_understanding-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'heading_deg-val :lambda-list '(m))
(cl:defmethod heading_deg-val ((m <GPSHeading>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:heading_deg-val is deprecated.  Use scene_understanding-msg:heading_deg instead.")
  (heading_deg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GPSHeading>) ostream)
  "Serializes a message object of type '<GPSHeading>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'heading_deg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GPSHeading>) istream)
  "Deserializes a message object of type '<GPSHeading>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading_deg) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GPSHeading>)))
  "Returns string type for a message object of type '<GPSHeading>"
  "scene_understanding/GPSHeading")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GPSHeading)))
  "Returns string type for a message object of type 'GPSHeading"
  "scene_understanding/GPSHeading")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GPSHeading>)))
  "Returns md5sum for a message object of type '<GPSHeading>"
  "3cf6fb6acd86d7f29e5238051c7a5ee6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GPSHeading)))
  "Returns md5sum for a message object of type 'GPSHeading"
  "3cf6fb6acd86d7f29e5238051c7a5ee6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GPSHeading>)))
  "Returns full string definition for message of type '<GPSHeading>"
  (cl:format cl:nil "Header header~%float32 heading_deg~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GPSHeading)))
  "Returns full string definition for message of type 'GPSHeading"
  (cl:format cl:nil "Header header~%float32 heading_deg~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GPSHeading>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GPSHeading>))
  "Converts a ROS message object to a list"
  (cl:list 'GPSHeading
    (cl:cons ':header (header msg))
    (cl:cons ':heading_deg (heading_deg msg))
))
