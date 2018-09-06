(defpackage #:<% @var name %>/core
   (:nicknames #:<% @var name %>)
   (:use #:cl)
   (:export #:foo
            #:bar))
(in-package <% @var name %>/core)


(defun foo (a b)
  "Prints its arguments as a list.

Look, Sphinx blocks can be used in a docstrings::

  ;; Just add two columns at the end of the string
  ;; and start block with code with some padding.
  (foo 1 2)
  (foo 'a 'b)

But if you want to show repl session then use:

.. code-block:: common-lisp-repl

   TEST> (foo 1 2)
   (1 2)
   (1 2)
   TEST> (foo 'a 'b)
   (A B)
   (A B)"
  (princ (list a b)))


(defmacro bar (a b)
  "Calls :cl:function:`foo`, but wraps adds newlines before and after."
  `(progn
     (terpri)
     (foo ,a ,b)
     (terpri)))
