; Auto-generated. Do not edit!


(cl:in-package localization-srv)


;//! \htmlinclude GpsConverter-request.msg.html

(cl:defclass <GpsConverter-request> (roslisp-msg-protocol:ros-message)
  ((gps
    :reader gps
    :initarg :gps
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass GpsConverter-request (<GpsConverter-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GpsConverter-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GpsConverter-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name localization-srv:<GpsConverter-request> is deprecated: use localization-srv:GpsConverter-request instead.")))

(cl:ensure-generic-function 'gps-val :lambda-list '(m))
(cl:defmethod gps-val ((m <GpsConverter-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization-srv:gps-val is deprecated.  Use localization-srv:gps instead.")
  (gps m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GpsConverter-request>) ostream)
  "Serializes a message object of type '<GpsConverter-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'gps) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GpsConverter-request>) istream)
  "Deserializes a message object of type '<GpsConverter-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'gps) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GpsConverter-request>)))
  "Returns string type for a service object of type '<GpsConverter-request>"
  "localization/GpsConverterRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GpsConverter-request)))
  "Returns string type for a service object of type 'GpsConverter-request"
  "localization/GpsConverterRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GpsConverter-request>)))
  "Returns md5sum for a message object of type '<GpsConverter-request>"
  "bdcf5f27c24de937f7f2bbe531c1e1f0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GpsConverter-request)))
  "Returns md5sum for a message object of type 'GpsConverter-request"
  "bdcf5f27c24de937f7f2bbe531c1e1f0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GpsConverter-request>)))
  "Returns full string definition for message of type '<GpsConverter-request>"
  (cl:format cl:nil "geometry_msgs/Point gps~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GpsConverter-request)))
  "Returns full string definition for message of type 'GpsConverter-request"
  (cl:format cl:nil "geometry_msgs/Point gps~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GpsConverter-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'gps))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GpsConverter-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GpsConverter-request
    (cl:cons ':gps (gps msg))
))
;//! \htmlinclude GpsConverter-response.msg.html

(cl:defclass <GpsConverter-response> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass GpsConverter-response (<GpsConverter-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GpsConverter-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GpsConverter-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name localization-srv:<GpsConverter-response> is deprecated: use localization-srv:GpsConverter-response instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <GpsConverter-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization-srv:position-val is deprecated.  Use localization-srv:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GpsConverter-response>) ostream)
  "Serializes a message object of type '<GpsConverter-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GpsConverter-response>) istream)
  "Deserializes a message object of type '<GpsConverter-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GpsConverter-response>)))
  "Returns string type for a service object of type '<GpsConverter-response>"
  "localization/GpsConverterResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GpsConverter-response)))
  "Returns string type for a service object of type 'GpsConverter-response"
  "localization/GpsConverterResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GpsConverter-response>)))
  "Returns md5sum for a message object of type '<GpsConverter-response>"
  "bdcf5f27c24de937f7f2bbe531c1e1f0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GpsConverter-response)))
  "Returns md5sum for a message object of type 'GpsConverter-response"
  "bdcf5f27c24de937f7f2bbe531c1e1f0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GpsConverter-response>)))
  "Returns full string definition for message of type '<GpsConverter-response>"
  (cl:format cl:nil "geometry_msgs/Point position~%~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GpsConverter-response)))
  "Returns full string definition for message of type 'GpsConverter-response"
  (cl:format cl:nil "geometry_msgs/Point position~%~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GpsConverter-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GpsConverter-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GpsConverter-response
    (cl:cons ':position (position msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GpsConverter)))
  'GpsConverter-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GpsConverter)))
  'GpsConverter-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GpsConverter)))
  "Returns string type for a service object of type '<GpsConverter>"
  "localization/GpsConverter")