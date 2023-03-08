;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::SetCostMapAroundVehicle)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'SetCostMapAroundVehicle (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::SETCOSTMAPAROUNDVEHICLE")
  (make-package "SCENE_UNDERSTANDING::SETCOSTMAPAROUNDVEHICLE"))
(unless (find-package "SCENE_UNDERSTANDING::SETCOSTMAPAROUNDVEHICLEREQUEST")
  (make-package "SCENE_UNDERSTANDING::SETCOSTMAPAROUNDVEHICLEREQUEST"))
(unless (find-package "SCENE_UNDERSTANDING::SETCOSTMAPAROUNDVEHICLERESPONSE")
  (make-package "SCENE_UNDERSTANDING::SETCOSTMAPAROUNDVEHICLERESPONSE"))

(in-package "ROS")





(defclass scene_understanding::SetCostMapAroundVehicleRequest
  :super ros::object
  :slots (_height _width _cost ))

(defmethod scene_understanding::SetCostMapAroundVehicleRequest
  (:init
   (&key
    ((:height __height) 0.0)
    ((:width __width) 0.0)
    ((:cost __cost) 0.0)
    )
   (send-super :init)
   (setq _height (float __height))
   (setq _width (float __width))
   (setq _cost (float __cost))
   self)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:cost
   (&optional __cost)
   (if __cost (setq _cost __cost)) _cost)
  (:serialization-length
   ()
   (+
    ;; float32 _height
    4
    ;; float32 _width
    4
    ;; float32 _cost
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _cost
       (sys::poke _cost (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _cost
     (setq _cost (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass scene_understanding::SetCostMapAroundVehicleResponse
  :super ros::object
  :slots (_success _message ))

(defmethod scene_understanding::SetCostMapAroundVehicleResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass scene_understanding::SetCostMapAroundVehicle
  :super ros::object
  :slots ())

(setf (get scene_understanding::SetCostMapAroundVehicle :md5sum-) "8c4553ce63e1ff713460885fc9f3430a")
(setf (get scene_understanding::SetCostMapAroundVehicle :datatype-) "scene_understanding/SetCostMapAroundVehicle")
(setf (get scene_understanding::SetCostMapAroundVehicle :request) scene_understanding::SetCostMapAroundVehicleRequest)
(setf (get scene_understanding::SetCostMapAroundVehicle :response) scene_understanding::SetCostMapAroundVehicleResponse)

(defmethod scene_understanding::SetCostMapAroundVehicleRequest
  (:response () (instance scene_understanding::SetCostMapAroundVehicleResponse :init)))

(setf (get scene_understanding::SetCostMapAroundVehicleRequest :md5sum-) "8c4553ce63e1ff713460885fc9f3430a")
(setf (get scene_understanding::SetCostMapAroundVehicleRequest :datatype-) "scene_understanding/SetCostMapAroundVehicleRequest")
(setf (get scene_understanding::SetCostMapAroundVehicleRequest :definition-)
      "float32 height
float32 width
float32 cost
---
bool success
string message

")

(setf (get scene_understanding::SetCostMapAroundVehicleResponse :md5sum-) "8c4553ce63e1ff713460885fc9f3430a")
(setf (get scene_understanding::SetCostMapAroundVehicleResponse :datatype-) "scene_understanding/SetCostMapAroundVehicleResponse")
(setf (get scene_understanding::SetCostMapAroundVehicleResponse :definition-)
      "float32 height
float32 width
float32 cost
---
bool success
string message

")



(provide :scene_understanding/SetCostMapAroundVehicle "8c4553ce63e1ff713460885fc9f3430a")


