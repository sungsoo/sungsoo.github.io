---
layout: post
title: Geometric Detail Transfer
date: 2017-04-04
categories: [computer science]
tags: [computer graphics, machine learning]

---

## Article Source
* Title: [Learning Detail Transfer based on Geometric Features](http://www.chongyangma.com/publications/ld/index.html)
* Authors: Sema Berkiten, Maciej Halber, Justin Solomon, Chongyang Ma, Hao Li, Szymon Rusinkiewicz

---

Geometric Detail Transfer
===============

The paper "*Learning Detail Transfer based on Geometric Features*" is available here:

* [http://www.chongyangma.com/publications/ld/index.html](http://www.chongyangma.com/publications/ld/index.html)

[![](http://www.chongyangma.com/publications/ld/2017_ld_paper_thumbnail.png)](http://www.chongyangma.com/publications/ld/2017_ld_preprint.pdf)

The story of our recent software and hardware overhaul: 

* [https://www.patreon.com/posts/software-and-8622149](https://www.patreon.com/posts/software-and-8622149)

<iframe width="600" height="400" src="https://www.youtube.com/embed/wz9cUncBdxw" frameborder="0" allowfullscreen></iframe>

## Abstract 

The visual richness of computer graphics applications is frequently limited by the difficulty of obtaining *high-quality*, *detailed 3D models*. This paper proposes a method for realistically *transferring details* (specifically, *displacement maps*) from existing high-quality 3D models to simple shapes that may be created with easy-to-learn modeling tools. Our key insight is to use metric learning to find a *combination of geometric features* that successfully predicts detail-map similarities on the source mesh, and use the learned feature combination to drive the detail transfer. The latter uses a variant of *multi-resolution non-parametric texture synthesis*, augmented by a high-frequency detail transfer step in texture space. We demonstrate that our technique can successfully transfer details among a variety of shapes including furniture and clothing.

![](http://www.chongyangma.com/publications/ld/2017_ld_teaser.png)

*Our algorithm learns combinations of geometric features that predict the spatial arrangement of details on surfaces. Left: Input (target) mesh without details. Center/Right: Details from each source mesh (blue) are synthesized on the target mesh (pink).*

<iframe width="600" height="400" src="https://www.youtube.com/embed/iSm3Wb9b5B8" frameborder="0" allowfullscreen></iframe>