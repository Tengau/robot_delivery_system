;; Auto-generated. Do not edit!


(when (boundp 'localization::Instructions)
  (if (not (find-package "LOCALIZATION"))
    (make-package "LOCALIZATION"))
  (shadow 'Instructions (find-package "LOCALIZATION")))
(unless (find-package "LOCALIZATION::INSTRUCTIONS")
  (make-package "LOCALIZATION::INSTRUCTIONS"))

(in-package "ROS")
;;//! \htmlinclude Instructions.msg.html


(defclass localization::Instructions
  :super ros::object
  :slots (_instructions ))

(defmethod localization::Instructions
  (:init
   (&key
    ((:instructions __instructions) ())
    )
   (send-super :init)
   (setq _instructions __instructions)
   self)
  (:instructions
   (&rest __instructions)
   (if (keywordp (car __instructions))
       (send* _instructions __instructions)
     (progn
       (if __instructions (setq _instructions (car __instructions)))
       _instructions)))
  (:serialization-length
   ()
   (+
    ;; localization/Instruction[] _instructions
    (apply #'+ (send-all _instructions :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; localization/Instruction[] _instructions
     (write-long (length _instructions) s)
     (dolist (elem _instructions)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; localization/Instruction[] _instructions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _instructions (let (r) (dotimes (i n) (push (instance localization::Instruction :init) r)) r))
     (dolist (elem- _instructions)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get localization::Instructions :md5sum-) "f704a970ca19812bcb8e91d7be98e4b3")
(setf (get localization::Instructions :datatype-) "localization/Instructions")
(setf (get localization::Instructions :definition-)
      "Instruction[] instructions

================================================================================
MSG: localization/Instruction
int64 from_index
int64 to_index
float64 distance

")



(provide :localization/Instructions "f704a970ca19812bcb8e91d7be98e4b3")


