(in-package :cl-user)

(ql:quickload :example)  ; (asdf:load-system :example)
(hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port 4242))
