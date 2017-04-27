---
layout: post
title:  Distributed Optimization via Alternating Direction Method of Multipliers
date: 2017-04-27
categories: [computer science]
tags: [machine learning]

---

<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>

# Distributed Optimization via Alternating Direction Method of Multipliers

Problems in areas such as *machine learning* and *dynamic optimization* on a large network lead to extremely *large convex optimization problems*, with problem data stored in a decentralized way, and processing elements distributed across a network. 

We argue that the *alternating direction method of multipliers* is well suited to such problems. The method was developed in the 1970s, with roots in the 1950s, and is equivalent or closely related to many other algorithms, such as dual decomposition, the method of multipliers, Douglas-Rachford splitting, Spingarn's method of partial inverses, Dykstra's alternating projections, Bregman iterative algorithms for $\ell_1$ problems, proximal methods, and others. After briefly surveying the theory and history of the algorithm, we discuss applications to statistical and machine learning problems such as the *lasso* and *support vector machines*, and to dynamic energy management problems arising in the smart grid.

<iframe width="600" height="400" src="https://www.youtube.com/embed/Xg0ozgCXXB8" frameborder="0" allowfullscreen></iframe>