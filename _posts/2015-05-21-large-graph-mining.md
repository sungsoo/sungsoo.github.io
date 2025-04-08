---
layout: post
title: Large Graph-Mining - Power Tools and a Practitioner's Guide
date: 2015-05-21
categories: [computer science]
tags: [big data]

---


## Article Source

* Title: [Tutorial T3](http://www.sigkdd.org/kdd2009/tutorials.html#t3) in [KDD2009](http://www.sigkdd.org/kdd2009/)
* Authors: [Christos Faloutsos](http://www.cs.cmu.edu/%7Echristos/), [Gary L. Miller](http://www.cs.cmu.edu/%7Eglmiller/) and [Charalampos E. Tsourakakis](http://www.cs.cmu.edu/%7Ectsourak/)

---


# Large Graph-Mining: Power Tools and a Practitioner's Guide



## Abstract

How to find patterns in large graphs, spanning Giga and Tera bytes? What
are the best tools from matrix algebra, and how can they help us solve
graph mining problems? These are exactly the goals of this tutorial.
Matrix algebra and graph theory can offer powerful tools and theorems,
like SVD, spectral analysis, community detection, and more; we single
out the most useful tools, we show the intuition behind them, and we
give one or more practical settings that each tool performed well. We
also cover the emerging map/reduce architecture, and its impact on large
graph mining.

<a href='http://videolectures.net/kdd09_faloutsos_miller_tsourakakis_lgm/'>
  <img src='http://videolectures.net/kdd09_faloutsos_miller_tsourakakis_lgm/thumb.jpg' border=0/>
  <br/>Large Graph-Mining: Power Tools and a Practitioner's Guide</a><br/>
Christos Faloutsos, Gary L Miller, Charalampos E. Tsourakakis
<br/><i><small>2 videos</small></i>

## Outline and Foils

All pdfs ([1-per-page](http://www.cs.cmu.edu/~christos/TALKS/09-KDD-tutorial/foils-pdf/FaloutsosEtAlKDD09-1up.pdf),
[4-per-page](foils4-up-pdf/FaloutsosEtAlKDD09-4up.pdf), and 
[6-per-page](foils6-up-pdf/FaloutsosEtAlKDD09-6up.pdf)).\
 [Video of the
lecture.](http://videolectures.net/kdd09_faloutsos_miller_tsourakakis_lgm/snippet/)

([pdf](http://www.cs.cmu.edu/~christos/TALKS/09-KDD-tutorial/foils-pdf/task0_intro.pdf) ) Introduction

([pdf](http://www.cs.cmu.edu/~christos/TALKS/09-KDD-tutorial/foils-pdf/task1_svd.pdf)) Task 1: Node importance

-   SVD
-   HITS
-   PageRank

([pfd](http://www.cs.cmu.edu/~christos/TALKS/09-KDD-tutorial/foils-pdf/task2_communities.pdf)) Task 2: Community detection

-   METIS, Spectral partitioning
-   co-clustering, cross-associations

([pdf](http://www.cs.cmu.edu/~christos/TALKS/09-KDD-tutorial/foils-pdf/task3_recommendations.pdf)) Task 3: Recommendations

-   Proximity

([pdf](http://www.cs.cmu.edu/~christos/TALKS/09-KDD-tutorial/foils-pdf/task4-ceps.pdf)) Task 4: Connection sub-graphs

([pdf](http://www.cs.cmu.edu/~christos/TALKS/09-KDD-tutorial/foils-pdf/task5-tensors.pdf)) Task 5: Mining graphs over time &
tensors

-   PARAFAC, Tucker

([pdf](http://www.cs.cmu.edu/~christos/TALKS/09-KDD-tutorial/foils-pdf/task6-virusProp.pdf)) Task 6: Virus/influence
propagation

([pdf](http://www.cs.cmu.edu/~christos/TALKS/09-KDD-tutorial/foils-pdf/task7_theory.pdf)) Task 7: Spectral Graph Theory: 

-   Properties of Adjacency Matrix, Laplacian, 
-   Sparsest cut and Cheeger Inequality, Normalized Laplacian

([pdf](http://www.cs.cmu.edu/~christos/TALKS/09-KDD-tutorial/foils-pdf/task8_hadoop.pdf)) Task 8: Tera/peta graph mining:
Hadoop

([pdf](http://www.cs.cmu.edu/~christos/TALKS/09-KDD-tutorial/foils-pdf/task9-conclusions.pdf)) Conclusions

## Target Audience

The target audience are data mining and machine learning professionals
who wish to know the most important matrix algebra tools and their
applications in large graph mining.

## Prerequisites

Computer science background (B.Sc or equivalent); familiarity with
undergraduate linear algebra.

## References

1.  Sergey Brin and Lawrence Page. The Anatomy of a Large-Scale
    Hypertextual Web Search Engine, Computer Networks 30(1-7): 107-117,
    1998.
2.  Randy Bryant. Data Intensive Scientific Computing, Tech report.
    available at
    http://www.cs.cmu.edu/\~bryant/pubdir/cmu-cs-07-128.pdf.
3.  Deepayan Chakrabarti, Spiros Papadimitriou, Dharmendra S. Modha, and
    Christos Faloutsos. Fully Automatic Cross-Associations, KDD 2004,
    Washington, DC.
4.  Fan R. K. Chung: Spectral Graph Theory (AMS)
5.  Inderjit S. Dhillon, Subramanyam Mallela, and Dharmendra S. Modha.
    Information-theoretic co-clustering. KDD 2003, Washington, DC.
6.  Jeffrey Dean and Sanjay Ghemawat. MapReduce: Simplified Data
    Processing on Large Clusters. OSDI'04 ,San Francisco, CA
7.  Petros Drineas, Ravi Kannan, and Michael W. Mahoney. Fast monte
    carlo algorithms for matrices iii: Computing a compressed
    approximate matrix decomposition, SIAM Journal of Computing, 2005.
8.  Chris Godsil and Gordon Royle: Algebraic Graph Theory (Springer)
9.  Jon Kleinberg. Authoritative sources in a hyperlinked environment,
    Proc. 9th ACM-SIAM Symposium on Discrete Algorithms, 1998.
10. Tamara Kolda, Brett Bader, and Joseph Kenny. Higher-order Web link
    analysis using multilinear algebra, ICDM 2005, Houston, Texas.
11. Jure Leskovec, Jon Kleinberg and Christos Faloutsos. Graphs over
    Time: Densification Laws, Shrinking Diameters and Possible
    Explanations, KDD 2005, Chicago, IL. ("Best Research Paper" award).
12. Jure Leskovec, Deepayan Chakrabarti, Jon Kleinberg, and Christos
    Faloutsos. Realistic, Mathematically Tractable Graph Generation and
    Evolution, Using Kronecker Multiplication, ECML/PKDD 2005, Porto,
    Portugal.
13. Jure Leskovec and Christos Faloutsos. Scalable Modeling of Real
    Graphs using Kronecker Multiplication, ICML 2007, Corvallis, OR, USA
14. Jure Leskovec, Mary McGlohon, Christos Faloutsos, Natalie S. Glance,
    and Matthew Hurst. Patterns of Cascading Behavior in Large Blog
    Graphs, SDM 2007, Minneapolis, Minnesota.
15. Bojan Mohar and Svatopluk Poljak: Eigenvalues in Combinatorial
    Optimization, IMA Preprint Series \#939
16. Shashank Pandit, Duen Horng (Polo) Chau, Samuel Wang and Christos
    Faloutsos. NetProbe: A Fast and Scalable System for Fraud Detection
    in Online Auction Networks WWW 2007, Banff, Alberta, Canada, May
    8-12, 2007.
17. Gilbert Strang: Introduction to Applied Mathematics
    (Wellesley-Cambridge Press)
18. Jimeng Sun, Dacheng Tao, and Christos Faloutsos. Beyond Streams and
    Graphs: Dynamic Tensor Analysis, KDD 2006, Philadelphia, PA.
19. Jimeng Sun, Yinglian Xie, Hui Zhang, Christos Faloutsos. Less is
    More: Compact Matrix Decomposition for Large Sparse Graphs, SDM
    2007, Minneapolis, Minnesota. ("Best Research Paper" award)
20. Jimeng Sun, Spiros Papadimitriou, Philip S. Yu, and Christos
    Faloutsos. GraphScope: parameter-free mining of large time-evolving
    graphs, KDD 2007, San Jose, CA.
21. Hanghang Tong, Christos Faloutsos, and Jia-Yu Pan. Fast Random Walk
    with Restart and Its Applications, ICDM 2006, Hong Kong. ("Best
    Research Paper" award)
22. Hanghang Tong and Christos Faloutsos. Center-Piece Subgraphs:
    Problem Definition and Fast Solutions, KDD 2006, Philadelphia, PA.
23. Hanghang Tong, Brian Gallagher, Tina Eliassi-Rad, and Christos
    Faloutsos. Fast best-effort pattern matching in large attributed
    graphs, KDD 2007, San Jose, CA.
24. Hanghang Tong, Yehuda Koren, and Christos Faloutsos. Fast
    direction-aware proximity for graph mining, KDD 2007, San Jose, CA.
25. Hanghang Tong, Spiros Papadimitriou, Philip S. Yu and Christos
    Faloutsos. Proximity Tracking on Time-Evolving Bipartite Graphs. SDM
    2008, Atlanta, GA.
26. Hanghang Tong, Spiros Papadimitriou, Jimeng Sun, Philip S. Yu, and
    Christos Faloutsos. Colibri: Fast Mining of Large Static and Dynamic
    Graphs, KDD 2008, Las Vegas, NV.
27. Charalampos Tsourakakis: Fast Counting of Triangles in Large Real
    Networks, without counting: Algorithms and Laws, ICDM '08
28. Yang Wang, Deepayan Chakrabarti, Chenxi Wang and Christos Faloutsos.
    Epidemic Spreading in Real Networks: an Eigenvalue Viewpoint, SRDS
    2003, Florence, Italy.

