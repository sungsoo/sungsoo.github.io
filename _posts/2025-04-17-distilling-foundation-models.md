---
layout: post
title: Inference Scaling; A New Frontier for AI Capability 
date: 2025-04-17
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Distilling Foundation Models via Energy Hessians](https://www.youtube.com/watch?v=TZbpxlLWO_Q)

---


# [Distilling Foundation Models via Energy Hessians](https://www.youtube.com/watch?v=TZbpxlLWO_Q)

* Paper: Towards Fast, Specialized Machine Learning Force Fields: Distilling Foundation Models via Energy Hessians

[https://arxiv.org/abs/2501.09009](https://arxiv.org/abs/2501.09009)

Abstract: The foundation model (FM) paradigm is transforming Machine Learning Force Fields (MLFFs), leveraging general-purpose representations and scalable training to perform a variety of computational chemistry tasks. Although MLFF FMs have begun to close the accuracy gap relative to first-principles methods, there is still a strong need for faster inference speed. Additionally, while research is increasingly focused on general-purpose models which transfer across chemical space, practitioners typically only study a small subset of systems at a given time. At test time, MLFFs must also obey physical constraints unique to the downstream use case, such as energy conservation for molecular dynamics simulations. This underscores the need for fast, specialized MLFFs relevant to specific downstream applications, which preserve test-time physical soundness while maintaining train-time scalability. In this work, we introduce a method for transferring general-purpose representations from MLFF foundation models to smaller, faster MLFFs specialized to specific regions of chemical space. We formulate our approach as a knowledge distillation procedure, where the smaller “student” MLFF is trained to match the Hessians of the energy predictions of the “teacher” foundation model. We demonstrate our approach across multiple recent foundation models, large-scale datasets, chemical subsets, and downstream tasks. Our specialized MLFFs can be up to 20 × faster than the original foundation model, while retaining, and in some cases exceeding, its performance and that of undistilled models. We also show that distilling from a teacher model with a direct force parameterization into a student model trained with conservative forces (i.e., computed as derivatives of the potential energy) successfully leverages the representations from the large-scale teacher for improved accuracy, while maintaining energy conservation during test-time molecular dynamics simulations. More broadly, our work suggests a new paradigm for MLFF development, in which foundation models are released along with smaller, specialized simulation “engines” for common chemical subsets. The implementation of our method is available at [https://github.com/ASK-Berkeley/MLFF-distill](https://github.com/ASK-Berkeley/MLFF-distill)

<iframe width="600" height="400" src="https://www.youtube.com/embed/TZbpxlLWO_Q?si=scNBZUNnJmKTBv6x" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
