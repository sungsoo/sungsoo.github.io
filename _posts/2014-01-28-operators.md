---
layout: post
title: Continuous Query Semantics and Operators (Part II)
date: 2014-01-28
categories: [computer science]
tags: [data management, stream computing]

---

Operators
---

In this post, we now introduce common *continuous query operators*. First, we need to define two important concepts: *monotonicity* and *non-blocking* execution.

**Definition 2.2** A continuous query or continuous query operator *Q* is *monotonic* if *Q*(*τ*) ⊆ *Q*(*τ′*) for all *τ ≤ τ′*.  

For example, simple *selection* over a single stream or a *join* of several streams are *monotonic* (recall our assumption that base streams are append-only). To see this, note that when a new tuple arrives, it either satisfies the (selection or join) predicate or it does not, and the *satisfaction condition* does not change over time. Thus, at any point in time, all the previously returned results remain in *Q*(*τ*). On the other hand, continuous queries with *negation* or *set difference* are *non-monotonic*, even on *append-only streams*.  

**Definition 2.3** A continuous query or continuous query operator *Q* is *non-blocking* if it does not need to wait until it has seen the entire input before producing results.  

Some operators have *blocking* and *non-blocking* implementations; of course, only the latter are used in DSMSs since we do not know when we will have seen the entire input. For instance, *traditional SQL* queries with aggregation are *blocking* since they scan the whole relation and then return the answer. However, on-line aggregation, where *partial* answers are incrementally returned as they are computed over the data seen so far, is non- blocking. Note that **Definitions 2.2** and **2.3** are related: *Q* is *monotonic* if and only if it is *non-blocking*.  

The simplest continuous query operators are *stateless*; examples include *duplicate-preserving projection*, *selection*, and *union*. These operators process new tuples *on-the-fly* without storing any temporary results, either by discarding unwanted attributes (projection) or dropping tuples that do not satisfy the selection condition (technically, the union operator temporarily buffers the inputs to ensure that its output stream is ordered). Figure 2.1(a) shows a simple example of selection (of all the “a” tuples) over the character stream S1.

A *non-blocking*, *pipelined join* (of two character streams, *S1* and *S2*)  is illustrated in Figure 2.1(b). A *hash-based implementation* maintains hash tables on both inputs. When a new tuple arrives on one of the inputs, it is inserted into its hash table and probed against the other stream’s hash table to generate results involving the new tuple, if any. Joins of more than two streams and joins of streams with a static relation are straightforward extensions. In the former, for each arrival on one input, the states of all the other inputs are probed in some order. In the latter, new arrivals on the stream trigger the probing of the relation.

Since maintaining hash tables on *unbounded* streams is not practical, most DSMSs only support *window joins*. Query *Q2* below is an example of a *tumbling window join* (on the attribute attr) of two streams, *S1* and *S2*, where the result tuples must satisfy the join predicate and belong to the same one-minute tumbling window. Similar to *Q1*, tumbling windows are created by grouping on the timestamp attribute. At the end of each window, the *join operator* can clear its hash tables and start producing results for the next window.

```sql
Q2: SELECT	* 
	FROM	S1, S2
    WHERE	S1.attr = S2.attr
    GROUP BY S1.timestamp/60 AS minute
```

One disadvantage of *Q2* is that *matching tuples*, whose timestamps are only a few seconds apart but happen to fall into different tumbling windows, will not be reported. Another option is a *sliding window join*, where two tuples join if they satisfy the join predicate and if their timestamps are at most one window length, call it *w*, apart. A sliding window join may be expressed in a similar way to *Q3* below:

```sql
Q3: SELECT *
	FROM	S1, S2
    WHERE	S1.attr = S2.attr
    GROUP BY |S1.timestamp - S2.timestamp| <= w
```

Alternatively, if the query language allows explicit specification of sliding windows (e.g., using the SQL:1999 <tt class="literal">RANGE</tt> keyword), Q3 may be expressed as follows:

```sql
Q4: SELECT *
	FROM S1 [RANGE w], S2 [RANGE w] 
	WHERE S1.attr = S2.attr
```

Note that *tumbling window joins* are simpler to evaluate since we can clear the hash tables at the end of every window and start over. In contrast, *sliding window* joins need to maintain their hash tables over time, by inserting new tuples as they arrive and removing old tuples.

Figure 2.1(c) shows a <tt class="literal">COUNT</tt> aggregate. When a new tuple arrives, we increment the stored count and append the new result to the output stream. If the aggregate includes a <tt class="literal">GROUP BY</tt> clause, we need to maintain partial counts for each group (e.g., in a hash table) and emit a new count for a group whenever a new tuple with this particular group value arrives. Since aggregates on a whole stream may not be of interest to users, DSMSs support tumbling and/or sliding window aggregates. For efficiency, window aggregates are typically implemented to return new results periodically rather than reacting to each new tuple. Query *Q1* is an example of a tumbling aggregate (with grouping on the source IP address) that produces a batch of results at the end of each one-minute window. 

