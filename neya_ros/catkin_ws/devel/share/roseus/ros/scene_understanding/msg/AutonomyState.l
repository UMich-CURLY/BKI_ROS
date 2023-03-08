;; Auto-generated. Do not edit!


(when (boundp 'scene_understanding::AutonomyState)
  (if (not (find-package "SCENE_UNDERSTANDING"))
    (make-package "SCENE_UNDERSTANDING"))
  (shadow 'AutonomyState (find-package "SCENE_UNDERSTANDING")))
(unless (find-package "SCENE_UNDERSTANDING::AUTONOMYSTATE")
  (make-package "SCENE_UNDERSTANDING::AUTONOMYSTATE"))

(in-package "ROS")
;;//! \htmlinclude AutonomyState.msg.html


(intern "*DISABLE_AUTONOMY*" (find-package "SCENE_UNDERSTANDING::AUTONOMYSTATE"))
(shadow '*DISABLE_AUTONOMY* (find-package "SCENE_UNDERSTANDING::AUTONOMYSTATE"))
(defconstant scene_understanding::AutonomyState::*DISABLE_AUTONOMY* 0)
(intern "*ENABLE_AUTONOMY*" (find-package "SCENE_UNDERSTANDING::AUTONOMYSTATE"))
(shadow '*ENABLE_AUTONOMY* (find-package "SCENE_UNDERSTANDING::AUTONOMYSTATE"))
(defconstant scene_understanding::AutonomyState::*ENABLE_AUTONOMY* 1)
(intern "*ENABLE_AUTONOMY_HYBRID*" (find-package "SCENE_UNDERSTANDING::AUTONOMYSTATE"))
(shadow '*ENABLE_AUTONOMY_HYBRID* (find-package "SCENE_UNDERSTANDING::AUTONOMYSTATE"))
(defconstant scene_understanding::AutonomyState::*ENABLE_AUTONOMY_HYBRID* 2)

(defun scene_understanding::AutonomyState-to-symbol (const)
  (cond
        ((= const 0) 'scene_understanding::AutonomyState::*DISABLE_AUTONOMY*)
        ((= const 1) 'scene_understanding::AutonomyState::*ENABLE_AUTONOMY*)
        ((= const 2) 'scene_understanding::AutonomyState::*ENABLE_AUTONOMY_HYBRID*)
        (t nil)))

(defclass scene_understanding::AutonomyState
  :super ros::object
  :slots (_state ))

(defmethod scene_understanding::AutonomyState
  (:init
   (&key
    ((:state __state) 0)
    )
   (send-super :init)
   (setq _state (round __state))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; int8 _state
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _state
       (write-byte _state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _state
     (setq _state (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _state 127) (setq _state (- _state 256)))
   ;;
   self)
  )

(setf (get scene_understanding::AutonomyState :md5sum-) "360e23629954382a9bc44f0eb38bc373")
(setf (get scene_understanding::AutonomyState :datatype-) "scene_understanding/AutonomyState")
(setf (get scene_understanding::AutonomyState :definition-)
      "# Autonomy States
# Note: This message is used to transition between autonomy states on the MRZR.
# Note: Hybrid mode is not recommended in most cases.
int8 DISABLE_AUTONOMY=0
int8 ENABLE_AUTONOMY=1
int8 ENABLE_AUTONOMY_HYBRID=2

int8 state
")



(provide :scene_understanding/AutonomyState "360e23629954382a9bc44f0eb38bc373")


