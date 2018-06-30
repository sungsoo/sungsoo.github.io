---
layout: post
title: Beautiful Layered Materials, Instantly
date: 2018-07-01
categories: [computer science]
tags: [computer graphics]

---

## Article Source
* Title: [Beautiful Layered Materials, Instantly](https://www.youtube.com/watch?v=YTup-cvELK0)

---


# Efficient Rendering of Layered Materials using an Atomic Decomposition with Statistical Operators


## Abstract

We derive a novel framework for the efficient analysis and computation of light transport within layered materials. Our derivation consists in two steps. First, we decompose light transport into a set of atomic operators that act on its directional statistics. Specifically, our operators consist of reflection, refraction, scattering, and absorption, whose combinations are sufficient to describe the statistics of light scattering multiple times within layered structures. We show that the first three directional moments (energy, mean and variance) already provide an accurate summary. Second, we extend the adding-doubling method to support arbitrary combinations of such operators efficiently. During shading, we map the directional moments to BSDF lobes. We validate that the resulting BSDF closely matches the ground truth in a lightweight and efficient form. Unlike previous methods we support an arbitrary number of textured layers, and demonstrate a practical and accurate rendering of layered materials with both an offline and real-time implementation that are free from per-material precomputation.

<iframe width="600" height="400" src="https://www.youtube.com/embed/YTup-cvELK0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

<a href="https://drive.google.com/open?id=1iRNnqSCGNTcXQQDBUiJU8ySVJqdV4H_6"><img src="https://belcour.github.io/blog/data/images/icon_pdf.png" height="32px">paper</a> &nbsp;
<a href="https://drive.google.com/open?id=1FiwUP21cVQDhs2mZERaSJZDxP7gAAFWx"><img src="https://belcour.github.io/blog/data/images/icon_pdf.png" height="32px">supp. pdf</a> &nbsp;
<a href="https://drive.google.com/open?id=1V7BgAAaf4VMDanSWp_rFuAlQj7qfKaQ8"><img src="https://belcour.github.io/blog/data/images/icon_zip.png" height="32px">supp. code</a> &nbsp;
<a href="https://youtu.be/wM5E-NJtaug">
<img src="https://belcour.github.io/blog/data/images/icon_video.png" height="32px">video</a> &nbsp;


<iframe width="600" height="400" src="https://www.youtube.com/embed/wM5E-NJtaug" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>