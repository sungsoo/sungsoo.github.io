---
layout: post
title: Multiphase Fluid Simulations
date: 2016-12-12
categories: [computer science]
tags: [computer graphics]

---

# Multiphase Fluid Simulations

## Abstract

This work extends existing *multiphase-fluid SPH frameworks* to cover solid phases, including deformable bodies and granular materials. In our *extended multiphase SPH framework*, the distribution and shapes of all phases, both fluids and solids, are uniformly represented by their volume fraction functions. The dynamics of the multiphase system is governed by conservation of mass and momentum within different phases. The behavior of individual phases and the interactions between them are represented by corresponding constitutive laws, which are functions of the volume fraction fields and the velocity fields. Our generalized multiphase SPH framework does not require separate equations for specific phases or tedious interface tracking. As the distribution, shape and motion of each phase is represented and resolved in the same way, the proposed approach is robust, efficient and easy to implement. Various simulation results are presented to demonstrate the capabilities of our new multiphase SPH framework, including deformable bodies, granular materials, interaction between multiple fluids and deformable solids, flow in porous media, and dissolution of deformable solids.


<iframe width="600" height="400" src="https://www.youtube.com/embed/cUWDeDRet4c" frameborder="0" allowfullscreen></iframe>

The paper "Multiphase SPH Simulation for Interactive Fluids and Solids" is available here:

* [Paper](http://cg.cs.tsinghua.edu.cn/papers/SIG_2016_Multiphase.pdf)
