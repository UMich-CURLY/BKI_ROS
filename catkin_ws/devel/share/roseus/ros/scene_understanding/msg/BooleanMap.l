;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::BooleanMap)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'BooleanMap (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::BOOLEANMAP")
  (make-package "SCENE_UNDERSTANDING::BOOLEANMAP"))

(in-package "ROS")
;;//! \htmlinclude BooleanMap.msg.html


(defclass scene_understanding::BooleanMap
  :super ros::object
  :slots (_data_exists ))

(defmethod scene_understanding::BooleanMap
  (:init
   (&key
    ((:data_exists __data_exists) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _data_exists __data_exists)
   self)
  (:data_exists
   (&optional __data_exists)
   (if __data_exists (setq _data_exists __data_exists)) _data_exists)
  (:serialization-length
   ()
   (+
    ;; int8[] _data_exists
    (* 1    (length _data_exists)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8[] _data_exists
     (write-long (length _data_exists) s)
     (dotimes (i (length _data_exists))
       (write-byte (elt _data_exists i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8[] _data_exists
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data_exists (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _data_exists i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _data_exists i) 127) (setf (elt _data_exists i) (- (elt _data_exists i) 256)))
     ))
   ;;
   self)
  )

(setf (get scene_understanding::BooleanMap :md5sum-) "87a3648defa41ca2572ff6541da77b0b")
(setf (get scene_understanding::BooleanMap :datatype-) "scene_understanding/BooleanMap")
(setf (get scene_understanding::BooleanMap :definition-)
      "#MapHeader mapheader
int8[] data_exists

")



(provide :scene_understanding/BooleanMap "87a3648defa41ca2572ff6541da77b0b")


