
(cl:in-package :asdf)

(defsystem "wombot_node-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "AckermannDriveStamped" :depends-on ("_package_AckermannDriveStamped"))
    (:file "_package_AckermannDriveStamped" :depends-on ("_package"))
    (:file "AckermannDrive" :depends-on ("_package_AckermannDrive"))
    (:file "_package_AckermannDrive" :depends-on ("_package"))
  ))