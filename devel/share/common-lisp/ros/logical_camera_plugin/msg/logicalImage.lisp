; Auto-generated. Do not edit!


(cl:in-package logical_camera_plugin-msg)


;//! \htmlinclude logicalImage.msg.html

(cl:defclass <logicalImage> (roslisp-msg-protocol:ros-message)
  ((modelName
    :reader modelName
    :initarg :modelName
    :type cl:string
    :initform "")
   (pose_pos_x
    :reader pose_pos_x
    :initarg :pose_pos_x
    :type cl:float
    :initform 0.0)
   (pose_pos_y
    :reader pose_pos_y
    :initarg :pose_pos_y
    :type cl:float
    :initform 0.0)
   (pose_pos_z
    :reader pose_pos_z
    :initarg :pose_pos_z
    :type cl:float
    :initform 0.0)
   (pose_rot_x
    :reader pose_rot_x
    :initarg :pose_rot_x
    :type cl:float
    :initform 0.0)
   (pose_rot_y
    :reader pose_rot_y
    :initarg :pose_rot_y
    :type cl:float
    :initform 0.0)
   (pose_rot_z
    :reader pose_rot_z
    :initarg :pose_rot_z
    :type cl:float
    :initform 0.0)
   (pose_rot_w
    :reader pose_rot_w
    :initarg :pose_rot_w
    :type cl:float
    :initform 0.0))
)

(cl:defclass logicalImage (<logicalImage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <logicalImage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'logicalImage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name logical_camera_plugin-msg:<logicalImage> is deprecated: use logical_camera_plugin-msg:logicalImage instead.")))

(cl:ensure-generic-function 'modelName-val :lambda-list '(m))
(cl:defmethod modelName-val ((m <logicalImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader logical_camera_plugin-msg:modelName-val is deprecated.  Use logical_camera_plugin-msg:modelName instead.")
  (modelName m))

(cl:ensure-generic-function 'pose_pos_x-val :lambda-list '(m))
(cl:defmethod pose_pos_x-val ((m <logicalImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader logical_camera_plugin-msg:pose_pos_x-val is deprecated.  Use logical_camera_plugin-msg:pose_pos_x instead.")
  (pose_pos_x m))

(cl:ensure-generic-function 'pose_pos_y-val :lambda-list '(m))
(cl:defmethod pose_pos_y-val ((m <logicalImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader logical_camera_plugin-msg:pose_pos_y-val is deprecated.  Use logical_camera_plugin-msg:pose_pos_y instead.")
  (pose_pos_y m))

(cl:ensure-generic-function 'pose_pos_z-val :lambda-list '(m))
(cl:defmethod pose_pos_z-val ((m <logicalImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader logical_camera_plugin-msg:pose_pos_z-val is deprecated.  Use logical_camera_plugin-msg:pose_pos_z instead.")
  (pose_pos_z m))

(cl:ensure-generic-function 'pose_rot_x-val :lambda-list '(m))
(cl:defmethod pose_rot_x-val ((m <logicalImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader logical_camera_plugin-msg:pose_rot_x-val is deprecated.  Use logical_camera_plugin-msg:pose_rot_x instead.")
  (pose_rot_x m))

(cl:ensure-generic-function 'pose_rot_y-val :lambda-list '(m))
(cl:defmethod pose_rot_y-val ((m <logicalImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader logical_camera_plugin-msg:pose_rot_y-val is deprecated.  Use logical_camera_plugin-msg:pose_rot_y instead.")
  (pose_rot_y m))

(cl:ensure-generic-function 'pose_rot_z-val :lambda-list '(m))
(cl:defmethod pose_rot_z-val ((m <logicalImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader logical_camera_plugin-msg:pose_rot_z-val is deprecated.  Use logical_camera_plugin-msg:pose_rot_z instead.")
  (pose_rot_z m))

(cl:ensure-generic-function 'pose_rot_w-val :lambda-list '(m))
(cl:defmethod pose_rot_w-val ((m <logicalImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader logical_camera_plugin-msg:pose_rot_w-val is deprecated.  Use logical_camera_plugin-msg:pose_rot_w instead.")
  (pose_rot_w m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <logicalImage>) ostream)
  "Serializes a message object of type '<logicalImage>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'modelName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'modelName))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pose_pos_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pose_pos_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pose_pos_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pose_rot_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pose_rot_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pose_rot_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pose_rot_w))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <logicalImage>) istream)
  "Deserializes a message object of type '<logicalImage>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'modelName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'modelName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pose_pos_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pose_pos_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pose_pos_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pose_rot_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pose_rot_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pose_rot_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pose_rot_w) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<logicalImage>)))
  "Returns string type for a message object of type '<logicalImage>"
  "logical_camera_plugin/logicalImage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'logicalImage)))
  "Returns string type for a message object of type 'logicalImage"
  "logical_camera_plugin/logicalImage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<logicalImage>)))
  "Returns md5sum for a message object of type '<logicalImage>"
  "c513e19b80cdf2effbda220ba2ebb388")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'logicalImage)))
  "Returns md5sum for a message object of type 'logicalImage"
  "c513e19b80cdf2effbda220ba2ebb388")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<logicalImage>)))
  "Returns full string definition for message of type '<logicalImage>"
  (cl:format cl:nil "string modelName~%float32 pose_pos_x~%float32 pose_pos_y~%float32 pose_pos_z~%float32 pose_rot_x~%float32 pose_rot_y~%float32 pose_rot_z~%float32 pose_rot_w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'logicalImage)))
  "Returns full string definition for message of type 'logicalImage"
  (cl:format cl:nil "string modelName~%float32 pose_pos_x~%float32 pose_pos_y~%float32 pose_pos_z~%float32 pose_rot_x~%float32 pose_rot_y~%float32 pose_rot_z~%float32 pose_rot_w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <logicalImage>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'modelName))
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <logicalImage>))
  "Converts a ROS message object to a list"
  (cl:list 'logicalImage
    (cl:cons ':modelName (modelName msg))
    (cl:cons ':pose_pos_x (pose_pos_x msg))
    (cl:cons ':pose_pos_y (pose_pos_y msg))
    (cl:cons ':pose_pos_z (pose_pos_z msg))
    (cl:cons ':pose_rot_x (pose_rot_x msg))
    (cl:cons ':pose_rot_y (pose_rot_y msg))
    (cl:cons ':pose_rot_z (pose_rot_z msg))
    (cl:cons ':pose_rot_w (pose_rot_w msg))
))
