
(cl:in-package :asdf)

(defsystem "setvelplugin-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "rotate" :depends-on ("_package_rotate"))
    (:file "_package_rotate" :depends-on ("_package"))
  ))