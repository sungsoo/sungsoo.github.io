---
layout: post
title: GraphZeppelin - Streaming Graph Connectivity at Scale
date: 2022-12-05
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [GraphZeppelin - Streaming Graph Connectivity at Scale](https://www.youtube.com/watch?v=ZPlgSjR6RV0)


---

# GraphZeppelin - Streaming Graph Connectivity at Scale


## Abstract

I presented GraphZeppelin: a high-performance graph stream processing system at SIGMOD 2022.  It outperforms the state of the art: on large, dense graph streams, it is more compact and faster than the best existing stream processing systems.  Systems takeaway: use linear sketching/lossy compression to improve the scalability of your graph systems.  Theory takeaway: prove external memory I/O bounds for your semi-streaming algorithms because you can probably only run them out-of-core. Data science takeaway: large, dense graphs exist and we should study them and build tools to analyze them.

* Paper: [https://arxiv.org/pdf/2203.14927v1.pdf](https://arxiv.org/pdf/2203.14927v1.pdf)
* Github: [https://github.com/GraphStreamingProject/GraphZeppelin](https://github.com/GraphStreamingProject/GraphZeppelin)

<iframe width="600" height="400" src="https://www.youtube.com/embed/ZPlgSjR6RV0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
