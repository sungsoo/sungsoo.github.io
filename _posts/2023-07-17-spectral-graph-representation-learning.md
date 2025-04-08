---
layout: post
title: Sign and Basis Invariant Networks for Spectral Graph Representation Learning  
date: 2023-07-17
categories: [computer science]
tags: [big data]

---

### Article Source

* [Sign and Basis Invariant Networks for Spectral Graph Representation Learning](https://www.youtube.com/watch?v=f7xWQSAa6P4)


---

# Sign and Basis Invariant Networks for Spectral Graph Representation Learning

Join the Learning on Graphs and Geometry Reading Group: [https://m2d2.io/talks/logg/about/](https://m2d2.io/talks/logg/about/)

* Paper Sign and Basis Invariant Networks for Spectral Graph Representation Learning: [https://arxiv.org/abs/2202.13013](https://arxiv.org/abs/2202.13013)
* Authors: Derek Lim, Joshua Robinson, Lingxiao Zhao, Tess Smidt, Suvrit Sra, Haggai Maron, Stefanie Jegelka


## Abstract
Any machine learning tasks involve processing eigenvectors derived from data. Especially valuable are Laplacian eigenvectors, which capture useful structural information about graphs and other geometric objects. However, ambiguities arise when computing eigenvectors: for each eigenvector v, the sign flipped −v is also an eigenvector. More generally, higher dimensional eigenspaces contain infinitely many choices of basis eigenvectors. These ambiguities make it a challenge to process eigenvectors and eigenspaces in a consistent way. In this work we introduce SignNet and BasisNet -- new neural architectures that are invariant to all requisite symmetries and hence process collections of eigenspaces in a principled manner. Our networks are universal, i.e., they can approximate any continuous function of eigenvectors with the proper invariances. They are also theoretically strong for graph representation learning -- they can approximate any spectral graph convolution, can compute spectral invariants that go beyond message passing neural networks, and can provably simulate previously proposed graph positional encodings. Experiments show the strength of our networks for molecular graph regression, learning expressive graph representations, and learning implicit neural representations on triangle meshes. Our code is available: [https://github.com/cptq/SignNet-BasisNet](https://github.com/cptq/SignNet-BasisNet)

<iframe width="600" height="400" src="https://www.youtube.com/embed/f7xWQSAa6P4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>