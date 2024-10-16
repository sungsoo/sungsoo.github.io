---
layout: post
title:  Understanding and Improving Efficient Language Models
date: 2024-10-21
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Understanding and Improving Efficient Language Models](https://www.youtube.com/watch?v=DmuZ3ckl8rs)

---


# Understanding and Improving Efficient Language Models


## Abstract

### Transformers as a Computational Model

A key bottleneck in machine learning is compute: ML is succeeding at modeling text, code, and even DNA, but to reach the full potential, we need more resources than we currently have. The Transformer architecture, which powers industry models, requires compute and memory to grow with the input size, precluding dreams of modeling inputs containing millions of lines of code or the 3.2Bn nucleotide pairs in genome sequences. Candidate efficient language models (LMs), which seek to reduce the compute and memory requirements relative to Transformers, are emerging at a rapid pace. However, deviating from the Transformer-orthodoxy is a major risk: models are served to millions of users and take billions of dollars to train, and we have limited insight into how alternatives will impact quality. In this talk, I first discuss our research on developing our understanding of why architectures work well, in order to distill them into their most efficient forms. Despite the breadth of skills required in language modeling (syntax, fact memorization, reasoning) and breadth of efficient LMs being proposed, our ICLR 2024 work found that a single skill called associative recall (AR) surprisingly explains 80%+ of the language modeling quality difference between Transformers and a popular class of efficient LMs. A LM performs AR if it is able to recall and use information that it has seen earlier in the input. We will use AR to theoretically and empirically explain the tradeoffs across several classes of efficient LM architectures. I will then share how we use this theoretical analysis in our ICML 2024 work (Spotlight top 3.5% of 10K papers) to develop new hardware-efficient ML architectures (BASED and JRT), which have expanded the Pareto-frontier of the quality-efficiency tradeoff space beyond prior LMs.

<iframe width="600" height="400" src="https://www.youtube.com/embed/DmuZ3ckl8rs?si=6q0a-Gybruglqayv" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>