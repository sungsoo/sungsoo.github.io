---
layout: post
title: A Unified Deep Model of Learning from both Data and Queries for Cardinality Estimation
date: 2021-07-20
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [A Unified Deep Model of Learning from both Data and Queries
for Cardinality Estimation](https://www.youtube.com/watch?v=TcSfvwt53iY&list=PL3xUNnH4TdbsfndCMn02BqAAgGB0z7cwq&index=209)


---

# A Unified Deep Model of Learning from both Data and Queries for Cardinality Estimation

* Authors:  Peizhi Wu, Gao Cong
* [Paper](https://dl.acm.org/doi/10.1145/3448016.3452830)
* SIGMOD/PODS 2021: Proceedings of the 2021 International Conference on Management of Data, June 2021, Pages 2009–2022


## Abstract

*Cardinality estimation* is a fundamental problem in database systems. To capture the rich joint data distributions of a relational table, most of the existing work either uses data as unsupervised information or uses query workload as supervised information. Very little work has been done to use both types of information, and cannot fully make use of both types of information to learn the *joint data distribution*. In this work, we aim to close the gap between *data-driven* and *query-driven* methods by proposing a new unified deep autoregressive model, UAE, that learns the joint data distribution from both the data and query workload. First, to enable using the supervised query information in the deep autoregressive model, we develop differentiable progressive sampling using the Gumbel-Softmax trick. Second, UAE is able to utilize both types of information to learn the joint data distribution in a single model. Comprehensive experimental results demonstrate that UAE achieves single-digit multiplicative error at tail, better accuracies over state-of-the-art methods, and is both space and time efficient.

<iframe width="600" height="400" src="https://www.youtube.com/embed/TcSfvwt53iY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>



