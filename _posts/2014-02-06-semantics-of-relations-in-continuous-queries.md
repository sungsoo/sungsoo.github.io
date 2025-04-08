---
layout: post
title: Semantics of Relations in Continuous Queries
date: 2014-02-06
categories: [computer science]
tags: [data management, stream computing]

---

SEMANTICS OF RELATIONS IN CONTINUOUS QUERIES
---

The *query-as-view model* can also help understand the semantics of continuous queries that reference non-static relations. Suppose that we want to join a stream, bounded by a (*explicit* or *implicit*) window, with a relation. For example, the stream tuples may contain a timestamp, an internal router ID, and a performance measurement such as CPU usage; the relation may have mappings from router IDs to alphanumeric names. Clearly, we may need to insert new mappings into the relation when adding new routers to the network, and/or delete old mappings when old routers are retired (updates may be modeled as deletions followed by insertions). If we want to maintain a view of the current answer at all times, deletions from the relation must produce negative tuples so that the join operator can undo all the current results that have been produced using the deleted tuple. This is similar to producing a negative tuple, in response to *expirations* from the *sliding windows*.
Similarly, after adding a tuple to the relation, we need to probe the sliding window and generate new results based on the stream tuples that have already arrived. That is, we are treating the relation as an *explicit window* (more specifically, an *explicit predicate window*).

Another, more efficient, solution is to make the changes to the relation visible only to tuples that will arrive in the future, effectively treating relations as implicit windows. That is, when a new tuple is added to the relation, we do not probe the sliding window to generate join results with any stream tuples that have already arrived; instead, new stream tuples that will arrive in the future will probe the new state of the relation. Similarly, after deleting a tuple from the relation, we do not need to produce any negative tuples. These types of relation updates are referred to as *non-retroactive*. Though non-retroactive updates may not be appropriate in all applications, they are useful in the above network monitoring example. When an old router is removed from the relation, there is no need to expire any of its measurements that have already been generated. Similarly, when a new router is inserted into the relation *before* it starts producing measurements, then there are no prior measurements to join with this new tuple.


Note that there is an important restriction on non-retroactive updates: once we delete a row from the relation with a particular key, we cannot later add a row with the same key. For example, if we remove a router ID, but do not delete the CPU usage measurements that have been produced for this router, then inserting a new router that has the same router ID makes it seem that the old CPU usage statistics refer to the new router.



￼References
---
[1] Lukasz Golab and M. Tamer Özsu, *Data Stream Management*, Synthesis Lectures on Data Management, 2010.
