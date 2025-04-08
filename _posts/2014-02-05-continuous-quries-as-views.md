---
layout: post
title: Continuous Quries as Views
date: 2014-02-05
categories: [computer science]
tags: [data management, stream computing]

---

CONTINUOUS QUERIES AS VIEWS
---

We now introduce *continuous query operators* whose output streams contain new results as well as updates to existing results. Conceptually, these operators produce “*deltas*” to a *view* of the current result (possibly, with the help of separate *relation-to-stream* operators), which may be materialized and maintained by an application that receives the streaming output.

We begin with (**duplicate-preserving**) negation, or set difference, of two character streams, *S1* and *S2*. As illustrated in Figure 2.1(d), we want to maintain a materialized view of characters in the prefix of *S1* that we have seen so far that do not occur in the prefix of *S2* that we have seen so far. Initially, we return “a”, “b”, and “d” as soon as they arrive on *S1* since they do not have counterparts in *S2*. When “d” arrives on *S2*, we remove its *S1*-counterpart from the result by appending a negative tuple to the output, denoted by *d ̄* in the illustration. When “b” arrives on *S2* later, we need another negative tuple (denoted by *b ̄*) to remove its *S1*-counterpart from the result.

![](http://sungsoo.github.com/images/continuousquery.png)

Another example of negative tuples in the output stream involves removing old tuples from sliding windows. Recall queries *Q3* and *Q4*, which use windows to limit the state of the join operator. Both of these queries are monotonic and keep producing new join results over time. Now, suppose that we also want to remove old join results involving tuples that have expired from their windows (i.e., tuples more than w time units old). Figure 2.2 shows an example where the sliding windows have moved forward, causing “f ” to expire from *S1* and “c” to expire from *S2*. Given that both of these tuples have created join results in the past, the join operator must now produce corresponding negative tuples. An application can now treat the output stream as a sequence of updates to a materialized view.

As the above example shows, windows can play two roles in a DSMS: *implicit* (internal) and *explicit* (external). Implicit windows are used to limit the memory requirements of operators such as joins, as in *Q3* and *Q4*. However, tuples do not expire from the result set when they expire from their windows, and, therefore, *monotonic* operators that use implicit windows remain monotonic. 

![](http://sungsoo.github.com/images/materializedview.png)

On the other hand, as illustrated in Figure 2.2, explicit windows can be thought of as *non-monotonic* operators that consume the input streams, and, in addition to propagating each tuple to the next operator in the query plan, produce a negative tuple whenever a “positive” tuple expires. Negative tuples must then be processed by each operator in the plan to “undo” previously reported results. As a result, the output stream, when interpreted as a sequence of “deltas” to a materialized view, must correspond to the result of an equivalent traditional query executed over the current state of the sliding windows (not to the result of an equivalent query that operates over prefixes of the inputs). 

Finally, we note that in the queries-as-views approach, the DSMS itself usually does not materialize the views. Continuous queries produce streams of updates over time, but it is up to the user or application to maintain the final result.

￼References
---
[1] Lukasz Golab and M. Tamer Özsu, *Data Stream Management*, Synthesis Lectures on Data Management, 2010.
