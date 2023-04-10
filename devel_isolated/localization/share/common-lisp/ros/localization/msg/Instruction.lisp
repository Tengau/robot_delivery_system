; Auto-generated. Do not edit!


(cl:in-package localization-msg)


;//! \htmlinclude Instruction.msg.html

(cl:defclass <Instruction> (roslisp-msg-protocol:ros-message)
  ((from_index
    :reader from_index
    :initarg :from_index
    :type cl:integer
    :initform 0)
   (to_index
    :reader to_index
    :initarg :to_index
    :type cl:integer
    :initform 0)
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass Instruction (<Instruction>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Instruction>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Instruction)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name localization-msg:<Instruction> is deprecated: use localization-msg:Instruction instead.")))

(cl:ensure-generic-function 'from_index-val :lambda-list '(m))
(cl:defmethod from_index-val ((m <Instruction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization-msg:from_index-val is deprecated.  Use localization-msg:from_index instead.")
  (from_index m))

(cl:ensure-generic-function 'to_index-val :lambda-list '(m))
(cl:defmethod to_index-val ((m <Instruction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization-msg:to_index-val is deprecated.  Use localization-msg:to_index instead.")
  (to_index m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <Instruction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization-msg:distance-val is deprecated.  Use localization-msg:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Instruction>) ostream)
  "Serializes a message object of type '<Instruction>"
  (cl:let* ((signed (cl:slot-value msg 'from_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'to_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Instruction>) istream)
  "Deserializes a message object of type '<Instruction>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'from_index) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'to_index) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Instruction>)))
  "Returns string type for a message object of type '<Instruction>"
  "localization/Instruction")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Instruction)))
  "Returns string type for a message object of type 'Instruction"
  "localization/Instruction")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Instruction>)))
  "Returns md5sum for a message object of type '<Instruction>"
  "e367e05ce4cf725a4081bd527e66bfca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Instruction)))
  "Returns md5sum for a message object of type 'Instruction"
  "e367e05ce4cf725a4081bd527e66bfca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Instruction>)))
  "Returns full string definition for message of type '<Instruction>"
  (cl:format cl:nil "int64 from_index~%int64 to_index~%float64 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Instruction)))
  "Returns full string definition for message of type 'Instruction"
  (cl:format cl:nil "int64 from_index~%int64 to_index~%float64 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Instruction>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Instruction>))
  "Converts a ROS message object to a list"
  (cl:list 'Instruction
    (cl:cons ':from_index (from_index msg))
    (cl:cons ':to_index (to_index msg))
    (cl:cons ':distance (distance msg))
))
