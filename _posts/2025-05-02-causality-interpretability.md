---
layout: post
title: A Natural Fit for Mechanistic Interpretability  
date: 2025-05-02
categories: [artificial intelligence]
tags: [protein engineering]

---

### Article Source


* [[Causal Representation Learning; A Natural Fit for Mechanistic Interpretability](https://www.youtube.com/watch?v=1fy9XpSoG3o)

---

# [Causal Representation Learning; A Natural Fit for Mechanistic Interpretability](https://www.youtube.com/watch?v=1fy9XpSoG3o)

* [Safety-Guaranteed LLMs](https://simons.berkeley.edu/workshops/safety-guaranteed-llms)

As the landscape of artificial intelligence evolves, ensuring the safety and alignment of superintelligent language models (LLMs) is paramount. This workshop will delve into the theoretical foundations of LLM safety. This could include topics like the Bayesian view of LLM safety versus the RL view of safety and other theories. 

The flavor of this workshop is futuristic, focusing on how to ensure a superintelligent LLM/AI remains safe and aligned with humans.  This workshop is a joint effort of the Simons Institute and [IVADO](https://ivado.ca/en/).

### Key Topics:

* Bayesian Approaches to LLM Safety
* Reinforcement Learning Perspectives on Safety
* Theoretical Frameworks for Ensuring AI Alignment
* Case Studies and Practical Implications
* Future Directions in LLM Safety Research
    

## Abstract

Steering methods manipulate the representations of large language models (LLMs) to induce responses that have desired properties, e.g., truthfulness, offering a promising approach for LLM alignment without the need for fine-tuning. However, these methods typically require supervision from e.g., contrastive pairs of prompts that vary by a single target concept, which is costly to obtain and limits the speed of steering research. An appealing alternative is to use unsupervised approaches such as sparse autoencoders (SAEs) to map LLM embeddings to sparse representations that capture human-interpretable concepts. However, without further assumptions, SAEs may not be identifiable: they could learn latent dimensions that entangle multiple concepts, leading to unintentional steering of unrelated properties. In this talk, I'll introduce sparse shift autoencoders (SSAEs). These models map the differences between embeddings to sparse representations that capture concept shifts. Crucially, we show that SSAEs are identifiable from paired observations that vary by multiple unknown concepts, leading to accurate steering of single concepts without the need for supervision. We empirically demonstrate accurate steering across semi-synthetic and real-world language datasets using Llama-3.1 embeddings.

<iframe width="600" height="400" src="https://www.youtube.com/embed/1fy9XpSoG3o?si=nkz-VzxfViKYj1Zr" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>