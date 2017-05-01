---
layout: post
title: Gunrock - GPU Graph Analytics
date: 2017-05-02
categories: [computer science]
tags: [machine learning]

---


# Gunrock - GPU Graph Analytics

* Authors: Yangzihao Wang, Yuechao Pan, Andrew Davidson, Yuduo Wu, Carl Yang, Leyuan Wang, Muhammad Osama, Chenshan Yuan, Weitang Liu, Andy T. Riffel, John D. Owens (University of California, Davis)
* [Paper](https://arxiv.org/pdf/1701.01170v1)


## Abstract

For *large-scale graph analytics* on the GPU, the irregularity of data access and control flow, and the complexity of programming GPUs, have presented two significant challenges to developing a programmable high-performance graph library. "Gunrock", our graph-processing system designed specifically for the GPU, uses a high-level, bulk-synchronous, data-centric abstraction focused on operations on a vertex or edge frontier. Gunrock achieves a balance between performance and expressiveness by coupling high performance GPU computing primitives and optimization strategies with a high-level programming model that allows programmers to quickly develop new graph primitives with small code size and minimal GPU programming knowledge. 

We characterize the performance of various optimization strategies and evaluate Gunrock’s overall performance on different GPU architectures on a wide range of graph primitives that span from *traversal-based algorithms* and *ranking algorithms*, to *triangle counting* and *bipartite-graph-based algorithms*. The results show that on a single GPU, Gunrock has on average at least an order of magnitude speedup over Boost and PowerGraph, comparable performance to the fastest GPU hardwired primitives and CPU shared-memory graph libraries such as Ligra and Galois, and better performance than any other GPU high-level graph library.

[![http://sungsoo.github.com/images/gunrock.png](http://sungsoo.github.com/images/gunrock.png)](http://sungsoo.github.com/images/gunrock.png)

## Operations

[![http://sungsoo.github.com/images/gunrock-operations.png](http://sungsoo.github.com/images/gunrock-operations.png)](http://sungsoo.github.com/images/gunrock-operations.png)