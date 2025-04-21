---
layout: post
title: Protein Design with Guided Discrete Diffusion  
date: 2025-05-01
categories: [artificial intelligence]
tags: [protein engineering]

---

### Article Source


* [Protein Design with Guided Discrete Diffusion](https://www.youtube.com/watch?v=Hm8Z0SIyLqw)

---

# [Protein Design with Guided Discrete Diffusion](https://www.youtube.com/watch?v=Hm8Z0SIyLqw)

* Nate Gruver, Samuel Stanton
* Title: Protein Design with Guided Discrete Diffusion
* Paper: [https://arxiv.org/abs/2305.20009](https://arxiv.org/abs/2305.20009)


## Summary 
A popular approach to protein design is to combine a generative model with a discriminative model for conditional sampling. The generative model samples plausible sequences while the discriminative model guides a search for sequences with high fitness. Given its broad success in conditional sampling, classifier-guided diffusion modeling is a promising foundation for protein design, leading many to develop guided diffusion models for structure with inverse folding to recover sequences. In this work, we propose diffusioN Optimized Sampling (NOS), a guidance method for discrete diffusion models that follows gradients in the hidden states of the denoising network. NOS makes it possible to perform design directly in sequence space, circumventing significant limitations of structure-based methods, including scarce data and challenging inverse design. Moreover, we use NOS to generalize LaMBO, a Bayesian optimization procedure for sequence design that facilitates multiple objectives and edit-based constraints. The resulting method, LaMBO-2, enables discrete diffusions and stronger performance with limited edits through a novel application of saliency maps. We apply LaMBO-2 to a real-world protein design task, optimizing antibodies for higher expression yield and binding affinity to several therapeutic targets under locality and developability constraints, attaining a 99% expression rate and 40% binding rate in exploratory in vitro experiments.

<iframe width="600" height="400" src="https://www.youtube.com/embed/Hm8Z0SIyLqw?si=BtdNmjxeSwgRH4Dc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>