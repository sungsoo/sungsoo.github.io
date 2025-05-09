---
layout: post
title: Leveraging Activation Sparsity for Training Deep Neural Networks
date: 2017-05-07
categories: [computer science]
tags: [computer graphics]

---

Compressing DMA Engine; Leveraging Activation Sparsity for Training Deep Neural Networks
========================

## Abstract

Popular deep learning frameworks require users to fine-tune their memory usage so that the training data of a *deep neural network* (DNN) fits within the GPU physical memory. Prior work tries to address this restriction by virtualizing the memory usage of DNNs, enabling both CPU and GPU memory to be utilized for memory allocations. Despite its merits, virtualizing memory can incur significant performance overheads when the time needed to copy data back and forth from CPU memory is higher than the latency to perform the computations required for DNN forward and backward propagation. We introduce a high-performance virtualization strategy based on a "*compressing DMA engine*" (cDMA) that drastically reduces the size of the data structures that are targeted for CPU-side allocations. The cDMA engine offers an average 2.6x (maximum 13.8x) compression ratio by exploiting the sparsity inherent in offloaded data, improving the performance of virtualized DNNs by an average 32% (maximum 61%).

* [Paper](https://arxiv.org/pdf/1705.01626)

