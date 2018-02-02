---
layout: post
title: Introduction to Geometric Deep Learning
date: 2018-02-03
categories: [computer science]
tags: [machine learning]

---

## Article Source

* M. M. Bronstein, J. Bruna, Y. LeCun, A. Szlam, P. Vandergheynst, <a href="https://arxiv.org/pdf/1611.08097.pdf">Geometric deep learning: going beyond Euclidean data</a>, <i>IEEE Signal Processing Magazine</i> 2017 (Review paper)


---


# Geometric deep learning: going beyond Euclidean data

## Abstract 

Many scientific fields study data with an underlying structure that is a *non-Euclidean space*. Some examples include social networks in computational social sciences, sensor networks in communications, functional networks in brain imaging, regulatory networks in genetics, and meshed surfaces in computer graphics. In many applications, such geometric data are large and complex (in the case of social networks, on the scale of billions), and are natural targets for machine learning techniques. In particular, we would like to use *deep neural networks*, which have recently proven to be powerful tools for a broad range of problems from computer vision, natural language processing, and audio analysis. However, these tools have been most successful on data with an underlying *Euclidean* or *grid-like structure*, and in cases where the invariances of these structures are built into networks used to model them.

*Geometric deep learning* is an umbrella term for emerging techniques attempting to generalize (structured) deep neural models to *non-Euclidean domains* such as *graphs* and *manifolds*. The purpose of this paper is to overview different examples of geometric deep learning problems and present available solutions, key difficulties, applications, and future research directions in this nascent field.

## Introduction

"**Deep learning**" refers to learning complicated concepts by building them from simpler ones in a *hierarchical* or *multi-layer* manner. *Artificial neural networks* are popular realizations of such deep multi-layer hierarchies. In the past few years, the growing computational power of modern GPU-based computers and the availability of large training datasets have allowed successfully training neural networks with many layers and degrees of freedom. This has led to qualitative breakthroughs on a wide variety of tasks, from speech recognition and machine translation to image analysis and computer vision.
Nowadays, deep learning has matured into a technology that is widely used in commercial applications, including Siri speech recognition in Apple iPhone, Google text translation, and Mobileye vision-based technology for autonomously driving cars.

One of the key reasons for the success of deep neural networks is their ability to leverage statistical properties of the data such as stationarity and compositionality through local statistics, which are present in natural images, video, and speech.
These statistical properties have been related to physics and formalized in specific classes of convo- lutional neural networks (CNNs).
In image analysis applications, one can consider images as functions on the Euclidean space (plane), sampled on a grid. In this setting, stationarity is owed to shift-invariance, locality is due to the local connectivity, and compositionality stems from the multi-resolution structure of the grid. These properties are exploited by convolutional architectures, which are built of alternating convolutional and downsampling (pooling) layers. The use of convolutions has a two-fold effect. First, it allows extracting local features that are shared across the image domain and greatly reduces the number of parameters in the network with respect to generic deep architectures (and thus also the risk of overfitting), without sacrificing the expressive capacity of the network. Second, the convolutional architecture itself imposes some priors about the data, which appear very suitable especially for natural images.