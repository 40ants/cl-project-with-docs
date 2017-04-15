======================
 cl-project-with-docs
======================

.. image:: https://travis-ci.org/40ants/cl-project-with-docs.svg?branch=master
    :target: https://travis-ci.org/40ants/cl-project-with-docs

.. Everything starting from this commit will be inserted into the
   index page of the HTML documentation.
.. include-from

This is a project skeleton generator which uses Sphinx and reStructured
text to render nice and readable HTML documentation.

It is based on Eitaro Fukamachi's `cl-project
<http://quickdocs.org/cl-project/>`_, but provides a modified template
with additional setup for documentation folder.

Features
========

* All documentation is in the reStructured text markup.
* Cross-reference between separate documents.
* Code snippets are highlighted.
* Automatic ``gh-pages`` update.
* Nice-looking theme.
* Integratin with Travis to run tests.

How to use
==========

Install it with quicklisp:

.. code-block:: common-lisp-repl

   TEST> (ql:quickload :cl-project-with-docs)
   CL-USER> (ql:quickload :cl-project-with-docs)
   To load "cl-project-with-docs":
     Load 1 ASDF system:
       cl-project-with-docs
   ; Loading "cl-project-with-docs"
   ..................................................
   [package cl-emb]..................................
   [package cl-emb-intern]...........................
   [package bordeaux-threads]........................
   [package cl-fad]..................................
   [package path]....................................
   [package local-time]..............................
   [package cl-project.specials].....................
   [package cl-project.io]...........................
   [package cl-project.file].........................
   [package cl-project.middleware]...................
   [package cl-project.skeleton].....................
   [package cl-project]..............................
   [package cl-project-with-docs]
   (:CL-PROJECT-WITH-DOCS)

.. note:: While project is not in Quicklisp, you'll
          have to clone it with::

            git clone https://github.com/40ants/cl-project-with-docs ~/common-lisp/

Then create a project like that:

.. code-block:: common-lisp-repl

   TEST> (cl-project-with-docs:make-project
          #P"/tmp/my-great-project"
          :author "Alexander Artemenko"
          :description "Make Lisp great again!"
          :license "BSD")
   writing /tmp/my-great-project/version.lisp-expr
   writing /tmp/my-great-project/tasks.py
   writing /tmp/my-great-project/my-great-project.asd
   writing /tmp/my-great-project/my-great-project-test.asd
   writing /tmp/my-great-project/README.rst
   writing /tmp/my-great-project/ChangeLog.rst
   writing /tmp/my-great-project/.travis.yml
   writing /tmp/my-great-project/.gitignore
   writing /tmp/my-great-project/docs/requirements.txt
   writing /tmp/my-great-project/docs/requirements.in
   writing /tmp/my-great-project/docs/Makefile
   writing /tmp/my-great-project/docs/source/index.rst
   writing /tmp/my-great-project/docs/source/conf.py
   writing /tmp/my-great-project/docs/source/changelog.rst
   writing /tmp/my-great-project/docs/source/api.rst
   writing /tmp/my-great-project/docs/source/_static/.keep
   writing /tmp/my-great-project/src/my-great-project.lisp
   writing /tmp/my-great-project/t/my-great-project.lisp
   T

How to build documentation
==========================

To build documentation, you'll need a Sphinx. It is
a documentaion building tool written in Python.

To install it, you need a virtualenv. Read
this instructions
`how to install it
<https://virtualenv.pypa.io/en/stable/installation/#installation>`_.

Also, you'll need a `cl-launch <http://www.cliki.net/CL-Launch>`_.
It is used by documentation tool to run a script which extracts
documentation strings from lisp systems.

Run these commands to build documentation::

  virtualenv env
  source env/bin/activate
  pip install -r docs/requirements.txt
  invoke build_docs

These commands will create a virtual environment and
install some python libraries there. Command ``invoke build_docs``
will build documentation and upload it to the GitHub, by replacing
the content of the ``gh-pages`` branch.


Authors
=======

* Alexander Artemenko

Copyright
=========

Copyright (c) 2017 Alexander Artemenko

License
=======

Licensed under the BSD License.
