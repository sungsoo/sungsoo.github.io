---
layout: post
title: AI Photo Translation
date: 2018-04-24
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [AI Photo Translation](https://www.youtube.com/watch?v=XcxzKLrCpyk)
* Title: [Toward Multimodal Image-to-Image Translation](https://junyanz.github.io/BicycleGAN/)
* Authors: Jun-Yan Zhu, Richard Zhang, Deepak Pathak, Trevor Darrell, Alexei A. Efros, Oliver Wang, Eli Shechtman

---

# Toward Multimodal Image-to-Image Translation

## AI Photo Translation

<iframe width="600" height="400" src="https://www.youtube.com/embed/XcxzKLrCpyk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>


## Abstract

Many image-to-image translation problems are ambiguous, as a single
input image may correspond to multiple possible outputs. In this work,
we aim to model a *distribution* of possible outputs in a conditional
generative modeling setting. The ambiguity of the mapping is distilled
in a low-dimensional latent vector, which can be randomly sampled at
test time. A generator learns to map the given input, combined with this
latent code, to the output. We explicitly encourage the connection
between output and the latent code to be invertible. This helps prevent
a many-to-one mapping from the latent code to the output during
training, also known as the problem of mode collapse, and produces more
diverse results. We explore several variants of this approach by
employing different training objectives, network architectures, and
methods of injecting the latent code. Our proposed method encourages
bijective consistency between the latent encoding and output modes. We
present a systematic comparison of our method and other variants on both
perceptual realism and diversity.

## Demo Video

<iframe width="600" height="400" src="https://www.youtube.com/embed/JvGysD2EFhw" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

[mp4](https://people.eecs.berkeley.edu/~junyanz/projects/BicycleGAN/video_extended.mp4)
[258 MB]

## Example Results


[![](https://junyanz.github.io/BicycleGAN/index_files/results_matrix.jpg)]()

**Unsynchronized z** [[labels → facades]](https://people.eecs.berkeley.edu/~junyanz/projects/BicycleGAN/web_arxiv/facades_random_z_20_20/) [[edges → shoes]](https://people.eecs.berkeley.edu/~junyanz/projects/BicycleGAN/web_arxiv/shoes_random_z_20_20/) [[edges → handbags]](https://people.eecs.berkeley.edu/~junyanz/projects/BicycleGAN/web_arxiv/handbags_random_z_20_20/) [[night → day]](https://people.eecs.berkeley.edu/~junyanz/projects/BicycleGAN/web_arxiv/night2day_random_z/) 

**Synchronized z** [[labels → facades]](https://people.eecs.berkeley.edu/~junyanz/projects/BicycleGAN/web_arxiv/facades_fixed_z_100_6/) [[edges → shoes]](https://people.eecs.berkeley.edu/~junyanz/projects/BicycleGAN/web_arxiv/shoes_fixed_z_50_6/) [[edges → handbags]](https://people.eecs.berkeley.edu/~junyanz/projects/BicycleGAN/web_arxiv/handbags_fixed_z_100_6/) [[night → day]](https://people.eecs.berkeley.edu/~junyanz/projects/BicycleGAN/web_arxiv/night2day_random_z/) 


## Exploring the Latent Space

[![](https://junyanz.github.io/BicycleGAN/index_files/day2night.gif)](https://junyanz.github.io/BicycleGAN/index_files/day2night.gif)


## Try the BicycleGAN model

[![](https://junyanz.github.io/BicycleGAN/index_files/network2.jpg)](https://github.com/junyanz/BicycleGAN)

[[GitHub]](https://github.com/junyanz/BicycleGAN)


## Paper

[![](https://junyanz.github.io/BicycleGAN/index_files/page1.jpg)](https://arxiv.org/abs/1711.11586)

J.Y. Zhu, R. Zhang, D. Pathak, T. Darrell, A. A. Efros, O. Wang, E. Shechtman. Toward Multimodal Image-to-Image Translation. In NIPS, 2017. (hosted on [arXiv](https://arxiv.org/abs/1711.11586))

[[Bibtex]](https://junyanz.github.io/BicycleGAN/index_files/bibtex_nips2017.txt)

## Related Work                                                            
                                                                        
* P. Isola, J.Y. Zhu, T. Zhou, A. A. Efros. **Image-to-image translation with conditional adversarial networks.** In CVPR, 2017. [[PDF]](https://arxiv.org/pdf/1611.07004v1.pdf)[[Website]](https://phillipi.github.io/pix2pix/)
* J.Y. Zhu*, T. Park*, P. Isola, A. A. Efros. **Unpaired Image-to-Image Translation using Cycle-Consistent Adversarial Networks.** In ICCV, 2017. [[PDF]](https://arxiv.org/abs/1703.10593)[[Website]](https://junyanz.github.io/CycleGAN/)                                                  







