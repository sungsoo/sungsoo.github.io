---
layout: post
title: Stunning Video Game Graphics With Voxel Cone Tracing
date: 2017-01-04
categories: [computer science]
tags: [computer graphics]

---

# Stunning Video Game Graphics With Voxel Cone Tracing

* Paper: [Interactive Indirect Illumination Using Voxel Cone Tracing](https://research.nvidia.com/publication/interactive-indirect-illumination-using-voxel-cone-tracing)

## Abstract

Indirect illumination is an important element for realistic image synthesis, but its computation is expensive and highly dependent on the complexity of the scene and of the BRDF of the involved surfaces. While off-line computation and pre-baking can be acceptable for some cases, many applications (games, simulators, etc.) require real-time or interactive approaches to evaluate indirect illumination.

We present a novel algorithm to compute indirect lighting in real-time that avoids costly precomputation steps and is not restricted to low-frequency illumination. It is based on a hierarchical voxel octree representation generated and updated on the fly from a regular scene mesh coupled with an approximate voxel cone tracing that allows for a fast estimation of the visibility and incoming energy.

Our approach can manage two light bounces for both Lambertian and glossy materials at interactive framerates (25-70FPS). It exhibits an almost scene-independent performance and can handle complex scenes with dynamic content thanks to an interactive octree-voxelization scheme. In addition, we demonstrate that our voxel cone tracing can be used to efficiently estimate Ambient Occlusion.

<iframe width="600" height="400" src="https://www.youtube.com/embed/dQSzmngTbtw?list=PLujxSBD-JXgnqDD1n-V30pKtp6Q886x7e" frameborder="0" allowfullscreen></iframe>
