;; Auto-generated. Do not edit!


(when (boundp 'plumbing_server_client::Serial)
  (if (not (find-package "PLUMBING_SERVER_CLIENT"))
    (make-package "PLUMBING_SERVER_CLIENT"))
  (shadow 'Serial (find-package "PLUMBING_SERVER_CLIENT")))
(unless (find-package "PLUMBING_SERVER_CLIENT::SERIAL")
  (make-package "PLUMBING_SERVER_CLIENT::SERIAL"))
(unless (find-package "PLUMBING_SERVER_CLIENT::SERIALREQUEST")
  (make-package "PLUMBING_SERVER_CLIENT::SERIALREQUEST"))
(unless (find-package "PLUMBING_SERVER_CLIENT::SERIALRESPONSE")
  (make-package "PLUMBING_SERVER_CLIENT::SERIALRESPONSE"))

(in-package "ROS")





(defclass plumbing_server_client::SerialRequest
  :super ros::object
  :slots (_InputData ))

(defmethod plumbing_server_client::SerialRequest
  (:init
   (&key
    ((:InputData __InputData) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _InputData __InputData)
   self)
  (:InputData
   (&optional __InputData)
   (if __InputData (setq _InputData __InputData)) _InputData)
  (:serialization-length
   ()
   (+
    ;; string[] _InputData
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _InputData)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _InputData
     (write-long (length _InputData) s)
     (dolist (elem _InputData)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _InputData
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _InputData (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _InputData i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass plumbing_server_client::SerialResponse
  :super ros::object
  :slots (_OutputData ))

(defmethod plumbing_server_client::SerialResponse
  (:init
   (&key
    ((:OutputData __OutputData) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _OutputData __OutputData)
   self)
  (:OutputData
   (&optional __OutputData)
   (if __OutputData (setq _OutputData __OutputData)) _OutputData)
  (:serialization-length
   ()
   (+
    ;; string[] _OutputData
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _OutputData)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _OutputData
     (write-long (length _OutputData) s)
     (dolist (elem _OutputData)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _OutputData
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _OutputData (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _OutputData i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass plumbing_server_client::Serial
  :super ros::object
  :slots ())

(setf (get plumbing_server_client::Serial :md5sum-) "a706874ecb124873b6727a0a5b02b832")
(setf (get plumbing_server_client::Serial :datatype-) "plumbing_server_client/Serial")
(setf (get plumbing_server_client::Serial :request) plumbing_server_client::SerialRequest)
(setf (get plumbing_server_client::Serial :response) plumbing_server_client::SerialResponse)

(defmethod plumbing_server_client::SerialRequest
  (:response () (instance plumbing_server_client::SerialResponse :init)))

(setf (get plumbing_server_client::SerialRequest :md5sum-) "a706874ecb124873b6727a0a5b02b832")
(setf (get plumbing_server_client::SerialRequest :datatype-) "plumbing_server_client/SerialRequest")
(setf (get plumbing_server_client::SerialRequest :definition-)
      "string[] InputData
---
string[] OutputData
")

(setf (get plumbing_server_client::SerialResponse :md5sum-) "a706874ecb124873b6727a0a5b02b832")
(setf (get plumbing_server_client::SerialResponse :datatype-) "plumbing_server_client/SerialResponse")
(setf (get plumbing_server_client::SerialResponse :definition-)
      "string[] InputData
---
string[] OutputData
")



(provide :plumbing_server_client/Serial "a706874ecb124873b6727a0a5b02b832")


