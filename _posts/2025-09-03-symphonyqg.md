---
layout: post
title: Towards Symphonious Integration of Quantization and Graph
date: 2025-09-03
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# [SymphonyQG: Towards Symphonious Integration of Quantization and Graph (SIGMOD 2025)](https://www.youtube.com/watch?v=ZSxYgW-zHiU)


## Abstract

Approximate nearest neighbor (ANN) search in high-dimensional Euclidean space has a broad range of applications. Among existing ANN algorithms, graph-based methods have shown superior performance in terms of the time-accuracy trade-off. However, they face performance bottlenecks due to the random memory accesses caused by the searching process on the graph indices and the costs of computing exact distances to guide the searching process. To relieve the bottlenecks, a recent method named NGT-QG makes an attempt by integrating quantization and graph. It (1) replicates and stores the quantization codes of a vertex's neighbors compactly so that they can be accessed sequentially, and (2) uses a SIMD-based implementation named FastScan to efficiently estimate distances based on the quantization codes in batch for guiding the searching process. While NGT-QG achieves promising improvements over the vanilla graph-based methods, it has not fully unleashed the potential of integrating quantization and graph. For instance, it entails a re-ranking step to compute exact distances at the end, which introduces extra random memory accesses; its graph structure is not jointly designed considering the in-batch nature of FastScan, which causes wastes of computation in searching. In this work, following NGT-QG, we present a new method named SymphonyQG, which achieves more symphonious integration of quantization and graph (e.g., it avoids the explicit re-ranking step and refines the graph structure to be more aligned with FastScan). Based on extensive experiments on real-world datasets, SymphonyQG establishes the new state-of-the-art in terms of the time-accuracy trade-off.


<iframe width="600" height="400" src="https://www.youtube.com/embed/RVgf2kLys20?si=c4nO0G4ifDKEVuL2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>