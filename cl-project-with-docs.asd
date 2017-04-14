#|
  This file is a part of cl-project-with-docs project.
  Copyright (c) 2017 Alexander Artemenko (svetlyak.40wt@gmail.com)
|#

#|
  Skeleton for a Lisp library with great documentation.

  Author: Alexander Artemenko (svetlyak.40wt@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-project-with-docs-asd
  (:use :cl :asdf))
(in-package :cl-project-with-docs-asd)

(defsystem cl-project-with-docs
  :version "0.1"
  :author "Alexander Artemenko"
  :license "BSD"
  :depends-on (:cl-project)
  :components ((:module "src"
                :components
                ((:file "cl-project-with-docs"))))
  :description "Skeleton for a Lisp library with great documentation."
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op cl-project-with-docs-test))))
