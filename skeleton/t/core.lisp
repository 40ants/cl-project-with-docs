(defpackage #:<% @var name %>-test/core
  (:use #:cl
        #:<% @var name %>/core
        #:rove
        #:hamcrest/rove))
(in-package <% @var name %>-test/core)


(deftest test-some-staff
    (testing "Replace this test with real staff."
      (assert-that (foo 1 2)
                   (contains 1 2))))
