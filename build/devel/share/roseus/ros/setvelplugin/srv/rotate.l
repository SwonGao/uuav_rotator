;; Auto-generated. Do not edit!


(when (boundp 'setvelplugin::rotate)
  (if (not (find-package "SETVELPLUGIN"))
    (make-package "SETVELPLUGIN"))
  (shadow 'rotate (find-package "SETVELPLUGIN")))
(unless (find-package "SETVELPLUGIN::ROTATE")
  (make-package "SETVELPLUGIN::ROTATE"))
(unless (find-package "SETVELPLUGIN::ROTATEREQUEST")
  (make-package "SETVELPLUGIN::ROTATEREQUEST"))
(unless (find-package "SETVELPLUGIN::ROTATERESPONSE")
  (make-package "SETVELPLUGIN::ROTATERESPONSE"))

(in-package "ROS")





(defclass setvelplugin::rotateRequest
  :super ros::object
  :slots (_degree ))

(defmethod setvelplugin::rotateRequest
  (:init
   (&key
    ((:degree __degree) 0.0)
    )
   (send-super :init)
   (setq _degree (float __degree))
   self)
  (:degree
   (&optional __degree)
   (if __degree (setq _degree __degree)) _degree)
  (:serialization-length
   ()
   (+
    ;; float32 _degree
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _degree
       (sys::poke _degree (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _degree
     (setq _degree (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass setvelplugin::rotateResponse
  :super ros::object
  :slots ())

(defmethod setvelplugin::rotateResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass setvelplugin::rotate
  :super ros::object
  :slots ())

(setf (get setvelplugin::rotate :md5sum-) "431b404e813e79a9f53659dd93110f14")
(setf (get setvelplugin::rotate :datatype-) "setvelplugin/rotate")
(setf (get setvelplugin::rotate :request) setvelplugin::rotateRequest)
(setf (get setvelplugin::rotate :response) setvelplugin::rotateResponse)

(defmethod setvelplugin::rotateRequest
  (:response () (instance setvelplugin::rotateResponse :init)))

(setf (get setvelplugin::rotateRequest :md5sum-) "431b404e813e79a9f53659dd93110f14")
(setf (get setvelplugin::rotateRequest :datatype-) "setvelplugin/rotateRequest")
(setf (get setvelplugin::rotateRequest :definition-)
      "float32 degree

---
")

(setf (get setvelplugin::rotateResponse :md5sum-) "431b404e813e79a9f53659dd93110f14")
(setf (get setvelplugin::rotateResponse :datatype-) "setvelplugin/rotateResponse")
(setf (get setvelplugin::rotateResponse :definition-)
      "float32 degree

---
")



(provide :setvelplugin/rotate "431b404e813e79a9f53659dd93110f14")


