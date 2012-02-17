
(cl:in-package :asdf)

(defsystem "wombot_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "DrivetrainCommand" :depends-on ("_package_DrivetrainCommand"))
    (:file "_package_DrivetrainCommand" :depends-on ("_package"))
    (:file "WombotVehicle" :depends-on ("_package_WombotVehicle"))
    (:file "_package_WombotVehicle" :depends-on ("_package"))
  ))