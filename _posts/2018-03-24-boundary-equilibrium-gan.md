---
layout: post
title: Boundary Equilibrium Generative Adversarial Networks
date: 2018-03-24
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title:[BEGAN-Boundary Equilibrium Generative Adversarial Networks](https://arxiv.org/abs/1703.10717)
* Authors: David Berthelot, Thomas Schumm, Luke Metz

---
# Boundary Equilibrium Generative Adversarial Networks

## Abstract

We propose a new *equilibrium enforcing method* paired with a loss derived from the Wasserstein distance for training *auto-encoder based Generative Adversarial Networks*. This method balances the generator and discriminator during training. Additionally, it provides a *new approximate convergence measure*, fast and stable training and high visual quality. We also derive a way of controlling the trade-off between image diversity and visual quality. We focus on the image generation task, setting a new milestone in visual quality, even at higher resolutions. This is achieved while using a relatively simple model architecture and a standard training procedure.

* [Paper](https://arxiv.org/pdf/1703.10717)

## Conditional Generative Adversarial Nets

## Abstract

*Generative Adversarial Nets* were recently introduced as a novel way to train *generative models*. In this work we introduce the *conditional* version of generative adversarial nets, which can be constructed by simply feeding the data, *y*, we wish to condition on to both the generator and discriminator. We show that this model can generate MNIST digits conditioned on class labels. We also illustrate how this model could be used to learn a *multi-modal model*, and provide preliminary examples of an application to image tagging in which we demonstrate how this approach can generate descriptive tags which are not part of training labels.

* [Paper](https://arxiv.org/pdf/1411.1784)

<iframe width="600" height="400" src="https://www.youtube.com/embed/iCgT8G4PkqI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## InfoGAN: Interpretable Representation Learning by Information Maximizing Generative Adversarial Nets

## Abstract

This paper describes InfoGAN, an *information-theoretic extension* to the Generative Adversarial Network that is able to learn disentangled representations in a completely unsupervised manner. InfoGAN is a generative adversarial network that also maximizes the mutual information between a small subset of the *latent variables* and the observation. We derive a lower bound to the mutual information objective that can be optimized efficiently, and show that our training procedure can be interpreted as a variation of the *Wake-Sleep algorithm*. Specifically, InfoGAN successfully disentangles writing styles from digit shapes on the MNIST dataset, pose from lighting of 3D rendered images, and background digits from the central digit on the SVHN dataset. It also discovers visual concepts that include hair styles, presence/absence of eyeglasses, and emotions on the CelebA face dataset. Experiments show that InfoGAN learns interpretable representations that are competitive with representations learned by existing fully supervised methods.

* [Paper](https://arxiv.org/pdf/1606.03657)
* [초짜 대학원생의 입장에서 이해하는 InfoGAN (1)](http://jaejunyoo.blogspot.com/2017/03/infogan-1.html)
* [초짜 대학원생의 입장에서 이해하는 InfoGAN (2)](http://jaejunyoo.blogspot.com/2017/03/infogan-2.html)