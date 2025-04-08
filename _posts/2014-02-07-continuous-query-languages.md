---
layout: post
title: Continuous Quries Languages
date: 2014-02-07
categories: [computer science]
tags: [big data]

---


CONTINUOUS QUERY LANGUAGES
---

Most DSMSs employ *declarative* query languages with SQL-like syntax, possibly with additional keywords for windows and novel operators such as sampling or relation-to-stream conversion. One exception is SQuAl, the graphical boxes-and-arrows language used in the Aurora DSMS; however, it, too, supports *non-blocking* relational-like operators such as selection, projection, union, join and group-by-aggregation. Although the surface syntax may be similar to SQL, the semantics and operator implementations of continuous queries are considerably different from traditional one-time queries.

First, we remark that most DSMSs use variants of <tt class="literal">CREATE STREAM</tt> statements to specify the schema and source (e.g., port number) of streaming inputs. Systems that also support relational input allow tables to be defined using the standard <tt class="literal">CREATE TABLE</tt> command.

STREAMS, RELATIONS AND WINDOWS
---

GSQL is used by the GS Tool and is a representative of simple, purely stream-to-stream languages with monotonic operators only. 
It supports a restricted subset of non-blocking versions of standard relational operators and requires all the inputs (and output) to be streams. GSQL has direct support only for tumbling windows that are specified by grouping on a timestamp attribute and must be used with joins and aggregation. However, sliding window aggregates, as well as join of streams with relations, may be encoded as UDAFs. *Q1* and *Q2* were written in a syntax similar to GSQL.

CQL, which is used by the STREAM DSMS, is a powerful language that supports streams, relations, sliding windows, and negative tuples. It contains three types of operators: *relation-to-relation operators* that are similar to standard relational operators, sliding
windows that convert streams to time-varying relations, and three *relation-to-stream operators*: <tt class="literal">Istream, Dstream</tt> and <tt class="literal">Rstream</tt>. The <tt class="literal">Istream</tt> operator compares the current output of the query (represented as a relation) with the output as of the current time minus one and returns only the new results. In contrast, at any time, <tt class="literal">Dstream</tt> returns all the results that existed in the answer set at the current time minus one but do not exist at the current time. That is, <tt class="literal">Dstream</tt> returns all the negative tuples required to maintain a materialized view of the result. Finally, <tt class="literal">Rstream</tt> streams out the entire result at any given time.

In contrast to GSQL’s *tumbling-only windows*, CQL supports *sliding windows* to convert streams to relations. Time-based windows of length *N* are specified with the <tt class="literal">[RANGE N]</tt> keyword following the reference to a stream. Count-based windows are denoted as <tt class="literal">[ROWS N]</tt> and partitioned windows on some attribute attr as <tt class="literal">[PARTITION BY attr ROWS N]</tt>. Windows containing only those tuples whose timestamps are equal to the current time are denoted as <tt class="literal">[NOW]</tt>, and a prefix of a stream up to now can be turned into a relation using <tt class="literal">[RANGE UNBOUNDED]</tt> or <tt class="literal">[ROWS UNBOUNDED]</tt>.

To illustrate CQL’s windows and relation-to-stream operators, consider a simple selection over a network traffic stream *S*:

```sql
Q5:	SELECT Istream(*)
	FROM S [RANGE UNBOUNDED]
	WHERE source_IP_address = "1.2.3.4"
```

Since this query is monotonic, it suffices to output new results at every time tick (using <tt class="literal">Istream</tt>), calculated over all the data that have arrived so far. Since this query is stateless, another way to express is by returning all the tuples that satisfy the selection predicate at any instant of time (using <tt class="literal">Rstream</tt>), over a <tt class="literal">NOW</tt> window of tuples that have arrived at that time instant:

```sql
Q6:	SELECT Rstream(*) 
	FROM S [NOW]
	WHERE source_IP_address = "1.2.3.4"
```

Note that using <tt class="literal">Rstream</tt> and unbounded windows with the above queries gives a different and arguably less desirable result—at any point in time, we repeatedly receive all the packets from IP address 1.2.3.4 that have arrived up to now. In general, the problem with repetitions in the output of <tt class="literal">Rstream</tt> is that other operators in the plan may not be able to process it properly, as it is neither an append-only stream of new results nor a stream of positive and negative deltas. CQL also provides syntactic shortcuts: windows are unbounded by default; Istream is the default relation-to-stream operator for monotonic queries, etc. Applying these shortcuts, the above queries may be written simply as <tt class="literal">SELECT * FROM S WHERE Source_IP_address = "1.2.3.4"</tt>.

In CQL, joins are usually expressed using <tt class="literal">Istream</tt> and sliding windows. In this case, the windows are implicit since <tt class="literal">Istream</tt> only generates new results.To express joins over explicit windows such as those in Figure 2.2, we need to write two queries, one with <tt class="literal">Istream</tt> (positive deltas) and one with Dstream (negative deltas), and merge their results. Notably, the SyncSQL language used in the Nile system can return both positive and negative tuples in a single query with the <tt class="literal">SELECT STREAMED</tt> keyword.

So far, we have given examples of queries with windows whose default behaviour is to slide whenever new tuples arrive. However, jumping windows are often used with aggregation for per- formance reasons; additionally, users may find it easier to deal with periodic output rather than a continuous output stream. CQL as well as the ESL language used in Stream Mill support aggregates over jumping windows via the <tt class="literal">SLIDE</tt> construct. For example, Q7 computes the total traffic originating from each source over the last five minutes, with new results returned every minute:

```sql
Q7:	SELECT Rstream(source_IP_address, SUM(size)) 
	FROM S [RANGE 5 min SLIDE 1 min]
	GROUP BY source_IP_address
```

Note that in the CQL version of this query, as shown above, we need to use <tt class="literal">Rstream</tt> to ensure that the complete result is produced every minute.

Summary
---
**Table 2.1** summarizes the continuous query languages discussed in this section in terms of their inputs and outputs, and the window types that they support; for a broader comparison, we refer the interested reader to an article by Cherniack and Zdonik.

![](http://sungsoo.github.com/images/summary-cql.png)

￼References
---
[1] Lukasz Golab and M. Tamer Özsu, *Data Stream Management*, Synthesis Lectures on Data Management, 2010.
