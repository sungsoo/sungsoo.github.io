---
layout: post
title: Super-Constant-Pass Streaming Lower Bounds for Reachability
date: 2021-07-19
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Almost Optimal Super-Constant-Pass Streaming Lower Bounds for Reachability](https://www.youtube.com/watch?v=AD3K8j12EIE)


---

# Almost Optimal Super-Constant-Pass Streaming Lower Bounds for Reachability

* Authors: Lijie Chen, Gillat Kol, Dmitry Paramonov, Raghuvansh R. Saxena, Zhao Song, Huacheng Yu
* [Paper](https://dl.acm.org/doi/10.1145/3406325.3451038)
* STOC 2021: Proceedings of the 53rd Annual ACM SIGACT Symposium on Theory of Computing, June 2021, Pages 570–583


## Abstract

We give an almost quadratic <img src="https://render.githubusercontent.com/render/math?math=n^{2-O(1)}"> lower bound on the space consumption of any <img src="https://render.githubusercontent.com/render/math?math=O(\sqrt{\log n})">-pass streaming algorithm solving the (directed) *s-t* reachability problem. This means that any such algorithm must essentially store the entire graph. As corollaries, we obtain almost quadratic space lower bounds for additional fundamental problems, including maximum matching, shortest path, matrix rank, and linear programming.

Our main technical contribution is the definition and construction of set hiding graphs, that may be of independent interest: we give a general way of encoding a set <img src="https://render.githubusercontent.com/render/math?math=S \subset [k]"> as a directed graph with <img src="https://render.githubusercontent.com/render/math?math=n = k^{1 + O(1)}"> vertices, such that deciding whether <img src="https://render.githubusercontent.com/render/math?math=i \in S"> boils down to deciding if <img src="https://render.githubusercontent.com/render/math?math=t_i"> is reachable from <img src="https://render.githubusercontent.com/render/math?math=s_i">, for a specific pair of vertices <img src="https://render.githubusercontent.com/render/math?math=(s_i,t_i)"> in the graph. Furthermore, we prove that our graph "hides" *S*, in the sense that no low-space streaming algorithm with a small number of passes can learn (almost) anything about *S*.


<iframe width="600" height="400" src="https://www.youtube.com/embed/mXMh2T1To2w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
