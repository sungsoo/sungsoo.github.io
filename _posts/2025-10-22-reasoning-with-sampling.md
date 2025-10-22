---
layout: post
title: Reasoning with Sampling - Your Base Model is Smarter Than You Think
date: 2025-10-22
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# [Reasoning with Sampling: Your Base Model is Smarter Than You Think (Oct 2025)](https://www.youtube.com/watch?v=lhODD2XAHk8)


## Abstract

Frontier reasoning models have exhibited incredible capabilities across a wide array of disciplines, driven by posttraining large language models (LLMs) with reinforcement learning (RL). However, despite the widespread success of this paradigm, much of the literature has been devoted to disentangling truly novel behaviors that emerge during RL but are not present in the base models. In our work, we approach this question from a different angle, instead asking whether comparable reasoning capabilites can be elicited from base models at inference time by pure sampling, without any additional training. Inspired by Markov chain Monte Carlo (MCMC) techniques for sampling from sharpened distributions, we propose a simple iterative sampling algorithm leveraging the base models' own likelihoods. Over different base models, we show that our algorithm offers substantial boosts in reasoning that nearly match and even outperform those from RL on a wide variety of single-shot tasks, including MATH500, HumanEval, and GPQA. Moreover, our sampler avoids the collapse in diversity over multiple samples that is characteristic of RL-posttraining. Crucially, our method does not require training, curated datasets, or a verifier, suggesting broad applicability beyond easily verifiable domains.

* Title: Reasoning with Sampling: Your Base Model is Smarter Than You Think (Oct 2025)
* Link: [http://arxiv.org/abs/2510.14901v1](http://arxiv.org/abs/2510.14901v1)
* Date: October 2025

### Summary:
The paper proposes a training-free sampling algorithm for base language models to enhance reasoning capabilities, matching or outperforming reinforcement learning (RL) post-training on tasks like MATH500, HumanEval, and GPQA, while avoiding the diversity collapse characteristic of RL.

### Key Topics:
* Reinforcement Learning
* Large Language Models
* Sampling Algorithms
* Reasoning
* Markov Chain Monte Carlo (MCMC)
* Power Distributions
* Base Models


<iframe width="600" height="400" src="https://www.youtube.com/embed/lhODD2XAHk8?si=xHVJSCzlAnEWgVeL" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>