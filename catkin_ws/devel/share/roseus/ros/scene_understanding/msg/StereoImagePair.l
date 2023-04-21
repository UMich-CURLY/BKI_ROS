;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::StereoImagePair)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'StereoImagePair (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::STEREOIMAGEPAIR")
  (make-package "SCENE_UNDERSTANDING::STEREOIMAGEPAIR"))

(in-package "ROS")
;;//! \htmlinclude StereoImagePair.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass scene_understanding::StereoImagePair
  :super ros::object
  :slots (_header _leftImage _rightImage _focalLength _baseline _centerRow _centerCol ))

(defmethod scene_understanding::StereoImagePair
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:leftImage __leftImage) (instance sensor_msgs::Image :init))
    ((:rightImage __rightImage) (instance sensor_msgs::Image :init))
    ((:focalLength __focalLength) 0.0)
    ((:baseline __baseline) 0.0)
    ((:centerRow __centerRow) 0.0)
    ((:centerCol __centerCol) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _leftImage __leftImage)
   (setq _rightImage __rightImage)
   (setq _focalLength (float __focalLength))
   (setq _baseline (float __baseline))
   (setq _centerRow (float __centerRow))
   (setq _centerCol (float __centerCol))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:leftImage
   (&rest __leftImage)
   (if (keywordp (car __leftImage))
       (send* _leftImage __leftImage)
     (progn
       (if __leftImage (setq _leftImage (car __leftImage)))
       _leftImage)))
  (:rightImage
   (&rest __rightImage)
   (if (keywordp (car __rightImage))
       (send* _rightImage __rightImage)
     (progn
       (if __rightImage (setq _rightImage (car __rightImage)))
       _rightImage)))
  (:focalLength
   (&optional __focalLength)
   (if __focalLength (setq _focalLength __focalLength)) _focalLength)
  (:baseline
   (&optional __baseline)
   (if __baseline (setq _baseline __baseline)) _baseline)
  (:centerRow
   (&optional __centerRow)
   (if __centerRow (setq _centerRow __centerRow)) _centerRow)
  (:centerCol
   (&optional __centerCol)
   (if __centerCol (setq _centerCol __centerCol)) _centerCol)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; sensor_msgs/Image _leftImage
    (send _leftImage :serialization-length)
    ;; sensor_msgs/Image _rightImage
    (send _rightImage :serialization-length)
    ;; float32 _focalLength
    4
    ;; float32 _baseline
    4
    ;; float32 _centerRow
    4
    ;; float32 _centerCol
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; sensor_msgs/Image _leftImage
       (send _leftImage :serialize s)
     ;; sensor_msgs/Image _rightImage
       (send _rightImage :serialize s)
     ;; float32 _focalLength
       (sys::poke _focalLength (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _baseline
       (sys::poke _baseline (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _centerRow
       (sys::poke _centerRow (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _centerCol
       (sys::poke _centerCol (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; sensor_msgs/Image _leftImage
     (send _leftImage :deserialize buf ptr-) (incf ptr- (send _leftImage :serialization-length))
   ;; sensor_msgs/Image _rightImage
     (send _rightImage :deserialize buf ptr-) (incf ptr- (send _rightImage :serialization-length))
   ;; float32 _focalLength
     (setq _focalLength (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _baseline
     (setq _baseline (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _centerRow
     (setq _centerRow (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _centerCol
     (setq _centerCol (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get scene_understanding::StereoImagePair :md5sum-) "b71ab9b442ba2143a8c747c61426fdc4")
(setf (get scene_understanding::StereoImagePair :datatype-) "scene_understanding/StereoImagePair")
(setf (get scene_understanding::StereoImagePair :definition-)
      "Header header
sensor_msgs/Image leftImage
sensor_msgs/Image rightImage

# The camera intrinsics for the rectified camera
float32 focalLength
float32 baseline
float32 centerRow
float32 centerCol

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
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

")



(provide :scene_understanding/StereoImagePair "b71ab9b442ba2143a8c747c61426fdc4")


