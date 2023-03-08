; Auto-generated. Do not edit!


(cl:in-package scene_understanding-msg)


;//! \htmlinclude StereoImagePair.msg.html

(cl:defclass <StereoImagePair> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (leftImage
    :reader leftImage
    :initarg :leftImage
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (rightImage
    :reader rightImage
    :initarg :rightImage
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (focalLength
    :reader focalLength
    :initarg :focalLength
    :type cl:float
    :initform 0.0)
   (baseline
    :reader baseline
    :initarg :baseline
    :type cl:float
    :initform 0.0)
   (centerRow
    :reader centerRow
    :initarg :centerRow
    :type cl:float
    :initform 0.0)
   (centerCol
    :reader centerCol
    :initarg :centerCol
    :type cl:float
    :initform 0.0))
)

(cl:defclass StereoImagePair (<StereoImagePair>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StereoImagePair>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StereoImagePair)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name scene_understanding-msg:<StereoImagePair> is deprecated: use scene_understanding-msg:StereoImagePair instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <StereoImagePair>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:header-val is deprecated.  Use scene_understanding-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'leftImage-val :lambda-list '(m))
(cl:defmethod leftImage-val ((m <StereoImagePair>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:leftImage-val is deprecated.  Use scene_understanding-msg:leftImage instead.")
  (leftImage m))

(cl:ensure-generic-function 'rightImage-val :lambda-list '(m))
(cl:defmethod rightImage-val ((m <StereoImagePair>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:rightImage-val is deprecated.  Use scene_understanding-msg:rightImage instead.")
  (rightImage m))

(cl:ensure-generic-function 'focalLength-val :lambda-list '(m))
(cl:defmethod focalLength-val ((m <StereoImagePair>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:focalLength-val is deprecated.  Use scene_understanding-msg:focalLength instead.")
  (focalLength m))

(cl:ensure-generic-function 'baseline-val :lambda-list '(m))
(cl:defmethod baseline-val ((m <StereoImagePair>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:baseline-val is deprecated.  Use scene_understanding-msg:baseline instead.")
  (baseline m))

(cl:ensure-generic-function 'centerRow-val :lambda-list '(m))
(cl:defmethod centerRow-val ((m <StereoImagePair>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:centerRow-val is deprecated.  Use scene_understanding-msg:centerRow instead.")
  (centerRow m))

(cl:ensure-generic-function 'centerCol-val :lambda-list '(m))
(cl:defmethod centerCol-val ((m <StereoImagePair>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:centerCol-val is deprecated.  Use scene_understanding-msg:centerCol instead.")
  (centerCol m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StereoImagePair>) ostream)
  "Serializes a message object of type '<StereoImagePair>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'leftImage) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rightImage) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'focalLength))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'baseline))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'centerRow))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'centerCol))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StereoImagePair>) istream)
  "Deserializes a message object of type '<StereoImagePair>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'leftImage) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rightImage) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'focalLength) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'baseline) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'centerRow) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'centerCol) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StereoImagePair>)))
  "Returns string type for a message object of type '<StereoImagePair>"
  "scene_understanding/StereoImagePair")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StereoImagePair)))
  "Returns string type for a message object of type 'StereoImagePair"
  "scene_understanding/StereoImagePair")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StereoImagePair>)))
  "Returns md5sum for a message object of type '<StereoImagePair>"
  "b71ab9b442ba2143a8c747c61426fdc4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StereoImagePair)))
  "Returns md5sum for a message object of type 'StereoImagePair"
  "b71ab9b442ba2143a8c747c61426fdc4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StereoImagePair>)))
  "Returns full string definition for message of type '<StereoImagePair>"
  (cl:format cl:nil "Header header~%sensor_msgs/Image leftImage~%sensor_msgs/Image rightImage~%~%# The camera intrinsics for the rectified camera~%float32 focalLength~%float32 baseline~%float32 centerRow~%float32 centerCol~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StereoImagePair)))
  "Returns full string definition for message of type 'StereoImagePair"
  (cl:format cl:nil "Header header~%sensor_msgs/Image leftImage~%sensor_msgs/Image rightImage~%~%# The camera intrinsics for the rectified camera~%float32 focalLength~%float32 baseline~%float32 centerRow~%float32 centerCol~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StereoImagePair>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'leftImage))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rightImage))
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StereoImagePair>))
  "Converts a ROS message object to a list"
  (cl:list 'StereoImagePair
    (cl:cons ':header (header msg))
    (cl:cons ':leftImage (leftImage msg))
    (cl:cons ':rightImage (rightImage msg))
    (cl:cons ':focalLength (focalLength msg))
    (cl:cons ':baseline (baseline msg))
    (cl:cons ':centerRow (centerRow msg))
    (cl:cons ':centerCol (centerCol msg))
))
