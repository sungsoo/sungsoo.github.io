---
layout: post
title: Real-time Fiber-level Cloth Rendering
date: 2017-03-01
categories: [computer science]
tags: [computer graphics]

---


## Article Source

* Title: [Real-time Fiber-level Cloth Rendering](http://www.cs.utah.edu/~kwu/rtfr.html)
* Authors: [Kui Wu](http://www.cs.utah.edu/~kwu/), [Cem Yuksel](http://www.cemyuksel.com/)

-----

Real-time Fiber-level Cloth Rendering
=====================================

## Overview

Here is also two minute overview video made by Károly Zsolnai-Fehér

<iframe width="600" height="400" src="https://www.youtube.com/embed/JzOc_NNY_zY" frameborder="0" allowfullscreen></iframe>

The 3rd Best Paper & The 2nd Best Presentation Awards

![](http://www.cs.utah.edu/~kwu/rtfr.png)

## Abstract

Modeling cloth with *fiber-level geometry* can produce highly realistic
details. However, rendering fiber-level cloth models not only has a *high
memory cost* but it also has a *high computation cost* even for offline
rendering applications. In this paper we present a real-time fiber-level
cloth rendering method for current GPUs. Our method procedurally
generates fiber-level geometric details *on-the-fly* using *yarn-level
control points* for *minimizing the data transfer* to the GPU. We also
reduce the rasterization operations by collectively representing the
fibers near the center of each ply that form the yarn structure.
Moreover, we employ a *level-of-detail strategy* to minimize or completely
eliminate the generation of fiber-level geometry that would have little
or no impact on the final rendered image. Furthermore, we introduce a
simple yarn-level *ambient occlusion approximation* and *self-shadow
computation method* that allows lighting with self-shadows using
relatively low-resolution shadow maps. We demonstrate the effectiveness
of our approach by comparing our simplified fiber geometry to
procedurally generated references and display knitwear containing more
than a hundred million individual fiber curves at real-time frame rates
with shadows and ambient occlusion.

![](http://www.cs.utah.edu/~kwu/fiber_combine.png)

An example yarn model with our core fibers and regular fibers, and the
comparison of our full model to a reference model generated offline

![](http://www.cs.utah.edu/~kwu/shadow_component.png)

Shadow components: A glove model showing the three shadow components:
shadow map, self-shadows, and ambient occlusion

## Paper [[**Preprint**](http://www.cs.utah.edu/~kwu/rtfr.pdf)] (PDF, 13Mb) 

## Data [[**Yarn-level Cloth Models**](http://www.cemyuksel.com/research/yarnmodels/)] 

## Demo

### Citation 

Kui Wu, Cem Yuksel, Real-time Fiber-level Cloth Rendering, ACM SIGGRAPH
Symposium on Interactive 3D Graphics and Games (I3D 2017).

### Bibtex 

```
@inproceedings{Wu2017,
author = {Kui Wu and Cem Yuksel},
title = {Real-time Fiber-level Cloth Rendering},
booktitle = {ACM SIGGRAPH Symposium on Interactive 3D Graphics and Games
(I3D 2017)},
year = {2017},
numpages = {8},
location = {San Francisco, CA},
isbn = {978-1-4503-4886-7/17/03},
url = {http://doi.acm.org/10.1145/3023368.3023372},
doi = {10.1145/3023368.3023372},
publisher = {ACM},
address = {New York, NY, USA},
}
```

