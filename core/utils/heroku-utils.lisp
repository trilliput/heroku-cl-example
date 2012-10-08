(in-package :core)

(defun utils-heroku-getenv (target)
  #+ccl (ccl:getenv target)
  #+sbcl (sb-posix:getenv target))

(defun utils-heroku-db-params ()
  "Heroku database url format is postgres://username:password@host:port/database_name.  TODO: cleanup code."
  (if (utils-heroku-getenv "DATABASE_URL")
      (let* ((url (second (cl-ppcre:split "//" (utils-heroku-getenv "DATABASE_URL"))))
         (user (first (cl-ppcre:split ":" (first (cl-ppcre:split "@" url)))))
         (password (second (cl-ppcre:split ":" (first (cl-ppcre:split "@" url)))))
         (host (first (cl-ppcre:split ":" (first (cl-ppcre:split "/" (second (cl-ppcre:split "@" url)))))))
         (database (second (cl-ppcre:split "/" (second (cl-ppcre:split "@" url))))))
        (list database user password host))))
