---
layout: post
title: Making Graphs Compact by Lossless Contraction
date: 2021-08-01
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Making Graphs Compact by Lossless Contraction](https://www.youtube.com/watch?v=pbbxG8wx3ag&list=PL3xUNnH4TdbsfndCMn02BqAAgGB0z7cwq&index=153)


---


# Making Graphs Compact by Lossless Contraction

* SIGMOD/PODS '21: Proceedings of the 2021 International Conference on Management of DataJune 2021 Pages 472–484
* [https://doi.org/10.1145/3448016.3452797](https://doi.org/10.1145/3448016.3452797)

## Abstract

This paper proposes a scheme to reduce big graphs to small graphs. It contracts obsolete parts, stars, cliques and paths into supernodes. The supernodes carry a synopsis S_Q for each query class Q to abstract key features of the contracted parts for answering queries of Q. The contraction scheme provides a compact graph representation and prioritizes up-to-date data. Better still, it is generic and lossless. We show that the same contracted graph is able to support multiple query classes at the same time, no matter whether their queries are label-based or not, local or non-local. Moreover, existing algorithms for these queries can be readily adapted to compute exact answers by using the synopses when possible, and decontracting the supernodes only when necessary. As a proof of concept, we show how to adapt existing algorithms for subgraph isomorphism, triangle counting and shortest distance to contracted graphs. We also provide an incremental contraction algorithm in response to updates. We experimentally verify that on average, the contraction scheme reduces graphs by 71.2%, and improves the evaluation of these queries by 1.53, 1.42 and 2.14 times, respectively.



<iframe width="600" height="400" src="https://www.youtube.com/embed/pbbxG8wx3ag" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>