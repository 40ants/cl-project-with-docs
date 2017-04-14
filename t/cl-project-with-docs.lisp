(in-package :cl-user)
(defpackage cl-project-with-docs-test
  (:use :cl
        :cl-project-with-docs
        :prove))
(in-package :cl-project-with-docs-test)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-project-with-docs)' in your Lisp.

(plan nil)

;; blah blah blah.

(finalize)
