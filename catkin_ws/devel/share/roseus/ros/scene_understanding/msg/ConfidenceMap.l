;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::ConfidenceMap)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'ConfidenceMap (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::CONFIDENCEMAP")
  (make-package "SCENE_UNDERSTANDING::CONFIDENCEMAP"))

(in-package "ROS")
;;//! \htmlinclude ConfidenceMap.msg.html


(defclass scene_understanding::ConfidenceMap
  :super ros::object
  :slots (_confidence ))

(defmethod scene_understanding::ConfidenceMap
  (:init
   (&key
    ((:confidence __confidence) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _confidence __confidence)
   self)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:serialization-length
   ()
   (+
    ;; float32[] _confidence
    (* 4    (length _confidence)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _confidence
     (write-long (length _confidence) s)
     (dotimes (i (length _confidence))
       (sys::poke (elt _confidence i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _confidence
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _confidence (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _confidence i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get scene_understanding::ConfidenceMap :md5sum-) "1dbbe1023d82ebb797244da71216a266")
(setf (get scene_understanding::ConfidenceMap :datatype-) "scene_understanding/ConfidenceMap")
(setf (get scene_understanding::ConfidenceMap :definition-)
      "#MapHeader mapheader
float32[] confidence

")



(provide :scene_understanding/ConfidenceMap "1dbbe1023d82ebb797244da71216a266")


