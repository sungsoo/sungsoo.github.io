---
layout: post
title: Neural Image Stitching And Morphing 
date: 2018-06-19
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Neural Image Stitching And Morphing](https://www.youtube.com/watch?v=SWW0nVQNm2w)

---


## Neural Best-Buddies: Sparse Cross-Domain Correspondence

### Abstract 

*Correspondence* between images is a fundamental problem in computer vision, with a variety of graphics applications. This paper presents a novel method for sparse cross-domain correspondence. Our method is designed for pairs of images where the main objects of interest may belong to different semantic categories and differ drastically in shape and appearance, yet still contain semantically related or geometrically similar parts. Our approach operates on hierarchies of deep features, extracted from the input images by a pre-trained CNN. Specifically, starting from the coarsest layer in both hierarchies, we search for *Neural Best Buddies* (NBB): pairs of neurons that are mutual nearest neighbors. The key idea is then to percolate NBBs through the hierarchy, while narrowing down the search regions at each level and retaining only NBBs with significant activations. Furthermore, in order to overcome differences in appearance, each pair of search regions is transformed into a common appearance. We evaluate our method via a user study, in addition to comparisons with alternative correspondence approaches. The usefulness of our method is demonstrated using a variety of graphics applications, including cross-domain image alignment, creation of hybrid images, automatic image morphing, and more. 

<iframe width="600" height="400" src="https://www.youtube.com/embed/SWW0nVQNm2w" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

* Paper: [PDF](https://arxiv.org/pdf/1805.04140)