---
layout: post
title: Image Editing with Generative Adversarial Networks
date: 2017-04-02
categories: [computer science]
tags: [machine learning]

---


## Article Source

* Title: [Image Editing with Generative Adversarial Networks](https://www.youtube.com/watch?v=pqkpIfu36Os&spfreload=10) 
* Authors: [Jun-Yan Zhu et. al](https://people.eecs.berkeley.edu/~junyanz/projects/gvm/)

-----

Image Editing with Generative Adversarial Networks
=====================================

## Overview

The paper "Generative Visual Manipulation on the Natural Image Manifold" is available here:
[https://people.eecs.berkeley.edu/~junyanz/projects/gvm/](https://people.eecs.berkeley.edu/~junyanz/projects/gvm/)

The source code is available here: [https://github.com/junyanz/iGAN](https://github.com/junyanz/iGAN)

## Abstract

Realistic image manipulation is challenging because it requires modifying the image appearance in a user-controlled way, while preserving the realism of the result. Unless the user has considerable artistic skill, it is easy to "fall off" the manifold of natural images while editing. In this paper, we propose to learn the natural image manifold directly from data using a *generative adversarial neural network*. We then define a class of image editing operations, and constrain their output to lie on that learned manifold at all times. The model automatically adjusts the output keeping all edits as realistic as possible. All our manipulations are expressed in terms of constrained optimization and are applied in near-real time. We evaluate our algorithm on the task of realistic photo manipulation of shape and color. The presented method can further be used for changing one image to look like the other, as well as generating novel imagery from scratch based on user's scribbles.

<iframe width="600" height="400" src="https://www.youtube.com/embed/pqkpIfu36Os" frameborder="0" allowfullscreen></iframe>


## Generative Visual Manipulation on the Natural Image Manifold

#### In [ECCV'16](http://www.eccv2016.org/)


<iframe width="600" height="400" src="https://www.youtube.com/embed/9c4z6YsBGQ0" frameborder="0" allowfullscreen></iframe>

People
------

-   [Jun-Yan Zhu](http://www.eecs.berkeley.edu/~junyanz/)
-   [Philipp Krähenbühl](http://www.philkr.net/)
-   [Eli
    Shechtman](http://www.adobe.com/technology/people/seattle/eli-shechtman.html)
    ([Adobe](https://research.adobe.com/about-the-labs/ctl/))
-   [Alexei A. Efros](http://www.eecs.berkeley.edu/~efros/)

Paper
-----

ECCV 2016 [paper](https://arxiv.org/pdf/1609.03552v2.pdf), 6.2MB

[![paper thumbnail](https://people.eecs.berkeley.edu/~junyanz/projects/gvm/images/paper_thumbnail.jpg)](https://arxiv.org/pdf/1609.03552v2.pdf)

### Citation

Jun-Yan Zhu, Philipp Krähenbühl, Eli Shechtman and Alexei A. Efros.
"Generative Visual Manipulation on the Natural Image Manifold", in
European Conference on Computer Vision (**ECCV**). 2016.
[Bibtex](eccv16_gvm.bib)

Video
-----

[Video (Download), 74MB](gvm_video.mp4)


Code and Data: [Github](https://github.com/junyanz/iGAN)
--------------------------------------------------------

## Interactive Image Generation
Our system can create new imagery based on user's scribbles. Let's draw an outdoor scene. 

![](https://people.eecs.berkeley.edu/~junyanz/projects/gvm/images/demo_generation.jpg)

Here we demonstrate how to achieve the above result.

<iframe width="600" height="400" src="https://www.youtube.com/embed/5jfViPdYLic" frameborder="0" allowfullscreen></iframe>

We can use our drawing interface to design products as well.

<iframe width="600" height="400" src="https://www.youtube.com/embed/HOn8437TWPA" frameborder="0" allowfullscreen></iframe>

## Intelligent Image Editing

Our interactive system allows a user to manipulate image in a natural and realistic way.                                                       

<iframe width="600" height="400" src="https://www.youtube.com/embed/x0uWw8WLCVs" frameborder="0" allowfullscreen></iframe>

## Generative Image Transformation                                          
Our system can automatically transform the shape and color of one image to look like another image.

<iframe width="600" height="400" src="https://www.youtube.com/embed/FGqMt6hZhyg" frameborder="0" allowfullscreen></iframe>

Related Work
------------

-   Ian J. Goodfellow, Jean Pouget-Abadie, Mehdi Mirza, Bing Xu, David
    Warde-Farley, Sherjil Ozair, Aaron Courville, Yoshua Bengio
    [**"Generative Adversarial
    Networks"**](https://arxiv.org/abs/1406.2661), in NIPS 2014.
-   Alec Radford, Luke Metz and Soumith Chintala [**"Unsupervised
    Representation Learning with Deep Convolutional Generative
    Adversarial Networks"**](https://arxiv.org/abs/1511.06434), in
    ICLR 2016.
-   Jun-Yan Zhu, Yong Jae Lee and Alexei A. Efros. [**"AverageExplorer:
    Interactive Exploration and Alignment of Visual Data
    Collections"**](https://people.eecs.berkeley.edu/~junyanz/projects/averageExplorer/index.html),
    in SIGGRAPH 2014.
-   Jun-Yan Zhu, Philipp Krähenbühl, Eli Shechtman and Alexei A. Efros.
    [**"Learning a Discriminative Model for the Perception of Realism in
    Composite
    Images"**](https://people.eecs.berkeley.edu/~junyanz/projects/realism/index.html),
    in ICCV 2015.

