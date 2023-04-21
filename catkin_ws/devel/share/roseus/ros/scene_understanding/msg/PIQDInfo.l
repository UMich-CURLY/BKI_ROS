;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::PIQDInfo)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'PIQDInfo (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::PIQDINFO")
  (make-package "SCENE_UNDERSTANDING::PIQDINFO"))

(in-package "ROS")
;;//! \htmlinclude PIQDInfo.msg.html


(defclass scene_understanding::PIQDInfo
  :super ros::object
  :slots (_stamp _target _current _error _proportionalTerm _integralTerm _integralTermLowerLimit _integralTermUpperLimit _quadraticTerm _derivativeTerm _feedForwardTerm _piqdOutput _controlOutput _saturatedControlOutput _timeDifference ))

(defmethod scene_understanding::PIQDInfo
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:target __target) 0.0)
    ((:current __current) 0.0)
    ((:error __error) 0.0)
    ((:proportionalTerm __proportionalTerm) 0.0)
    ((:integralTerm __integralTerm) 0.0)
    ((:integralTermLowerLimit __integralTermLowerLimit) 0.0)
    ((:integralTermUpperLimit __integralTermUpperLimit) 0.0)
    ((:quadraticTerm __quadraticTerm) 0.0)
    ((:derivativeTerm __derivativeTerm) 0.0)
    ((:feedForwardTerm __feedForwardTerm) 0.0)
    ((:piqdOutput __piqdOutput) 0.0)
    ((:controlOutput __controlOutput) 0.0)
    ((:saturatedControlOutput __saturatedControlOutput) 0.0)
    ((:timeDifference __timeDifference) 0.0)
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _target (float __target))
   (setq _current (float __current))
   (setq _error (float __error))
   (setq _proportionalTerm (float __proportionalTerm))
   (setq _integralTerm (float __integralTerm))
   (setq _integralTermLowerLimit (float __integralTermLowerLimit))
   (setq _integralTermUpperLimit (float __integralTermUpperLimit))
   (setq _quadraticTerm (float __quadraticTerm))
   (setq _derivativeTerm (float __derivativeTerm))
   (setq _feedForwardTerm (float __feedForwardTerm))
   (setq _piqdOutput (float __piqdOutput))
   (setq _controlOutput (float __controlOutput))
   (setq _saturatedControlOutput (float __saturatedControlOutput))
   (setq _timeDifference (float __timeDifference))
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:target
   (&optional __target)
   (if __target (setq _target __target)) _target)
  (:current
   (&optional __current)
   (if __current (setq _current __current)) _current)
  (:error
   (&optional __error)
   (if __error (setq _error __error)) _error)
  (:proportionalTerm
   (&optional __proportionalTerm)
   (if __proportionalTerm (setq _proportionalTerm __proportionalTerm)) _proportionalTerm)
  (:integralTerm
   (&optional __integralTerm)
   (if __integralTerm (setq _integralTerm __integralTerm)) _integralTerm)
  (:integralTermLowerLimit
   (&optional __integralTermLowerLimit)
   (if __integralTermLowerLimit (setq _integralTermLowerLimit __integralTermLowerLimit)) _integralTermLowerLimit)
  (:integralTermUpperLimit
   (&optional __integralTermUpperLimit)
   (if __integralTermUpperLimit (setq _integralTermUpperLimit __integralTermUpperLimit)) _integralTermUpperLimit)
  (:quadraticTerm
   (&optional __quadraticTerm)
   (if __quadraticTerm (setq _quadraticTerm __quadraticTerm)) _quadraticTerm)
  (:derivativeTerm
   (&optional __derivativeTerm)
   (if __derivativeTerm (setq _derivativeTerm __derivativeTerm)) _derivativeTerm)
  (:feedForwardTerm
   (&optional __feedForwardTerm)
   (if __feedForwardTerm (setq _feedForwardTerm __feedForwardTerm)) _feedForwardTerm)
  (:piqdOutput
   (&optional __piqdOutput)
   (if __piqdOutput (setq _piqdOutput __piqdOutput)) _piqdOutput)
  (:controlOutput
   (&optional __controlOutput)
   (if __controlOutput (setq _controlOutput __controlOutput)) _controlOutput)
  (:saturatedControlOutput
   (&optional __saturatedControlOutput)
   (if __saturatedControlOutput (setq _saturatedControlOutput __saturatedControlOutput)) _saturatedControlOutput)
  (:timeDifference
   (&optional __timeDifference)
   (if __timeDifference (setq _timeDifference __timeDifference)) _timeDifference)
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; float64 _target
    8
    ;; float64 _current
    8
    ;; float64 _error
    8
    ;; float64 _proportionalTerm
    8
    ;; float64 _integralTerm
    8
    ;; float64 _integralTermLowerLimit
    8
    ;; float64 _integralTermUpperLimit
    8
    ;; float64 _quadraticTerm
    8
    ;; float64 _derivativeTerm
    8
    ;; float64 _feedForwardTerm
    8
    ;; float64 _piqdOutput
    8
    ;; float64 _controlOutput
    8
    ;; float64 _saturatedControlOutput
    8
    ;; float64 _timeDifference
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _stamp
       (write-long (send _stamp :sec) s) (write-long (send _stamp :nsec) s)
     ;; float64 _target
       (sys::poke _target (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _current
       (sys::poke _current (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _error
       (sys::poke _error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _proportionalTerm
       (sys::poke _proportionalTerm (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _integralTerm
       (sys::poke _integralTerm (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _integralTermLowerLimit
       (sys::poke _integralTermLowerLimit (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _integralTermUpperLimit
       (sys::poke _integralTermUpperLimit (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _quadraticTerm
       (sys::poke _quadraticTerm (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _derivativeTerm
       (sys::poke _derivativeTerm (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _feedForwardTerm
       (sys::poke _feedForwardTerm (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _piqdOutput
       (sys::poke _piqdOutput (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _controlOutput
       (sys::poke _controlOutput (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _saturatedControlOutput
       (sys::poke _saturatedControlOutput (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _timeDifference
       (sys::poke _timeDifference (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _stamp
     (send _stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _target
     (setq _target (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _current
     (setq _current (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _error
     (setq _error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _proportionalTerm
     (setq _proportionalTerm (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _integralTerm
     (setq _integralTerm (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _integralTermLowerLimit
     (setq _integralTermLowerLimit (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _integralTermUpperLimit
     (setq _integralTermUpperLimit (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _quadraticTerm
     (setq _quadraticTerm (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _derivativeTerm
     (setq _derivativeTerm (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _feedForwardTerm
     (setq _feedForwardTerm (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _piqdOutput
     (setq _piqdOutput (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _controlOutput
     (setq _controlOutput (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _saturatedControlOutput
     (setq _saturatedControlOutput (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _timeDifference
     (setq _timeDifference (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get scene_understanding::PIQDInfo :md5sum-) "240bec481b74c3ece1f9f0cf6d2d3d49")
(setf (get scene_understanding::PIQDInfo :datatype-) "scene_understanding/PIQDInfo")
(setf (get scene_understanding::PIQDInfo :definition-)
      "time stamp

float64 target
float64 current
float64 error
float64 proportionalTerm
float64 integralTerm
float64 integralTermLowerLimit
float64 integralTermUpperLimit
float64 quadraticTerm
float64 derivativeTerm
float64 feedForwardTerm
float64 piqdOutput
float64 controlOutput
float64 saturatedControlOutput
float64 timeDifference

")



(provide :scene_understanding/PIQDInfo "240bec481b74c3ece1f9f0cf6d2d3d49")


