
(cl:in-package :asdf)

(defsystem "localization-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Instruction" :depends-on ("_package_Instruction"))
    (:file "_package_Instruction" :depends-on ("_package"))
    (:file "Instructions" :depends-on ("_package_Instructions"))
    (:file "_package_Instructions" :depends-on ("_package"))
  ))