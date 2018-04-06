
(cl:in-package :asdf)

(defsystem "logical_camera_plugin-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "logicalImage" :depends-on ("_package_logicalImage"))
    (:file "_package_logicalImage" :depends-on ("_package"))
  ))