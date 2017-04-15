#|
  This file is a part of cl-project-with-docs project.
  Copyright (c) 2017 Alexander Artemenko (svetlyak.40wt@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-project-with-docs-test-asd
  (:use :cl :asdf))
(in-package :cl-project-with-docs-test-asd)

(defsystem cl-project-with-docs-test
  :version (:read-file-form "version.lisp-expr")
  :author "Alexander Artemenko"
  :license "BSD"
  :depends-on (:cl-project-with-docs
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "cl-project-with-docs"))))
  :description "Test system for cl-project-with-docs"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
