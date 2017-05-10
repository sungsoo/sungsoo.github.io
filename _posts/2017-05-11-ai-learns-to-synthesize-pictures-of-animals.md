---
layout: post
title: AI Learns to Synthesize Pictures of Animals
date: 2017-05-11
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Unpaired Image-to-Image Translation using Cycle-Consistent Adversarial Networks](https://junyanz.github.io/CycleGAN/)

---

Unpaired Image-to-Image Translation using Cycle-Consistent Adversarial Networks
=======

* Authors: [Jun-Yan Zhu](http://www.eecs.berkeley.edu/~junyanz/)*    [Taesung Park](https://taesung.me/)*    [Phillip Isola](http://web.mit.edu/phillipi/)    [Alexei A. Efros](http://www.eecs.berkeley.edu/~efros/)
* Affiliations: [UC Berkeley](http://bair.berkeley.edu/)

**[[Paper]](https://arxiv.org/pdf/1703.10593.pdf) [[Code (Torch)]](https://github.com/junyanz/CycleGAN) [[Code (PyTorch)]](https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix)**

[![](https://junyanz.github.io/CycleGAN/images/teaser.jpg)](https://junyanz.github.io/CycleGAN/images/teaser_high_res.jpg)


## AI Learns to Synthesize Pictures of Animals

<iframe width="600" height="400" src="https://www.youtube.com/embed/D4C1dB9UheQ" frameborder="0" allowfullscreen></iframe>

Abstract
--------

Image-to-image translation is a class of vision and graphics problems where the goal is to learn the mapping between an input image and an output image using a training set of aligned image pairs. However, for many tasks, paired training data will not be available. We present an approach for learning to translate an image from a source domain *X* to a target domain *Y* in the absence of paired examples. Our goal is to learn a mapping *G: X → Y* such that the distribution of images from *G(X)* is indistinguishable from the distribution *Y* using an adversarial loss.

Because this mapping is highly under-constrained, we couple it with an inverse mapping *F: Y → X* and introduce a cycle consistency loss to push *F(G(X)) ≈ X* (and vice versa). Qualitative results are presented on several tasks where paired training data does not exist, including collection style transfer, object transfiguration, season transfer, photo enhancement, etc. Quantitative comparisons against several prior methods demonstrate the superiority of our approach.

[![paper thumbnail](https://junyanz.github.io/CycleGAN/images/paper_thumbnail.jpg)](https://arxiv.org/pdf/1703.10593.pdf)


Paper
-----

[arxiv 1703.10593](https://arxiv.org/abs/1703.10593), 2017.

### Citation

Jun-Yan Zhu*, Taesung Park*, Phillip Isola, and Alexei A. Efros.
"Unpaired Image-to-Image Translation using Cycle-Consistent Adversarial Networks", in arxiv, 2017.
(* indicates equal contributions) [Bibtex](CycleGAN.txt)

Code and Data: [[Torch]](https://github.com/junyanz/CycleGAN) [[PyTorch]](https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix)


