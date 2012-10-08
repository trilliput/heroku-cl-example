(in-package :core)

(defun init ()
  (and
    (init-configs)))

(defun init-configs () 
  (and 
    (in-package :core)
    (if (probe-file "settings/local-settings.lisp") (load "settings/settings.lisp" :verbose t)) ;added file existence check espcially to make Heroku work. TODO: Had to be solved later
    (if (probe-file "settings/local-settings.lisp") (load "settings/local-settings.lisp" :verbose t))))

(defun get-db-params ()
  (utils-heroku-or-local-db-params))
