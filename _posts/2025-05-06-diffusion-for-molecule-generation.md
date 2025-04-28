---
layout: post
title: Diffusion for Molecule Generation 
date: 2025-05-06
categories: [artificial intelligence]
tags: [protein engineering]

---

### Article Source


* [Structured Variational Autoencoders; Primer by A. Dumitrescu & D. Korpela](https://www.youtube.com/watch?v=jsjYcugNoTk)

---

# [Diffusion for Molecule Generation](https://www.youtube.com/watch?v=jsjYcugNoTk)

* Models, Inference and Algorithms
* April 9, 2025
* Broad Institute of MIT and Harvard

## Primer: Diffusion for molecule generation

* Alexandru Dumitrescu, Aalto University
* Dani Korpela, Aalto University

In silico molecule generation enables the rapid creation of an initial pool of drug-like molecules, potentially accelerating significantly drug discovery and design. We explore the use of deep generative models for molecular generation, focusing on recent advancements and challenges. We begin with an introduction to diffusion models, a powerful framework for generating high-quality data through iterative noise processes. Diffusion models on point cloud representations of molecules has been extensively explored, with prevailing methodologies focusing on NN parametrizations that are E(3) invariant. We then examine Field-based Molecule Generation (FMG). Instead of moving points in the 3D space, we generate 3D vector fields, and analyze pros and cons of the two representations. Crucially different than point clouds, we do not constrain our architectures to be rotationally invariant in FMG. We show that keeping rotational invariance in diffusion models must either necessarily disregard molecular chirality or become intractable. We end our discussion with future next steps and ideas on how to integrate molecular generation methods as exploratory models for drug-discovery pipelines.

<iframe width="600" height="400" src="https://www.youtube.com/embed/jsjYcugNoTk?si=ba42INp2k7cmKliE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Meeting: Structured variational autoencoders for prediction and optimization

* Harri Lähdesmäki, Aalto University

Variational autoencoder (VAE) is a neural architecture that learns a deep latent variable model using an amortized variational inference model and has become a popular approach to generative modeling and high-dimensional data analysis. Structured VAEs extend vanilla VAEs by incorporating probabilistic graphical models to account for dependencies in the prior of latent variables that naturally extend VAEs to temporal modeling and sequential decision making. In this talk, I will present our recent efforts in developing structured VAEs for modeling high-dimensional temporal and spatio-temporal data as well as for high-dimensional Bayesian optimization. Our proposed models are defined either as Gaussian process prior VAEs or latent neural ODEs or PDEs. I will discuss these models and their robust and computationally efficient learning methods. I will also highlight some applications in longitudinal modeling of electronic health records and dynamical modeling of physical systems as well as single-cell data. 
