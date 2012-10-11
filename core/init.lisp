(in-package :core)

(defun init ()
  (progn
    (init-configs)
    (init-db)))

(defun init-configs () 
  (progn 
    (in-package :core)
    (if (probe-file "settings/local-settings.lisp") (load "settings/settings.lisp" :verbose t)) ;added file existence check espcially to make Heroku work. TODO: Had to be solved later
    (if (probe-file "settings/local-settings.lisp") (load "settings/local-settings.lisp" :verbose t))))

(defun init-db ()
  (progn 
    (if (not (null postmodern:*database*)) (postmodern:disconnect-toplevel))
    (apply #'postmodern:connect-toplevel (get-db-params))))

(defun get-db-params ()
  (utils-heroku-or-local-db-params))
