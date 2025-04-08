---
layout: post
title: How Do Hollywood Movies Render Smoke? 
date: 2017-02-14
categories: [computer science]
tags: [computer graphics]

---


How Do Hollywood Movies Render Smoke? 
===

The paper "*Importance Sampling Techniques for Path Tracing in Participating Media*" is available here: 
[https://www.solidangle.com/research/egsr2012_volume.pdf](https://www.solidangle.com/research/egsr2012_volume.pdf)

Implementation in 2k (binary + video without code): 
[https://users.cg.tuwien.ac.at/zsolnai/gfx/volumetric-path-tracing-with-equiangular-sampling-in-2k/](https://users.cg.tuwien.ac.at/zsolnai/gfx/volumetric-path-tracing-with-equiangular-sampling-in-2k/)

Solid Angle (Arnold renderer) webpage + Oscar award headline:

* https://www.solidangle.com/
* [https://www.solidangle.com/news/2017-scitech-award/](https://www.solidangle.com/news/2017-scitech-award/)

<iframe width="600" height="400" src="https://www.youtube.com/embed/XbuEYcFfl6s" frameborder="0" allowfullscreen></iframe>

# Importance Sampling Techniques for Path Tracing in Participating Media

## Abstract


We introduce a set of robust importance sampling techniques which allow efficient calculation of direct and indirect lighting from arbitrary light sources in both homogeneous and heterogeneous media. We show how to distribute samples along a ray proportionally to the incoming radiance for point and area lights. In heterogeneous media, we decouple ray marching from light calculations by computing a representation of the transmittance function that can be quickly evaluated during sampling, at the cost of a small amount of bias. This representation also allows the calculation of another probability density function which can direct samples to regions most likely to scatter light. These techniques are orthogonal and can be combined via multiple importance sampling to further reduce variance. Our method has very modest per-ray memory requirements and does not require any preprocessing, making it simple to integrate into production ray tracing based renderers.
