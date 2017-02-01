---
layout: post
title: Enhance Super Resolution From Google
date: 2017-01-30
categories: [computer science]
tags: [computer graphics]

---

Enhance! Super Resolution From Google
===

## RAISR: Rapid and Accurate Image Super Resolution


## Abstract

Given an image, we wish to produce an image of larger size with significantly more pixels and higher image quality. This is generally known as the *Single Image Super-Resolution* (SISR) problem. The idea is that with sufficient training data (corresponding pairs of low and high resolution images) we can learn set of filters (i.e. a mapping) that when applied to given image that is not in the training set, will produce a higher resolution version of it, where the learning is preferably low complexity. In our proposed approach, the run-time is more than one to two orders of magnitude faster than the best competing methods currently available, while producing results comparable or better than state-of-the-art. 
A closely related topic is image sharpening and contrast enhancement, i.e., improving the visual quality of a blurry image by amplifying the underlying details (a wide range of frequencies). Our approach additionally includes an extremely efficient way to produce an image that is significantly sharper than the input blurry one, without introducing artifacts such as halos and noise amplification. We illustrate how this effective sharpening algorithm, in addition to being of independent interest, can be used as a pre-processing step to induce the learning of more effective upscaling filters with built-in sharpening and contrast enhancement effect.

<iframe width="600" height="400" src="https://www.youtube.com/embed/WovbLx8C0yA" frameborder="0" allowfullscreen></iframe>

The paper "RAISR: Rapid and Accurate Image Super Resolution" is available here:

* [https://arxiv.org/abs/1606.01299](https://arxiv.org/abs/1606.01299)
