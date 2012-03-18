(in-package :example)

(net.aserve:publish :path "/" :function #'(lambda (req ent)
				 (with-http-response (request entity :content-type "text/html")
				   (with-http-body (request entity)
				     (cl-who:with-html-output-to-string (s)
				       (:html
					 (:head
					  (:title "Heroku CL Example App"))
					 (:body
					  (:h1 "Heroku CL Example App")
					  (:h3 "Using")
					  (:ul
					   (:li (format s "~A ~A" (lisp-implementation-type) (lisp-implementation-version)))
					   (:li (format s "~A" net.aserve:*aserve-version*))
					   (:li (format s "CL-WHO")))
					  (:div
					   (:a :href "static/lisp-glossy.jpg" (:img :src "static/lisp-glossy.jpg" :width 100)))
					  (:div
					   (:a :href "static/hello.txt" "hello")))))))))

(net.aserve:publish-directory
 :prefix "/"
 :destination "./public/")
