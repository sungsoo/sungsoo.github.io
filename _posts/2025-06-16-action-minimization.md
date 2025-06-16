---
layout: post
title: Action-Minimization Meets Generative Modeling 
date: 2025-06-16
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# [Action-Minimization Meets Generative Modeling: Efficient Transition Path Sampling](https://www.youtube.com/watch?v=YAWo8gKi7b4) 

* [Paper: Action-Minimization Meets Generative Modeling: Efficient Transition Path Sampling with the Onsager-Machlup](https://arxiv.org/abs/2504.18506)


## Abstract


Transition path sampling (TPS), which involves finding probable paths connecting two points on an energy landscape, remains a challenge due to the complexity of real-world atomistic systems. Current machine learning approaches use expensive, task-specific, and data-free training procedures, limiting their ability to benefit from recent advances in atomistic machine learning, such as high-quality datasets and large-scale pre-trained models. In this work, we address TPS by interpreting candidate paths as trajectories sampled from stochastic dynamics induced by the learned score function of pre-trained generative models, specifically denoising diffusion and flow matching. Under these dynamics, finding high-likelihood transition paths becomes equivalent to minimizing the Onsager-Machlup (OM) action functional. This enables us to repurpose pre-trained generative models for TPS in a zero-shot manner, in contrast with bespoke, task-specific TPS models trained in previous work. We demonstrate our approach on varied molecular systems, obtaining diverse, physically realistic transition pathways and generalizing beyond the pre-trained model's original training dataset. Our method can be easily incorporated into new generative models, making it practically relevant as models continue to scale and improve with increased data availability.

<iframe width="600" height="400" src="https://www.youtube.com/embed/YAWo8gKi7b4?si=ETVuXtlzGhdf5DBh" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>