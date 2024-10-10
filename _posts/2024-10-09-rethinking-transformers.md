---
layout: post
title: Re-thinking Transformers
date: 2024-10-09
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Re-thinking Transformers; Searching for Efficient Linear Layers over a Continuous Space of Structured Matrices](https://www.youtube.com/watch?v=nplao1_t8ig)

---



# Re-thinking Transformers: Searching for Efficient Linear Layers over a Continuous Space of Structured Matrices

## Abstract

Dense linear layers are the dominant computational bottleneck in large neural networks, presenting a critical need for more efficient alternatives. Previous efforts to develop alternatives have focused on a small number of hand-crafted structured matrices, and have neglected to investigate whether these structures can surpass dense layers in terms of compute-optimal scaling laws when both the model size and training examples are optimally allocated. In this work, we present a unifying framework that enables searching among all linear operators expressible via an Einstein summation. This framework encompasses many previously proposed structures, such as low-rank, Kronecker, Tensor-Train, and Monarch, along with many novel structures. We develop a taxonomy of all such operators based on their computational and algebraic properties, which provides insights into their scaling laws. Combining these insights with empirical evaluation, we identify a subset of structures that achieve better performance than dense layers as a function of training compute. To further improve their compute efficiency, we develop a natural extension of these structures that convert into a sparse mixture-of-experts layer. The resulting layer significantly outperforms dense layers in compute-optimal training efficiency for large language models.


<iframe width="600" height="400" src="https://www.youtube.com/embed/nplao1_t8ig?si=d8R4hcnRSCEIcu_2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>