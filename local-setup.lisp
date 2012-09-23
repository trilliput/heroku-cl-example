(in-package :cl-user)

(asdf:load-system :example)
(hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port 4242))
