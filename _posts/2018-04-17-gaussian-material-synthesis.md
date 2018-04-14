---
layout: post
title: Gaussian Material Synthesis 
date: 2018-04-17
categories: [computer science]
tags: [computer graphics, machine learning]

---

## Article Source
* Title: [Gaussian Material Synthesis](https://users.cg.tuwien.ac.at/zsolnai/gfx/gaussian-material-synthesis/)
* Authors: Károly Zsolnai-Fehér, Peter Wonka, Michael Wimmer

---


# Gaussian Material Synthesis 

## Summary
In this paper, we teach an AI the concept of metallic, translucent materials and more. The newly *synthesized materials* can be visualized in real-time via *neural rendering* and we also propose an intuitive variant generation technique to enable the user to fine-tune these recommended materials. 

## Abstract

We present a *learning-based system* for rapid mass-scale material synthesis that is useful for novice and expert users alike. The user preferences are learned via Gaussian Process Regression and can be easily sampled for new recommendations. Typically, each recommendation takes 40-60 seconds to render with global illumination, which makes this process impracticable for real-world workflows. Our neural network eliminates this bottleneck by providing high-quality image predictions in real time, after which it is possible to pick the desired materials from a gallery and assign them to a scene in an intuitive manner. 

Workflow timings against Disney's "*principled*" shader reveal that our system scales well with the number of sought materials, thus empowering even novice users to generate hundreds of high-quality material models without any expertise in material modeling. Similarly, expert users experience a significant decrease in the total modeling time when populating a scene with materials. Furthermore, our proposed solution also offers controllable recommendations and a novel latent space variant generation step to enable the real-time fine-tuning of materials without requiring any domain expertise.

<iframe width="600" height="400" src="https://www.youtube.com/embed/6FzVhIV_t3s" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

* Paper: [PDF](https://users.cg.tuwien.ac.at/~zsolnai/wp/wp-content/uploads/2018/04/gms.pdf)
* Supplementary materials: [PDF](https://users.cg.tuwien.ac.at/~zsolnai/wp/wp-content/uploads/2018/04/gms-supp.pdf)
* Code + data [(923 MB)](https://users.cg.tuwien.ac.at/zsolnai/wp/wp-content/uploads/2018/04/gms-supplementary.zip)
* Pre-trained network [3.3GB](https://users.cg.tuwien.ac.at/zsolnai/wp/wp-content/uploads/2018/04/gms-pretrained.zip)