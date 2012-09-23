(in-package :example)

(defun db-params ()
  (OR (heroku-db-params) *settings-db-params*)
)
