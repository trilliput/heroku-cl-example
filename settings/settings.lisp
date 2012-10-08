(in-package :settings)

(defvar settings-db-params (list "db-name" "user" "pass" "host"))


(if (probe-file "settings/local-settings.lisp") (load "settings/local-settings.lisp"))
