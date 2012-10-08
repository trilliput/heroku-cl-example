(in-package :core)

(defun init ()
  (and
    (init-configs)))

(defun init-configs () 
  (and 
    (in-package :core)
    (load "settings/settings.lisp")
    (if (probe-file "settings/local-settings.lisp") (load "settings/local-settings.lisp"))))

(defun get-db-params ()
  (utils-heroku-or-local-db-params))
