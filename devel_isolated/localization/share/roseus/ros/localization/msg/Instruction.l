;; Auto-generated. Do not edit!


(when (boundp 'localization::Instruction)
  (if (not (find-package "LOCALIZATION"))
    (make-package "LOCALIZATION"))
  (shadow 'Instruction (find-package "LOCALIZATION")))
(unless (find-package "LOCALIZATION::INSTRUCTION")
  (make-package "LOCALIZATION::INSTRUCTION"))

(in-package "ROS")
;;//! \htmlinclude Instruction.msg.html


(defclass localization::Instruction
  :super ros::object
  :slots (_from_index _to_index _distance ))

(defmethod localization::Instruction
  (:init
   (&key
    ((:from_index __from_index) 0)
    ((:to_index __to_index) 0)
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _from_index (round __from_index))
   (setq _to_index (round __to_index))
   (setq _distance (float __distance))
   self)
  (:from_index
   (&optional __from_index)
   (if __from_index (setq _from_index __from_index)) _from_index)
  (:to_index
   (&optional __to_index)
   (if __to_index (setq _to_index __to_index)) _to_index)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; int64 _from_index
    8
    ;; int64 _to_index
    8
    ;; float64 _distance
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _from_index
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _from_index (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _from_index) (= (length (_from_index . bv)) 2)) ;; bignum
              (write-long (ash (elt (_from_index . bv) 0) 0) s)
              (write-long (ash (elt (_from_index . bv) 1) -1) s))
             ((and (class _from_index) (= (length (_from_index . bv)) 1)) ;; big1
              (write-long (elt (_from_index . bv) 0) s)
              (write-long (if (>= _from_index 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _from_index s)(write-long (if (>= _from_index 0) 0 #xffffffff) s)))
     ;; int64 _to_index
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _to_index (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _to_index) (= (length (_to_index . bv)) 2)) ;; bignum
              (write-long (ash (elt (_to_index . bv) 0) 0) s)
              (write-long (ash (elt (_to_index . bv) 1) -1) s))
             ((and (class _to_index) (= (length (_to_index . bv)) 1)) ;; big1
              (write-long (elt (_to_index . bv) 0) s)
              (write-long (if (>= _to_index 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _to_index s)(write-long (if (>= _to_index 0) 0 #xffffffff) s)))
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _from_index
#+(or :alpha :irix6 :x86_64)
      (setf _from_index (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _from_index (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _to_index
#+(or :alpha :irix6 :x86_64)
      (setf _to_index (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _to_index (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get localization::Instruction :md5sum-) "e367e05ce4cf725a4081bd527e66bfca")
(setf (get localization::Instruction :datatype-) "localization/Instruction")
(setf (get localization::Instruction :definition-)
      "int64 from_index
int64 to_index
float64 distance

")



(provide :localization/Instruction "e367e05ce4cf725a4081bd527e66bfca")


