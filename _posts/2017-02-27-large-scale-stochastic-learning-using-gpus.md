---
layout: post
title: Large-Scale Stochastic Learning using GPUs
date: 2017-02-27
categories: [computer science]
tags: [machine learning, parallel computing]

---






# Large-Scale Stochastic Learning using GPUs

## Abstract

In this work we propose an *accelerated stochastic learning system* for very large-scale applications. Acceleration is achieved by *mapping* the *training algorithm* onto *massively parallel processors*: we demonstrate a *parallel*, *asynchronous* GPU implementation of the widely used stochastic coordinate descent/ascent algorithm that can provide up to 35x speed-up over a sequential CPU implementation. 

In order to train on very large datasets that *do not fit* inside the memory of a single GPU, we then consider techniques for *distributed stochastic learning*. We propose a novel method for optimally *aggregating model updates* from worker nodes when the training data is distributed either by example or by feature. Using this technique, we demonstrate that one can scale out stochastic learning across up to 8 worker nodes without any significant loss of training time. Finally, we combine GPU acceleration with the *optimized distributed method* to train on a dataset consisting of 200 million training examples and 75 million features. We show by scaling out across 4 GPUs, one can attain a high degree of training accuracy in around 4 seconds: a 20x speed-up in training time compared to a multi-threaded, distributed implementation across 4 CPUs.