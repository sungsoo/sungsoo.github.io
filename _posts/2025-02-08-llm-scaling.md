---
layout: post
title: Scaling LLM Test-Time Compute
date: 2025-02-08
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Scaling LLM Test-Time Compute](https://www.youtube.com/watch?v=OXwGp9YeuBg)

---


# Scaling LLM Test-Time Compute

## Abstract

Enabling LLMs to improve their outputs by using more test-time computation is a critical step towards building generally self-improving agents that can operate on open-ended natural language. In this paper, we study the scaling of inference-time computation in LLMs, with a focus on answering the question: if an LLM is allowed to use a fixed but non-trivial amount of inference-time compute, how much can it improve its performance on a challenging prompt? Answering this question has implications not only on the achievable performance of LLMs, but also on the future of LLM pretraining and how one should tradeoff inference-time and pre-training compute. Despite its importance, little research attempted to understand the scaling behaviors of various test-time inference methods. Moreover, current work largely provides negative results for a number of these strategies. In this work, we analyze two primary mechanisms to scale test-time computation: (1) searching against dense, process-based verifier reward models; and (2) updating the model's distribution over a response adaptively, given the prompt at test time. We find that in both cases, the effectiveness of different approaches to scaling test-time compute critically varies depending on the difficulty of the prompt. This observation motivates applying a "compute-optimal" scaling strategy, which acts to most effectively allocate test-time compute adaptively per prompt. Using this compute-optimal strategy, we can improve the efficiency of test-time compute scaling by more than 4x compared to a best-of-N baseline. Additionally, in a FLOPs-matched evaluation, we find that on problems where a smaller base model attains somewhat non-trivial success rates, test-time compute can be used to outperform a 14x larger model.

Bio: I'm a third year PhD student at UC Berkeley who's research focuses on topics such as reasoning, scaling-laws, and synthetic data with LLMs. Previously I was a student researcher at Google Deepmind where I did the research I am going to talk about today.


<iframe width="600" height="400" src="https://www.youtube.com/embed/OXwGp9YeuBg?si=Gt3ihHK9rri5cPBv" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>