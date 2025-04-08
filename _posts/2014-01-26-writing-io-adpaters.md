---
layout: post
title: Writing Input And Output Adapters
date: 2014-01-26
categories: [computer science]
tags: [big data]

---

A classic adapter’s intent is to convert the interface of a class into another interface that clients expect. Doing so allows classes to work together that otherwise could not due to incompatible interfaces.

Adapters in the CEP world are no different—except that they have an additional responsibility. Depending on whether an adapter is an input or output adapter, the *primary responsibilities* of a CEP adapter are to:


1. **Read from source or write to sink**  
	* Events can be delivered to the consumer from
the provider using a *push* or a *pull*.  
	* Adapters should know how to connect (*access
mechanism*) with the source or sink. 

2. **Transform**
	* An event could be *transformed* from source event type to CEP known type or from CEP known type to destination event type.
	
3. **Enqueue or Dequeue**  
	* Once the transformation is done, the event will
be either placed or removed in/from the CEP engine.


Typically, an input adapter would perform the *Read*, *Transform* and *Enqueue* while an output adapter would do a *Dequeue*, *Transform* and *Write* in the same order.


In the trade processing scenario described above, market feeds should be continuously monitored. The input adapter has to continuously read the incoming tuples and events, transform them, and feed them to the CEP engine so that events can be partitioned and aggregate results deduced. Similarly, the output adapter will wait on the decisions inferred from the CEP engine, transform them to target- or sink-specific type, and write to the sink.

Esper has a very basic set of pre-built adapters (CSV, Spring JMS, HTTP, Socket, JDBC and XML). It also bundles the OpenTick input adapter specifically for capital market scenarios.

StreamInsight does not ship with any pre-built adapters because of its emphasis on ease of adapter creation using IEnumerable and IObservable. Some basic adapter sets that exist in the web include CSV, SQL Server, MSMQ and WCF.
Esper and StreamInsight come with an adapter
kit that can be used to write specific adapters fitting the purposes.
StreamBase has adapters built for most of the common data and connectivity tasks. Immediately available adapters include CSV, SQL Server, Oracle, IBM MQ, TIBCO, e-mail and Hadoop. Apart from these general adapters, it also offers an exhaustive list of capital market–specific adapters for FX, FIX, market feeds from various sources, and financial news feeds. Its adapter kit supports .NET languages as well as Java.

It should be noted that depending on the architecture chosen, these adapters can be built embedded within the CEP platform or built externally. Some platforms support this inherently; in others, it is not difficult
to model. Regardless of this design choice, the CEP engine has to work with a known type so that it can run the pattern-matching queries.

For rapid application development, off-the-shelf adapters would be very useful. If the number of input stream and output stream types are relatively low, writing an adapter should not be time consuming. However, complexity would grow as the number of incoming and outgoing event types increases.


References
---

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