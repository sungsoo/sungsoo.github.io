---
layout: post
title: In-Memory Caches
date: 2014-01-09
categories: [computer science]
tags: [stream computing, data management]

---
<script type="text/javascript"  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

Most CEP platforms provide some sort of *in-memory caches* as part of the runtime engine.

**In-memory caches** are used by the CEP engine primarily to store events and windows. Caches are also used for other purposes, such as sharing data between streams, maintaining state and storing external data (from relational databases and data from web services, for example) for ultra-fast processing. These data types
are stored outside the windows and event streams but can participate in computation when required. It should be noted that data stored in this cache is not persistent unless specified otherwise; when a server is shut down, the cached data goes down with it.


CEP engines implicitly manage evictions while caching events and windows using policies such as *Least Frequently Used* (LFU), *Least Recently Used* (LRU), and *First in First out* (FIFO) when the maximum cache size is reached. Eviction of user-defined cache objects should be managed explicitly.


In case an application requires a persistent cache wherein data is not lost across the runs or when one node fails, CEP engines can be integrated to use disk- based cache or distributed cache that is out of process. Some platforms bundle these alternative caching mechanisms as a feature; others can be extended to use an off-the-shelf product. Depending on the platform, these alternative mechanisms can be used to store events received or reference data.


A *persistent cache* plays an important role in *high availability*. From a performance point of view, however, in-memory caches are much faster. If the reads are high and the invalidation happens rarely for a relatively small data volume, the distributed cache objects could be replicated in memory to form a near-cache. A tradeoff between high availability and speed would determine caching design.


### References

[1] [Complex Event Processing – 10 Design Patterns – Sybase](http://m.sybase.com/files/White_Papers/CEP-10-Design-Patterns-WP.pdf)  
[2] [Big Data vs Event Processing – The TIBCO Blog](http://www.tibco.com/blog/2012/01/26/big-data-vs-event-processing/)  
[3] [Understanding Scalability – Oracle CEP Guide](http://docs.oracle.com/cd/E14571_01/doc.1111/e14301/scalunder.htm)  
[4] [The Forrester WaveTM: Complex Event Processing (CEP) Platforms](http://www.reinsa.co.cr/2009wave_complex_event_processing_cep_platforms_q3.pdf), Q3 2009.  
[5] [Storm & Esper](http://tomdzk.wordpress.com/2011/09/28/storm-esper/)  
[6] [The Esper CEP Ecosystem](http://blog.octo.com/en/the-esper-cep-ecosystem/)  
[7] *Enterprise Integration Patterns*: Designing, Building, and Deploying Messaging Solutions- Gregor Hohpe,Bobby Wool; Addison-Wesley Professional.    
[8] *A Hitchhiker’s Guide to Microsoft StreamInsight Queries* - Ramkumar (Ram) Krishnan, Jonathan Goldstein,
Alex Raizman (Version: Jun 12 2012)  
[9] [StreamInsight: User Defined Aggregates and Operators - MSDN](http://msdn.microsoft.com/en-us/library/ee842720.aspx)  
[10] StreamBase: Expression Language Functions  
[11] [Esper: Packaging and Deploying](http://esper.codehaus.org/esper-4.0.0/doc/reference/en/html/packaging_deployment.html)  
[12] [StreamBase: Administration Guide](http://docs.streambase.com/sb72/index.jsp?topic=/com.streambase.sb.ide.help/data/html/admin/index.html)  
[13] [StreamInsight: Planning and Architecture](http://msdn.microsoft.com/en-us/library/ee391397(v=sql.111).aspx)  
[14] [StreamInsight: Resiliency](http://msdn.microsoft.com/en-in/library/hh290501.aspx)  
[15] Oracle Complex Event Processing High Availability  
[16] StreamBase tuning tips  
[17] [Fincos – Benchmarking tool for CEP systems](https://code.google.com/p/fincos/)  
[18] Mohd. Saboor, Rajesh Rengasamy, *Designing and Developing Complex Event Processing Applications*, Sapient Global Markets, August 2013.