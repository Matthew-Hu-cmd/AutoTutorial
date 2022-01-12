
(cl:in-package :asdf)

(defsystem "plumbing_server_client-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "AddInts" :depends-on ("_package_AddInts"))
    (:file "_package_AddInts" :depends-on ("_package"))
    (:file "Serial" :depends-on ("_package_Serial"))
    (:file "_package_Serial" :depends-on ("_package"))
  ))