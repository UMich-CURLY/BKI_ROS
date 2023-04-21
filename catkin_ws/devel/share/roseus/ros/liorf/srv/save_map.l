;; Auto-generated. Do not edit!


(when (boundp 'liorf::save_map)
  (if (not (find-package "LIORF"))
    (make-package "LIORF"))
  (shadow 'save_map (find-package "LIORF")))
(unless (find-package "LIORF::SAVE_MAP")
  (make-package "LIORF::SAVE_MAP"))
(unless (find-package "LIORF::SAVE_MAPREQUEST")
  (make-package "LIORF::SAVE_MAPREQUEST"))
(unless (find-package "LIORF::SAVE_MAPRESPONSE")
  (make-package "LIORF::SAVE_MAPRESPONSE"))

(in-package "ROS")





(defclass liorf::save_mapRequest
  :super ros::object
  :slots (_resolution _destination ))

(defmethod liorf::save_mapRequest
  (:init
   (&key
    ((:resolution __resolution) 0.0)
    ((:destination __destination) "")
    )
   (send-super :init)
   (setq _resolution (float __resolution))
   (setq _destination (string __destination))
   self)
  (:resolution
   (&optional __resolution)
   (if __resolution (setq _resolution __resolution)) _resolution)
  (:destination
   (&optional __destination)
   (if __destination (setq _destination __destination)) _destination)
  (:serialization-length
   ()
   (+
    ;; float32 _resolution
    4
    ;; string _destination
    4 (length _destination)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _resolution
       (sys::poke _resolution (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _destination
       (write-long (length _destination) s) (princ _destination s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _resolution
     (setq _resolution (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _destination
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _destination (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass liorf::save_mapResponse
  :super ros::object
  :slots (_success ))

(defmethod liorf::save_mapResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass liorf::save_map
  :super ros::object
  :slots ())

(setf (get liorf::save_map :md5sum-) "9b82c64d089149d300598523af304f22")
(setf (get liorf::save_map :datatype-) "liorf/save_map")
(setf (get liorf::save_map :request) liorf::save_mapRequest)
(setf (get liorf::save_map :response) liorf::save_mapResponse)

(defmethod liorf::save_mapRequest
  (:response () (instance liorf::save_mapResponse :init)))

(setf (get liorf::save_mapRequest :md5sum-) "9b82c64d089149d300598523af304f22")
(setf (get liorf::save_mapRequest :datatype-) "liorf/save_mapRequest")
(setf (get liorf::save_mapRequest :definition-)
      "float32 resolution
string destination
---
bool success

")

(setf (get liorf::save_mapResponse :md5sum-) "9b82c64d089149d300598523af304f22")
(setf (get liorf::save_mapResponse :datatype-) "liorf/save_mapResponse")
(setf (get liorf::save_mapResponse :definition-)
      "float32 resolution
string destination
---
bool success

")



(provide :liorf/save_map "9b82c64d089149d300598523af304f22")


