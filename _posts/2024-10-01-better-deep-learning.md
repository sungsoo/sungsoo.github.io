---
layout: post
title: Toward a better Deep Learning
date: 2024-10-01
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Rich Sutton, Toward a better Deep Learning](https://www.youtube.com/watch?v=YLiXgPhb8cQ)

---



# Toward a better Deep Learning


* Viacheslav Borovitskiy, Alexander Terenin
* [Slides](https://vab.im/download/2024-07-15-Geometric-Probabilistic-Models-Tutorial/)

## Abstract

Artificial intelligence needs better deep learning methods because current algorithms fail in continual learning settings, losing plasticity, forgetting catastrophically, and collapsing in their RL policies. I seek a design for a new class of deep learning methods that are dynamic (changing) at three levels: 1) in their weights, 2) in their per-weight step-size parameters, and 3) in their pattern of interconnection. The first step is distinguishing between the part of the network that is important to its current functioning (the backbone) from the part that does not yet contribute to its functioning (the fringe). This short talk explores new ideas for finding, protecting, and slowly growing the backbone, and new ideas for creating features within the fringe through “imprinting”, “master units”, and “shadow weights”, together with advanced step-size optimization. These are the first steps toward achieving dynamic deep learning.

<iframe width="600" height="400" src="https://www.youtube.com/embed/YLiXgPhb8cQ?si=HoANEqUXeMiS0PP1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>