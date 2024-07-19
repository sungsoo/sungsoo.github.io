---
layout: post
title: A Bi-metric Framework for Fast Similarity Search
date: 2024-07-20
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [A Bi-metric Framework for Fast Similarity Search](https://www.youtube.com/watch?v=W1ww23ZJC3s)

---


# A Bi-metric Framework for Fast Similarity Search

* Piotr Indyk (Massachusetts Institute of Technology)
* Extroverted Sublinear Algorithms


## Abstract

We propose a new ``bi-metric'' framework for designing nearest neighbor data structures. Our framework assumes two dissimilarity functions: a ground-truth metric that is accurate but expensive to compute (e.g., a cross-encoder that runs a large neural network to compare two sentences), and a proxy metric that is cheaper but less accurate (e.g., the Euclidean distance between feature vectors representing the sentences, possibly sketched). In both theory and practice, we show how to construct data structures using only the proxy metric such that the query procedure achieves the accuracy of the expensive metric, while only using a limited number of calls to both metrics.

Our theoretical results instantiate this framework for two popular nearest neighbor search algorithms: DiskANN and Cover Tree. In both cases we show that, as long as the proxy metric used to construct the data structure approximates the ground-truth metric up to a bounded factor, our data structure achieves arbitrarily good approximation guarantees with respect to the ground-truth metric. On the empirical side, we apply the framework to the text retrieval problem with two dissimilarity functions evaluated by ML models with vastly different computational costs. We observe that for almost all data sets in the MTEB benchmark, our approach achieves a considerably better accuracy-efficiency tradeoff than the alternatives, such as re-ranking.

Joint work with Haike Xu and Sandeep Silwal.

<iframe width="600" height="400" src="https://www.youtube.com/embed/W1ww23ZJC3s?si=41pfcjHkLalWTXU9" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

