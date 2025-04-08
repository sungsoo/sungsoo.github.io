---
layout: post
title: Continuous Query Semantics and Operators (Part I)
date: 2014-01-27
categories: [computer science]
tags: [big data]

---


Semantics and Algebras
---
In a DSMS, queries are issued once and run continuously, incrementally producing new results over time. Let *Q* be a continuous query, whose inputs are one or more append-only data streams and zero or more relations. For now, assume that relations are static throughout the lifetime of the query. Let *Q*(*τ*) be the result of *Q* at time *τ* . Intuitively, we want *Q* to produce “*correct*” answers at any point in time, taking into account all the data that have arrived so far.

**Definition 2.1** At any time *τ* , *Q*(*τ*) must be equal to the output of a corresponding traditional database query, in which all references to streams are replaced by relations constructed from prefixes of the streams up to time *τ*.

Optionally, the output may be refreshed periodically, in which case the variable *τ* in the above definition ranges over the refresh times rather than each time tick.  
Two types of continuous query algebras have been proposed in the literature, both based on relational algebra. In a *stream-to-stream* algebra, each operator consumes one or more streams (and zero or more relations) and incrementally produces an output stream. In a *mixed* algebra, there are three sets of operators: those which produce a relation from a stream (e.g., sliding windows), those which produce a relation from one or more input relations (i.e., the standard relational algebraic operators), and those which produce a stream from a relation. Conceptually, at every time tick, an operator converts its input to relations, computes any new results, and converts the results back a stream that can be consumed by the next operator. Since the converted relations change over time, a natural way of switching back to a stream is to report the difference between the current result and the result computed one time tick ago. This is similar to computing a set of changes (insertions and/or deletions) required to update a materialized view.


References
---
[1] Lukasz Golab and M. Tamer Özsu, *Data Stream Management*, Synthesis Lectures on Data Management, 2010.
