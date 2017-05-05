---
layout: post
title: Deep Photo Style Transfer
date: 2017-05-05
categories: [computer science]
tags: [computer graphics, machine learning]

---

Deep Photo Style Transfer
========================

## Abstract

This paper introduces a deep-learning approach to photographic style transfer that handles a large variety of image content while faithfully transferring the reference style. Our approach builds upon the recent work on painterly transfer that separates style from the content of an image by considering different layers of a neural network. However, as is, this approach is not suitable for photorealistic style transfer. Even when both the input and reference images are photographs, the output still exhibits distortions reminiscent of a painting. Our contribution is to constrain the transformation from the input to the output to be locally affine in colorspace, and to express this constraint as a custom fully differentiable energy term. We show that this approach successfully suppresses distortion and yields satisfying photorealistic style transfers in a broad variety of scenarios, including transfer of the time of day, weather, season, and artistic edits.

<iframe width="600" height="400" src="https://www.youtube.com/embed/HTUxsrO-P_8" frameborder="0" allowfullscreen></iframe>

The paper "Deep Photo Style Transfer" is and its source code is available here:

* [Paper](https://arxiv.org/pdf/1703.07511.pdf)
* [Source code](https://github.com/luanfujun/deep-photo-styletransfer)

