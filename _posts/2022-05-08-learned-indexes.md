---
layout: post
title: Learned Index Structures for Dynamic and Multi-Dimensional Data
date: 2022-05-08
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Learned Index Structures for Dynamic and Multi-Dimensional Data](https://www.youtube.com/watch?v=Zv04F380hCw)


---

# Learned Index Structures for Dynamic and Multi-Dimensional Data


* See more Northwest Database Society talks here:
[https://db.cs.washington.edu/nwds/nwds.html](https://db.cs.washington.edu/nwds/nwds.html)
* Speaker: Jialin Ding



## Abstract 
Recent advancements in learned index structures propose replacing existing index structures, like B-Trees, with learned models. On read-only workloads, learned indexes can outperform state-of-the-art "traditional" indexes in both index size and lookup performance. However, past works on learned indexes perform poorly on workloads over changing or multi-dimensional data. In this talk, I will introduce some recent work that addresses these limitations of learned indexes. First, I will present ALEX, a fully dynamic learned index structure that simultaneously provides efficient support for point lookups, short range queries, inserts, updates, deletes, and bulk loading. I will then give a brief overview of Flood and Tsunami, learned multi-dimensional indexes that handle OLAP-style workloads that involve scanning and filtering over multi-dimensional tables. I will conclude by describing some directions for future work on learned indexes and how they fit into instance-optimized database systems.

<iframe width="600" height="400" src="https://www.youtube.com/embed/Zv04F380hCw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Bio
I am a CS PhD in the MIT Data Systems Group, where I am advised by Prof. Tim Kraska. My research focuses on applying machine learning to database systems. I also collaborate with Umar Farooq Minhas and the Database Group at Microsoft Research on learned data structures. Prior to MIT, I was an undergraduate at Stanford University, where I worked on data-intensive systems with Prof. Peter Bailis as part of Stanford DAWN. My CV.