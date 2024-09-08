---
layout: post
title: Marginal-based Methods for Differentially Private Synthetic Data
date: 2024-09-08
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Marginal-based Methods for Differentially Private Synthetic Data](https://www.youtube.com/watch?v=UKzh9QgNRxA)

---



# Marginal-based Methods for Differentially Private Synthetic Data

* A Google TechTalk, presented by Ryan McKenna, 2021/12/08
* Differential Privacy for ML series.

## ABSTRACT 
Generating good quality DP synthetic data is the holy grail of DP research. Current SOTA is to fine-tune a pretrained generative model on private data using DPSGD and use it to generate DP synthetic data. But DP fine-tuning is cumbersome and we may not have access to the weights of pretrained foundation models.

In this work, we show that we can generate DP Synthetic Data via APIs (DPSDA), where we treat foundation models as blackboxes and only utilize their inference APIs. Such an approach can leverage the power of large foundation models whose model weights are unknown and is easy to use because it doesn't require any model training. However, this comes with greater challenges due to strictly more restrictive model access and the additional need to protect privacy from the API provider.

We present a new framework called Private Evolution (PE) to solve this problem and show its initial promise on synthetic images. Surprisingly, PE can match or even outperform state-of-the-art (SOTA) DP fine-tuning methods. For example, on CIFAR10 (with ImageNet as the public data), we achieve FID of 8 with privacy cost ϵ = 0.67, significantly improving the previous SOTA from ϵ = 32. Based on joint work with Zinan Lin, Janardhan Kulkarni, Harsha Nori and Sergey Yekhanin.

<iframe width="600" height="400" src="https://www.youtube.com/embed/UKzh9QgNRxA?si=n7oAeDBfK9DNc0bX" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>