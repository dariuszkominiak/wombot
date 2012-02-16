; Auto-generated. Do not edit!


(cl:in-package wombot_msgs-msg)


;//! \htmlinclude SteeringCommand.msg.html

(cl:defclass <SteeringCommand> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (request
    :reader request
    :initarg :request
    :type cl:integer
    :initform 0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass SteeringCommand (<SteeringCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SteeringCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SteeringCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wombot_msgs-msg:<SteeringCommand> is deprecated: use wombot_msgs-msg:SteeringCommand instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SteeringCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wombot_msgs-msg:header-val is deprecated.  Use wombot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'request-val :lambda-list '(m))
(cl:defmethod request-val ((m <SteeringCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wombot_msgs-msg:request-val is deprecated.  Use wombot_msgs-msg:request instead.")
  (request m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <SteeringCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wombot_msgs-msg:angle-val is deprecated.  Use wombot_msgs-msg:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<SteeringCommand>)))
    "Constants for message type '<SteeringCommand>"
  '((:RADIANS . 0)
    (:RELATIVE . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'SteeringCommand)))
    "Constants for message type 'SteeringCommand"
  '((:RADIANS . 0)
    (:RELATIVE . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SteeringCommand>) ostream)
  "Serializes a message object of type '<SteeringCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'request)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'request)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'request)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'request)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SteeringCommand>) istream)
  "Deserializes a message object of type '<SteeringCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'request)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'request)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'request)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'request)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SteeringCommand>)))
  "Returns string type for a message object of type '<SteeringCommand>"
  "wombot_msgs/SteeringCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SteeringCommand)))
  "Returns string type for a message object of type 'SteeringCommand"
  "wombot_msgs/SteeringCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SteeringCommand>)))
  "Returns md5sum for a message object of type '<SteeringCommand>"
  "bfd13d298f8d7a74c0ab365780036106")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SteeringCommand)))
  "Returns md5sum for a message object of type 'SteeringCommand"
  "bfd13d298f8d7a74c0ab365780036106")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SteeringCommand>)))
  "Returns full string definition for message of type '<SteeringCommand>"
  (cl:format cl:nil "# Wombot steering controller~%~%# copied from art steering command but changed to Radians as per ROS std~%~%Header header~%~%# Request type~%uint32 Radians = 0	# Set absolute angle in radians +left 0 center -right~%uint32 Relative = 1	# change angle relative to current setting~%~%uint32 request	# request type~%float32 angle	# request angle~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SteeringCommand)))
  "Returns full string definition for message of type 'SteeringCommand"
  (cl:format cl:nil "# Wombot steering controller~%~%# copied from art steering command but changed to Radians as per ROS std~%~%Header header~%~%# Request type~%uint32 Radians = 0	# Set absolute angle in radians +left 0 center -right~%uint32 Relative = 1	# change angle relative to current setting~%~%uint32 request	# request type~%float32 angle	# request angle~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SteeringCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SteeringCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'SteeringCommand
    (cl:cons ':header (header msg))
    (cl:cons ':request (request msg))
    (cl:cons ':angle (angle msg))
))
