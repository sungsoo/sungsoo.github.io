---
layout: post
title: Differentially Private Synthetic Data via Foundation Model APIs
date: 2024-09-07
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Differentially Private Synthetic Data via Foundation Model APIs](https://www.youtube.com/watch?v=WvCfGPSzaUs)

---



# Differentially Private Synthetic Data via Foundation Model APIs

* A Google TechTalk, presented by Sivakanth Gopi, 2023/06/01
* A Google Algorithms Seminar.  

## ABSTRACT 
Generating good quality DP synthetic data is the holy grail of DP research. Current SOTA is to fine-tune a pretrained generative model on private data using DPSGD and use it to generate DP synthetic data. But DP fine-tuning is cumbersome and we may not have access to the weights of pretrained foundation models.

In this work, we show that we can generate DP Synthetic Data via APIs (DPSDA), where we treat foundation models as blackboxes and only utilize their inference APIs. Such an approach can leverage the power of large foundation models whose model weights are unknown and is easy to use because it doesn't require any model training. However, this comes with greater challenges due to strictly more restrictive model access and the additional need to protect privacy from the API provider.

We present a new framework called Private Evolution (PE) to solve this problem and show its initial promise on synthetic images. Surprisingly, PE can match or even outperform state-of-the-art (SOTA) DP fine-tuning methods. For example, on CIFAR10 (with ImageNet as the public data), we achieve FID of 8 with privacy cost ϵ = 0.67, significantly improving the previous SOTA from ϵ = 32. Based on joint work with Zinan Lin, Janardhan Kulkarni, Harsha Nori and Sergey Yekhanin.

About the speaker: Sivakanth Gopi is a senior researcher in the Algorithms group at Microsoft Research Redmond. He received a PhD in Computer Science from Princeton University in 2018 during which he received a STOC best paper award for his work on private information retrieval. He completed his undergraduate studies at IIT Bombay with a major in computer science and a minor in mathematics. His main research interests are in coding theory and its applications to both theory and practice, and differential privacy.


<iframe width="600" height="400" src="https://www.youtube.com/embed/WvCfGPSzaUs?si=HSdBhqoaCoCCMCss" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>