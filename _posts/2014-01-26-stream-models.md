---
layout: post
title: Stream Models
date: 2014-01-26
categories: [computer science]
tags: [big data]

---

Stream Models
---
For the purpose of this lecture, data streams have the following properties:

* They are *sequences* of records, ordered by *arrival time* or by another ordered attribute such as generation time (which is likely to be correlated with, but not equivalent to, the arrival time), that arrive for processing over time instead of being available a priori;  
* They are produced by a *variety* of external sources, meaning that a **DSMS** has no control over the arrival order or the data rate;  
* They are produced continually and, therefore, have unbounded, or at least unknown, length. Thus, a DSMS may not know if or when the stream “ends”.  

We distinguish between *base streams* produced by the sources and *derived streams* produced by *continuous queries* and their operators. In either case, we model individual stream items as relational tuples with a fixed schema. For instance, an Internet traffic stream (more specifically, a TCP or UDP packet stream) may have the following schema, where size indicates the number of bytes of data contained in each packet and timestamp is the packet generation time:  

```
<timestamp, source IP address, source port, destination IP address,
destination port, size>.  
```  

Since there may be multiple connections between the same pair of nodes (IP addresses and ports) over time, the first *five fields* form a key. We may also tag each tuple with its arrival time in addition to the generation time; this is useful for measuring the response time of the **DSMS** (i.e., the time it takes to produce results in response to the arrival of a new tuple). On the other hand, a stream of router *CPU utilization* measurements may have the following schema, with new measurements arriving from each router every five minutes (here, timestamp and router ID are a key):  

```
<timestamp, router ID, cpu_usage>.  
```  

Some models require a stream to be *totally ordered*, whereas others do not distinguish among items having the same value of the ordering attribute. Recently, a *unified model* was proposed that allows both alternatives.  
In practice, *base streams* are almost always *append-only* in the sense that previously arrived items (i.e., those with previously seen keys) are never modified; in the remainder of this lecture, we assume that every base stream is append-only. However, derived streams may or may not be append- only. For instance, consider the following query, *Q1*, over an Internet traffic stream **S** (assume that <tt class="literal">timestamp</tt> is the packet generation time measured in seconds, similar to a Unix timestamp):  

```sql
Q1: SELECT minute, source_IP_address, SUM(size) AS total_traffic   
	 FROM S  
	 GROUP BY timestamp/60 AS minute, source_IP_address  
```

At the end of each one-minute window, this query computes the total traffic originating from each source IP address during the given window (we will discuss continuous query semantics and languages in more detail later in this chapter). Thus, <tt class="literal">minute</tt> and <tt class="literal">source_IP_address</tt> are a key for the output stream of this query. However, since packets may arrive late, incorrect <tt class="literal">total_traffic</tt> values may be returned if they are computed *eagerly* right at the end of every minute, say, according to the local clock. One solution is to produce revised answers that take late arrivals into account, meaning that the output stream may contain updates to previously seen <tt class="literal">total_traffic</tt> values. Note that this example is meant only to illustrate that derived streams may not be append-only. As we will discuss later in this article, there are other ways of dealing with *out-of-order arrivals*, such as *buffering*.


Data streams often describe underlying “*signals*”. Let S : [*1...N* ] → **R** be a signal, represented as a mapping from a *discrete* domain to the *reals*. For example, one signal carried by an Internet packet stream maps each source IP address to the total number of bytes sent from that address (i.e., *N = 2<sup>32</sup>* since an IP address is 32 bits long); another maps each destination IP address to the total number of bytes received by it. There are at least four ways in which a data stream can represent a signal:  

* In the *aggregate model*, each stream item contains a range value for a particular value in the domain of S.  
* In the *cash register model*, each stream item contains a partial non-negative range value for a particular value in the domain of S. Hence, to reconstruct the signal A, we need to aggregate the partial range values for each domain value.
* The *turnstile model* generalizes the cash register model by allowing the partial range values to be negative.
* In the *reset model*, each stream item contains a range value for a particular value in the domain of **S**, which replaces all previous range values for this domain value.

The Internet packet stream examples correspond to the *cash register model* since the underlying signals (e.g., total traffic per source and total traffic per destination) are computed by aggregating data from individual packets, while router CPU measurements are examples of the reset model since new measurements effectively replace old ones (assuming that the domain of the signal consists of all the routers being monitored). Alternatively, in the router CPU example, a signal whose domain elements are labeled with the router id and the 5-minute measurement window corresponds to the *aggregate model*: each domain value occurs exactly once in the stream, assuming that there is exactly one measurement from each router in each 5-minute window. The turnstile model usually appears in derived streams, e.g., a difference of two *cash-register base streams*.



References
---
[1] Lukasz Golab and M. Tamer Özsu, *Data Stream Management*, Synthesis Lectures on Data Management, 2010.
