(in-package :cl-user)
(defpackage cl-project-with-docs
  (:use :cl)
  (:export
   #:make-project
   #:*skeleton-directory*))
(in-package :cl-project-with-docs)


(defparameter *skeleton-directory*
  (asdf:system-relative-pathname :cl-project-with-docs #P"skeleton/"))


(defun make-project (path
                     &rest params
                     &key
                       name
                       description
                       author
                       email
                       license
                       depends-on
                       (without-tests nil)
                     &allow-other-keys)
  "Generates a skeleton of a Lisp library with docs."
  
  (declare (ignore name description author email license depends-on without-tests))
  (let ((cl-project:*skeleton-directory* *skeleton-directory*))
    (apply #'cl-project:make-project
           path
           params)))
