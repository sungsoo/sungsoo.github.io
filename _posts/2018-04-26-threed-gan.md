---
layout: post
title: 3D Generative-Adversarial Modeling
date: 2018-04-26
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Learning a Probabilistic Latent Space of Object Shapes via 3D Generative-Adversarial Modeling](http://3dgan.csail.mit.edu)
* Authors: [Jiajun Wu](http://jiajunwu.com), Chengkai Zhang, [Tianfan Xue](http://people.csail.mit.edu/tfxue/), [William T. Freeman](http://billf.mit.edu), and [Joshua B. Tenenbaum](http://web.mit.edu/cocosci/josh.html)

------

Learning a Probabilistic Latent Space of Object Shapes via 3D Generative-Adversarial Modeling
==============


![The generator of 3D-GAN](http://3dgan.csail.mit.edu/images/model.jpg)

*Figure 1: The generator of 3D Generative Adversarial Network (3D-GAN)*


![Shapes synthesized by 3D-GAN](http://3dgan.csail.mit.edu/images/results.jpg)

*Figure 2: Shapes synthesized by 3D-GAN*


## Abstract

We study the problem of 3D object generation. We propose a novel
framework, namely 3D Generative Adversarial Network (3D-GAN), which
generates 3D objects from a probabilistic space by leveraging recent
advances in volumetric convolutional networks and generative adversarial
nets. The benefits of our model are three-fold: first, the use of an
adversarial criterion, instead of traditional heuristic criteria,
enables the generator to capture object structure implicitly and to
synthesize high-quality 3D objects; second, the generator establishes a
mapping from a low-dimensional probabilistic space to the space of 3D
objects, so that we can sample objects without a reference image or CAD
models, and explore the 3D object manifold; third, the adversarial
discriminator provides a powerful 3D shape descriptor which, learned
without supervision, has wide applications in 3D object recognition.
Experiments demonstrate that our method generates high-quality 3D
objects, and our unsupervisedly learned features achieve impressive
performance on 3D object recognition, comparable with those of
supervised learning methods.


## Spotlight Video


<iframe width="600" height="400" src="https://www.youtube.com/embed/mfx7uAkUtCI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>


If you cannot access YouTube, please [download our video
here](videos/3dgan.mp4).

Also see ["AI Makes 3D Models From Photos" from Two Minute Papers on
YouTube](https://www.youtube.com/watch?v=HO1LYJb818Q).


## Publication


* Learning a Probabilistic Latent Space of Object Shapes via 3D
    Generative-Adversarial Modeling, [Jiajun Wu](http://jiajunwu.com)\*, Chengkai Zhang\*, [Tianfan Xue](http://people.csail.mit.edu/tfxue/), [William T. Freeman](http://billf.mit.edu), and [Joshua B. Tenenbaum](http://web.mit.edu/cocosci/josh.html)

NIPS 2016 [Paper](papers/3dgan_nips.pdf) [Slides](talks/3dgan_slides_nips.pdf) [Poster](talks/3dgan_poster_nips.pdf) [arXiv](http://arxiv.org/abs/1610.07584) [BibTeX](bibtex/3dgan_nips.bib) (* indicates equal contributions)


## Downloads

-   [Pretrained models and code for shape
    synthesis](https://github.com/zck119/3dgan-release)

## Related Publication


* MarrNet: 3D Shape Reconstruction via 2.5D Sketches [Jiajun Wu](http://jiajunwu.com/)\*, Yifan Wang\*, [Tianfan
    Xue](http://people.csail.mit.edu/tfxue/), Xingyuan Sun, [William T.
    Freeman](http://billf.mit.edu/), and [Joshua B.
    Tenenbaum](http://web.mit.edu/cocosci/josh.html)

NIPS 2017 [Paper](http://marrnet.csail.mit.edu/papers/marrnet_nips.pdf)
[Project
    Page](http://marrnet.csail.mit.edu) [BibTeX](http://marrnet.csail.mit.edu/bibtex/marrnet_nips.bib)
    (* indicates equal contributions)
