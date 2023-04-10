;; Auto-generated. Do not edit!


(when (boundp 'localization::GpsConverter)
  (if (not (find-package "LOCALIZATION"))
    (make-package "LOCALIZATION"))
  (shadow 'GpsConverter (find-package "LOCALIZATION")))
(unless (find-package "LOCALIZATION::GPSCONVERTER")
  (make-package "LOCALIZATION::GPSCONVERTER"))
(unless (find-package "LOCALIZATION::GPSCONVERTERREQUEST")
  (make-package "LOCALIZATION::GPSCONVERTERREQUEST"))
(unless (find-package "LOCALIZATION::GPSCONVERTERRESPONSE")
  (make-package "LOCALIZATION::GPSCONVERTERRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass localization::GpsConverterRequest
  :super ros::object
  :slots (_gps ))

(defmethod localization::GpsConverterRequest
  (:init
   (&key
    ((:gps __gps) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _gps __gps)
   self)
  (:gps
   (&rest __gps)
   (if (keywordp (car __gps))
       (send* _gps __gps)
     (progn
       (if __gps (setq _gps (car __gps)))
       _gps)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _gps
    (send _gps :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _gps
       (send _gps :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _gps
     (send _gps :deserialize buf ptr-) (incf ptr- (send _gps :serialization-length))
   ;;
   self)
  )

(defclass localization::GpsConverterResponse
  :super ros::object
  :slots (_position ))

(defmethod localization::GpsConverterResponse
  (:init
   (&key
    ((:position __position) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _position __position)
   self)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;;
   self)
  )

(defclass localization::GpsConverter
  :super ros::object
  :slots ())

(setf (get localization::GpsConverter :md5sum-) "bdcf5f27c24de937f7f2bbe531c1e1f0")
(setf (get localization::GpsConverter :datatype-) "localization/GpsConverter")
(setf (get localization::GpsConverter :request) localization::GpsConverterRequest)
(setf (get localization::GpsConverter :response) localization::GpsConverterResponse)

(defmethod localization::GpsConverterRequest
  (:response () (instance localization::GpsConverterResponse :init)))

(setf (get localization::GpsConverterRequest :md5sum-) "bdcf5f27c24de937f7f2bbe531c1e1f0")
(setf (get localization::GpsConverterRequest :datatype-) "localization/GpsConverterRequest")
(setf (get localization::GpsConverterRequest :definition-)
      "geometry_msgs/Point gps

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---
geometry_msgs/Point position


================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")

(setf (get localization::GpsConverterResponse :md5sum-) "bdcf5f27c24de937f7f2bbe531c1e1f0")
(setf (get localization::GpsConverterResponse :datatype-) "localization/GpsConverterResponse")
(setf (get localization::GpsConverterResponse :definition-)
      "geometry_msgs/Point gps

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---
geometry_msgs/Point position


================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")



(provide :localization/GpsConverter "bdcf5f27c24de937f7f2bbe531c1e1f0")


