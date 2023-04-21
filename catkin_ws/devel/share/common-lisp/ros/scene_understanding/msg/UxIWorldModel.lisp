; Auto-generated. Do not edit!


(cl:in-package scene_understanding-msg)


;//! \htmlinclude UxIWorldModel.msg.html

(cl:defclass <UxIWorldModel> (roslisp-msg-protocol:ros-message)
  ((mapheader
    :reader mapheader
    :initarg :mapheader
    :type scene_understanding-msg:MapHeader
    :initform (cl:make-instance 'scene_understanding-msg:MapHeader))
   (costmap
    :reader costmap
    :initarg :costmap
    :type scene_understanding-msg:Costmap
    :initform (cl:make-instance 'scene_understanding-msg:Costmap))
   (ground_elevation_map
    :reader ground_elevation_map
    :initarg :ground_elevation_map
    :type scene_understanding-msg:ElevationMap
    :initform (cl:make-instance 'scene_understanding-msg:ElevationMap)))
)

(cl:defclass UxIWorldModel (<UxIWorldModel>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UxIWorldModel>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UxIWorldModel)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name scene_understanding-msg:<UxIWorldModel> is deprecated: use scene_understanding-msg:UxIWorldModel instead.")))

(cl:ensure-generic-function 'mapheader-val :lambda-list '(m))
(cl:defmethod mapheader-val ((m <UxIWorldModel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:mapheader-val is deprecated.  Use scene_understanding-msg:mapheader instead.")
  (mapheader m))

(cl:ensure-generic-function 'costmap-val :lambda-list '(m))
(cl:defmethod costmap-val ((m <UxIWorldModel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:costmap-val is deprecated.  Use scene_understanding-msg:costmap instead.")
  (costmap m))

(cl:ensure-generic-function 'ground_elevation_map-val :lambda-list '(m))
(cl:defmethod ground_elevation_map-val ((m <UxIWorldModel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader scene_understanding-msg:ground_elevation_map-val is deprecated.  Use scene_understanding-msg:ground_elevation_map instead.")
  (ground_elevation_map m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UxIWorldModel>) ostream)
  "Serializes a message object of type '<UxIWorldModel>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'mapheader) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'costmap) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ground_elevation_map) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UxIWorldModel>) istream)
  "Deserializes a message object of type '<UxIWorldModel>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'mapheader) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'costmap) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ground_elevation_map) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UxIWorldModel>)))
  "Returns string type for a message object of type '<UxIWorldModel>"
  "scene_understanding/UxIWorldModel")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UxIWorldModel)))
  "Returns string type for a message object of type 'UxIWorldModel"
  "scene_understanding/UxIWorldModel")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UxIWorldModel>)))
  "Returns md5sum for a message object of type '<UxIWorldModel>"
  "cb62fd2200fd1ee960df6a33acdf4318")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UxIWorldModel)))
  "Returns md5sum for a message object of type 'UxIWorldModel"
  "cb62fd2200fd1ee960df6a33acdf4318")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UxIWorldModel>)))
  "Returns full string definition for message of type '<UxIWorldModel>"
  (cl:format cl:nil "MapHeader mapheader~%Costmap costmap~%ElevationMap ground_elevation_map~%#ElevationMap max_elevation_map~%~%================================================================================~%MSG: scene_understanding/MapHeader~%Header header~%~%float64 originx~%float64 originy~%~%int32 num_rows~%int32 num_cols~%float64 cell_size~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: scene_understanding/Costmap~%MapHeader mapheader~%uint8[] cost~%~%#Enum for type of update~%int8 NO_CHANGE = 0~%int8 CHANGED   = 1~%int8[] updated_cells~%~%ConfidenceMap confidence_map~%~%================================================================================~%MSG: scene_understanding/ConfidenceMap~%#MapHeader mapheader~%float32[] confidence~%~%================================================================================~%MSG: scene_understanding/ElevationMap~%MapHeader mapheader~%float32[] elevation~%ConfidenceMap confidence_map~%BooleanMap bool_map~%~%================================================================================~%MSG: scene_understanding/BooleanMap~%#MapHeader mapheader~%int8[] data_exists~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UxIWorldModel)))
  "Returns full string definition for message of type 'UxIWorldModel"
  (cl:format cl:nil "MapHeader mapheader~%Costmap costmap~%ElevationMap ground_elevation_map~%#ElevationMap max_elevation_map~%~%================================================================================~%MSG: scene_understanding/MapHeader~%Header header~%~%float64 originx~%float64 originy~%~%int32 num_rows~%int32 num_cols~%float64 cell_size~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: scene_understanding/Costmap~%MapHeader mapheader~%uint8[] cost~%~%#Enum for type of update~%int8 NO_CHANGE = 0~%int8 CHANGED   = 1~%int8[] updated_cells~%~%ConfidenceMap confidence_map~%~%================================================================================~%MSG: scene_understanding/ConfidenceMap~%#MapHeader mapheader~%float32[] confidence~%~%================================================================================~%MSG: scene_understanding/ElevationMap~%MapHeader mapheader~%float32[] elevation~%ConfidenceMap confidence_map~%BooleanMap bool_map~%~%================================================================================~%MSG: scene_understanding/BooleanMap~%#MapHeader mapheader~%int8[] data_exists~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UxIWorldModel>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'mapheader))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'costmap))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ground_elevation_map))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UxIWorldModel>))
  "Converts a ROS message object to a list"
  (cl:list 'UxIWorldModel
    (cl:cons ':mapheader (mapheader msg))
    (cl:cons ':costmap (costmap msg))
    (cl:cons ':ground_elevation_map (ground_elevation_map msg))
))
