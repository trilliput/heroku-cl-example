(in-package :core)

(defun utils-db-params ()
  (OR (utils-heroku-db-params) settings:settings-db-params)
)
