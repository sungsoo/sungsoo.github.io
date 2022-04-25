---
layout: post
title: Improving Transfer and Robustness of Supervised Contrastive Learning 
date: 2022-04-23
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Improving Transfer and Robustness of Supervised Contrastive Learning](https://www.youtube.com/watch?v=G3yLSBSCUUw)


---

# Improving Transfer and Robustness of Supervised Contrastive Learning 

## Abstract

An ideal learned representation should display transferability and robustness. Supervised contrastive learning is a promising method for training accurate models, but produces representations that do not capture these properties due to class collapse -- when all points in a class map to the same representation. In this talk, we discuss how to alleviate these problems to improve the geometry of supervised contrastive learning. We identify two key principles: balancing the right amount of geometric "spread" in the embedding space, and inducing an inductive bias towards subclass clustering. We introduce two mechanisms for achieving these aims in supervised contrastive learning, and show that doing so improves transfer learning and worst-group robustness. Next, we show how we can apply these insights to improve entity retrieval in open-domain NLP tasks (e.g., QA, search). We present a new method, TABi, that trains bi-encoders with a type-aware supervised contrastive loss and improves long-tailed entity retrieval.

<iframe width="600" height="400" src="https://www.youtube.com/embed/G3yLSBSCUUw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>



## Bio
Dan Fu is a PhD student in the Computer Science Department at Stanford University, where he is co-advised by Christopher Ré and Kayvon Fatahalian. His research focuses on understanding the principles behind why machine learning methods work and using that understanding to build the next generation of ML systems. He is supported by a Department of Defense NDSEG fellowship.