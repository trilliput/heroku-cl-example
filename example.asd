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
  :components ((:file "package") 
               (:module :settings
               :serial t
               :components ((:file "settings")))
               (:module :src
               :serial t      
               :components ((:module :utils
                             :serial t
                             :components ((:file "heroku-utils")
                                          (:file "db-utils")))
                            (:file "hello-world")))))

