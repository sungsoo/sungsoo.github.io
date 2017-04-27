---
layout: post
title:  Learning Local Geometric Descriptors from RGB-D Reconstructions
date: 2017-04-28
categories: [computer science]
tags: [machine learning]

---

# 3DMatch: Learning Local Geometric Descriptors from RGB-D Reconstructions


#### *Andy Zeng, Shuran Song, Matthias Nießner, Matthew Fisher, Jianxiong Xiao, and Thomas Funkhouser*

##### IEEE Conference on Computer Vision and Pattern Recognition (CVPR) 2017 **Oral Presentation**

<iframe width="600" height="400" src="https://www.youtube.com/embed/1U3YKnuMS7g" frameborder="0" allowfullscreen></iframe>

## Abstract 

Matching local geometric features on real-world depth images is a challenging task due to the noisy, low-resolution, and incomplete nature of 3D scan data. These difficulties limit the performance of current state-of-art methods, which are typically based on histograms over geometric properties. In this paper, we present 3DMatch, a data-driven
model that learns a local volumetric patch descriptor for establishing correspondences between partial 3D data. To amass training data for our model, we propose an unsupervised feature learning method that leverages the millions of correspondence labels found in existing RGB-D reconstructions. Experiments show that our descriptor is not only able
to match local geometry in new scenes for reconstruction, but also generalize to different tasks and spatial scales (e.g. instance-level object model alignment for the Amazon Picking Challenge, and mesh surface correspondence). Results show that 3DMatch consistently outperforms other state-of-the-art approaches by a significant margin.

## Overview

![](http://3dmatch.cs.princeton.edu/img/overview.jpg)

From existing RGB-D reconstructions (a), we extract local 3D patches and correspondence labels from scans of different views (b). We collect pairs of matching and non-matching local 3D patches converted into a volumetric representation (c) to train a 3D ConvNet-based descriptor (d). This geometric descriptor can be used to establish correspondences for matching 3D geometry in various applications (e) such as reconstruction, model alignment, and surface correspondence.

## Paper

[![](http://3dmatch.cs.princeton.edu/img/paper-view.jpg)](https://arxiv.org/pdf/1603.08182.pdf)

* Latest version (5 Dec 2016): [arXiv:1603.08182 [cs.CV]](https://arxiv.org/abs/1603.08182) or [here](paper_v2.pdf)
* Older version (27 Mar 2016): [3DMatch: Learning the Matching of Local 3D Geometry in Range Scans](paper_v1.pdf)

## Bibtex

```
@inproceedings{zeng20163dmatch,
    title={3DMatch: Learning Local Geometric Descriptors from RGB-D
Reconstructions},
    author={Zeng, Andy and Song, Shuran and Nie{ss}ner, Matthias and
Fisher, Matthew and Xiao, Jianxiong and
            Funkhouser, Thomas},
    booktitle={CVPR},
    year={2017}
}
```

## Video

<iframe width="600" height="400" src="https://www.youtube.com/embed/gZrsJJtDvvA" frameborder="0" allowfullscreen></iframe>

## Code


All 3DMatch code (for training and testing) can be found in our Github repository [here](https://github.com/andyzeng/3dmatch-toolbox).


## Keypoint Matching Benchmark


![](http://3dmatch.cs.princeton.edu/img/patch-rgb.jpg)![](http://3dmatch.cs.princeton.edu/img/patch-depth.jpg)

This benchmark evaluates how well descriptors (both 2D and 3D) can establish correspondences between RGB-D frames of different views. The dataset contains 2D RGB-D patches and 3D patches (local TDF voxel grid volumes) of wide-baselined correspondences, which are sampled from our testing split of the [RGB-D reconstruction datasets](#rgbd-reconstruction-datasets). The pixel size of each 2D patch is determined by the projection of the 0.3m^3^ local 3D patch around the interest point onto the image plane. We provide Matlab code for generating similar correspondence datasets [here](https://github.com/andyzeng/3dmatch-toolbox#generate-your-own-correspondence-dataset-from-rgb-d-reconstructions).
Although our baselines are 3D approaches that use depth information only, we are also looking for descriptor algorithms (2D or 3D) that leverage color information or both modalities.

## References
[1] [*3DMatch: Learning Local Geometric Descriptors from RGB-D Reconstructions*](http://3dmatch.cs.princeton.edu/), Princeton University, 2017.