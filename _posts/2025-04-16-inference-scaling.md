---
layout: post
title: Inference Scaling; A New Frontier for AI Capability 
date: 2025-04-16
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Inference Scaling; A New Frontier for AI Capability](https://www.youtube.com/watch?v=-pi4lI6FnT4)

---


# [Inference Scaling; A New Frontier for AI Capability](https://www.youtube.com/watch?v=-pi4lI6FnT4)

## Abstract

Scaling laws, which demonstrate a predictable relationship between AI’s performance and the amount of training data, compute, and model size continue to drive progress in AI. In this talk, we present inference compute as a new frontier for scaling LLMs. Our recent work, Large Language Monkeys, shows that coverage - the fraction of problems solved by any attempt - persistently scales with the number of samples over four orders of magnitude. Interestingly, the relationship between coverage and the number of samples is log-linear and can be modeled with an exponentiated power law, suggesting the existence of inference-time scaling laws. In domains where answers can be automatically verified, like coding and formal proofs, we show that these increases in coverage directly translate into improved performance. In domains without verifiers, we find that identifying correct samples out of many generations remains challenging. Common methods to pick correct solutions from a collection of samples, such as majority voting or reward models, plateau beyond several hundred samples and fail to fully scale with the sample budget. We then present Archon, a framework for automatically designing effective inference-time systems composed of one or more LLMs. Archon selects, combines, and stacks layers of inference-time operation such as repeated sampling, fusion, ranking, model based unit testing, and verification to construct optimized LLM systems for target benchmarks. It alleviates the need for automated verifiers by enabling strong pass@1 performance across diverse instruction following, reasoning, math, and coding tasks. Finally, we discuss some of our recent hardware acceleration techniques to improve the computational efficiency of serving LLMs.

<iframe width="600" height="400" src="https://www.youtube.com/embed/-pi4lI6FnT4?si=wOvgm3GdYSYiIO09" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>