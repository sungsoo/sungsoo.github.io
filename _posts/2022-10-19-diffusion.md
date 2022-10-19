---
layout: post
title: Diffusion probabilistic modelling of protein backbones in 3D
date: 2022-10-19
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Diffusion probabilistic modelling of protein backbones in 3D](https://www.youtube.com/watch?v=UymQ-iE23MY)


---

# Diffusion probabilistic modelling of protein backbones in 3D

* Speakers: Brian Trippe - [https://twitter.com/brianltrippe](https://twitter.com/brianltrippe)


## Abstract

The construction of a scaffold structure that supports a desired motif, conferring protein function, shows promise for the design of vaccines and enzymes. But a general solution to this motif-scaffolding problem remains open. Current machine-learning techniques for scaffold design are either limited to unrealistically small scaffolds (up to length 20) or struggle to produce multiple diverse scaffolds. We propose to learn a distribution over diverse and longer protein backbone structures via an E(3)-equivariant graph neural network. We develop SMCDiff to efficiently sample scaffolds from this distribution conditioned on a given motif; our algorithm is the first to theoretically guarantee conditional samples from a diffusion model in the large-compute limit. We evaluate our designed backbones by how well they align with AlphaFold2-predicted structures. We show that our method can (1) sample scaffolds up to 80 residues and (2) achieve structurally diverse scaffolds for a fixed motif.


<iframe width="600" height="400" src="https://www.youtube.com/embed/UymQ-iE23MY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>