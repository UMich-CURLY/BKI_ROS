;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::LoggerStatus)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'LoggerStatus (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::LOGGERSTATUS")
  (make-package "SCENE_UNDERSTANDING::LOGGERSTATUS"))

(in-package "ROS")
;;//! \htmlinclude LoggerStatus.msg.html


(intern "*NOMINAL*" (find-package "SCENE_UNDERSTANDING::LOGGERSTATUS"))
(shadow '*NOMINAL* (find-package "SCENE_UNDERSTANDING::LOGGERSTATUS"))
(defconstant scene_understanding::LoggerStatus::*NOMINAL* 0)
(intern "*CONSOLIDATING*" (find-package "SCENE_UNDERSTANDING::LOGGERSTATUS"))
(shadow '*CONSOLIDATING* (find-package "SCENE_UNDERSTANDING::LOGGERSTATUS"))
(defconstant scene_understanding::LoggerStatus::*CONSOLIDATING* 1)
(intern "*PARAMETER_ERROR*" (find-package "SCENE_UNDERSTANDING::LOGGERSTATUS"))
(shadow '*PARAMETER_ERROR* (find-package "SCENE_UNDERSTANDING::LOGGERSTATUS"))
(defconstant scene_understanding::LoggerStatus::*PARAMETER_ERROR* 2)
(intern "*DIRECTORY_ERROR*" (find-package "SCENE_UNDERSTANDING::LOGGERSTATUS"))
(shadow '*DIRECTORY_ERROR* (find-package "SCENE_UNDERSTANDING::LOGGERSTATUS"))
(defconstant scene_understanding::LoggerStatus::*DIRECTORY_ERROR* 3)
(intern "*DISK_SPACE_ERROR*" (find-package "SCENE_UNDERSTANDING::LOGGERSTATUS"))
(shadow '*DISK_SPACE_ERROR* (find-package "SCENE_UNDERSTANDING::LOGGERSTATUS"))
(defconstant scene_understanding::LoggerStatus::*DISK_SPACE_ERROR* 4)
(intern "*SYNC_ERROR*" (find-package "SCENE_UNDERSTANDING::LOGGERSTATUS"))
(shadow '*SYNC_ERROR* (find-package "SCENE_UNDERSTANDING::LOGGERSTATUS"))
(defconstant scene_understanding::LoggerStatus::*SYNC_ERROR* 5)

(defun scene_understanding::LoggerStatus-to-symbol (const)
  (cond
        ((= const 0) 'scene_understanding::LoggerStatus::*NOMINAL*)
        ((= const 1) 'scene_understanding::LoggerStatus::*CONSOLIDATING*)
        ((= const 2) 'scene_understanding::LoggerStatus::*PARAMETER_ERROR*)
        ((= const 3) 'scene_understanding::LoggerStatus::*DIRECTORY_ERROR*)
        ((= const 4) 'scene_understanding::LoggerStatus::*DISK_SPACE_ERROR*)
        ((= const 5) 'scene_understanding::LoggerStatus::*SYNC_ERROR*)
        (t nil)))

(defclass scene_understanding::LoggerStatus
  :super ros::object
  :slots (_logging _status ))

(defmethod scene_understanding::LoggerStatus
  (:init
   (&key
    ((:logging __logging) nil)
    ((:status __status) 0)
    )
   (send-super :init)
   (setq _logging __logging)
   (setq _status (round __status))
   self)
  (:logging
   (&optional (__logging :null))
   (if (not (eq __logging :null)) (setq _logging __logging)) _logging)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; bool _logging
    1
    ;; int8 _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _logging
       (if _logging (write-byte -1 s) (write-byte 0 s))
     ;; int8 _status
       (write-byte _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _logging
     (setq _logging (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int8 _status
     (setq _status (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _status 127) (setq _status (- _status 256)))
   ;;
   self)
  )

(setf (get scene_understanding::LoggerStatus :md5sum-) "b41f30f09dc0b31930675744564ab05c")
(setf (get scene_understanding::LoggerStatus :datatype-) "scene_understanding/LoggerStatus")
(setf (get scene_understanding::LoggerStatus :definition-)
      "# Status enum
int8 NOMINAL=0
int8 CONSOLIDATING=1
int8 PARAMETER_ERROR=2
int8 DIRECTORY_ERROR=3
int8 DISK_SPACE_ERROR=4
int8 SYNC_ERROR=5

# Logger Status
bool logging
int8 status

")



(provide :scene_understanding/LoggerStatus "b41f30f09dc0b31930675744564ab05c")


