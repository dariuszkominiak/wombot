; Auto-generated. Do not edit!


(cl:in-package wombot_msgs-msg)


;//! \htmlinclude DrivetrainCommand.msg.html

(cl:defclass <DrivetrainCommand> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (gear
    :reader gear
    :initarg :gear
    :type cl:fixnum
    :initform 0)
   (front_diff
    :reader front_diff
    :initarg :front_diff
    :type cl:fixnum
    :initform 0)
   (rear_diff
    :reader rear_diff
    :initarg :rear_diff
    :type cl:fixnum
    :initform 0))
)

(cl:defclass DrivetrainCommand (<DrivetrainCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DrivetrainCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DrivetrainCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wombot_msgs-msg:<DrivetrainCommand> is deprecated: use wombot_msgs-msg:DrivetrainCommand instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DrivetrainCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wombot_msgs-msg:header-val is deprecated.  Use wombot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'gear-val :lambda-list '(m))
(cl:defmethod gear-val ((m <DrivetrainCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wombot_msgs-msg:gear-val is deprecated.  Use wombot_msgs-msg:gear instead.")
  (gear m))

(cl:ensure-generic-function 'front_diff-val :lambda-list '(m))
(cl:defmethod front_diff-val ((m <DrivetrainCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wombot_msgs-msg:front_diff-val is deprecated.  Use wombot_msgs-msg:front_diff instead.")
  (front_diff m))

(cl:ensure-generic-function 'rear_diff-val :lambda-list '(m))
(cl:defmethod rear_diff-val ((m <DrivetrainCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wombot_msgs-msg:rear_diff-val is deprecated.  Use wombot_msgs-msg:rear_diff instead.")
  (rear_diff m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<DrivetrainCommand>)))
    "Constants for message type '<DrivetrainCommand>"
  '((:NOCHANGE . 0)
    (:LOWRANGE . 1)
    (:HIGHRANGE . 2)
    (:NOCHANGE . 0)
    (:UNLOCK . 1)
    (:LOCK . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'DrivetrainCommand)))
    "Constants for message type 'DrivetrainCommand"
  '((:NOCHANGE . 0)
    (:LOWRANGE . 1)
    (:HIGHRANGE . 2)
    (:NOCHANGE . 0)
    (:UNLOCK . 1)
    (:LOCK . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DrivetrainCommand>) ostream)
  "Serializes a message object of type '<DrivetrainCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gear)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'front_diff)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rear_diff)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DrivetrainCommand>) istream)
  "Deserializes a message object of type '<DrivetrainCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gear)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'front_diff)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rear_diff)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DrivetrainCommand>)))
  "Returns string type for a message object of type '<DrivetrainCommand>"
  "wombot_msgs/DrivetrainCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DrivetrainCommand)))
  "Returns string type for a message object of type 'DrivetrainCommand"
  "wombot_msgs/DrivetrainCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DrivetrainCommand>)))
  "Returns md5sum for a message object of type '<DrivetrainCommand>"
  "09da80225b8092c781124e80463cb389")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DrivetrainCommand)))
  "Returns md5sum for a message object of type 'DrivetrainCommand"
  "09da80225b8092c781124e80463cb389")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DrivetrainCommand>)))
  "Returns full string definition for message of type '<DrivetrainCommand>"
  (cl:format cl:nil "# Wombot driveline control message~%~%# Used to select high range / low range and lock/unlock diffs~%~%Header header		# Standard ROS message header~%~%# Gears~%uint8 NoChange = 0~%uint8 LowRange = 1~%uint8 HighRange = 2~%~%# Diff~%uint8 NoChange = 0~%uint8 Unlock = 1~%uint8 Lock = 2~%~%uint8 gear		# requested gear number~%uint8 front_diff	# request diff status~%uint8 rear_diff		# requested diff status~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DrivetrainCommand)))
  "Returns full string definition for message of type 'DrivetrainCommand"
  (cl:format cl:nil "# Wombot driveline control message~%~%# Used to select high range / low range and lock/unlock diffs~%~%Header header		# Standard ROS message header~%~%# Gears~%uint8 NoChange = 0~%uint8 LowRange = 1~%uint8 HighRange = 2~%~%# Diff~%uint8 NoChange = 0~%uint8 Unlock = 1~%uint8 Lock = 2~%~%uint8 gear		# requested gear number~%uint8 front_diff	# request diff status~%uint8 rear_diff		# requested diff status~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DrivetrainCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DrivetrainCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'DrivetrainCommand
    (cl:cons ':header (header msg))
    (cl:cons ':gear (gear msg))
    (cl:cons ':front_diff (front_diff msg))
    (cl:cons ':rear_diff (rear_diff msg))
))
