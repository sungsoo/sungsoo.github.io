---
layout: post
title: Distributed Transactions
date: 2016-02-24
categories: [computer science]
tags: [big data]

---

# No compromises: distributed transactions with consistency, availability, and performance


## Abstract

Transactions with strong consistency and high availability simplify building and reasoning about distributed systems. However, previous implementations performed poorly. This forced system designers to avoid transactions completely, to weaken consistency guarantees, or to provide single-machine transactions that require programmers to partition their data. In this paper, we show that there is no need to compromise in modern data centers. We show that a main memory distributed computing platform called FaRM can provide distributed transactions with strict serializability, high performance, durability, and high availability. FaRM achieves a peak throughput of 140 million TATP transactions per second on 90 machines with a 4.9 TB database, and it recovers from a failure in less than 50 ms. Key to achieving these results was the design of new transaction, replication, and recovery protocols from first principles to leverage commodity networks with RDMA and a new, inexpensive approach to providing non-volatile DRAM.


<iframe width="600" height="400" src="https://www.youtube.com/embed/fYrDPK_t6J8" frameborder="0" allowfullscreen></iframe>


ACM DL: [http://dl.acm.org/citation.cfm?id=281...](http://dl.acm.org/citation.cfm?id=2815400.2815425)  
DOI: [http://dx.doi.org/10.1145/2815400.281...](http://dx.doi.org/10.1145/2815400.2815425)