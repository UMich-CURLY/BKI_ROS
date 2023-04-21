;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::LoggerControl)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'LoggerControl (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::LOGGERCONTROL")
  (make-package "SCENE_UNDERSTANDING::LOGGERCONTROL"))

(in-package "ROS")
;;//! \htmlinclude LoggerControl.msg.html


(defclass scene_understanding::LoggerControl
  :super ros::object
  :slots (_directory _experiment _log_data ))

(defmethod scene_understanding::LoggerControl
  (:init
   (&key
    ((:directory __directory) "")
    ((:experiment __experiment) "")
    ((:log_data __log_data) nil)
    )
   (send-super :init)
   (setq _directory (string __directory))
   (setq _experiment (string __experiment))
   (setq _log_data __log_data)
   self)
  (:directory
   (&optional __directory)
   (if __directory (setq _directory __directory)) _directory)
  (:experiment
   (&optional __experiment)
   (if __experiment (setq _experiment __experiment)) _experiment)
  (:log_data
   (&optional (__log_data :null))
   (if (not (eq __log_data :null)) (setq _log_data __log_data)) _log_data)
  (:serialization-length
   ()
   (+
    ;; string _directory
    4 (length _directory)
    ;; string _experiment
    4 (length _experiment)
    ;; bool _log_data
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _directory
       (write-long (length _directory) s) (princ _directory s)
     ;; string _experiment
       (write-long (length _experiment) s) (princ _experiment s)
     ;; bool _log_data
       (if _log_data (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _directory
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _directory (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _experiment
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _experiment (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _log_data
     (setq _log_data (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get scene_understanding::LoggerControl :md5sum-) "c6ce9bb3e388aa19d3b944e0c92c892a")
(setf (get scene_understanding::LoggerControl :datatype-) "scene_understanding/LoggerControl")
(setf (get scene_understanding::LoggerControl :definition-)
      "string directory
string experiment
bool log_data

")



(provide :scene_understanding/LoggerControl "c6ce9bb3e388aa19d3b944e0c92c892a")


