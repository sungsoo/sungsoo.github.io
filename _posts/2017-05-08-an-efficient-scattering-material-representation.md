---
layout: post
title: An Efficient Scattering Material Representation
date: 2017-05-08
categories: [computer science]
tags: [computer graphics]

---

An Efficient Scattering Material Representation
========================

## Abstract

Volumetric micro-appearance models have provided remarkably high-quality renderings, but are highly data intensive and usually require tens of gigabytes in storage. When an object is viewed from a distance, the highest level of detail offered by these models is usually unnecessary, but traditional linear downsampling weakens the object's intrinsic shadowing structures and can yield poor accuracy. We introduce a *joint optimization of single-scattering albedos and phase functions* to accurately downsample heterogeneous and anisotropic media. Our method is built upon scaled phase functions, a new representation combining abledos and (standard) phase functions. We also show that modularity can be exploited to greatly reduce the amortized optimization overhead by allowing multiple synthesized models to share one set of downsampled parameters. Our optimized parameters generalize well to novel lighting and viewing configurations, and the resulting data sets offer several orders of magnitude storage savings.

<iframe width="600" height="400" src="https://www.youtube.com/embed/HTUxsrO-P_8" frameborder="0" allowfullscreen></iframe>

The paper "Downsampling Scattering Parameters for Rendering Anisotropic Media" and its source code is available here:

* [Web site](https://shuangz.com/projects/multires-sa16/)
* [Paper](https://shuangz.com/projects/multires-sa16/multires-sa16.pdf)

