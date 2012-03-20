(in-package :example)

;; Utils
(defun heroku-getenv (target)
  #+ccl (ccl:getenv target)
  #+sbcl (sb-posix:getenv target))

;; Database
(defvar *database-url* (heroku-getenv "DATABASE_URL"))

(defun db-params ()
  "Heroku database url format is postgres://username:password@host/database_name.
TODO: cleanup code."
  (let* ((url (second (cl-ppcre:split "//" *database-url*)))
	 (user (first (cl-ppcre:split ":" (first (cl-ppcre:split "@" url)))))
	 (password (second (cl-ppcre:split ":" (first (cl-ppcre:split "@" url)))))
	 (host (first (cl-ppcre:split "/" (second (cl-ppcre:split "@" url)))))
	 (database (second (cl-ppcre:split "/" (second (cl-ppcre:split "@" url))))))
    (list database user password host)))

;; Handlers
(publish :path "/"
	 	:function #'(lambda (req ent)
	 					(with-http-response (req ent)
	 						(with-http-body (req ent)
			 				  	(cl-who:with-html-output (s *html-stream*)
									(:html
									 (:head
									  (:title "Heroku CL Example App"))
									 (:body
									  (:h1 "Heroku CL Example App")
									  (:h3 "Using")
									  (:ul
									   (:li (format s "~A ~A" (lisp-implementation-type) (lisp-implementation-version)))
									   (:li (format s "Portable AllegroServe ~{~A~^.~}" net.aserve:*aserve-version*))
									   (:li (format s "CL-WHO")))
									  (:div
									   (:a :href "static/lisp-glossy.jpg" (:img :src "static/lisp-glossy.jpg" :width 100)))
									  (:div
									   (:a :href "static/hello.txt" "hello"))
									  (:div
       									(:pre "SELECT version();"))
									  (:div
									  	(format s "~A" (postmodern:with-connection (db-params)
									  						(postmodern:query "select version()")))))))))))

(publish-directory
 :prefix "/static/"
 :destination "./public/")