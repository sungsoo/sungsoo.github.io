---
layout: post
title: Supervised Contrastive Learning
date: 2021-09-15
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Supervised Contrastive Learning](https://www.youtube.com/watch?v=MpdbFLXOOIw)


---

# Supervised Contrastive Learning

The cross-entropy loss has been the default in deep learning for the last few years for supervised learning. This paper proposes a new loss, the supervised contrastive loss, and uses it to pre-train the network in a supervised fashion. The resulting model, when fine-tuned to ImageNet, achieves new state-of-the-art.

* [Paper](https://arxiv.org/abs/2004.11362)
* Authors: Prannay Khosla, Piotr Teterwak, Chen Wang, Aaron Sarna, Yonglong Tian, Phillip Isola, Aaron Maschinot, Ce Liu, Dilip Krishnan


## Abstract

Cross entropy is the most widely used loss function for supervised training of image classification models. In this paper, we propose a novel training methodology that consistently outperforms cross entropy on supervised learning tasks across different architectures and data augmentations. We modify the batch contrastive loss, which has recently been shown to be very effective at learning powerful representations in the self-supervised setting. We are thus able to leverage label information more effectively than cross entropy. Clusters of points belonging to the same class are pulled together in embedding space, while simultaneously pushing apart clusters of samples from different classes. In addition to this, we leverage key ingredients such as large batch sizes and normalized embeddings, which have been shown to benefit self-supervised learning. On both ResNet-50 and ResNet-200, we outperform cross entropy by over 1%, setting a new state of the art number of 78.8% among methods that use AutoAugment data augmentation. The loss also shows clear benefits for robustness to natural corruptions on standard benchmarks on both calibration and accuracy. Compared to cross entropy, our supervised contrastive loss is more stable to hyperparameter settings such as optimizers or data augmentations.


<iframe width="600" height="400" src="https://www.youtube.com/embed/MpdbFLXOOIw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>