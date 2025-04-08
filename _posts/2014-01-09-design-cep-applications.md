---
layout: post
title: Pattern Matching Techniques
date: 2014-01-09
categories: [computer science]
tags: [big data]

---
<script type="text/javascript"  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

CEP Architecture
---

CEP is used for event processing within an *event-driven architecture*. Unlike a simple event processing or event stream processing mechanism, CEP uses *event-correlation* and *pattern-matching* techniques to “**infer**” complex events. It augments business *activity monitoring with inferences* from source events treated as business events and sent for further action or analysis via dashboards. In business process management, CEP is used as an enrichment system that reports business events as they occur. Threats and opportunities are reported to further workflows. In a service-oriented architecture, CEP systems can be used to determine the business trigger to launch further services in the processing pipeline.


DESIGN CONSIDERATIONS
---

In building CEP applications, designers can employ a set of common building blocks. A typical CEP architecture would be as follows:

![](http://sungsoo.github.com/images/typical-cep-architecture.png)

The *event sources* are responsible for producing or sending the events. The sources could be pushing events (such as tickers); in some event sources, a pull (such as database or web services) can be employed.

Within the *CEP engine*, some pre-processing is generally required. It may include converting the source-specific event format to a format understandable by the CEP engine. Once pre-processing is complete, events are washed over pre-defined queries. A *matching pattern* is then interpreted as a complex event and forwarded to post-processing.

The post-processing could be a reverse of the pre-processing in which the CEP-specific format is undone and a *sink*- or *target-specific* format is created. The event could then be made available to the target as a **push** or a **pull**.

Given the architecture above—and regardless of the CEP platform—there are some common patterns across CEP applications. The following sections will provide a brief overview on such patterns.

### PATTERN-MATCHING TECHNIQUES

*Pattern matching* is an integral element of complex event processing. Pattern matching lets a business situation be *inferred* or *identified*. It involves combining several methods, such as *grouping* and *correlating*, as well as *filtering* and *aggregation* to identify a specific pattern to events within or across streams.

#### Correlations

The first step of applying a pattern is to group relevant events, forming a “*window*.” These events are correlated using a common set of techniques called window policies:


1. *Temporal windows*, also known as *time windows*, can be used to do a stateful event correlation based on the event occurrence. Based on the time, a “**peephole**”
is created on the event stream, and the state of the previous events in the stream is used with the current event’s state to determine a pattern.  
*Example*: Stock value declined by 5 percent within one hour of buying the stock


2. *Spatial correlation* or *dimension-based windows* are similar to temporal windows. The difference is that the peephole focuses on *number of events* rather than time. This technique is also called *count windows*, as the count of events determines the window.  
*Example*: Three consecutive high stock prices in the stock ticker


3. *Direct filters* can be applied on the attributes of the event or on aggregated events.  
*Example*: Event.CurrencyPair == EURUSD
 
*Temporal* windows and *dimension* windows could be started and stopped based on set conditions. Events within windows, known as “**tuples**,” are evicted based on an eviction policy. When all the tuples are evicted from the existing window before a new window is created,
the window is called a *tumbling window*. Sometimes only the oldest tuple or tuples get evicted so that the window condition is met; this type of window is called a *sliding window*.

To illustrate the **tumbling window** and **sliding window**, consider the following input stream:

![](http://sungsoo.github.com/images/input-stream.png)

In this stream, each box represents a new event. The order of the events is strictly increasing by time. Applying a *dimension* of 3 and specifying a *tumbling window* will result in the events being grouped as follows:

![](http://sungsoo.github.com/images/stream-group.png)

Each alternate color indicates a **new window**. No events are repeated in the next window. Applying the same dimension of 3, if the window is specified as a *sliding window*, the events will be grouped as follows:

![](http://sungsoo.github.com/images/sliding-window.png)

Here, too, the alternate color indicates a **new window**. However, as the new event comes in, the old event is *evicted* to retain the number of events to the specified dimension of 3.


*Direct filters* based on **predicate expressions** over event attributes are another important way of *partitioning* events. Typically, high-volume, no-value or low-value events should be filtered out so that the residues of low-volume, high-value events are subjected to further processing. 

For example, if the interest is only on
how the Euro fares against the USD, the filter would eliminate all other currency pairs. The remaining stream would contain only events with EURUSD as the currency pair.


Note that all of the above could happen on one stream or on multiple streams from multiple event sources.


#### Computing Aggregates
As events are *correlated*, *aggregates* should be calculated for further computation or filtering.

To calculate an **aggregate**, events should be grouped into a *set*. Grouping events can be achieved through *window partitioning techniques* as discussed above.


Aggregates can be calculated on any type of window—including *temporal*, *dimension*, *tumbling* or *sliding* windows.


For example, consider the following stream of events:

![](http://sungsoo.github.com/images/input-stream.png)

Assuming the number in the box indicates the *event weight*, to calculate an average weight for 3 events, the first step would be to partition the window based on the dimension (count = 3).

If the window is a *tumbling window*, the average for each window would be calculated as follows:

![](http://sungsoo.github.com/images/tumbling-window.png)

If the window is specified as a *sliding window*, the aggregate value and the window would be as follows:

![](http://sungsoo.github.com/images/window-average.png)


Most CEP platforms have simple, built-in aggregate functions, such as sum(), avg(), min(), max(), count().


Some platforms allow running *statistical* calculations— such as stddev(), median(), variance()—and support retrieving values from the window—such as first(), last(), firstn(), lastn()—for writing aggregate expressions on the window.

These platforms also offer extension points so that *user-defined aggregate functions* can be written in an external language, such as Java, C++ or C#, and called for *calculating the aggregate*.

Care should be exercised when writing a custom or a user-defined aggregate function; performance of the function could be a key factor. Proper impact analysis and testing should be carried out to check if this would constrain the event-processing pipeline.

As each event arrives, it participates in the *aggregate expression*. The state of the event stream is remembered in further computations—that is, the events within a window that participated in the previous computation will not be used on the next computations.

Thus, the aggregate values computed can be emitted when the window is closed or when the tuples are emitted. The emission of the aggregate value is periodic and calculated within the *working set*.

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