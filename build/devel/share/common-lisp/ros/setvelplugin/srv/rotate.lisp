; Auto-generated. Do not edit!


(cl:in-package setvelplugin-srv)


;//! \htmlinclude rotate-request.msg.html

(cl:defclass <rotate-request> (roslisp-msg-protocol:ros-message)
  ((degree
    :reader degree
    :initarg :degree
    :type cl:float
    :initform 0.0))
)

(cl:defclass rotate-request (<rotate-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rotate-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rotate-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name setvelplugin-srv:<rotate-request> is deprecated: use setvelplugin-srv:rotate-request instead.")))

(cl:ensure-generic-function 'degree-val :lambda-list '(m))
(cl:defmethod degree-val ((m <rotate-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader setvelplugin-srv:degree-val is deprecated.  Use setvelplugin-srv:degree instead.")
  (degree m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rotate-request>) ostream)
  "Serializes a message object of type '<rotate-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'degree))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rotate-request>) istream)
  "Deserializes a message object of type '<rotate-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'degree) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rotate-request>)))
  "Returns string type for a service object of type '<rotate-request>"
  "setvelplugin/rotateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rotate-request)))
  "Returns string type for a service object of type 'rotate-request"
  "setvelplugin/rotateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rotate-request>)))
  "Returns md5sum for a message object of type '<rotate-request>"
  "431b404e813e79a9f53659dd93110f14")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rotate-request)))
  "Returns md5sum for a message object of type 'rotate-request"
  "431b404e813e79a9f53659dd93110f14")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rotate-request>)))
  "Returns full string definition for message of type '<rotate-request>"
  (cl:format cl:nil "float32 degree~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rotate-request)))
  "Returns full string definition for message of type 'rotate-request"
  (cl:format cl:nil "float32 degree~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rotate-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rotate-request>))
  "Converts a ROS message object to a list"
  (cl:list 'rotate-request
    (cl:cons ':degree (degree msg))
))
;//! \htmlinclude rotate-response.msg.html

(cl:defclass <rotate-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass rotate-response (<rotate-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rotate-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rotate-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name setvelplugin-srv:<rotate-response> is deprecated: use setvelplugin-srv:rotate-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rotate-response>) ostream)
  "Serializes a message object of type '<rotate-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rotate-response>) istream)
  "Deserializes a message object of type '<rotate-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rotate-response>)))
  "Returns string type for a service object of type '<rotate-response>"
  "setvelplugin/rotateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rotate-response)))
  "Returns string type for a service object of type 'rotate-response"
  "setvelplugin/rotateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rotate-response>)))
  "Returns md5sum for a message object of type '<rotate-response>"
  "431b404e813e79a9f53659dd93110f14")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rotate-response)))
  "Returns md5sum for a message object of type 'rotate-response"
  "431b404e813e79a9f53659dd93110f14")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rotate-response>)))
  "Returns full string definition for message of type '<rotate-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rotate-response)))
  "Returns full string definition for message of type 'rotate-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rotate-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rotate-response>))
  "Converts a ROS message object to a list"
  (cl:list 'rotate-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'rotate)))
  'rotate-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'rotate)))
  'rotate-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rotate)))
  "Returns string type for a service object of type '<rotate>"
  "setvelplugin/rotate")