(defsystem <% @var name %>
           :version (:read-file-form "version.lisp-expr")
           :author "<% @var author %>"
           :license "<% @var license %>"
           :class :package-inferred-system
           :pathname "src"
           :depends-on (<% (format t "~{:~(~A~)~^~%               ~}"
                                   (getf env :depends-on)) %>
                                   "<% @var name %>/core")
           :description "<% @var description %>"
           :long-description
           #.(with-open-file (stream (merge-pathnames
                                      #p"README.rst"
                                      (or *load-pathname* *compile-file-pathname*))
                                     :if-does-not-exist nil
                                     :direction :input)
               (when stream
                 (let ((seq (make-array (file-length stream)
                                        :element-type 'character
                                        :fill-pointer t)))
                   (setf (fill-pointer seq)
                         (read-sequence seq stream))
                   seq)))
           <%- @unless without-tests %>
           :in-order-to ((test-op (test-op <% @var name %>-test)))
           <%- @endunless %>)

