; Auto-generated. Do not edit!


(cl:in-package localization-msg)


;//! \htmlinclude Instructions.msg.html

(cl:defclass <Instructions> (roslisp-msg-protocol:ros-message)
  ((instructions
    :reader instructions
    :initarg :instructions
    :type (cl:vector localization-msg:Instruction)
   :initform (cl:make-array 0 :element-type 'localization-msg:Instruction :initial-element (cl:make-instance 'localization-msg:Instruction))))
)

(cl:defclass Instructions (<Instructions>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Instructions>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Instructions)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name localization-msg:<Instructions> is deprecated: use localization-msg:Instructions instead.")))

(cl:ensure-generic-function 'instructions-val :lambda-list '(m))
(cl:defmethod instructions-val ((m <Instructions>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization-msg:instructions-val is deprecated.  Use localization-msg:instructions instead.")
  (instructions m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Instructions>) ostream)
  "Serializes a message object of type '<Instructions>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'instructions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'instructions))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Instructions>) istream)
  "Deserializes a message object of type '<Instructions>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'instructions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'instructions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'localization-msg:Instruction))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Instructions>)))
  "Returns string type for a message object of type '<Instructions>"
  "localization/Instructions")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Instructions)))
  "Returns string type for a message object of type 'Instructions"
  "localization/Instructions")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Instructions>)))
  "Returns md5sum for a message object of type '<Instructions>"
  "f704a970ca19812bcb8e91d7be98e4b3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Instructions)))
  "Returns md5sum for a message object of type 'Instructions"
  "f704a970ca19812bcb8e91d7be98e4b3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Instructions>)))
  "Returns full string definition for message of type '<Instructions>"
  (cl:format cl:nil "Instruction[] instructions~%~%================================================================================~%MSG: localization/Instruction~%int64 from_index~%int64 to_index~%float64 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Instructions)))
  "Returns full string definition for message of type 'Instructions"
  (cl:format cl:nil "Instruction[] instructions~%~%================================================================================~%MSG: localization/Instruction~%int64 from_index~%int64 to_index~%float64 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Instructions>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'instructions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Instructions>))
  "Converts a ROS message object to a list"
  (cl:list 'Instructions
    (cl:cons ':instructions (instructions msg))
))
