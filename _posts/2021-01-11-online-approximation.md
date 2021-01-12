---
layout: post
title: Online Approximation Techniques for Spatial Data
date: 2021-01-11
categories: [computer science]
tags: [machine learning, data management]

---

### Article Source
* [Online Approximation Techniques for Spatial Data](https://www.youtube.com/watch?v=z3ryo7MFN5Q&t=10s)

----


## Online Approximation Techniques for Spatial Data

<iframe width="600" height="400" src="https://www.youtube.com/embed/z3ryo7MFN5Q" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Abstract
 
Spatial Database Management Systems (SDBMS), e.g., Geographical Information Systems, that manage spatial objects such as points, lines, and hyper-rectangles, often have very high query processing costs. Accurate selectivity estimation during query optimization therefore is crucially important for finding good query plans, especially when spatial joins are involved. Selectivity estimation has been studied for relational database systems, but till date has only received little attention in SDBMS.     

In this talk, I will present novel sketch-based methods that permit high-quality selectivity estimation for spatial joins and range queries. The sketch-based synopses can be constructed in a single scan over the input, handle inserts and deletes to the database incrementally, and hence can also be used for processing of streaming data. In contrast to previous approaches which provide no guarantees on the quality of approximate results provided, our techniques return approximate results that come with provable probabilistic quality guarantees. The quality guarantees are user tunable and permit a graceful tradeoff between space consumption and the quality of the resulting approximation.