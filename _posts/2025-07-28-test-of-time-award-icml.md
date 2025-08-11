---
layout: post
title: Batch Normalization (ICML 2025 Test Of Time Award)
date: 2025-07-28
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# [Batch Normalization (ICML 2025 Test Of Time Award)](https://www.youtube.com/watch?v=hl8tDqKv6t8)



## Batch Normalization: Accelerating Deep Network Training by Reducing Internal Covariate Shift

## Abstract

Training Deep Neural Networks is complicated by the fact that the distribution of each layer's inputs changes during training, as the parameters of the previous layers change. This slows down the training by requiring lower learning rates and careful parameter initialization, and makes it notoriously hard to train models with saturating nonlinearities. We refer to this phenomenon as internal covariate shift, and address the problem by normalizing layer inputs. Our method draws its strength from making normalization a part of the model architecture and performing the normalization for each training mini-batch. Batch Normalization allows us to use much higher learning rates and be less careful about initialization. It also acts as a regularizer, in some cases eliminating the need for Dropout. Applied to a state-of-the-art image classification model, Batch Normalization achieves the same accuracy with 14 times fewer training steps, and beats the original model by a significant margin. Using an ensemble of batch-normalized networks, we improve upon the best published result on ImageNet classification: reaching 4.9% top-5 validation error (and 4.8% test error), exceeding the accuracy of human raters.


<iframe width="600" height="400" src="https://www.youtube.com/embed/hl8tDqKv6t8?si=S11Fwi-m2zW2KekS" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>