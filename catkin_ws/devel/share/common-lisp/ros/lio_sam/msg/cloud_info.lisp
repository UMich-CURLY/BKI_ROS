; Auto-generated. Do not edit!


(cl:in-package lio_sam-msg)


;//! \htmlinclude cloud_info.msg.html

(cl:defclass <cloud_info> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (startRingIndex
    :reader startRingIndex
    :initarg :startRingIndex
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (endRingIndex
    :reader endRingIndex
    :initarg :endRingIndex
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (pointColInd
    :reader pointColInd
    :initarg :pointColInd
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (pointRange
    :reader pointRange
    :initarg :pointRange
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (imuAvailable
    :reader imuAvailable
    :initarg :imuAvailable
    :type cl:integer
    :initform 0)
   (odomAvailable
    :reader odomAvailable
    :initarg :odomAvailable
    :type cl:integer
    :initform 0)
   (imuRollInit
    :reader imuRollInit
    :initarg :imuRollInit
    :type cl:float
    :initform 0.0)
   (imuPitchInit
    :reader imuPitchInit
    :initarg :imuPitchInit
    :type cl:float
    :initform 0.0)
   (imuYawInit
    :reader imuYawInit
    :initarg :imuYawInit
    :type cl:float
    :initform 0.0)
   (initialGuessX
    :reader initialGuessX
    :initarg :initialGuessX
    :type cl:float
    :initform 0.0)
   (initialGuessY
    :reader initialGuessY
    :initarg :initialGuessY
    :type cl:float
    :initform 0.0)
   (initialGuessZ
    :reader initialGuessZ
    :initarg :initialGuessZ
    :type cl:float
    :initform 0.0)
   (initialGuessRoll
    :reader initialGuessRoll
    :initarg :initialGuessRoll
    :type cl:float
    :initform 0.0)
   (initialGuessPitch
    :reader initialGuessPitch
    :initarg :initialGuessPitch
    :type cl:float
    :initform 0.0)
   (initialGuessYaw
    :reader initialGuessYaw
    :initarg :initialGuessYaw
    :type cl:float
    :initform 0.0)
   (cloud_deskewed
    :reader cloud_deskewed
    :initarg :cloud_deskewed
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (cloud_corner
    :reader cloud_corner
    :initarg :cloud_corner
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (cloud_surface
    :reader cloud_surface
    :initarg :cloud_surface
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (key_frame_cloud
    :reader key_frame_cloud
    :initarg :key_frame_cloud
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (key_frame_color
    :reader key_frame_color
    :initarg :key_frame_color
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (key_frame_poses
    :reader key_frame_poses
    :initarg :key_frame_poses
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (key_frame_map
    :reader key_frame_map
    :initarg :key_frame_map
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2)))
)

(cl:defclass cloud_info (<cloud_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cloud_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cloud_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lio_sam-msg:<cloud_info> is deprecated: use lio_sam-msg:cloud_info instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:header-val is deprecated.  Use lio_sam-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'startRingIndex-val :lambda-list '(m))
(cl:defmethod startRingIndex-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:startRingIndex-val is deprecated.  Use lio_sam-msg:startRingIndex instead.")
  (startRingIndex m))

(cl:ensure-generic-function 'endRingIndex-val :lambda-list '(m))
(cl:defmethod endRingIndex-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:endRingIndex-val is deprecated.  Use lio_sam-msg:endRingIndex instead.")
  (endRingIndex m))

(cl:ensure-generic-function 'pointColInd-val :lambda-list '(m))
(cl:defmethod pointColInd-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:pointColInd-val is deprecated.  Use lio_sam-msg:pointColInd instead.")
  (pointColInd m))

(cl:ensure-generic-function 'pointRange-val :lambda-list '(m))
(cl:defmethod pointRange-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:pointRange-val is deprecated.  Use lio_sam-msg:pointRange instead.")
  (pointRange m))

(cl:ensure-generic-function 'imuAvailable-val :lambda-list '(m))
(cl:defmethod imuAvailable-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:imuAvailable-val is deprecated.  Use lio_sam-msg:imuAvailable instead.")
  (imuAvailable m))

(cl:ensure-generic-function 'odomAvailable-val :lambda-list '(m))
(cl:defmethod odomAvailable-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:odomAvailable-val is deprecated.  Use lio_sam-msg:odomAvailable instead.")
  (odomAvailable m))

(cl:ensure-generic-function 'imuRollInit-val :lambda-list '(m))
(cl:defmethod imuRollInit-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:imuRollInit-val is deprecated.  Use lio_sam-msg:imuRollInit instead.")
  (imuRollInit m))

(cl:ensure-generic-function 'imuPitchInit-val :lambda-list '(m))
(cl:defmethod imuPitchInit-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:imuPitchInit-val is deprecated.  Use lio_sam-msg:imuPitchInit instead.")
  (imuPitchInit m))

(cl:ensure-generic-function 'imuYawInit-val :lambda-list '(m))
(cl:defmethod imuYawInit-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:imuYawInit-val is deprecated.  Use lio_sam-msg:imuYawInit instead.")
  (imuYawInit m))

(cl:ensure-generic-function 'initialGuessX-val :lambda-list '(m))
(cl:defmethod initialGuessX-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:initialGuessX-val is deprecated.  Use lio_sam-msg:initialGuessX instead.")
  (initialGuessX m))

(cl:ensure-generic-function 'initialGuessY-val :lambda-list '(m))
(cl:defmethod initialGuessY-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:initialGuessY-val is deprecated.  Use lio_sam-msg:initialGuessY instead.")
  (initialGuessY m))

(cl:ensure-generic-function 'initialGuessZ-val :lambda-list '(m))
(cl:defmethod initialGuessZ-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:initialGuessZ-val is deprecated.  Use lio_sam-msg:initialGuessZ instead.")
  (initialGuessZ m))

(cl:ensure-generic-function 'initialGuessRoll-val :lambda-list '(m))
(cl:defmethod initialGuessRoll-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:initialGuessRoll-val is deprecated.  Use lio_sam-msg:initialGuessRoll instead.")
  (initialGuessRoll m))

(cl:ensure-generic-function 'initialGuessPitch-val :lambda-list '(m))
(cl:defmethod initialGuessPitch-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:initialGuessPitch-val is deprecated.  Use lio_sam-msg:initialGuessPitch instead.")
  (initialGuessPitch m))

(cl:ensure-generic-function 'initialGuessYaw-val :lambda-list '(m))
(cl:defmethod initialGuessYaw-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:initialGuessYaw-val is deprecated.  Use lio_sam-msg:initialGuessYaw instead.")
  (initialGuessYaw m))

(cl:ensure-generic-function 'cloud_deskewed-val :lambda-list '(m))
(cl:defmethod cloud_deskewed-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:cloud_deskewed-val is deprecated.  Use lio_sam-msg:cloud_deskewed instead.")
  (cloud_deskewed m))

(cl:ensure-generic-function 'cloud_corner-val :lambda-list '(m))
(cl:defmethod cloud_corner-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:cloud_corner-val is deprecated.  Use lio_sam-msg:cloud_corner instead.")
  (cloud_corner m))

(cl:ensure-generic-function 'cloud_surface-val :lambda-list '(m))
(cl:defmethod cloud_surface-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:cloud_surface-val is deprecated.  Use lio_sam-msg:cloud_surface instead.")
  (cloud_surface m))

(cl:ensure-generic-function 'key_frame_cloud-val :lambda-list '(m))
(cl:defmethod key_frame_cloud-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:key_frame_cloud-val is deprecated.  Use lio_sam-msg:key_frame_cloud instead.")
  (key_frame_cloud m))

(cl:ensure-generic-function 'key_frame_color-val :lambda-list '(m))
(cl:defmethod key_frame_color-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:key_frame_color-val is deprecated.  Use lio_sam-msg:key_frame_color instead.")
  (key_frame_color m))

(cl:ensure-generic-function 'key_frame_poses-val :lambda-list '(m))
(cl:defmethod key_frame_poses-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:key_frame_poses-val is deprecated.  Use lio_sam-msg:key_frame_poses instead.")
  (key_frame_poses m))

(cl:ensure-generic-function 'key_frame_map-val :lambda-list '(m))
(cl:defmethod key_frame_map-val ((m <cloud_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lio_sam-msg:key_frame_map-val is deprecated.  Use lio_sam-msg:key_frame_map instead.")
  (key_frame_map m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cloud_info>) ostream)
  "Serializes a message object of type '<cloud_info>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'startRingIndex))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'startRingIndex))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'endRingIndex))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'endRingIndex))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pointColInd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'pointColInd))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pointRange))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'pointRange))
  (cl:let* ((signed (cl:slot-value msg 'imuAvailable)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'odomAvailable)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'imuRollInit))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'imuPitchInit))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'imuYawInit))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'initialGuessX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'initialGuessY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'initialGuessZ))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'initialGuessRoll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'initialGuessPitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'initialGuessYaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'cloud_deskewed) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'cloud_corner) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'cloud_surface) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'key_frame_cloud) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'key_frame_color) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'key_frame_poses) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'key_frame_map) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cloud_info>) istream)
  "Deserializes a message object of type '<cloud_info>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'startRingIndex) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'startRingIndex)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'endRingIndex) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'endRingIndex)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pointColInd) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pointColInd)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pointRange) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pointRange)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'imuAvailable) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'odomAvailable) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'imuRollInit) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'imuPitchInit) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'imuYawInit) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'initialGuessX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'initialGuessY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'initialGuessZ) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'initialGuessRoll) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'initialGuessPitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'initialGuessYaw) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'cloud_deskewed) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'cloud_corner) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'cloud_surface) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'key_frame_cloud) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'key_frame_color) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'key_frame_poses) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'key_frame_map) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cloud_info>)))
  "Returns string type for a message object of type '<cloud_info>"
  "lio_sam/cloud_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cloud_info)))
  "Returns string type for a message object of type 'cloud_info"
  "lio_sam/cloud_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cloud_info>)))
  "Returns md5sum for a message object of type '<cloud_info>"
  "b654dbfca2e5288eff9e25937cb8519e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cloud_info)))
  "Returns md5sum for a message object of type 'cloud_info"
  "b654dbfca2e5288eff9e25937cb8519e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cloud_info>)))
  "Returns full string definition for message of type '<cloud_info>"
  (cl:format cl:nil "# Cloud Info~%Header header ~%~%int32[] startRingIndex~%int32[] endRingIndex~%~%int32[]  pointColInd # point column index in range image~%float32[] pointRange # point range ~%~%int64 imuAvailable~%int64 odomAvailable~%~%# Attitude for LOAM initialization~%float32 imuRollInit~%float32 imuPitchInit~%float32 imuYawInit~%~%# Initial guess from imu pre-integration~%float32 initialGuessX~%float32 initialGuessY~%float32 initialGuessZ~%float32 initialGuessRoll~%float32 initialGuessPitch~%float32 initialGuessYaw~%~%# Point cloud messages~%sensor_msgs/PointCloud2 cloud_deskewed  # original cloud deskewed~%sensor_msgs/PointCloud2 cloud_corner    # extracted corner feature~%sensor_msgs/PointCloud2 cloud_surface   # extracted surface feature~%~%# 3rd party messages~%sensor_msgs/PointCloud2 key_frame_cloud~%sensor_msgs/PointCloud2 key_frame_color~%sensor_msgs/PointCloud2 key_frame_poses~%sensor_msgs/PointCloud2 key_frame_map~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cloud_info)))
  "Returns full string definition for message of type 'cloud_info"
  (cl:format cl:nil "# Cloud Info~%Header header ~%~%int32[] startRingIndex~%int32[] endRingIndex~%~%int32[]  pointColInd # point column index in range image~%float32[] pointRange # point range ~%~%int64 imuAvailable~%int64 odomAvailable~%~%# Attitude for LOAM initialization~%float32 imuRollInit~%float32 imuPitchInit~%float32 imuYawInit~%~%# Initial guess from imu pre-integration~%float32 initialGuessX~%float32 initialGuessY~%float32 initialGuessZ~%float32 initialGuessRoll~%float32 initialGuessPitch~%float32 initialGuessYaw~%~%# Point cloud messages~%sensor_msgs/PointCloud2 cloud_deskewed  # original cloud deskewed~%sensor_msgs/PointCloud2 cloud_corner    # extracted corner feature~%sensor_msgs/PointCloud2 cloud_surface   # extracted surface feature~%~%# 3rd party messages~%sensor_msgs/PointCloud2 key_frame_cloud~%sensor_msgs/PointCloud2 key_frame_color~%sensor_msgs/PointCloud2 key_frame_poses~%sensor_msgs/PointCloud2 key_frame_map~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cloud_info>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'startRingIndex) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'endRingIndex) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pointColInd) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pointRange) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     8
     8
     4
     4
     4
     4
     4
     4
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'cloud_deskewed))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'cloud_corner))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'cloud_surface))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'key_frame_cloud))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'key_frame_color))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'key_frame_poses))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'key_frame_map))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cloud_info>))
  "Converts a ROS message object to a list"
  (cl:list 'cloud_info
    (cl:cons ':header (header msg))
    (cl:cons ':startRingIndex (startRingIndex msg))
    (cl:cons ':endRingIndex (endRingIndex msg))
    (cl:cons ':pointColInd (pointColInd msg))
    (cl:cons ':pointRange (pointRange msg))
    (cl:cons ':imuAvailable (imuAvailable msg))
    (cl:cons ':odomAvailable (odomAvailable msg))
    (cl:cons ':imuRollInit (imuRollInit msg))
    (cl:cons ':imuPitchInit (imuPitchInit msg))
    (cl:cons ':imuYawInit (imuYawInit msg))
    (cl:cons ':initialGuessX (initialGuessX msg))
    (cl:cons ':initialGuessY (initialGuessY msg))
    (cl:cons ':initialGuessZ (initialGuessZ msg))
    (cl:cons ':initialGuessRoll (initialGuessRoll msg))
    (cl:cons ':initialGuessPitch (initialGuessPitch msg))
    (cl:cons ':initialGuessYaw (initialGuessYaw msg))
    (cl:cons ':cloud_deskewed (cloud_deskewed msg))
    (cl:cons ':cloud_corner (cloud_corner msg))
    (cl:cons ':cloud_surface (cloud_surface msg))
    (cl:cons ':key_frame_cloud (key_frame_cloud msg))
    (cl:cons ':key_frame_color (key_frame_color msg))
    (cl:cons ':key_frame_poses (key_frame_poses msg))
    (cl:cons ':key_frame_map (key_frame_map msg))
))
