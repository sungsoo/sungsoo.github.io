---
layout: post
title: GPU accelerated population annealing algorithm
date: 2017-03-16
categories: [computer science]
tags: [machine learning, parallel computing]

---


## Article Source
* Title: [GPU accelerated population annealing algorithm](http://hgpu.org/?p=17061)
* Authors: Lev Yu. Barash, Martin Weigel, Michal Borovsky, Wolfhard Janke, Lev N. Shchur (Landau Institute for Theoretical Physic)

---


GPU accelerated population annealing algorithm
====================================

[**Download Paper**](https://arxiv.org/pdf/1703.03676)

Abstract
--------
*Population annealing* is a promising recent approach for *Monte Carlo simulations* in statistical physics, in particular for the simulation of systems with complex free-energy landscapes. It is a *hybrid* method, combining *importance sampling* through *Markov chains* with elements of *sequential Monte Carlo* in the form of population control. While it appears to provide algorithmic capabilities for the simulation of such systems that are roughly comparable to those of more established approaches such as parallel tempering, it is intrinsically much more suitable for massively parallel computing. Here, we tap into this structural advantage and present a highly optimized implementation of the population annealing algorithm on GPUs that promises speed-ups of several orders of magnitude as compared to a serial implementation on CPUs. While the sample code is for simulations of the 2D ferromagnetic Ising model, it should be easily adapted for simulations of other spin models, including disordered systems. Our code includes implementations of some advanced algorithmic features that have only recently been suggested, namely the *automatic adaptation* of temperature steps and a *multi-histogram analysis* of the data at different temperatures.
