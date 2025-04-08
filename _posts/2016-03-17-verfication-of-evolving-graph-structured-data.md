---
layout: post
title: Verification of Evolving Graph-structured Data under Expressive Path Constraints 
date: 2016-03-17
categories: [computer science]
tags: [data management]

---

# Verification of Evolving Graph-structured Data under Expressive Path Constraints

## Abstract

*Integrity constraints* play a central role in databases and, among other applications, are fundamental for preserving *data integrity* when databases evolve as a result of operations manipulating the data. In this context, an important task is that of static verification, which consists in deciding whether a given set of constraints is preserved after the execution of a given sequence of operations, for every possible database satisfying the initial constraints. 

In this paper, we consider constraints over *graph-structured data* formulated in an expressive Description Logic (DL) that allows for regular expressions over binary relations and their inverses, generalizing many of the well-known path constraint languages proposed for semi-structured data in the last two decades. In this setting, we study the problem of static verification, for operations expressed in a simple yet flexible language built from additions and deletions of complex DL expressions. We establish *undecidability* of the general setting, and identify suitable restricted fragments for which we obtain tight complexity results, building on techniques developed in our previous work for simpler DLs. As a by-product, we obtain new *(un)decidability* results for the implication problem of path constraints, and improve previous upper bounds on the complexity of the problem.

[![](http://sungsoo.github.com/images/definition-zoi.png)](http://sungsoo.github.com/images/definition-zoi.png)

## References


* Diego Calvanese et. al, Verification of Evolving Graph-structured Data under Expressive Path Constraints, *19th International Conference on Database Theory (ICDT 2016)*
