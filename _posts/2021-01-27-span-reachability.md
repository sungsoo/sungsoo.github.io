---
layout: post
title: Efficiently Answering Span Reachability Queries 
date: 2021-01-27
categories: [computer science]
tags: [machine learning, data management]

---

### Article Source
* [Efficiently Answering Span Reachability Queries in Large Temporal Graphs](https://www.youtube.com/watch?v=nzaqczZIkjA)

----


## Efficiently Answering Span Reachability Queries in Large Temporal Graphs


<iframe width="600" height="400" src="https://www.youtube.com/embed/nzaqczZIkjA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Abstract
 
*Reachability* is a fundamental problem in graph analysis. In applications such as social networks and collaboration networks, edges are always associated with timestamps. Most existing works on reachability queries in *temporal graphs* assume that two vertices are related if they are connected by a path with non-decreasing timestamps (time-respecting) of edges. This assumption fails to capture the relationship between entities involved in the same group or activity with no time-respecting path connecting them. 

In this paper, we define a new reachability model, called *span-reachability*, designed to relax the time order dependency and identify the relationship between entities in a given time period. We adopt the idea of *two-hop cover* and propose an **index-based method** to answer *span-reachability queries*. Several optimizations are also given to improve the efficiency of *index construction* and *query processing*. We conduct extensive experiments on **17 real-world datasets** to show the efficiency of our proposed solution.
