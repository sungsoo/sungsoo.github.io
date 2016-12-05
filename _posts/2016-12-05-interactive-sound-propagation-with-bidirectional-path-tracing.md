---
layout: post
title: Sound Propagation With Bidirectional Path Tracing
date: 2016-12-05
categories: [computer science]
tags: [computer graphics]

---

# Sound Propagation With Bidirectional Path Tracing

## Abstract

We introduce *Bidirectional Sound Transport* (BST), a new algorithm that simulates sound propagation by bidirectional path tracing using multiple importance sampling. Our approach can handle multiple sources in large virtual environments with complex occlusion, and can produce plausible acoustic effects at an interactive rate on a desktop PC. We introduce a new metric based on the signal-to-noise ratio (SNR) of the energy response and use this metric to evaluate the performance of ray-tracing-based acoustic simulation methods. Our formulation exploits temporal coherence in terms of using the resulting sample distribution of the previous frame to guide the sample distribution of the current one. We show that our sample redistribution algorithm converges and better balances between early and late reflections. We evaluate our approach on different benchmarks and demonstrate significant speedup over prior geometric acoustic algorithms.


<iframe width="600" height="400" src="https://www.youtube.com/embed/DzsZ2qMtEUE" frameborder="0" allowfullscreen></iframe>

The paper "Interactive Sound Propagation with Bidirectional Path Tracing" is available here:

* [http://gaps-zju.org/bst/](http://gaps-zju.org/bst/) 
* [Paper](http://gaps-zju.org/bst/bst.pdf)
