---
layout: post
title: Vision Transformer
date: 2021-05-10
categories: [computer science]
tags: [machine learning, data management]

---

### Article Source

* [An Image is Worth 16x16 Words; Transformers for Image Recognition at Scale](https://www.youtube.com/watch?v=TrdevFK_am4)

---

# Vision Transformer
## An Image is Worth 16x16 Words; Transformers for Image Recognition at Scale

* [Paper](https://arxiv.org/abs/2010.11929)


## Abstract
Transformers are Ruining Convolutions. This paper, under review at ICLR, shows that given enough data, a standard Transformer can outperform Convolutional Neural Networks in image recognition tasks, which are classically tasks where CNNs excel. In this Video, I explain the architecture of the **Vision Transformer** (ViT), the reason why it works better and rant about why double-bline peer review is broken.

<iframe width="600" height="400" src="https://www.youtube.com/embed/TrdevFK_am4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

While the Transformer architecture has become the de-facto standard for natural language processing tasks, its applications to computer vision remain limited. In vision, attention is either applied in conjunction with convolutional networks, or used to replace certain components of convolutional networks while keeping their overall structure in place. We show that this reliance on CNNs is not necessary and a pure transformer can perform very well on image classification tasks when applied directly to sequences of image patches. When pre-trained on large amounts of data and transferred to multiple recognition benchmarks (ImageNet, CIFAR-100, VTAB, etc), Vision Transformer attains excellent results compared to state-of-the-art convolutional networks while requiring substantially fewer computational resources to train.

<iframe width="600" height="400" src="https://www.youtube.com/embed/HZ4j_U3FC94" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="600" height="400" src="https://www.youtube.com/embed/D72_Cn-XV1g" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="600" height="400" src="https://www.youtube.com/embed/bgsYOGhpxDc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

