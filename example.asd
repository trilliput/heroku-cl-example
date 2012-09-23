;;;; To install packages
;;;; (require 'asdf)
;;;; (require 'asdf-install)
;;;; (asdf-install:install 'package-name)

(asdf:defsystem #:example
  :serial t
  :description "Example cl-heroku application"
  :depends-on (#:hunchentoot
               #:cl-who
               #:postmodern)
  :components ((:file "package") (:module :src
                                  :serial t      
                                  :components ((:file "hello-world")))))

