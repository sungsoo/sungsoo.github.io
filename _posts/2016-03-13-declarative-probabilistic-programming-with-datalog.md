---
layout: post
title: Declarative Probabilistic Programming with Datalog 
date: 2016-03-13
categories: [computer science]
tags: [data management]

---

# Declarative Probabilistic Programming with Datalog

## Abstract

*Probabilistic programming* languages are used for developing statistical models, and they typically consist of two components: a specification of a stochastic process (the prior), and a specification of observations that restrict the probability space to a conditional subspace (the posterior). Use cases of such formalisms include the development of algorithms in machine learning and artificial intelligence. We propose and investigate an extension of Datalog for specifying statistical models, and establish a *declarative probabilistic-programming* paradigm over databases. Our proposed extension provides convenient mechanisms to include common numerical probability functions; in particular, conclusions of rules may contain values drawn from such functions. The semantics of a program is a probability distribution over the possible outcomes of the input database with respect to the program. Observations are naturally incorporated by means of integrity constraints over the extensional and intensional relations. The resulting semantics is robust under different chases and invariant to rewritings that preserve logical equivalence.


## References


Vince Barany, et. al, Declarative Probabilistic Programming with Datalog, *19th International Conference on Database Theory (ICDT 2016)*
