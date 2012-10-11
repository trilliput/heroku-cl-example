;;;; Model Users
;;;; TODO: Wrap this staff to a marco or even better a bunch of margos

(defpackage #:model-users
  (:use #:cl)
  (:export :get-list-by-id
           :get-list-by-name
           :get-list-by-email
           :get-list-by-is-admin
           
           :get-columns))

(in-package :model-users)

(defvar *table-name* "users")
(defvar *columns* (list 
                    :id (list :type :integer :name "id")
                    :name (list :type :string :name "name")
                    :email (list :type :string :name "email")
                    :is-admin (list :type :integer :name "is_admin")))

;;; TODO: function for creating tables in DB
;;;   MySQL:
;;;     CREATE TABLE users (id integer NOT NULL AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255), email VARCHAR(255), is_admin INTEGER);
;;;     
;;;   PostgreSQL:
;;;     CREATE SEQUENCE users_id_seq;
;;;     CREATE TABLE users (id integer NOT NULL PRIMARY KEY DEFAULT nextval('users_id_seq'), name VARCHAR(255), email VARCHAR(255), is_admin INTEGER);
;;;     ALTER SEQUENCE users_id_seq OWNED BY users.id;

;;; TODO: function fur inserting row to the Table
;;;   MySQL:
;;;     INSERT INTO users (name, email, is-admin) VALUES (...),(...)
;;;   PostgreSQL:
;;;     INSERT INTO users (name, email, is-admin) VALUES (...),(...)

;;; TODO: function for deleting row from the Table
;;;   MySQL:
;;;     DELETE FROM users WHERE id = ~D;
;;;   PostgreSQL:
;;;     DELETE FROM users WHERE id = ~D;

(defun get-columns () *columns*)
(defun get-column (name) (getf *columns* name))

(defun get-list-by-field (field-name value) (postmodern:query (get-sql-for-list-by-field field-name value)))
(defun get-sql-for-list-by-field (field-name value) 
  (concatenate 'string
               (format nil "SELECT * FROM ~A" *table-name*)
               (format nil
                       (let ((field-type (getf (get-column field-name) :type)) ) 
                         (cond ((eq field-type :integer) " WHERE ~A = '~D'")
                               (T " WHERE ~A = '~A'")))
                       (getf (get-column field-name) :name)
                       value)))

(defun get-list-by-id (id) (get-list-by-field :id id))

(defun get-list-by-name (name) (get-list-by-field :name name))

(defun get-list-by-email (email) (get-list-by-field :email email))

(defun get-list-by-is-admin (is-admin) (get-list-by-field :is-admin is-admin))
