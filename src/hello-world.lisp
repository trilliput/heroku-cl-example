(in-package :example)

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
									   (:a :href "static/hello.txt" "hello")))))))))

(publish-directory
 :prefix "/static/"
 :destination "./public/")