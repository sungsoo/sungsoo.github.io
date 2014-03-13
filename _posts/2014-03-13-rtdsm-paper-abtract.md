---
layout: post
title: Stream Data Processing for Performance Evaluation of the Equipment in an Offshore Plant
date: 2014-03-13 
categories: [computer science]
tags: [papers, publications]

---

#### Key Words
*stream computing, complex event processing, stream data processing*


# Abstract

In recent years, big data is great interest to production an operation work in the offshore plants as well as enterprise resource planning. Being able to predict future equipment performance based on historical results, or to identify sub-par production zones, can be used to shift assets to more productive areas. Equipment maintenance is one of the important applications for production efficiency of an offshore plant. 

In this paper, we present the stream data processing architecture for computing the performance of the centrifugal compressor. Our system consists of two major components, such as, virtual tag stream generator (VTSG) and real-time data stream manager (RTDSM). Real-time data stream manager, which is based on the Esper complex event processing engine, handles stream sources such as tag streams in the compressor. In order to provide the scalability of our system, we exploit parallel programming approach to process massive amount of stream data using multi-core CPUs. In addition, we provide experimental evidence demonstrating the improvements of stream data processing for centrifugal compressor.
        

References
---
[1] Gunther Hagleitner, [*Hive on Tez*](https://cwiki.apache.org/confluence/display/Hive/Hive+on+Tez#HiveonTez-Multiplereducestages), Apache Hive Design Documentation, Jan 31, 2014.