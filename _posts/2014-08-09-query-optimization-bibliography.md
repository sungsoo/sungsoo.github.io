---
layout: post
title: Query Optimization Bibliography
date: 2014-08-09
categories: [computer science]
tags: [data management]

---


Query Optimization Bibliography
===============================


**Overviews**
-------------

1.  **1998. S.Chaudhuri. An Overview of Query Optimization in Relational
    Systems. PODS 98**
2.  **1996. Yannis Ioannidis. Query Optimization. In Handbook of
    Computer Science , A.B.Tucker(ed.), CRC Press.
    [(.ps)](papers/overviews/query-opt-yannis-long.ps)**
3.  **1993. G.Graefe. Query Evaluation Techniques for Large Databases.
    ACM Computing Surveys. 25(2).**
4.  **1984. M.Jarke, J.Koch. Query Optimization in Database Systems. ACM
    Computing Surveys, 16(2), June 1984.**

**[EDITH](http://edith.in.tum.de) related publications**
--------------------------------------------------------

**For a complete list follow [this
link](http://www.mistral.in.tum.de/results/publications/).**

1.  **2000. V. Markl R. Bayer On Analyzing the Cost of Queries with
    Multi-Attribute Restrictions and Sort Operations**
2.  **2000. F. Ramsak V. Markl R. Fenk M. Zirkel K. Elhardt R. Bayer.
    Integrating the UB-Tree into a Database System Kernel Proc. of VLDB
    Conf. 2000, Cairo, Egypt, 2000
    ([.pdf](papers/edith_related/vldb00.pdf))**
3.  **2000. V. Markl R. Bayer Processing Relational OLAP Queries with
    UB-Trees and Multidimensional Hierarchical Clustering**
4.  **1999. V. Markl F. Ramsak R. Bayer Improving OLAP Performance by
    Multidimensional Hierarchical Clustering. Proc. of IDEAS Conf.,
    Montreal, Canada, 1999  (.[pdf](papers/edith_related/ideas99.pdf))**
5.  **1999. V. Markl MISTRAL: Processing Relational Queries using a
    Multidimensional Access Technique Ph.D. Thesis, TU München, 1999,
    1999. published by infix Verlag, St. Augustin, DISDBIS 59, ISBN
    3-89601-459-5, 1999 
    ([.pdf](papers/edith_related/markl_phd_thesis.pdf))**
6.  **1999. V. Markl M. Zirkel R. Bayer Processing Operations with
    Restrictions in Relational Database Management Systems without
    external Sorting. Proc. of ICDE Conf., Sydney, Australia, 1999 
    ([.ps](papers/edith_related/tetris_ICDE99.ps))**
7.  **1996. R. Bayer The Universal B-Tree for multidimensional Indexing
    Technical Report TUM-I9637,November 1996. 
    ([.ps](papers/edith_related/Bayer-UB-tree-TR.ps))**
8.  **Other [UB-tree
    material](http://mistral.in.tum.de/results/presentations/ppt/).**

**Rule Based Optimization/Extensible Query Optimizers**
-------------------------------------------------------

1.  **1995.Goetz Graefe: The Cascades Framework for Query
    Optimization.Data Eng Bulletin 18(3): 19-29 (1995)**
2.  **1993. Graefe G. McKenna W.J. The Volcano optimizer generator:
    Extensibility and efficient search. In Proceedings of the IEEE Conf.
    on Data Engineering. IEEE, New York 1993.**
3.  **1993. Gail Mitchell, Umeshwar Dayal, Stanley B. Zdonik: Control of
    an Extensible Query Optimizer: A Planning-Based Approach. VLDB 1993:
    517-528**
4.  **1992. Hamid Pirahesh, Joseph M. Hellerstein, Waqar Hasan:
    Extensible/Rule Based Query Rewrite Optimization in Starburst.
    SIGMOD Conference 1992: 39-48
    ([.pdf](papers/rule_based/starburst_sigmod92_rule_based_qopt.pdf))**
5.  **1992. Graefe G. et.al. Extensible query optimization and parallel
    execution in Volcano. In Query Processing for Advanced Database
    Applications. J.Freytag. Morgan-Kaufman.**
6.  **1989. L.Haas,J.Freytag,G.Lohman,H.Pirahesh. Extensible Query
    Processing in Starburst. In Proceeding of ACM SIGMOD conf.. ACM New
    York 1989.**
7.  **1988.Guy M. Lohman: Grammar-like Functional Rules for Representing
    Query Optimization Alternatives. SIGMOD Conference 1988: 18-27**
8.  **1987.Graefe G. Dewitt D.J. The EXODUS Optimizer generator.In
    Proceeding of ACM SIGMOD conf.. ACM New York 1987.**
9.  **1987. Johann Christoph Freytag: A Rule-Based View of Query
    Optimization.SIGMOD conf. 1987: 173-180
    ([.pdf](papers/rule_based/freytag_sigmod87_rule_based_qopt.pdf))**

**Optimization of Queries with Aggregates**
-------------------------------------------

1.  **1995.Weipeng P. Yan, Per-Åke Larson: Eager Aggregation and Lazy
    Aggregation. VLDB 1995: 345-357
    ([.ps](papers/aggregates/vldb95.ps))**
2.  **1995. Surajit Chaudhuri, Kyuseok Shim: An Overview of Cost-based
    Optimization of Queries with Aggregates. Data Engineering Bulletin
    18(3): 3-9 (1995)**
3.  **1995. Ashish Gupta, Venky Harinarayan, Dallan Quass:
    Aggregate-Query Processing in Data Warehousing Environments. VLDB
    1995: 358-369 ([ext. version
    .ps](papers/aggregates/Gupta_VLDB95_extv.ps))**
4.  **1994. Surajit Chaudhuri, Kyuseok Shim: Including Group-By in Query
    Optimization. VLDB 1994: 354-366
    ([.pdf](papers/aggregates/Chaudhuri_vldb94.pdf))**
5.  **Some [more
    papers...](http://www.informatik.tu-darmstadt.de/DVS1/staff/wu/Query_Processing_and_Language/Group-by_Evaluation/)**

**Global (Multiple) Query Optimization**
----------------------------------------

1.  **1998. Simultaneous Optimization and Evaluation of Multiple
    Dimensional Queries - Yihong Zhao , Prasad Deshpande, Jeffrey F.
    Naughton, Amit Shukla , SIGMOD , 1998 .**
2.  **1988. T.Sellis.Multiple Query Optimization. ACM-TODS, 13(1):23-52,
    March 1988.**

**Optimization with User Defined Predicates/functions (expensive selection predicates)**
----------------------------------------------------------------------------------------

1.  **1999. Optimization of Queries with User-Defined Predicates. ACM
    TODS, 24(2), June 1999.**

**Caching of query results**
----------------------------

1.  **1998. Caching Multidimensional Queries Using Chunks - Prasad
    Deshpande , Karthikeyan Ramasamy, Amit Shukla, Jeffrey F. Naughton ,
    SIGMOD, 1998 .**
2.  **1988. Timos K. Sellis: Intelligent caching and indexing techniques
    for relational database systems. IS 13(2): 175-185 (1988)**

**Semantic Query Optimization**
-------------------------------

1.  **1981. J.J.King. Quist: A system for semantic query optimization in
    relational databases. In Proc, of the 7th Int. VLDB Conf., pages
    510-1517, Cannes France, August 1981.**

**Size-Value Distribution Estimation**
--------------------------------------

1.  **1988. M.V.Mannino, P. Chu, T.Sager. Statistical profile estimation
    in database systems. ACM Computing Survey, 20(3):192-221, Seprember
    1988.**

**Histograms**
--------------

1.  **1996. V. Poosala, Y.Ioannidis, P.Haas and E.Shekita. Improved
    histograms for selectivity estimations of range predicates. In ACM
    SIGMOD Conf. On the Management of Data, 1996.**
2.  **1993. Y.I. Ioannidis. Universality of serial histograms. In proc.
    of the Conf. on Very Large Databases, 1993.**
3.  **1988. M Muralikrishna and D.DeWitt. Equi-depth histograms for
    estimating selectivity factors for multi-dimensional queries. In ACM
    SIGMOD Conf. On the Management of Data, 1988.**
