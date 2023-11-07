---
layout: post
title: Fast, Approximate Vector Queries on Very Large Unstructured Datasets  
date: 2023-11-06
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source

* [Fast, Approximate Vector Queries on Very Large Unstructured Datasets](https://www.youtube.com/watch?v=lBDxHBW-fTw)

---

# Fast, Approximate Vector Queries on Very Large Unstructured Datasets


* Zili Zhang and Chao Jin, Peking University; Linpeng Tang, Moqi; Xuanzhe Liu and Xin Jin, Peking University



## Abstract

The breakthroughs in deep learning enable unstructured data to be represented as high-dimensional feature vectors for serving a wide range of applications. Processing vector queries (i.e., finding the nearest neighbor vectors for an input vector) for large unstructured datasets (with billions of items) is challenging, especially for applications with strict service level objectives (SLOs). Existing solutions trade query accuracy for latency, but without any guarantees, causing SLO violations.

This paper presents Auncel, a vector query engine for large unstructured datasets that provides bounded query errors and bounded query latencies. The core idea of Auncel is to exploit local geometric properties of individual query vectors to build a precise error-latency profile (ELP) for each query. This profile enables Auncel to sample the right amount of data to process a given query while satisfying its error or latency requirements. Auncel is a distributed solution that can scale out with multiple workers. We evaluate Auncel with a variety of benchmarking datasets. The experimental results show that Auncel outperforms state-of-the-art approximate solutions by up to 10× on query latency with the same error bound (≤ 10%). In particular, Auncel only takes 25 ms to process a vector query on the DEEP1B dataset that contains one billion items with four c5.metal EC2 instances.

<iframe width="600" height="400" src="https://www.youtube.com/embed/lBDxHBW-fTw?si=kbSsMftoYURTvlyD" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>