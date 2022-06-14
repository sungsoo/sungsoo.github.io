---
layout: post
title: Geometry Processing with Neural Fields
date: 2022-06-15
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Geometry Processing with Neural Fields](https://www.youtube.com/watch?v=AOKKXg0E-HE)


---

# Geometry Processing with Neural Fields


* Paper: [Geometry Processing with Neural Fields](http://vladlen.info/papers/neural-fields.pdf)
* Authors: Guandao Yang, Serge Belongie, Bharath Hariharan, Vladlen Koltun



## Abstract

Most existing geometry processing algorithms use meshes as the default shape representation. Manipulating meshes, however, requires one to maintain high quality in the surface discretization. For example, changing the topology of a mesh usually requires additional procedures such as remeshing. This paper instead proposes the use of neural fields for geometry processing. Neural fields can compactly store complicated shapes without spatial discretization. Moreover, neural fields are infinitely differentiable, which allows them to be optimized for objectives that involve higher-order derivatives. This raises the question: can geometry processing be done entirely using neural fields? We introduce loss functions and architectures to show that some of the most challenging geometry processing tasks, such as deformation and filtering, can be done with neural fields. Experimental results show that our methods are on par with the well-established mesh-based methods without committing to a particular surface discretization. Code is available at [https://github.com/stevenygd/NFGP](https://github.com/stevenygd/NFGP).



<iframe width="600" height="400" src="https://www.youtube.com/embed/P2IeDSKP7W0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>



