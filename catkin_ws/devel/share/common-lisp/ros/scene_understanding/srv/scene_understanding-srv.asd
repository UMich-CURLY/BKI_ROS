
(cl:in-package :asdf)

(defsystem "scene_understanding-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SetCostMapAroundVehicle" :depends-on ("_package_SetCostMapAroundVehicle"))
    (:file "_package_SetCostMapAroundVehicle" :depends-on ("_package"))
  ))