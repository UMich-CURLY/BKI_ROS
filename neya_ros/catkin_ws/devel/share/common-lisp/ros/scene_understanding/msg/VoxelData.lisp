; Auto-generated. Do not edit!


(cl:in-package scene_understanding-msg)


;//! \htmlinclude VoxelData.msg.html

(cl:defclass <VoxelData> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (resolution
    :reader resolution
    :initarg :resolution
    :type cl:float
    :initform 0.0)
   (data
    :reader data
    :initarg :data
    :type (cl:vector scene_understanding-msg:VoxelValue)
   :initform (cl:make-array 0 :element-type 'scene_understanding-msg:VoxelValue :initial-element (cl:make-instance 'scene_understanding-msg:VoxelValue))))
)

(cl:defclass VoxelData (<VoxelData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VoxelData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VoxelData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name scene_understanding-msg:<VoxelData> is deprecated: use scene_understanding-msg:VoxelData instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <VoxelData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:header-val is deprecated.  Use scene_understanding-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'resolution-val :lambda-list '(m))
(cl:defmethod resolution-val ((m <VoxelData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:resolution-val is deprecated.  Use scene_understanding-msg:resolution instead.")
  (resolution m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <VoxelData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:data-val is deprecated.  Use scene_understanding-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VoxelData>) ostream)
  "Serializes a message object of type '<VoxelData>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'resolution))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VoxelData>) istream)
  "Deserializes a message object of type '<VoxelData>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'resolution) (roslisp-utils:decode-double-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'scene_understanding-msg:VoxelValue))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VoxelData>)))
  "Returns string type for a message object of type '<VoxelData>"
  "scene_understanding/VoxelData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VoxelData)))
  "Returns string type for a message object of type 'VoxelData"
  "scene_understanding/VoxelData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VoxelData>)))
  "Returns md5sum for a message object of type '<VoxelData>"
  "ef47bab6b7887fe67691b47c4525189e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VoxelData)))
  "Returns md5sum for a message object of type 'VoxelData"
  "ef47bab6b7887fe67691b47c4525189e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VoxelData>)))
  "Returns full string definition for message of type '<VoxelData>"
  (cl:format cl:nil "Header header~%~%float64 resolution # The resolution of the voxel data in meters~%~%VoxelValue[] data  # The list of voxel data. Positions are the center of the voxel~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: scene_understanding/VoxelValue~%float64 x~%float64 y~%float64 z~%~%float32 density~%float32 density_confidence~%~%float32 rgb~%~%uint8 material~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VoxelData)))
  "Returns full string definition for message of type 'VoxelData"
  (cl:format cl:nil "Header header~%~%float64 resolution # The resolution of the voxel data in meters~%~%VoxelValue[] data  # The list of voxel data. Positions are the center of the voxel~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: scene_understanding/VoxelValue~%float64 x~%float64 y~%float64 z~%~%float32 density~%float32 density_confidence~%~%float32 rgb~%~%uint8 material~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VoxelData>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VoxelData>))
  "Converts a ROS message object to a list"
  (cl:list 'VoxelData
    (cl:cons ':header (header msg))
    (cl:cons ':resolution (resolution msg))
    (cl:cons ':data (data msg))
))
