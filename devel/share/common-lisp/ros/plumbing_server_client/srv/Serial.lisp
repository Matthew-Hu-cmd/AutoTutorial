; Auto-generated. Do not edit!


(cl:in-package plumbing_server_client-srv)


;//! \htmlinclude Serial-request.msg.html

(cl:defclass <Serial-request> (roslisp-msg-protocol:ros-message)
  ((InputData
    :reader InputData
    :initarg :InputData
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass Serial-request (<Serial-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Serial-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Serial-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name plumbing_server_client-srv:<Serial-request> is deprecated: use plumbing_server_client-srv:Serial-request instead.")))

(cl:ensure-generic-function 'InputData-val :lambda-list '(m))
(cl:defmethod InputData-val ((m <Serial-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plumbing_server_client-srv:InputData-val is deprecated.  Use plumbing_server_client-srv:InputData instead.")
  (InputData m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Serial-request>) ostream)
  "Serializes a message object of type '<Serial-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'InputData))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'InputData))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Serial-request>) istream)
  "Deserializes a message object of type '<Serial-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'InputData) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'InputData)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Serial-request>)))
  "Returns string type for a service object of type '<Serial-request>"
  "plumbing_server_client/SerialRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Serial-request)))
  "Returns string type for a service object of type 'Serial-request"
  "plumbing_server_client/SerialRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Serial-request>)))
  "Returns md5sum for a message object of type '<Serial-request>"
  "a706874ecb124873b6727a0a5b02b832")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Serial-request)))
  "Returns md5sum for a message object of type 'Serial-request"
  "a706874ecb124873b6727a0a5b02b832")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Serial-request>)))
  "Returns full string definition for message of type '<Serial-request>"
  (cl:format cl:nil "string[] InputData~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Serial-request)))
  "Returns full string definition for message of type 'Serial-request"
  (cl:format cl:nil "string[] InputData~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Serial-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'InputData) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Serial-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Serial-request
    (cl:cons ':InputData (InputData msg))
))
;//! \htmlinclude Serial-response.msg.html

(cl:defclass <Serial-response> (roslisp-msg-protocol:ros-message)
  ((OutputData
    :reader OutputData
    :initarg :OutputData
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass Serial-response (<Serial-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Serial-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Serial-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name plumbing_server_client-srv:<Serial-response> is deprecated: use plumbing_server_client-srv:Serial-response instead.")))

(cl:ensure-generic-function 'OutputData-val :lambda-list '(m))
(cl:defmethod OutputData-val ((m <Serial-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plumbing_server_client-srv:OutputData-val is deprecated.  Use plumbing_server_client-srv:OutputData instead.")
  (OutputData m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Serial-response>) ostream)
  "Serializes a message object of type '<Serial-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'OutputData))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'OutputData))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Serial-response>) istream)
  "Deserializes a message object of type '<Serial-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'OutputData) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'OutputData)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Serial-response>)))
  "Returns string type for a service object of type '<Serial-response>"
  "plumbing_server_client/SerialResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Serial-response)))
  "Returns string type for a service object of type 'Serial-response"
  "plumbing_server_client/SerialResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Serial-response>)))
  "Returns md5sum for a message object of type '<Serial-response>"
  "a706874ecb124873b6727a0a5b02b832")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Serial-response)))
  "Returns md5sum for a message object of type 'Serial-response"
  "a706874ecb124873b6727a0a5b02b832")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Serial-response>)))
  "Returns full string definition for message of type '<Serial-response>"
  (cl:format cl:nil "string[] OutputData~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Serial-response)))
  "Returns full string definition for message of type 'Serial-response"
  (cl:format cl:nil "string[] OutputData~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Serial-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'OutputData) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Serial-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Serial-response
    (cl:cons ':OutputData (OutputData msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Serial)))
  'Serial-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Serial)))
  'Serial-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Serial)))
  "Returns string type for a service object of type '<Serial>"
  "plumbing_server_client/Serial")