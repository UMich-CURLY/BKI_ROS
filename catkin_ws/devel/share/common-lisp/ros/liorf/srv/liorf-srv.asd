
(cl:in-package :asdf)

(defsystem "liorf-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "save_map" :depends-on ("_package_save_map"))
    (:file "_package_save_map" :depends-on ("_package"))
  ))