(asdf:defsystem #:example
  :serial t
  :description "Example cl-heroku application"
  :depends-on (#:aserve
	       #:cl-who
	       #:postmodern)
  :components ((:file "package")
	       (:module :src
			:serial t      
			:components ((:file "hello-world")))))

