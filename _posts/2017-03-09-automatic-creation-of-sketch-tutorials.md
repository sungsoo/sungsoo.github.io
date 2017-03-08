---
layout: post
title: Automatic Creation of Sketch Tutorials
date: 2017-03-09
categories: [computer science]
tags: [machine learning]

---


## Article Source

* Title: [Automatic Creation of Sketch Tutorials](http://hgpu.org/?p=17022)
* Authors: Sercan O. Arik, Mike Chrzanowski, Adam Coates, Gregory Diamos, Andrew Gibiansky, Yongguo Kang, Xian Li, John Miller, Jonathan Raiman, Shubho Sengupta, Mohammad Shoeybi (Baidu)


-----

Automatic Creation of Sketch Tutorials
=====================================

The paper "How2Sketch: Generating Easy-To-Follow Tutorials for Sketching 3D Objects" is available here:

* [http://geometry.cs.ucl.ac.uk/projects/2017/how2sketch/](http://geometry.cs.ucl.ac.uk/projects/2017/how2sketch/)

<iframe width="600" height="400" src="https://www.youtube.com/embed/brs1qCDzRdk" frameborder="0" allowfullscreen></iframe>

## Abstract

Accurately drawing 3D objects is difficult for untrained individuals, as it requires an understanding of perspective and its effects on geometry and proportions. Step-by-step tutorials break the complex task of sketching an entire object down into easy-to-follow steps that even a novice can follow. However, creating such tutorials *requires expert knowledge* and is *time-consuming*. As a result, the availability of tutorials for a given object or viewpoint is limited. How2Sketch (H2S) addresses this problem by automatically generating easy-to-follow tutorials for arbitrary 3D objects. Given a segmented 3D model and a camera viewpoint, H2S computes a sequence of steps for constructing a drawing scaffold comprised of geometric primitives, which helps the user draw the final contours in correct perspective and proportion. To make the drawing scaffold easy to construct, the algorithm solves for an ordering among the scaffolding primitives and explicitly makes small geometric modifications to the size and location of the object parts to simplify relative positioning. Technically, we formulate this scaffold construction as a single selection problem that simultaneously solves for the ordering and geometric changes of the primitives. We generate different tutorials on man-made objects using our method and evaluate how easily the tutorials can be followed with a user study.
