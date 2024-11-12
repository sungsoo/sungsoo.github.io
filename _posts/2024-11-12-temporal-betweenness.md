---
layout: post
title:  Making Temporal Betweenness Computation Faster and Restless
date: 2024-11-12
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Making Temporal Betweenness Computation Faster and Restless](https://www.youtube.com/watch?v=jH0m-gjJ72c)

---



# Making Temporal Betweenness Computation Faster and Restless


## Abstract

* Temporal Graph Learning Reading Group
* Paper: ["Making Temporal Betweenness Computation Faster and Restless"](https://dl.acm.org/doi/10.1145/3637528.3671825)
* Speaker: Filippo Brunelli
* Date: Nov. 07, 2024

Buss et al [KDD 2020] recently proved that the problem of computing the betweenness of all nodes of a temporal graph is computationally hard in the case of foremost and fastest paths, while it is solvable in time O(n3T2) in the case of shortest and shortest foremost paths, where n is the number of nodes and T is the number of distinct time steps. A new algorithm for temporal betweenness computation is introduced in this paper. In the case of shortest and shortest foremost paths, it requires O(n + M) space and runs in time O(nM)=O(n3T), where M is the number of temporal edges, thus significantly improving the algorithm of Buss et al in terms of time complexity (note that T is usually large). Experimental evidence is provided that our algorithm performs between twice and almost 250 times better than the algorithm of Buss et al. Moreover, we were able to compute the exact temporal betweenness values of several large temporal graphs with over a million of temporal edges. For such size, only approximate computation was possible by using the algorithm of Santoro and Sarpe [WWW 2022]. Maybe more importantly, our algorithm extends to the case of restless walks (that is, walks with waiting constraints in each node), thus providing a polynomial-time algorithm (with complexity O(nM)) for computing the temporal betweenness in the case of several different optimality criteria. Such restless computation was known only for the shortest criterion (Rymar et al [JGAA 2023]), with complexity O(n2MT2). We performed an extensive experimental validation by comparing different waiting constraints and different optimisation criteria. Moreover, as a case study, we investigate six public transit networks including Berlin, Rome, and Paris. Overall we find a general consistency between the different variants of betweenness centrality. However, we do measure a sensible influence of waiting constraints, and note some cases of low correlation for certain pairs of criteria in some networks.

<iframe width="600" height="400" src="https://www.youtube.com/embed/jH0m-gjJ72c?si=WQnwoujGgUhHe0i7" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>