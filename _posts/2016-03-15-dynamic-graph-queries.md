---
layout: post
title: Dynamic Graph Queries 
date: 2016-03-15
categories: [computer science]
tags: [data management]

---

# Dynamic Graph Queries

## Abstract

Graph databases in many applications – semantic web, transport or biological networks among others – are not only large, but also frequently modified. Evaluating graph queries in this dynamic context is a challenging task, as those queries often combine first-order and navigational features.

Motivated by recent results on maintaining *dynamic reachability*, we study the dynamic evaluation of traditional query languages for graphs in the *descriptive complexity framework*. Our focus is on maintaining regular path queries, and extensions thereof, by first-order formulas. In particular we are interested in path queries defined by non-regular languages and in extended conjunctive regular path queries (which allow to compare labels of paths based on word relations). Further we study the closely related problems of maintaining distances in graphs and reachability in product graphs.

In this preliminary study we obtain upper bounds for those problems in restricted settings, such as undirected and acyclic graphs, or under insertions only, and negative results regarding quantifier-free update formulas. In addition we point out interesting directions for further research.


## References


* Pablo Muñoz, et. al, Dynamic Graph Queries, *19th International Conference on Database Theory (ICDT 2016)*
