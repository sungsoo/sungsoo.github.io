---
layout: post
title: Graph Nets; The Next Generation
date: 2020-07-24
categories: [computer science]
tags: [machine learning]

---

### Article Source
* [Graph Nets: The Next Generation](https://www.youtube.com/watch?v=Wx8J-Kw3fTA)

----


## Graph Nets: The Next Generation

* Speaker: Max Welling, University of Amsterdam, July 21, 2020

### Abstract
In this talk I will introduce our next generation of graph neural networks. GNNs have the property that they are invariant to permutations of the nodes in the graph and to rotations of the graph as a whole. We claim this is unnecessarily restrictive and in this talk we will explore extensions of these GNNs to more flexible equivariant constructions. In particular, Natural Graph Networks for general graphs are globally equivariant under permutations of the nodes but can still be executed through local message passing protocols. Our mesh-CNNs on manifolds are equivariant under SO(2) gauge transformations and as such, unlike regular GNNs, entertain non-isotropic kernels. And finally our SE(3)-transformers are local message passing GNNs, invariant to permutations but equivariant to global SE(3) transformations. These developments clearly emphasize the importance of geometry and symmetries as design principles for graph (or other) neural networks.
Joint with: Pim de Haan and Taco Cohen (Natural Graph Networks) Pim de Haan, Maurice Weiler and Taco Cohen (Mesh-CNNs) Fabian Fuchs and Daniel Worrall (SE(3)-Transformers)
 
<iframe width="600" height="400" src="https://www.youtube.com/embed/Wx8J-Kw3fTA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>