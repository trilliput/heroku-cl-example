(in-package :example)

;; Handlers
(push (hunchentoot:create-folder-dispatcher-and-handler "/static/" "public/")
	 hunchentoot:*dispatch-table*)

(hunchentoot:define-easy-handler (hello-sbcl :uri "/") ()
  (cl-who:with-html-output-to-string (s)
    (:html
     (:head
      (:script :language "javascript" :src "http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" :type "text/javascript")
      (:script :language "javascript" :src "static/jquery.tweet.js" :type "text/javascript")
      (:script :language "javascript" :src "static/main.js" :type "text/javascript")
      (:link :rel "stylesheet" :type "text/css" :href "static/main.css")
      (:title "Heroku CL Example App"))
     (:body
      (:a :href "https://github.com/Trilliput" 
       (:img :class "forkme" :src "https://s3.amazonaws.com/github/ribbons/forkme_left_gray_6d6d6d.png" :alt "Fork me on GitHub"))
      (:div :class "tweets")
      (:div :class "content"
      (:h1 "Heroku CL Example App")
      (:h3 "Using")
      (:ul
       (:li (format s "~A ~A" (lisp-implementation-type) (lisp-implementation-version)))
       (:li (format s "Hunchentoot ~A" hunchentoot::*hunchentoot-version*))
       (:li (format s "CL-WHO")))
      (:div
       (:a :href "static/lisp-glossy.jpg" (:img :src "static/lisp-glossy.jpg" :width 100)))
      (:div
       (:a :href "static/hello.txt" "hello"))
      (:h3 "App Database")
      (:div
       (:pre "SELECT version();"))
      (:div (format s "~A" (postmodern:with-connection (db-params)
			     (postmodern:query "select version()")))))))))
