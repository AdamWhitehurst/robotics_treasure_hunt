;; Auto-generated. Do not edit!


(when (boundp 'logical_camera_plugin::logicalImage)
  (if (not (find-package "LOGICAL_CAMERA_PLUGIN"))
    (make-package "LOGICAL_CAMERA_PLUGIN"))
  (shadow 'logicalImage (find-package "LOGICAL_CAMERA_PLUGIN")))
(unless (find-package "LOGICAL_CAMERA_PLUGIN::LOGICALIMAGE")
  (make-package "LOGICAL_CAMERA_PLUGIN::LOGICALIMAGE"))

(in-package "ROS")
;;//! \htmlinclude logicalImage.msg.html


(defclass logical_camera_plugin::logicalImage
  :super ros::object
  :slots (_modelName _pose_pos_x _pose_pos_y _pose_pos_z _pose_rot_x _pose_rot_y _pose_rot_z _pose_rot_w ))

(defmethod logical_camera_plugin::logicalImage
  (:init
   (&key
    ((:modelName __modelName) "")
    ((:pose_pos_x __pose_pos_x) 0.0)
    ((:pose_pos_y __pose_pos_y) 0.0)
    ((:pose_pos_z __pose_pos_z) 0.0)
    ((:pose_rot_x __pose_rot_x) 0.0)
    ((:pose_rot_y __pose_rot_y) 0.0)
    ((:pose_rot_z __pose_rot_z) 0.0)
    ((:pose_rot_w __pose_rot_w) 0.0)
    )
   (send-super :init)
   (setq _modelName (string __modelName))
   (setq _pose_pos_x (float __pose_pos_x))
   (setq _pose_pos_y (float __pose_pos_y))
   (setq _pose_pos_z (float __pose_pos_z))
   (setq _pose_rot_x (float __pose_rot_x))
   (setq _pose_rot_y (float __pose_rot_y))
   (setq _pose_rot_z (float __pose_rot_z))
   (setq _pose_rot_w (float __pose_rot_w))
   self)
  (:modelName
   (&optional __modelName)
   (if __modelName (setq _modelName __modelName)) _modelName)
  (:pose_pos_x
   (&optional __pose_pos_x)
   (if __pose_pos_x (setq _pose_pos_x __pose_pos_x)) _pose_pos_x)
  (:pose_pos_y
   (&optional __pose_pos_y)
   (if __pose_pos_y (setq _pose_pos_y __pose_pos_y)) _pose_pos_y)
  (:pose_pos_z
   (&optional __pose_pos_z)
   (if __pose_pos_z (setq _pose_pos_z __pose_pos_z)) _pose_pos_z)
  (:pose_rot_x
   (&optional __pose_rot_x)
   (if __pose_rot_x (setq _pose_rot_x __pose_rot_x)) _pose_rot_x)
  (:pose_rot_y
   (&optional __pose_rot_y)
   (if __pose_rot_y (setq _pose_rot_y __pose_rot_y)) _pose_rot_y)
  (:pose_rot_z
   (&optional __pose_rot_z)
   (if __pose_rot_z (setq _pose_rot_z __pose_rot_z)) _pose_rot_z)
  (:pose_rot_w
   (&optional __pose_rot_w)
   (if __pose_rot_w (setq _pose_rot_w __pose_rot_w)) _pose_rot_w)
  (:serialization-length
   ()
   (+
    ;; string _modelName
    4 (length _modelName)
    ;; float32 _pose_pos_x
    4
    ;; float32 _pose_pos_y
    4
    ;; float32 _pose_pos_z
    4
    ;; float32 _pose_rot_x
    4
    ;; float32 _pose_rot_y
    4
    ;; float32 _pose_rot_z
    4
    ;; float32 _pose_rot_w
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _modelName
       (write-long (length _modelName) s) (princ _modelName s)
     ;; float32 _pose_pos_x
       (sys::poke _pose_pos_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pose_pos_y
       (sys::poke _pose_pos_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pose_pos_z
       (sys::poke _pose_pos_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pose_rot_x
       (sys::poke _pose_rot_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pose_rot_y
       (sys::poke _pose_rot_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pose_rot_z
       (sys::poke _pose_rot_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pose_rot_w
       (sys::poke _pose_rot_w (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _modelName
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _modelName (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _pose_pos_x
     (setq _pose_pos_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pose_pos_y
     (setq _pose_pos_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pose_pos_z
     (setq _pose_pos_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pose_rot_x
     (setq _pose_rot_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pose_rot_y
     (setq _pose_rot_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pose_rot_z
     (setq _pose_rot_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pose_rot_w
     (setq _pose_rot_w (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get logical_camera_plugin::logicalImage :md5sum-) "c513e19b80cdf2effbda220ba2ebb388")
(setf (get logical_camera_plugin::logicalImage :datatype-) "logical_camera_plugin/logicalImage")
(setf (get logical_camera_plugin::logicalImage :definition-)
      "string modelName
float32 pose_pos_x
float32 pose_pos_y
float32 pose_pos_z
float32 pose_rot_x
float32 pose_rot_y
float32 pose_rot_z
float32 pose_rot_w

")



(provide :logical_camera_plugin/logicalImage "c513e19b80cdf2effbda220ba2ebb388")


