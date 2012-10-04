(in-package :cl-user)

(ql:quickload :example)  ; (asdf:load-system :example)

(defvar *hunchentoot-instance* (make-instance 'hunchentoot:easy-acceptor :port 4242))
(hunchentoot:start *hunchentoot-instance*)
;(hunchentoot:stop *hunchentoot-instance*)
