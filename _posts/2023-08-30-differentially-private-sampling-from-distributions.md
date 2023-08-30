---
layout: post
title: Differentially Private Sampling from Distributions
date: 2023-08-30
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source

* [Differentially Private Sampling from Distributions](https://www.youtube.com/watch?v=AkIPBjZAy9s)

---

# Differentially Private Sampling from Distributions

* A Google TechTalk, presented by Marika Swanberg, 2023-08-22
* Google Algorithms Seminar.  

## ABSTRACT

We initiate an investigation of private sampling from distributions. Given a dataset with n independent observations from an unknown distribution P, a sampling algorithm must output a single observation from a distribution that is close in total variation distance to P while satisfying differential privacy. Sampling abstracts the goal of generating small amounts of realistic-looking data. 
We provide tight upper and lower bounds for the dataset size needed for this task for three natural families of distributions: arbitrary distributions on {1,…,k}, arbitrary product distributions on {0,1}^d, and product distributions on {0,1}^d with bias in each coordinate bounded away from 0 and 1. We demonstrate that, in some parameter regimes, private sampling requires asymptotically fewer observations than learning a description of P nonprivately; in other regimes, however, private sampling proves to be as difficult as private learning. Notably, for some classes of distributions, the overhead in the number of observations needed for private learning compared to non-private learning is completely captured by the number of observations needed for private sampling.

This work appeared at NeurIPS and the full version can be found here: [https://arxiv.org/abs/2211.08193](https://arxiv.org/abs/2211.08193 ) 

Bio: Marika is a rising fifth year PhD student at Boston University advised by Adam Smith. Her research spans differential privacy, cryptography, and their intersection with legal questions, and more recently she has become interested in practical implementations of differential privacy. Before interning at Google, she was a visiting assistant professor at Reed College, and she has also done research for Tumult Labs.

<iframe width="600" height="400" src="https://www.youtube.com/embed/AkIPBjZAy9s?si=08fXFRs6dhuXLM6g" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>