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
  :components ((:module :settings
                :serial t
                :components ((:file "package")
                             (:file "settings")))
               (:module :core
                :serial t      
                :components ((:file "package")
                             (:file "init") 
                             (:module :utils
                              :serial t
                              :components ((:file "heroku-utils")
                                           (:file "db-utils")))))
               (:module :app
                :serial t
                :components ((:file "package")
                             (:file "main")))))

