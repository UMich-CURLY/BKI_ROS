;; Auto-generated. Do not edit!


(when (boundp 'lio_sam::cloud_info)
  (if (not (find-package "LIO_SAM"))
    (make-package "LIO_SAM"))
  (shadow 'cloud_info (find-package "LIO_SAM")))
(unless (find-package "LIO_SAM::CLOUD_INFO")
  (make-package "LIO_SAM::CLOUD_INFO"))

(in-package "ROS")
;;//! \htmlinclude cloud_info.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass lio_sam::cloud_info
  :super ros::object
  :slots (_header _startRingIndex _endRingIndex _pointColInd _pointRange _imuAvailable _odomAvailable _imuRollInit _imuPitchInit _imuYawInit _initialGuessX _initialGuessY _initialGuessZ _initialGuessRoll _initialGuessPitch _initialGuessYaw _cloud_deskewed _cloud_corner _cloud_surface _key_frame_cloud _key_frame_color _key_frame_poses _key_frame_map ))

(defmethod lio_sam::cloud_info
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:startRingIndex __startRingIndex) (make-array 0 :initial-element 0 :element-type :integer))
    ((:endRingIndex __endRingIndex) (make-array 0 :initial-element 0 :element-type :integer))
    ((:pointColInd __pointColInd) (make-array 0 :initial-element 0 :element-type :integer))
    ((:pointRange __pointRange) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:imuAvailable __imuAvailable) 0)
    ((:odomAvailable __odomAvailable) 0)
    ((:imuRollInit __imuRollInit) 0.0)
    ((:imuPitchInit __imuPitchInit) 0.0)
    ((:imuYawInit __imuYawInit) 0.0)
    ((:initialGuessX __initialGuessX) 0.0)
    ((:initialGuessY __initialGuessY) 0.0)
    ((:initialGuessZ __initialGuessZ) 0.0)
    ((:initialGuessRoll __initialGuessRoll) 0.0)
    ((:initialGuessPitch __initialGuessPitch) 0.0)
    ((:initialGuessYaw __initialGuessYaw) 0.0)
    ((:cloud_deskewed __cloud_deskewed) (instance sensor_msgs::PointCloud2 :init))
    ((:cloud_corner __cloud_corner) (instance sensor_msgs::PointCloud2 :init))
    ((:cloud_surface __cloud_surface) (instance sensor_msgs::PointCloud2 :init))
    ((:key_frame_cloud __key_frame_cloud) (instance sensor_msgs::PointCloud2 :init))
    ((:key_frame_color __key_frame_color) (instance sensor_msgs::PointCloud2 :init))
    ((:key_frame_poses __key_frame_poses) (instance sensor_msgs::PointCloud2 :init))
    ((:key_frame_map __key_frame_map) (instance sensor_msgs::PointCloud2 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _startRingIndex __startRingIndex)
   (setq _endRingIndex __endRingIndex)
   (setq _pointColInd __pointColInd)
   (setq _pointRange __pointRange)
   (setq _imuAvailable (round __imuAvailable))
   (setq _odomAvailable (round __odomAvailable))
   (setq _imuRollInit (float __imuRollInit))
   (setq _imuPitchInit (float __imuPitchInit))
   (setq _imuYawInit (float __imuYawInit))
   (setq _initialGuessX (float __initialGuessX))
   (setq _initialGuessY (float __initialGuessY))
   (setq _initialGuessZ (float __initialGuessZ))
   (setq _initialGuessRoll (float __initialGuessRoll))
   (setq _initialGuessPitch (float __initialGuessPitch))
   (setq _initialGuessYaw (float __initialGuessYaw))
   (setq _cloud_deskewed __cloud_deskewed)
   (setq _cloud_corner __cloud_corner)
   (setq _cloud_surface __cloud_surface)
   (setq _key_frame_cloud __key_frame_cloud)
   (setq _key_frame_color __key_frame_color)
   (setq _key_frame_poses __key_frame_poses)
   (setq _key_frame_map __key_frame_map)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:startRingIndex
   (&optional __startRingIndex)
   (if __startRingIndex (setq _startRingIndex __startRingIndex)) _startRingIndex)
  (:endRingIndex
   (&optional __endRingIndex)
   (if __endRingIndex (setq _endRingIndex __endRingIndex)) _endRingIndex)
  (:pointColInd
   (&optional __pointColInd)
   (if __pointColInd (setq _pointColInd __pointColInd)) _pointColInd)
  (:pointRange
   (&optional __pointRange)
   (if __pointRange (setq _pointRange __pointRange)) _pointRange)
  (:imuAvailable
   (&optional __imuAvailable)
   (if __imuAvailable (setq _imuAvailable __imuAvailable)) _imuAvailable)
  (:odomAvailable
   (&optional __odomAvailable)
   (if __odomAvailable (setq _odomAvailable __odomAvailable)) _odomAvailable)
  (:imuRollInit
   (&optional __imuRollInit)
   (if __imuRollInit (setq _imuRollInit __imuRollInit)) _imuRollInit)
  (:imuPitchInit
   (&optional __imuPitchInit)
   (if __imuPitchInit (setq _imuPitchInit __imuPitchInit)) _imuPitchInit)
  (:imuYawInit
   (&optional __imuYawInit)
   (if __imuYawInit (setq _imuYawInit __imuYawInit)) _imuYawInit)
  (:initialGuessX
   (&optional __initialGuessX)
   (if __initialGuessX (setq _initialGuessX __initialGuessX)) _initialGuessX)
  (:initialGuessY
   (&optional __initialGuessY)
   (if __initialGuessY (setq _initialGuessY __initialGuessY)) _initialGuessY)
  (:initialGuessZ
   (&optional __initialGuessZ)
   (if __initialGuessZ (setq _initialGuessZ __initialGuessZ)) _initialGuessZ)
  (:initialGuessRoll
   (&optional __initialGuessRoll)
   (if __initialGuessRoll (setq _initialGuessRoll __initialGuessRoll)) _initialGuessRoll)
  (:initialGuessPitch
   (&optional __initialGuessPitch)
   (if __initialGuessPitch (setq _initialGuessPitch __initialGuessPitch)) _initialGuessPitch)
  (:initialGuessYaw
   (&optional __initialGuessYaw)
   (if __initialGuessYaw (setq _initialGuessYaw __initialGuessYaw)) _initialGuessYaw)
  (:cloud_deskewed
   (&rest __cloud_deskewed)
   (if (keywordp (car __cloud_deskewed))
       (send* _cloud_deskewed __cloud_deskewed)
     (progn
       (if __cloud_deskewed (setq _cloud_deskewed (car __cloud_deskewed)))
       _cloud_deskewed)))
  (:cloud_corner
   (&rest __cloud_corner)
   (if (keywordp (car __cloud_corner))
       (send* _cloud_corner __cloud_corner)
     (progn
       (if __cloud_corner (setq _cloud_corner (car __cloud_corner)))
       _cloud_corner)))
  (:cloud_surface
   (&rest __cloud_surface)
   (if (keywordp (car __cloud_surface))
       (send* _cloud_surface __cloud_surface)
     (progn
       (if __cloud_surface (setq _cloud_surface (car __cloud_surface)))
       _cloud_surface)))
  (:key_frame_cloud
   (&rest __key_frame_cloud)
   (if (keywordp (car __key_frame_cloud))
       (send* _key_frame_cloud __key_frame_cloud)
     (progn
       (if __key_frame_cloud (setq _key_frame_cloud (car __key_frame_cloud)))
       _key_frame_cloud)))
  (:key_frame_color
   (&rest __key_frame_color)
   (if (keywordp (car __key_frame_color))
       (send* _key_frame_color __key_frame_color)
     (progn
       (if __key_frame_color (setq _key_frame_color (car __key_frame_color)))
       _key_frame_color)))
  (:key_frame_poses
   (&rest __key_frame_poses)
   (if (keywordp (car __key_frame_poses))
       (send* _key_frame_poses __key_frame_poses)
     (progn
       (if __key_frame_poses (setq _key_frame_poses (car __key_frame_poses)))
       _key_frame_poses)))
  (:key_frame_map
   (&rest __key_frame_map)
   (if (keywordp (car __key_frame_map))
       (send* _key_frame_map __key_frame_map)
     (progn
       (if __key_frame_map (setq _key_frame_map (car __key_frame_map)))
       _key_frame_map)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32[] _startRingIndex
    (* 4    (length _startRingIndex)) 4
    ;; int32[] _endRingIndex
    (* 4    (length _endRingIndex)) 4
    ;; int32[] _pointColInd
    (* 4    (length _pointColInd)) 4
    ;; float32[] _pointRange
    (* 4    (length _pointRange)) 4
    ;; int64 _imuAvailable
    8
    ;; int64 _odomAvailable
    8
    ;; float32 _imuRollInit
    4
    ;; float32 _imuPitchInit
    4
    ;; float32 _imuYawInit
    4
    ;; float32 _initialGuessX
    4
    ;; float32 _initialGuessY
    4
    ;; float32 _initialGuessZ
    4
    ;; float32 _initialGuessRoll
    4
    ;; float32 _initialGuessPitch
    4
    ;; float32 _initialGuessYaw
    4
    ;; sensor_msgs/PointCloud2 _cloud_deskewed
    (send _cloud_deskewed :serialization-length)
    ;; sensor_msgs/PointCloud2 _cloud_corner
    (send _cloud_corner :serialization-length)
    ;; sensor_msgs/PointCloud2 _cloud_surface
    (send _cloud_surface :serialization-length)
    ;; sensor_msgs/PointCloud2 _key_frame_cloud
    (send _key_frame_cloud :serialization-length)
    ;; sensor_msgs/PointCloud2 _key_frame_color
    (send _key_frame_color :serialization-length)
    ;; sensor_msgs/PointCloud2 _key_frame_poses
    (send _key_frame_poses :serialization-length)
    ;; sensor_msgs/PointCloud2 _key_frame_map
    (send _key_frame_map :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32[] _startRingIndex
     (write-long (length _startRingIndex) s)
     (dotimes (i (length _startRingIndex))
       (write-long (elt _startRingIndex i) s)
       )
     ;; int32[] _endRingIndex
     (write-long (length _endRingIndex) s)
     (dotimes (i (length _endRingIndex))
       (write-long (elt _endRingIndex i) s)
       )
     ;; int32[] _pointColInd
     (write-long (length _pointColInd) s)
     (dotimes (i (length _pointColInd))
       (write-long (elt _pointColInd i) s)
       )
     ;; float32[] _pointRange
     (write-long (length _pointRange) s)
     (dotimes (i (length _pointRange))
       (sys::poke (elt _pointRange i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int64 _imuAvailable
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _imuAvailable (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _imuAvailable) (= (length (_imuAvailable . bv)) 2)) ;; bignum
              (write-long (ash (elt (_imuAvailable . bv) 0) 0) s)
              (write-long (ash (elt (_imuAvailable . bv) 1) -1) s))
             ((and (class _imuAvailable) (= (length (_imuAvailable . bv)) 1)) ;; big1
              (write-long (elt (_imuAvailable . bv) 0) s)
              (write-long (if (>= _imuAvailable 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _imuAvailable s)(write-long (if (>= _imuAvailable 0) 0 #xffffffff) s)))
     ;; int64 _odomAvailable
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _odomAvailable (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _odomAvailable) (= (length (_odomAvailable . bv)) 2)) ;; bignum
              (write-long (ash (elt (_odomAvailable . bv) 0) 0) s)
              (write-long (ash (elt (_odomAvailable . bv) 1) -1) s))
             ((and (class _odomAvailable) (= (length (_odomAvailable . bv)) 1)) ;; big1
              (write-long (elt (_odomAvailable . bv) 0) s)
              (write-long (if (>= _odomAvailable 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _odomAvailable s)(write-long (if (>= _odomAvailable 0) 0 #xffffffff) s)))
     ;; float32 _imuRollInit
       (sys::poke _imuRollInit (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _imuPitchInit
       (sys::poke _imuPitchInit (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _imuYawInit
       (sys::poke _imuYawInit (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _initialGuessX
       (sys::poke _initialGuessX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _initialGuessY
       (sys::poke _initialGuessY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _initialGuessZ
       (sys::poke _initialGuessZ (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _initialGuessRoll
       (sys::poke _initialGuessRoll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _initialGuessPitch
       (sys::poke _initialGuessPitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _initialGuessYaw
       (sys::poke _initialGuessYaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; sensor_msgs/PointCloud2 _cloud_deskewed
       (send _cloud_deskewed :serialize s)
     ;; sensor_msgs/PointCloud2 _cloud_corner
       (send _cloud_corner :serialize s)
     ;; sensor_msgs/PointCloud2 _cloud_surface
       (send _cloud_surface :serialize s)
     ;; sensor_msgs/PointCloud2 _key_frame_cloud
       (send _key_frame_cloud :serialize s)
     ;; sensor_msgs/PointCloud2 _key_frame_color
       (send _key_frame_color :serialize s)
     ;; sensor_msgs/PointCloud2 _key_frame_poses
       (send _key_frame_poses :serialize s)
     ;; sensor_msgs/PointCloud2 _key_frame_map
       (send _key_frame_map :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32[] _startRingIndex
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _startRingIndex (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _startRingIndex i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _endRingIndex
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _endRingIndex (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _endRingIndex i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _pointColInd
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pointColInd (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _pointColInd i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float32[] _pointRange
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pointRange (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pointRange i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int64 _imuAvailable
#+(or :alpha :irix6 :x86_64)
      (setf _imuAvailable (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _imuAvailable (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _odomAvailable
#+(or :alpha :irix6 :x86_64)
      (setf _odomAvailable (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _odomAvailable (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float32 _imuRollInit
     (setq _imuRollInit (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _imuPitchInit
     (setq _imuPitchInit (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _imuYawInit
     (setq _imuYawInit (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _initialGuessX
     (setq _initialGuessX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _initialGuessY
     (setq _initialGuessY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _initialGuessZ
     (setq _initialGuessZ (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _initialGuessRoll
     (setq _initialGuessRoll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _initialGuessPitch
     (setq _initialGuessPitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _initialGuessYaw
     (setq _initialGuessYaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; sensor_msgs/PointCloud2 _cloud_deskewed
     (send _cloud_deskewed :deserialize buf ptr-) (incf ptr- (send _cloud_deskewed :serialization-length))
   ;; sensor_msgs/PointCloud2 _cloud_corner
     (send _cloud_corner :deserialize buf ptr-) (incf ptr- (send _cloud_corner :serialization-length))
   ;; sensor_msgs/PointCloud2 _cloud_surface
     (send _cloud_surface :deserialize buf ptr-) (incf ptr- (send _cloud_surface :serialization-length))
   ;; sensor_msgs/PointCloud2 _key_frame_cloud
     (send _key_frame_cloud :deserialize buf ptr-) (incf ptr- (send _key_frame_cloud :serialization-length))
   ;; sensor_msgs/PointCloud2 _key_frame_color
     (send _key_frame_color :deserialize buf ptr-) (incf ptr- (send _key_frame_color :serialization-length))
   ;; sensor_msgs/PointCloud2 _key_frame_poses
     (send _key_frame_poses :deserialize buf ptr-) (incf ptr- (send _key_frame_poses :serialization-length))
   ;; sensor_msgs/PointCloud2 _key_frame_map
     (send _key_frame_map :deserialize buf ptr-) (incf ptr- (send _key_frame_map :serialization-length))
   ;;
   self)
  )

(setf (get lio_sam::cloud_info :md5sum-) "b654dbfca2e5288eff9e25937cb8519e")
(setf (get lio_sam::cloud_info :datatype-) "lio_sam/cloud_info")
(setf (get lio_sam::cloud_info :definition-)
      "# Cloud Info
Header header 

int32[] startRingIndex
int32[] endRingIndex

int32[]  pointColInd # point column index in range image
float32[] pointRange # point range 

int64 imuAvailable
int64 odomAvailable

# Attitude for LOAM initialization
float32 imuRollInit
float32 imuPitchInit
float32 imuYawInit

# Initial guess from imu pre-integration
float32 initialGuessX
float32 initialGuessY
float32 initialGuessZ
float32 initialGuessRoll
float32 initialGuessPitch
float32 initialGuessYaw

# Point cloud messages
sensor_msgs/PointCloud2 cloud_deskewed  # original cloud deskewed
sensor_msgs/PointCloud2 cloud_corner    # extracted corner feature
sensor_msgs/PointCloud2 cloud_surface   # extracted surface feature

# 3rd party messages
sensor_msgs/PointCloud2 key_frame_cloud
sensor_msgs/PointCloud2 key_frame_color
sensor_msgs/PointCloud2 key_frame_poses
sensor_msgs/PointCloud2 key_frame_map

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field

")



(provide :lio_sam/cloud_info "b654dbfca2e5288eff9e25937cb8519e")


