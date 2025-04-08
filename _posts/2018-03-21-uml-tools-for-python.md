---
layout: post
title: UML Tools for Python
date: 2018-03-21
categories: [computer science]
tags: [design patterns]

---


# UML Tools for Python

* [PyUML](https://sourceforge.net/projects/eclipse-pyuml/) is an open source Eclipse plug-in offering round trip engineering betwee UML and Python.UML support is limited to class diagrams and the code-generation capabilities are simple class to class (or interface to interface) transformations
* [Epydoc](http://epydoc.sourceforge.net/) : Generate UML documentation from python code (last release on 2008)
* [PyNSource](http://www.andypatterns.com/index.php/products/pynsource/) : Reverse engineer python source code into UML. Generated UML class diagrams can be displayed as ASCII Art or in a more typical graphical form.
* [Lumpy](http://www.greenteapress.com/thinkpython/swampy/lumpy.html) : Python module that generates UML diagrams (currently object and class diagrams) from a running Python program. It is similar to a graphical debugger in the sense that it generates a visualization of the state of a running program, but it is different from a debugger in the sense that it tries to generate high-level visualizations that are compliant (at least in spirit) with standard UML
* [ObjectDomain](http://www.objectdomain.com/products/od-features) : commercial tool with forward and reverse engineering support for Python.
* [argoUML-python](http://argouml-python.tigris.org/) seems (seemed?) to go in the same direction but it is not quite there yet.
* [GraphModels (django-command-extensions)](https://code.google.com/p/django-command-extensions/wiki/GraphModels) creates a UML-like GraphViz dot file for the specified app name
* [Pyreverse](https://www.logilab.org/project/pylint) included in the Pylint source distribution (for the analysis of the quality of python code) creates UML diagrams from the code
* [pywebuml](https://bitbucket.org/tzulberti/pywebuml) uses graphviz to create a UML class diagram representing your python (and also Java and C#) code.