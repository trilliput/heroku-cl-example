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
      (:title "Heroku CL Hello World"))
     (:body
      (:a :href "https://github.com/Trilliput" 
       (:img :class "forkme" :src "https://s3.amazonaws.com/github/ribbons/forkme_left_gray_6d6d6d.png" :alt "Fork me on GitHub"))
      (:div :class "container"
       (:div :class "sub-container"
        (:div :class "tweets")
        (:div :class "content"
         (:h2 "Common Lisp on Heroku")

         (:p :class "h-notes" "Sandbox Project")

         (:p "This is my sandbox project to play around with Common Lisp on the Heroku cloud using " (:a :href "https://github.com/jsmpereira/heroku-buildpack-cl" "a fork by José Santos Martins Pereira") "of the " (:a :href "https://github.com/mtravers/heroku-buildpack-cl" "Heroku Common Lisp Buildpack originally developed by Mike Travers") ". See the buildpack repository for more information and credits.")

         (:p "This is the Hunchentoot branch. I'm focused only on Hunchentoot now, so other branch(es) was forked from the examle application originally made by José Santos Martins Pereira")

         (:p "Url to my sandbox app: " (:a :href "http://sleepy-peak-6043.herokuapp.com/" "http://sleepy-peak-6043.herokuapp.com/")))
         (:div :class "container-float-cleaner")))

      (:div :class "footer"
       (:div :class "powered-by"
        (:a :href "static/lisp-glossy.jpg" (:img :src "static/fancy_logo.png"))) 
       (:div :class "footer-content"
        (:h4 "Using")
        (:ul
         (:li (format s "~A ~A" (lisp-implementation-type) (lisp-implementation-version)))
         (:li (format s "Hunchentoot ~A" hunchentoot::*hunchentoot-version*))
         (:li (format s "CL-WHO"))
         (:li (format s "~A" (caar (postmodern:with-connection (db-params) (postmodern:query "select version()"))))))
       (:div :class "footer-float-cleaner")))))))
