---
layout: post
title: Main Memory Databases 
date: 2016-02-05
categories: [computer science]
tags: [data management]

---

# Main-Memory Databases

Current database systems were designed assuming that data resides on
disk. This assumption is no longer valid; *main memories* have become
sufficiently large that most OLTP databases can reside entirely in
memory. In this project we investigate what architectural changes and
new techniques are required to realize the potential for great
performance improvements offered by storing data in main memory.

## Related Papers

-   Ahmed Eldawy, Justin Levandoski, and Paul Larson, [Trekking Through
    Siberia: Managing Cold Data in a Memory-Optimized
    Database](http://research.microsoft.com/apps/pubs/default.aspx?id=218305), in *International
    Conference on Very Large Databases (PVLDB Vol. 7, Issue. 11), June
    2014*, VLDB – Very Large Data Bases, September 2014.
-   Justin Levandoski, David Lomet, Sudipta Sengupta, Adrian Birka, and
    Cristian Diaconu, [Indexing on Modern Hardware: Hekaton and
    Beyond](http://research.microsoft.com/apps/pubs/default.aspx?id=213089), in *Proceedings of the
    ACM SIGMOD International Conference on Management of Data, SIGMOD
    2014* , ACM, June 2014.
-   Karolina Alexiou, Donald Kossmann, and Per-Ake Larson, [Adaptive
    Range Filters for Cold Data: Avoiding Trips to
    Siberia](http://research.microsoft.com/apps/pubs/default.aspx?id=220613), VLDB – Very Large Data
    Bases, September 2013.
-   Cristian Diaconu, Craig Freedman, Erik Ismert, Per-Ake Larson,
    Pravin Mittal, Ryan Stonecipher, Nitin Verma, and Mike Zwilling,
    [Hekaton: SQL Server’s Memory-Optimized OLTP
    Engine](http://research.microsoft.com/apps/pubs/default.aspx?id=193594), ACM International
    Conference on Management of Data, 22 June 2013.
-   Justin Levandoski, David Lomet, and Sudipta Sengupta, [The Bw-Tree:
    A B-tree for New Hardware](http://research.microsoft.com/apps/pubs/default.aspx?id=178758), in
    *2013 IEEE 29th International Conference on Data
    Engineering (ICDE)*, International Conference on Data Engineering, 8
    April 2013.
-   Justin J. Levandoski, Per-Ake Larson, and Radu Stoica, [Identifying
    Hot and Cold Data in Main-Memory
    Databases](http://research.microsoft.com/apps/pubs/default.aspx?id=176690), in *2013 IEEE 29th
    International Conference on Data Engineering (ICDE)*, International
    Conference on Data Engineering, 8 April 2013.
-   Per-Åke Larson, Spyros Blanas, Cristian Diaconu, Craig Freedman,
    Jignesh Patel, and Mike Zwilling, [High-Performance Concurrency
    Control Mechanisms for Main-Memory
    Databases](http://research.microsoft.com/apps/pubs/default.aspx?id=156645), in *PVLDB Vol 5(4)*,
    Very Large Data Bases Endowment Inc., December 2011.

