---
layout: post
title: Sparse Matrices Beyond Solvers
date: 2021-01-03
categories: [computer science]
tags: [machine learning, data management]

---

### Article Source
* [Sparse Matrices Beyond Solvers: Graphs, Biology, and Machine Learning](https://www.youtube.com/watch?v=8QFxuIwHZcA)

----


## Sparse Matrices Beyond Solvers: Graphs, Biology, and Machine Learning


* Talk from the MIT CSAIL Fast Code Seminar, June 22 2020, by Aydin Buluc

<iframe width="600" height="400" src="https://www.youtube.com/embed/8QFxuIwHZcA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Abstract
 
Solving systems of linear equations have traditionally driven the research in sparse matrix computation for decades. Direct and iterative solvers, together with finite element computations, still account for the primary use case for sparse matrix data structures and algorithms. These sparse "*solvers*" often serve as the workhorse of many algorithms in *spectral graph theory* and traditional machine learning.

In this talk, I will be highlighting some of the emerging use cases of sparse matrices outside the domain of solvers. These include graph computations outside the spectral realm, computational biology, and emerging techniques in machine learning. A recurring theme in all these novel use cases is the concept of a semiring on which the sparse matrix computations are carried out. By overloading scalar addition and multiplication operators of a semiring, we can attack a much richer set of computational problems using the same sparse data structures and algorithms. This approach has been formalized by the GraphBLAS effort.

I will illustrate one example application from each problem domain, together with the most computationally demanding sparse matrix primitive required for its efficient execution. I will also briefly cover available software that implement these sparse matrix primitives efficiently on various architectures.
