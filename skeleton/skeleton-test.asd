(defsystem <% @var name %>-test
           :author "<% @var author %>"
           :license "<% @var license %>"
           :class :package-inferred-system
           :pathname "t"
           :depends-on (:<% @var name %>
                        "<% @var name %>-test/core")
           :description "Test system for <% @var name %>"

           :perform (test-op :after (op c)
                             (symbol-call :rove :run c)
                             (clear-system c)))
