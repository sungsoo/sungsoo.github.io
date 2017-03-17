---
layout: post
title: Stable Neural Style Transfer
date: 2017-03-17
categories: [computer science]
tags: [machine learning]

---


## Article Source
* Title: [Stable Neural Style Transfer](https://www.youtube.com/watch?v=8u3Hkbev2Gg)


---


Stable Neural Style Transfer
====================================

The paper "Stable and Controllable Neural Texture Synthesis and
Style Transfer Using Histogram Losses" is available here:

[https://arxiv.org/abs/1701.08893](https://arxiv.org/abs/1701.08893)

Texture synthesis survey: [http://www-sop.inria.fr/reves/Basilic/2009/WLKT09/](http://www-sop.inria.fr/reves/Basilic/2009/WLKT09/)

<iframe width="600" height="400" src="https://www.youtube.com/embed/8u3Hkbev2Gg" frameborder="0" allowfullscreen></iframe>


## Stable and Controllable Neural Texture Synthesis and Style Transfer Using Histogram Losses

Abstract
--------

Recently, methods have been proposed that perform texture synthesis and style transfer by using convolutional neural networks. These methods are exciting because they can in some cases create results with state-of-the-art quality. However, in this paper, we show these methods also have limitations in *texture quality*, *stability*, *requisite parameter tuning*, and *lack of user controls*. This paper presents a *multiscale synthesis pipeline* based on convolutional neural networks that ameliorates these issues. We first give a mathematical explanation of the source of instabilities in many previous approaches. We then improve these instabilities by using histogram losses to synthesize textures that better statistically match the exemplar. We also show how to integrate localized style losses in our multiscale framework. These losses can improve the quality of large features, improve the separation of content and style, and offer artistic controls such as paint by numbers. We demonstrate that our approach offers improved quality, convergence in fewer iterations, and more stability over the optimization.