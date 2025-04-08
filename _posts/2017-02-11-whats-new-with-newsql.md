---
layout: post
title: What's New with NewSQL?
date: 2017-02-11
categories: [computer science]
tags: [data management]

---


What's New with NewSQL?
===

* Authors: A. Pavlo and Matthew Aslett
* Affiliation: Carnegie Mellon University, 451 Research
* Published: SIGMOD Record (vol. 45, iss. 2), 2016
* [What's New with NewSQL?](http://15721.courses.cs.cmu.edu/spring2017/papers/01-intro/pavlo-newsql-sigmodrec2016.pdf)

## Abstract

A new class of database management systems (DBMSs) called *NewSQL* tout their ability to scale modern on-line transaction processing (OLTP) workloads in a way that is not possible with legacy systems. The term **NewSQL** was first used by one of the authors of this article in a 2011 business analysis report discussing the rise of new database systems as challengers to these established vendors (Oracle, IBM, Microsoft). The other author was working on what became one of the first examples of a NewSQL DBMS. Since then several companies and research projects have used this term (rightly and wrongly) to describe their systems.

Given that relational DBMSs have been around for over four decades, it is justifiable to ask whether the claim of NewSQL’s superiority is actually true or whether it is simply marketing. If they are indeed able to get better performance, then the next question is whether there is anything scientifically new about them that enables them to achieve these gains or is it just that hardware has advanced so much that now the bottlenecks from earlier years are no longer a problem.

To do this, we first discuss the history of databases to understand how NewSQL systems came about. We then provide a detailed explanation of what the term NewSQL means and the different categories of systems that fall under this definition