
(cl:in-package :asdf)

(defsystem "wombot_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "WombotVehicle" :depends-on ("_package_WombotVehicle"))
    (:file "_package_WombotVehicle" :depends-on ("_package"))
  ))