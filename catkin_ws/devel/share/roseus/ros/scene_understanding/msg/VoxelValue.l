;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::VoxelValue)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'VoxelValue (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::VOXELVALUE")
  (make-package "SCENE_UNDERSTANDING::VOXELVALUE"))

(in-package "ROS")
;;//! \htmlinclude VoxelValue.msg.html


(defclass scene_understanding::VoxelValue
  :super ros::object
  :slots (_x _y _z _density _density_confidence _rgb _material ))

(defmethod scene_understanding::VoxelValue
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:density __density) 0.0)
    ((:density_confidence __density_confidence) 0.0)
    ((:rgb __rgb) 0.0)
    ((:material __material) 0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _density (float __density))
   (setq _density_confidence (float __density_confidence))
   (setq _rgb (float __rgb))
   (setq _material (round __material))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:density
   (&optional __density)
   (if __density (setq _density __density)) _density)
  (:density_confidence
   (&optional __density_confidence)
   (if __density_confidence (setq _density_confidence __density_confidence)) _density_confidence)
  (:rgb
   (&optional __rgb)
   (if __rgb (setq _rgb __rgb)) _rgb)
  (:material
   (&optional __material)
   (if __material (setq _material __material)) _material)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float32 _density
    4
    ;; float32 _density_confidence
    4
    ;; float32 _rgb
    4
    ;; uint8 _material
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _density
       (sys::poke _density (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _density_confidence
       (sys::poke _density_confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rgb
       (sys::poke _rgb (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _material
       (write-byte _material s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _density
     (setq _density (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _density_confidence
     (setq _density_confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rgb
     (setq _rgb (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _material
     (setq _material (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get scene_understanding::VoxelValue :md5sum-) "803ef880e1818e7bb7eb8eac0ff9f20b")
(setf (get scene_understanding::VoxelValue :datatype-) "scene_understanding/VoxelValue")
(setf (get scene_understanding::VoxelValue :definition-)
      "float64 x
float64 y
float64 z

float32 density
float32 density_confidence

float32 rgb

uint8 material

")



(provide :scene_understanding/VoxelValue "803ef880e1818e7bb7eb8eac0ff9f20b")


