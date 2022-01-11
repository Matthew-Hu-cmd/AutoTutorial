;; Auto-generated. Do not edit!


(when (boundp 'plumbing_server_client::AddInts)
  (if (not (find-package "PLUMBING_SERVER_CLIENT"))
    (make-package "PLUMBING_SERVER_CLIENT"))
  (shadow 'AddInts (find-package "PLUMBING_SERVER_CLIENT")))
(unless (find-package "PLUMBING_SERVER_CLIENT::ADDINTS")
  (make-package "PLUMBING_SERVER_CLIENT::ADDINTS"))
(unless (find-package "PLUMBING_SERVER_CLIENT::ADDINTSREQUEST")
  (make-package "PLUMBING_SERVER_CLIENT::ADDINTSREQUEST"))
(unless (find-package "PLUMBING_SERVER_CLIENT::ADDINTSRESPONSE")
  (make-package "PLUMBING_SERVER_CLIENT::ADDINTSRESPONSE"))

(in-package "ROS")





(defclass plumbing_server_client::AddIntsRequest
  :super ros::object
  :slots (_num1 _num2 ))

(defmethod plumbing_server_client::AddIntsRequest
  (:init
   (&key
    ((:num1 __num1) 0)
    ((:num2 __num2) 0)
    )
   (send-super :init)
   (setq _num1 (round __num1))
   (setq _num2 (round __num2))
   self)
  (:num1
   (&optional __num1)
   (if __num1 (setq _num1 __num1)) _num1)
  (:num2
   (&optional __num2)
   (if __num2 (setq _num2 __num2)) _num2)
  (:serialization-length
   ()
   (+
    ;; int32 _num1
    4
    ;; int32 _num2
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _num1
       (write-long _num1 s)
     ;; int32 _num2
       (write-long _num2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _num1
     (setq _num1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _num2
     (setq _num2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass plumbing_server_client::AddIntsResponse
  :super ros::object
  :slots (_sum ))

(defmethod plumbing_server_client::AddIntsResponse
  (:init
   (&key
    ((:sum __sum) 0)
    )
   (send-super :init)
   (setq _sum (round __sum))
   self)
  (:sum
   (&optional __sum)
   (if __sum (setq _sum __sum)) _sum)
  (:serialization-length
   ()
   (+
    ;; int32 _sum
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _sum
       (write-long _sum s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _sum
     (setq _sum (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass plumbing_server_client::AddInts
  :super ros::object
  :slots ())

(setf (get plumbing_server_client::AddInts :md5sum-) "4781436a0c2affec8025955a6041e481")
(setf (get plumbing_server_client::AddInts :datatype-) "plumbing_server_client/AddInts")
(setf (get plumbing_server_client::AddInts :request) plumbing_server_client::AddIntsRequest)
(setf (get plumbing_server_client::AddInts :response) plumbing_server_client::AddIntsResponse)

(defmethod plumbing_server_client::AddIntsRequest
  (:response () (instance plumbing_server_client::AddIntsResponse :init)))

(setf (get plumbing_server_client::AddIntsRequest :md5sum-) "4781436a0c2affec8025955a6041e481")
(setf (get plumbing_server_client::AddIntsRequest :datatype-) "plumbing_server_client/AddIntsRequest")
(setf (get plumbing_server_client::AddIntsRequest :definition-)
      "#客户端请求时发送的数据
int32 num1
int32 num2
---
int32 sum
")

(setf (get plumbing_server_client::AddIntsResponse :md5sum-) "4781436a0c2affec8025955a6041e481")
(setf (get plumbing_server_client::AddIntsResponse :datatype-) "plumbing_server_client/AddIntsResponse")
(setf (get plumbing_server_client::AddIntsResponse :definition-)
      "#客户端请求时发送的数据
int32 num1
int32 num2
---
int32 sum
")



(provide :plumbing_server_client/AddInts "4781436a0c2affec8025955a6041e481")


