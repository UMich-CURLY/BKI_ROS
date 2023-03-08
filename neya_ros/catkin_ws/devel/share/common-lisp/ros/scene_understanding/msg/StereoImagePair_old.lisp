; Auto-generated. Do not edit!


(cl:in-package scene_understanding-msg)


;//! \htmlinclude StereoImagePair_old.msg.html

(cl:defclass <StereoImagePair_old> (roslisp-msg-protocol:ros-message)
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
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass StereoImagePair_old (<StereoImagePair_old>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StereoImagePair_old>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StereoImagePair_old)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name scene_understanding-msg:<StereoImagePair_old> is deprecated: use scene_understanding-msg:StereoImagePair_old instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <StereoImagePair_old>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:header-val is deprecated.  Use scene_understanding-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'leftImage-val :lambda-list '(m))
(cl:defmethod leftImage-val ((m <StereoImagePair_old>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:leftImage-val is deprecated.  Use scene_understanding-msg:leftImage instead.")
  (leftImage m))

(cl:ensure-generic-function 'rightImage-val :lambda-list '(m))
(cl:defmethod rightImage-val ((m <StereoImagePair_old>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:rightImage-val is deprecated.  Use scene_understanding-msg:rightImage instead.")
  (rightImage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StereoImagePair_old>) ostream)
  "Serializes a message object of type '<StereoImagePair_old>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'leftImage) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rightImage) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StereoImagePair_old>) istream)
  "Deserializes a message object of type '<StereoImagePair_old>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'leftImage) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rightImage) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StereoImagePair_old>)))
  "Returns string type for a message object of type '<StereoImagePair_old>"
  "scene_understanding/StereoImagePair_old")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StereoImagePair_old)))
  "Returns string type for a message object of type 'StereoImagePair_old"
  "scene_understanding/StereoImagePair_old")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StereoImagePair_old>)))
  "Returns md5sum for a message object of type '<StereoImagePair_old>"
  "2bd638146eaa49b61cb46f08d72754d0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StereoImagePair_old)))
  "Returns md5sum for a message object of type 'StereoImagePair_old"
  "2bd638146eaa49b61cb46f08d72754d0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StereoImagePair_old>)))
  "Returns full string definition for message of type '<StereoImagePair_old>"
  (cl:format cl:nil "Header header~%sensor_msgs/Image leftImage~%sensor_msgs/Image rightImage~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StereoImagePair_old)))
  "Returns full string definition for message of type 'StereoImagePair_old"
  (cl:format cl:nil "Header header~%sensor_msgs/Image leftImage~%sensor_msgs/Image rightImage~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StereoImagePair_old>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'leftImage))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rightImage))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StereoImagePair_old>))
  "Converts a ROS message object to a list"
  (cl:list 'StereoImagePair_old
    (cl:cons ':header (header msg))
    (cl:cons ':leftImage (leftImage msg))
    (cl:cons ':rightImage (rightImage msg))
))
