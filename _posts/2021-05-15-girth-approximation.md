---
layout: post
title: Constant Girth Approximation for Directed Graphs in Subquadratic Time
date: 2021-05-15
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Constant Girth Approximation for Directed Graphs in Subquadratic Time](https://www.youtube.com/watch?v=P_7p-I5QzB8)

---

# Constant Girth Approximation for Directed Graphs in Subquadratic Time

* Paper: [https://arxiv.org/abs/1907.10779](https://arxiv.org/abs/1907.10779)

## Abstract

In this paper we provide a Õ (mn‾√) time algorithm that computes a 3-multiplicative approximation of the girth of a n-node m-edge directed graph with non-negative edge lengths. This is the first algorithm which approximates the girth of a directed graph up to a constant multiplicative factor faster than All-Pairs Shortest Paths (APSP) time, i.e. O(mn). Additionally, for any integer k≥1, we provide a deterministic algorithm for a O(kloglogn)-multiplicative approximation to the girth in directed graphs in Õ (m1+1/k) time. Combining the techniques from these two results gives us an algorithm for a O(klogk)-multiplicative approximation to the girth in directed graphs in Õ (m1+1/k) time. Our results naturally also provide algorithms for improved constructions of roundtrip spanners, the analog of spanners in directed graphs.
The previous fastest algorithms for these problems either ran in All-Pairs Shortest Paths (APSP) time, i.e. O(mn), or were due Pachocki et al. (PRSTV18) which provided a randomized algorithm that for any integer k≥1 in time Õ (m1+1/k) computed with high probability a O(klogn) multiplicative approximation of the girth. Our first algorithm constitutes the first sub-APSP-time algorithm for approximating the girth to constant accuracy, our second removes the need for randomness and improves the approximation factor in Pachocki et al. (PRSTV18), and our third is the first time versus quality trade-off for obtaining constant approximations. 

<iframe width="600" height="400" src="https://www.youtube.com/embed/P_7p-I5QzB8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

