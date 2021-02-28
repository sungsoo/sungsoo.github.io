---
layout: post
title: Graph Sketching, Streaming, and Sampling 
date: 2021-02-28
categories: [computer science]
tags: [machine learning, data management]

---

### Article Source

* [Andrew McGregor's page](https://people.cs.umass.edu/~mcgregor/graphs/)

---

## Graph Sketching, Streaming, and Sampling

### Tutorial Slides (KDD 2018 version)

-   [Part I: Streaming, Sampling, and Sketching](../slides/18-kdd-part1.pdf) Andrew McGregor
-   [Part II: Space-Efficient Optimization](../slides/18-kdd-part2.pdf)
    Sudipto Guha

### Other General Resources

-   A [survey](http://people.cs.umass.edu/~mcgregor/papers/13-graphsurvey.pdf)
    about graph stream algorithms.
-   [Extended Tutorial Slides
    (3hrs)](http://cs.umass.edu/~mcgregor/slides/18-porto.pdf) from
    Porto Winter School on Network Science 2018.
-   Ten lectures on graph streams:
    -   [Graphs-1:](http://www.cs.umass.edu/~mcgregor/711S18/graph-1.pdf)
        Connectivity, k-connectivity, Spanners, Sparsification
    -   [Graphs-2:](http://www.cs.umass.edu/~mcgregor/711S18/graph-2.pdf)
        Connectivity via Sketching
    -   [Graphs-3:](http://www.cs.umass.edu/~mcgregor/711S18/graph-3.pdf)
        Sparsification via Sketching
    -   [Graphs-4:](http://www.cs.umass.edu/~mcgregor/711S18/graph-4.pdf)
        Insert-Only (Weighted) Matchings
    -   [Graphs-5:](http://www.cs.umass.edu/~mcgregor/711S18/graph-5.pdf)
        Planar Matchings
    -   [Graphs-6:](http://www.cs.umass.edu/~mcgregor/711S18/graph-6.pdf)
        Small Matchings
    -   [Graphs-7:](http://www.cs.umass.edu/~mcgregor/711S18/graph-7.pdf)
        Multiple-Pass Matchings via Multiplicative Weights
    -   [Graphs-8:](http://www.cs.umass.edu/~mcgregor/711S18/graph-8.pdf)
        Submodular Maximization
    -   [Graphs-9:](http://www.cs.umass.edu/~mcgregor/711S18/graph-9.pdf)
        Set-Cover and Max Coverage
    -   [Graphs-10:](http://www.cs.umass.edu/~mcgregor/711S18/graph-10.pdf)
        Correlation Clustering

### Bibliography

The following is not an exhaustive list of papers that are relevant to
the topic but should include the most relevant and recent papers.

-   Vertex and Edge Connectivity and Graph Sparsification
    -   [Single Pass Spectral Sparsification in Dynamic
        Streams](http://arxiv.org/abs/1407.1289) FOCS 2014 (M.
        Kapralov, Y. T. Lee, C. Musco, C. Musco, A. Sidford)
    -   [Vertex and Hyperedge Connectivity in Dynamic Graph
        Streams](../papers/15-pods.pdf) PODS 2015 (S. Guha, A.
        McGregor, D. Tench)
    -   [Graph Sketches: Sparsfiers, Spanners, and
        Subgraphs](../papers/12-pods1.pdf) PODS 2012 (K. Ahn, S.
        Guha, A. McGregor)
    -   [Analyzing Graph Structure via Linear
        Measurements](../papers/12-dynamic.pdf) SODA 2012 (K. Ahn, S.
        Guha, A. McGregor)
    -   [Spectral Sparsification of Dynamic Graph
        Streams](../papers/coming.html) APPROX 2013 (K. Ahn, S. Guha, A.
        McGregor)
-   Matchings and Vertex Cover
    -   [Kernelization via Sampling with Applications to Dynamic Graph
        Streams](http://arxiv.org/abs/1505.01731) SODA 2016 (R.
        Chitnis, G. Cormode, H. Esfandiari, M. Hajiaghayi, A.
        McGregor, M. Monemizadeh, S. Vorotnikova)
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
-   Graph Coloring
    -   [Sublinear Algorithms for (Delta+1) Vertex
        Coloring](https://arxiv.org/abs/1807.08886) ArXiv 2018 (S.
        Assadi, Y. Chen, S. Khanna)
    -   [SColoring in Graph Streams](https://arxiv.org/abs/1807.07640)
        ArXiv 2018 (S. K. Bera, P. Ghosh)
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
    -   [Graphical Model
        Sketch](https://arxiv.org/pdf/1602.03105.pdf). B. Kveton, H.
        Bui, M. Ghavamzadeh, G. Theocharous, S. Muthukrishnan, S. Sun
-   Other
    -   [Dynamic Graphs in the Sliding-Window
        Model](../papers/13-esa.pdf) ESA 2013 (M. Crouch, A.
        McGregor, D. Stubbs)
