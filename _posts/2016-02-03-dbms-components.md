---
layout: post
title: DBMS Components 
date: 2016-02-03
categories: [computer science]
tags: [data management]

---


# Database Management System Components


![](http://sungsoo.github.com/images/dbms-components.png)

We see an outline of a complete DBMS. Single boxes represent system components, while double boxes represent *in-memory* data structures. The solid lines indicate *control* and *data flow*, while dashed lines indicate data flow only. Since the diagram is complicated, we shall consider the details in several stages. First, at the top, we suggest that there are two distinct sources of commands to the DBMS:
1. Conventional users and application programs that ask for data or modify data.2. A *database administrator*: a person or persons responsible for the structure or schema of the database.