---
layout: post
title: Randomized Embeddings and Neural Networks
date: 2023-10-09
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source

* [Randomized Embeddings and Neural Networks](https://www.youtube.com/watch?v=xiDdXU-_zWU&list=PLgKuh-lKre10-e2TWPCB0JdacFEnHHS31)

---

# Randomized Embeddings and Neural Networks

* Mert Pilanci (Stanford University)
* [https://simons.berkeley.edu/talks/mert-pilanci-stanford-university-2023-10-09](https://simons.berkeley.edu/talks/mert-pilanci-stanford-university-2023-10-09)
* Sketching and Algorithm Design

## Abstract

In this talk, we explore connections between random embeddings and neural networks through the lens of convex analysis. We first introduce exact convex formulations of neural network training problems. We show that rectified linear unit (ReLU) networks can be globally trained via convex programs with the number of variables polynomial in the number of training samples but exponential in the feature dimension. We show that the exponential dependence on the feature dimension can be reduced by a randomized zonotope vertex sampling algorithm. The analysis of this algorithm is tightly connected to randomized embeddings of l2 to l1, Dvoretzky's theorem and hyperplane tessellations. Finally, we present numerical simulations verifying our claims and illustrating that the proposed approach is faster and more reliable than standard local search heuristics such as stochastic gradient descent and variants.