#### Figure 2.1. Simple continuous query operators: (a)-selection, (b)-jon, (c)-count, (d)-negation.
![](http://sungsoo.github.com/images/query-operators.png) 

Note that the type of aggregate being computed determines the amount of state that we need to store and the per-tuple processing time. An aggregate *f* is *distributive* if, for two disjoint multi-sets *X* and *Y* , *f* (*X* ∪ *Y*) = *f* (*X*) ∪ *f* (*Y*). Distributive aggregates, such as <tt class="literal">COUNT, SUM, MAX</tt> and <tt class="literal">MIN</tt>, may be computed incrementally using constant space and time (per tuple). For instance, <tt class="literal">SUM</tt> is evaluated by storing the current sum and continually adding to it the values of new tuples as they arrive. Moreover, *f* is *algebraic* if it can be computed using the values of two or more distributive aggregates using constant space and time (e.g., <tt class="literal">AVG</tt> is algebraic because <tt class="literal">AVG = SUM/COUNT</tt>). Algebraic aggregates are also incrementally computable using constant space and time. On the other hand, *f* is *holistic* if, for two multi-sets *X* and *Y* , computing *f* (*X* ∪ *Y*) exactly requires space proportional to the size of X ∪ Y . Examples of holistic aggregates include <tt class="literal">TOP-k, QUANTILE,</tt> and <tt class="literal">COUNT DISTINCT</tt>. For instance, we need to maintain the multiplicities of each distinct value seen so far to (exactly) identify the *k* most frequent item types at any point in time. This requires Ω (*n*) space, where *n* is the number of stream tuples seen so far—consider a stream with *n* − 1 unique values and one of the values occurring twice.

In practice, we can obtain approximate answers to *holistic aggregates* on data streams using several methods. One is to maintain a (possibly *non-uniform*) sample of the stream. Sam- pling is used for approximating <tt class="literal">COUNT DISTINCT, QUANTILE</tt>, and <tt class="literal">TOP k</tt> queries. Another possibility is to avoid storing frequency counters for each distinct value seen so far by periodically evicting counters having low values. This is a possible approach for computing <tt class="literal">TOP k</tt> queries, so long as frequently occurring values are not missed by repeatedly deleting and re-starting counters. A related *space-reduction technique* may also be used for approximate quantile computation where the rank of a subset of values is stored along with corresponding error bounds (rather than storing a sorted list of all the frequency counters for exact quantile calculation). Finally, *hashing* is another way of reducing the number of counters that need to be maintained. Stream summaries created using hashing are referred to as *sketches*. Examples include the following.  

* A **Flajolet-Martin(FM)** sketch is used for <tt class="literal">COUNT DISTINCT</tt> queries. It uses a set of hash functions *h<sub>j</sub>* that map each value v onto the integral range [1, . . . , log U ] with probability **Pr**[*h<sub>j</sub>* (*v*)=*l*] = 2*<sup>−l</sup>* , where *U* is the upper bound on the number of possible distinct values. Given *d* distinct items in the stream, each hash function is expected to map *d*/2 items to bucket 1, *d*/4 items to bucket 2, and so on with all buckets above log *d* expected to be empty. Thus, the highest numbered non-empty bucket is an estimate for the value log *d* . The FM sketch approximates *d* by averaging the estimate of log *d* (i.e., the largest non-zero bit) from each hash function.

* A **Count-Min(CM)** sketch is a two-dimensional array of counters with dimensions *d* by *w*. There are *d* associated hash functions, *h<sub>1</sub>*  through *h<sub>d</sub>*  , each mapping stream items onto the integral range [1, . . . , *w*]. When a new tuple arrives with value *v*, the following cells in the array are incremented: [*i*,*h<sub>i</sub>* (*v*)] for = 1 to d. An estimate of the count of tuples with value *v* can be obtained by taking the minimum of values found in cells [*i*,*h<sub>i</sub>* (*v*)] for *i=1* to *d*.The approximate counts can then be used to compute <tt class="literal">TOP k</tt> queries.



So far, we have shown *relational-like* query operators and briefly discussed how a DSMS may evaluate them. Other operators in a DSMS may include the following.

* A buffered sort operator buffers the incoming stream for a specified length of time, call it *l*, and outputs the stream in sorted order on some attribute, typically the generation timestamp. Tuples that arrive more than l time units late are dropped.

* Many DSMSs include built-in *sampling* operators, either for specific techniques such as **random sampling**, or for expressing various user-defined sampling methods.

* **User-defined aggregate functions** (**UDAFs**) are supported by most DSMSs. They are often used to add application-specific functionalities to general-purpose DSMSs, such as *approximate versions* of complex aggregates and data mining algorithms. A UDAF specification requires at least *two components*: how to *initialize* any intermediate state before processing and how to *update* the state (and, optionally, report an up-to-date answer) when a new tuple arrives. Additionally, a UDAF over a *sliding window* needs to specify how to update the state when a tuple expires from the window.


References
---
[1] Lukasz Golab and M. Tamer Özsu, *Data Stream Management*, Synthesis Lectures on Data Management, 2010.
