---
layout: post
title: Learned Query Scheduling
date: 2022-03-18
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Learned Query Scheduling](https://www.youtube.com/watch?v=uiMdErKz_rk)


---

# Learned Query Scheduling


## Abstract

**Query scheduling** is a crucial task for analytical database systems that can greatly affect query latency. However, existing scheduling approaches are either based on *heuristics* or not able to learn a scheduling policy that considers the *database-specific characteristics* (e.g., operator types, pipelining). As a result, such approaches become not efficient for analytical database systems. In this talk, we introduce LSched: a fully *learned workload-aware query scheduler* for in-memory analytical database systems. LSched provides an efficient *inter-query* and *intra-query* scheduling for dynamic analytical workloads (i.e., different queries can arrive/depart at any time). We integrated LSched with an efficient in-memory analytical database system, and evaluated it with TPCH, SSB, and JOB benchmarks. Our evaluation shows the efficiency of LSched in both streaming and batching query workloads.


<iframe width="600" height="400" src="https://www.youtube.com/embed/uiMdErKz_rk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>