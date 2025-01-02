---
layout: post
title: Causal Inference and Large Language Models
date: 2025-01-02
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Causal Inference and Large Language Models](https://www.youtube.com/watch?v=RbzAtlVopAU&list=PLeKJtN5YzWyM4q_GRnF_YWU7_4GRfTrH5&index=7)

---



# Causal Inference and Large Language Models

## Abstract

A key challenge in conducting causal analyses is that identifying the correct assumptions, such as the causal graph, needs considerable manual effort. Since a causal graph cannot be learned from data alone, domain experts face the difficult task of providing underlying causal relationships and also verifying them. In this talk, I will discuss how large language models (LLMs) provide new capabilities that were so far understood to be restricted to domain experts, such as inferring the direction of causal relationships, identifying any missing relationships, or verifying the underlying assumptions in a causal analysis. First, I will present results on the causal graph discovery capabilities of LLMs. Algorithms based on GPT-3.5 and 4 outperform existing algorithms on a wide variety of datasets: Tubingen pairwise dataset (97%, 13 points gain) spanning domains such as physics, engineering, biology, and soil science; arctic sea ice coverage dataset (0.22 hamming distance, 11 points gain); and a medical pain diagnosis dataset. We find that LLMs infer causal relationships by relying on information such as variable names, a process that we call knowledge-based reasoning that is distinct from and complementary to non-LLM based causal discovery. Second, I will describe how these capabilities of LLMs can be extended for useful tasks in the causal inference pipeline: identifying any missing confounders, suggesting instrumental variables, suggesting special variables like negative control that can validate causal analyses, and reasoning about root cause attribution. At the same time, LLMs exhibit unpredictable failure modes and I will provide some techniques to interpret their robustness, especially with respect to dataset memorization. Looking ahead, by capturing domain knowledge about causal mechanisms, LLMs may open new frontiers for advancing causal inference research and enable the widespread adoption of causal methods.


<iframe width="600" height="400" src="https://www.youtube.com/embed/RbzAtlVopAU?si=2woRLCOS8V1PtK-u" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>