
(cl:in-package :asdf)

(defsystem "localization-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "GpsConverter" :depends-on ("_package_GpsConverter"))
    (:file "_package_GpsConverter" :depends-on ("_package"))
  ))