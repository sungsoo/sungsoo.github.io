---
layout: post
title: Compute Complex Temporal Join Queries Efficiently
date: 2022-11-14
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Compute Complex Temporal Join Queries Efficiently](https://www.youtube.com/watch?v=WnIp1L9dv24)


---

# Compute Complex Temporal Join Queries Efficiently


## Abstract

This paper studies multi-way join queries over temporal data, where each tuple is associated with a valid time interval indicating when the tuple is valid. A temporal join requires that joining tuples' valid intervals intersect. Previous work on temporal joins has focused on joining two relations, but pairwise processing is often inefficient because it may generate unnecessarily large intermediate results. This paper investigates how to efficiently process complex temporal joins involving multiple relations. We also consider a useful extension, durable temporal joins, which further selects results with long enough valid intervals so they are not merely transient patterns.

We classify temporal join queries into different classes based on their computational complexity. We identify the class of r-hierarchical joins and show that a linear-time algorithm exists for a temporal join if and only it is r-hierarchical (assuming the 3SUM conjecture holds). We further propose output-sensitive algorithms for non-r-hierarchical joins. We implement our algorithms and evaluate them on both synthetic and real datasets.


<iframe width="600" height="400" src="https://www.youtube.com/embed/WnIp1L9dv24" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>