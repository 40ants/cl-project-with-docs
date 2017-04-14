#|
  This file is a part of <% @var name %> project.
<%- @if author %>
  Copyright (c) <%= (local-time:timestamp-year (local-time:now)) %> <% @var author %><% @if email %> (<% @var email %>)<% @endif %>
<%- @endif %>
|#
<%
(when (or (getf env :description)
          (getf env :author))
%>
#|
<%- @if description %>
  <% @var description %>
  <%- @if author %>
<% @endif %>
<%- @endif %>
<%- @if author %>
  Author: <% @var author %><% @if email %> (<% @var email %>)<% @endif %>
<%- @endif %>
|#
<% ) %>

(in-package :cl-user)
(defpackage <% @var name %>-asd
  (:use :cl :asdf))
(in-package :<% @var name %>-asd)


(defsystem <% @var name %>
  :version (:read-file-form "version.lisp-expr")
  :author "<% @var author %>"
  :license "<% @var license %>"
  :depends-on (<% (format t "~{:~(~A~)~^~%               ~}"
                          (getf env :depends-on)) %>)
  :components ((:module "src"
                :components
                ((:file "<% @var name %>"))))
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

