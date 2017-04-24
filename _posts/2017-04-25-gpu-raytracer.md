---
layout: post
title:  A modular GPU raytracer using OpenCL for non-interactive graphics
date: 2017-04-25
categories: [computer science]
tags: [computer graphics]

---


# A modular GPU raytracer using OpenCL for non-interactive graphics

* Authors: Henrique Nunes Jung, Vinicius Jurinic Cassol, Universidade do Vale do Rio dos Sinos, Escola Politecnica, Brazil
* [Publication: SBGames, 2016](http://www.sbgames.org/sbgames2016/downloads/anais/157507.pdf)
* [Github](https://github.com/henriquenj/rendergirl)

## Abstract

We describe the development of a modular plugin based raytracer renderer called *RenderGirl* suitable for running inside the OpenCL framework. We aim to take advantage of heterogeneous computing devices such as GPUs and many-core CPUs, focusing on parallelism. We implemented the traditional partitioning scheme called bounding volume hierarchies, where each scene is hierarchically subdivided into axis-aligned bounding boxes, so a ray may only need to traverse a subset of geometry by traversing the BVH and discarding objects it surely cannot hit, optimizing the rendering process. These structures were implemented on a many-core high parallel architecture suitable for OpenCL, which needed a specific binary tree structure implementation ready for stackless traversal on GPUs. RenderGirl is split between two main portions: Core and Interface, where the Core portions provide the bulk of ray-tracing operations and manage the communication with OpenCL; and the interfaces provide communication with a given host program, seeking modularity. In this paper we describe our results and performance gains with our partitioning scheme.


# Hybrid Ray Tracing Real time demo - Rigid Gems 2.0

This video is just a compilation of the ray tracing demo found at [http://www.rigidgems.sakura.ne.jp/](http://www.rigidgems.sakura.ne.jp/)

<iframe width="600" height="400" src="https://www.youtube.com/embed/pm85W-f7xuk" frameborder="0" allowfullscreen></iframe>

The music is Coriolan Overture, Op. 62 - composed by Beethoven