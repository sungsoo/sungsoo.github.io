---
layout: post
title: Evolutionary Generative Adversarial Networks
date: 2018-04-14
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Evolutionary Generative Adversarial Networks](https://arxiv.org/pdf/1803.00657.pdf)
* Speaker: Chaoyue Wang, Chang Xu, Xin Yao, Dacheng Tao

---


# Evolutionary Generative Adversarial Networks

* Paper: [PDF](https://arxiv.org/pdf/1803.00657.pdf)


## Abstract

*Generative adversarial networks* (GAN) have been effective for learning generative models for real-world data. However, existing GANs (GAN and its variants) tend to suffer from training problems such as *instability* and *mode collapse*. In this paper, we propose a novel GAN framework called *evolutionary generative adversarial networks* (E-GAN) for *stable* GAN training and improved generative performance. Unlike existing GANs, which employ a pre-defined adversarial objective function alternately training a generator and a discriminator, we utilize different adversarial training objectives as *mutation* operations and evolve a population of generators to adapt to the environment (i.e., the discriminator). We also utilize an evaluation mechanism to measure the quality and diversity of generated samples, such that only well-performing generator(s) are preserved and used for further training. In this way, E-GAN overcomes the limitations of an individual adversarial training objective and always preserves the best offspring, contributing to progress in and the success of GANs. Experiments on several datasets demonstrate that E-GAN achieves convincing generative performance and reduces the training problems inherent in existing GANs.

<iframe width="600" height="400" src="https://www.youtube.com/embed/ni6P5KU3SDU" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>