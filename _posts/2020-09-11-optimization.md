---
layout: post
title: Optimal Join Algorithms meet Top-k
date: 2020-09-11
categories: [computer science]
tags: [machine learning]

---

### Article Source
* [Optimal Join Algorithms meet Top-k](https://www.youtube.com/watch?v=KpUQayBuaQI)

----

# Optimal Join Algorithms meet Top-*k*

## Abstract

Top-*k* queries have been studied intensively in the database community and they are an important means to reduce query cost when only the "best" or "most interesting" results are needed instead of the full output. While some optimality results exist, e.g., the famous Threshold Algorithm, they hold only in a fairly limited model of computation that does not account for the cost incurred by large intermediate results and hence is not aligned with typical database-optimizer cost models. On the other hand, the idea of avoiding large intermediate results is arguably the main goal of recent work on optimal join algorithms, which uses the standard RAM model of computation to determine algorithm complexity. This research has created a lot of excitement due to its promise of reducing the time complexity of join queries with cycles, but it has mostly focused on full-output computation. We argue that the two areas can and should be studied from a unified point of view in order to achieve optimality in the common model of computation for a very general class of top-k-style join queries. This tutorial has two main objectives. First, we will explore and contrast the main assumptions, concepts, and algorithmic achievements of the two research areas. Second, we will cover recent, as well as some older, approaches that emerged at the intersection to support efficient ranked enumeration of join-query results. These are related to classic work on k-shortest path algorithms and more general optimization problems, some of which dates back to the 1950s. We demonstrate that this line of research warrants renewed attention in the challenging context of ranked enumeration for general join queries

<iframe width="600" height="400" src="https://www.youtube.com/embed/KpUQayBuaQI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="600" height="400" src="https://www.youtube.com/embed/0i8xC2dimoU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="600" height="400" src="https://www.youtube.com/embed/epvkyXBWefs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>