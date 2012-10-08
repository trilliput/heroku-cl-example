(in-package :core)

(defun db-params ()
  (OR (heroku-db-params) settings:settings-db-params)
)
