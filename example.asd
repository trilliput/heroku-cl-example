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
  :components ((:module :core
                :serial t      
                :components ((:file "package")
                             (:file "init") 
                             (:file "model") 
                             (:module :utils
                              :serial t
                              :components ((:file "heroku")))))
               (:module :app
                :serial t
                :components ((:module :models
                              :serial t
                              :components ((:file "users")))
                              (:file "package")
                              (:file "main")))))

