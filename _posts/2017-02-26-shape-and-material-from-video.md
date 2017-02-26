---
layout: post
title: Shape and Material from Video
date: 2017-02-26
categories: [computer science]
tags: [computer graphics]

---






# Shape and Material from Video


The paper "Recovering Shape and Spatially-Varying Surface Reflectance under Unknown Illumination" is available here:

[http://www.cs.wm.edu/~ppeers/showPublication.php?id=Xia:2016:RSS](http://www.cs.wm.edu/~ppeers/showPublication.php?id=Xia:2016:RSS)

## Recovering Shape and Spatially-Varying Surface Reflectance under Unknown Illumination

## Abstract

We present a novel integrated approach for estimating both *spatially-varying surface reflectance* and *detailed geometry* from a video of a rotating object under unknown static illumination. Key to our method is the decoupling of the recovery of normal and surface reflectance from the estimation of surface geometry. We define an apparent normal field with corresponding reflectance for each point (including those not on the object's surface) that best explain the observations. We observe that the object's surface goes through points where the apparent normal field and corresponding reflectance exhibit a high degree of consistency with the observations. However, estimating the apparent normal field requires knowledge of the unknown incident lighting. We therefore formulate the recovery of shape, surface reflectance, and incident lighting, as an iterative process that alternates between estimating shape and lighting, and simultaneously recovers surface reflectance at each step. To recover the shape, we first form an initial surface that passes through locations with consistent apparent temporal traces, followed by a refinement that maximizes the consistency of the surface normals with the underlying apparent normal field. To recover the lighting, we rely on appearance-from-motion using the recovered geometry from the previous step. We demonstrate our integrated framework on a variety of synthetic and real test cases exhibiting a wide variety of materials and shape.

<iframe width="600" height="400" src="https://www.youtube.com/embed/ZUa5sNVSjGw" frameborder="0" allowfullscreen></iframe>