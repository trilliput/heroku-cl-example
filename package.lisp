;;;; package.lisp

(defpackage #:example
  (:use #:cl #:net.aserve)
  (:import-from #:net.aserve *html-stream*))