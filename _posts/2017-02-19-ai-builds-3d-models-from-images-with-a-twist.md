---
layout: post
title: AI Builds 3D Models From Images With a Twist
date: 2017-02-19
categories: [computer science]
tags: [computer graphics, machine learning]

---



# AI Builds 3D Models From Images With a Twist


The paper "IM2CAD" is available here:

* [http://homes.cs.washington.edu/~izadinia/im2cad.html](http://homes.cs.washington.edu/~izadinia/im2cad.html)

LSUN Challenge datasets: http://lsun.cs.princeton.edu/2016/

More related papers are available here:

* [http://www.cs.toronto.edu/~fidler/projects/rent3D.html](http://www.cs.toronto.edu/~fidler/projects/rent3D.html)
* [http://web.engr.illinois.edu/~slazebni/publications/iccv15_informative.pdf](http://web.engr.illinois.edu/~slazebni/publications/iccv15_informative.pdf)
* [http://ieeexplore.ieee.org/document/6619238/?reload=true](http://ieeexplore.ieee.org/document/6619238/?reload=true)

## Abstract

Given a single photo of a room and a large database of furniture CAD models, our goal is to reconstruct a scene that is as similar as possible to the scene depicted in the photograph, and composed of objects drawn from the database. We present a *completely automatic system* to address this IM2CAD problem that produces high quality results on challenging imagery from real estate web sites. Our approach iteratively optimizes the placement and scale of objects in the room to best match scene renderings to the input photo, used image comparison metrics trained using deep convolutional neural nets. By operating jointly on the full scene at once, we account for inter-object occlusions.

<iframe width="600" height="400" src="https://www.youtube.com/embed/kf-KViOuktc" frameborder="0" allowfullscreen></iframe>