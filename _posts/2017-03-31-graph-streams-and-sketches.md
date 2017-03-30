---
layout: post
title: Graph Streams and Sketches
date: 2017-03-31
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Graph Streams and Sketches](http://people.cs.umass.edu/~mcgregor/graphs/)
* Authors: Andrew McGregor

---

Graph Streams and Sketches
===============

This webpage was set up to accompany a tutorial at [ICML 2016](http://icml.cc/2016/?page_id=97).

Tutorial Slides
===============

![](http://sungsoo.github.com/images/graph-streaming.png)

-   [Part I: Streaming, Sampling, and
    Sketching](../slides/16-icml-part1.pdf) Andrew McGregor
-   [Part II: Space-Efficient Optimization](../slides/16-icml-part2.pdf)
    Sudipto Guha

Other General Resources
=======================

-   Presentations [[Slides]](slides/12-michigan.pdf),
    [[Video]](slides/12-graphs.mov)
-   A
    [survey](http://people.cs.umass.edu/~mcgregor/papers/13-graphsurvey.pdf)
    about graph stream algorithms

Bibliography
============

The following is not an exhaustive list of papers that are relevant to
the topic but should include the most relevant and recent papers.

-   Vertex and Edge Connectivity and Graph Sparsification
    -   [Single Pass Spectral Sparsification in Dynamic
        Streams](http://arxiv.org/abs/1407.1289) FOCS 2014 (M. Kapralov,
        Y. T. Lee, C. Musco, C. Musco, A. Sidford)
    -   [Vertex and Hyperedge Connectivity in Dynamic Graph
        Streams](../papers/15-pods.pdf) PODS 2015 (S. Guha, A. McGregor,
        D. Tench)
    -   [Graph Sketches: Sparsfiers, Spanners, and
        Subgraphs](../papers/12-pods1.pdf) PODS 2012 (K. Ahn, S. Guha,
        A. McGregor)
    -   [Analyzing Graph Structure via Linear
        Measurements](../papers/12-dynamic.pdf) SODA 2012 (K. Ahn, S.
        Guha, A. McGregor)
    -   [Spectral Sparsification of Dynamic Graph
        Streams](../papers/coming.html) APPROX 2013 (K. Ahn, S. Guha, A.
        McGregor)
-   Matchings and Vertex Cover
    -   [Kernelization via Sampling with Applications to Dynamic Graph
        Streams](http://arxiv.org/abs/1505.01731) SODA 2016 (R. Chitnis,
        G. Cormode, H. Esfandiari, M. Hajiaghayi, A. McGregor, M.
        Monemizadeh, S. Vorotnikova)
    -   [Tight Bounds for Single-Pass Streaming Complexity of the Set
        Cover Problem](http://arxiv.org/abs/1603.05715) SODA 2016. S.
        Assadi, S. Khanna, Y. Li.
-   Triangle Counting, Frequent Subgraphs, Clustering Coefficients
    -   [Better Algorithms for Counting Triangles in Data
        Streams](../papers/coming.html) PODS 2016 (A. McGregor, S.
        Vorotnikova, H. Vu)
    -   [Colorful Triangle Counting and a MapReduce
        Implementation](http://arxiv.org/abs/1103.6073). Rasmus Pagh,
        Charalampos E. Tsourakakis
-   Set Cover
    -   [Tight Bounds for Single-Pass Streaming Complexity of the Set
        Cover Problem](http://arxiv.org/abs/1603.05715) FOCS 2016. S.
        Assadi, S. Khanna, Y. Li.
    -   [Incidence Geometries and the Pass Complexity of Semi-Streaming
        Set Cover](http://arxiv.org/abs/1507.04645) SODA 2016. A.
        Chakrabarti, A. Wirth.
    -   [Towards Tight Bounds for the Streaming Set Cover
        Problem](http://arxiv.org/abs/1509.00118) PODS 2016. S.
        Har-Peled, P. Indyk, S. Mahabadi, A. Vakilian.
-   Densest Subgraph
    -   [Densest Subgraph in Dynamic Graph
        Streams](../papers/15-mfcs.pdf) MFCS 2015 (A. McGregor, D.
        Tench, S. Vorotnikova, H. Vu)
    -   See also: [Dense subgraph discovery
        Tutorial](https://densesubgraphdiscovery.wordpress.com/tutorial/)
        KDD 2015. A. Gionis, C. Tsourakakis,
-   Correlation Clustering
    -   [Correlation Clustering in Data Streams](../papers/15-icml.pdf)
        ICML 2015 (K. Ahn, G. Cormode, S. Guha, A. McGregor, A. Wirth)
    -   See also: [Correlation Clustering: from Theory to
        Practice](http://www.cs.yale.edu/homes/el327/papers/CCtuto_kdd14.pdf)
        KDD 2014. F. Bonchi, D. Garcia-Soriano, E. Liberty
-   Bayesian Networks
    -   [Evaluating Bayesian Networks via Data
        Streams](../papers/15-cocoon.pdf) COCOON 2015. A. McGregor, H.
        T. Vu.
    -   [Graphical Model Sketch](https://arxiv.org/pdf/1602.03105.pdf).
        B. Kveton, H. Bui, M. Ghavamzadeh, G. Theocharous, S.
        Muthukrishnan, S. Sun
-   Other
    -   [Dynamic Graphs in the Sliding-Window
        Model](../papers/13-esa.pdf) ESA 2013 (M. Crouch, A. McGregor,
        D. Stubbs)