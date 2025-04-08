---
layout: post
title: Query Planning of Hive on Tez
date: 2014-03-12 
categories: [computer science]
tags: [big data]

---

### Summary

* Article Source: [*Hive on Tez*](https://cwiki.apache.org/confluence/display/Hive/Hive+on+Tez#HiveonTez-Multiplereducestages)  
* Author: Gunther Hagleitner

# Query Planning

MapRedWork
---

MapRedWork is where we currently record all information about the MR job during compile/optimize time.  
This class will be refactored to capture Map information and reduce information separately (in MapWork and ReduceWork). This requires quite a few - albeit straight-forward - changes to both planning and execution.  
The refactor has benefits for pure MR execution as well. It removes the need for Mappers/Reducers to load and de-serialize information they don’t use and it makes it easier to read and maintain the code, because it clearly delineates what information is used at what stage.  
MapWork and ReduceWork will be shared by both MapRedWork and TezWork. MapRedWork is basically a composition of 1M + 0-1R, while TezWork is a tree of Map/ReduceWork with MapWork classes as leaves only.  
As discussed above, TezTask will use TezWork, while MapRedTask and ExecDriver will use MapReduceWork.

Semantic analysis and logical optimizations
---

Neither semantic analyzer nor any logical optimizations will change. Physical optimizations and MR plan generation are currently also done in the SemanticAnalyzer and will be moved out to separate classes.

Physical Optimizations and Task generation
---

The MapReduceCompiler does two things at the same time right now. After breaking down the operator plan into map-reduce tasks, it optimizes the number of tasks and also performs physical optimizations (picks join implementations, total order sort, etc).  
In order to limit the impact of Tez, we will provide a separate implementation: TezCompiler. The tez compiler will attempt to perform most physical optimizations at the plan level, leaving the breakdown of the plan into Tez jobs for a second round of optimizations.  
Later we may decide to use that physical optimizer (at the plan level) for both MR and Tez, while leaving specific optimizations in the two layers.

Local Job Runner
---

In the short term Tez will not support a “LocalTezDagRunner”. That means that hive will always have to submit MR jobs when executing locally. In order to avoid replanning the query after execution has started in Tez mode some optimizations for converting stages to local jobs will not be available.

Number of tasks
---

Some MR jobs have a predetermined number of reducers. This happens for order by (numReducers = 1) and scenarios where bucketing is used (numReducers = numBuckets). The user can also set the number of reducers manually. The same numbers will be used for each reduce tasks. Initially there will be no way for the user to set different numbers of reducers for each of the separate reduce stages. There is already a ticket (HIVE-3946) to address this shortcoming which can be used for both Tez and MR.

In most cases hive will determine the number of reducers by looking at the input size of a particular MR job. Hive will then guess the correct number of reducers. The same guess will be used for subsequent reduce phases in a tez plan. Ultimately, this number will have to be determined using statistics which is out of scope, but applies equally to MR and Tez.

Explain statements
---

Explain statements are driven (in part) off of fields in the MapReduceWork. Part of extending/refactoring MapReduceWork will be to add sufficient information to print the correct operator trees in explain for Tez.

Hive variables
---

The “set” mechanism for hive variables will not change. The variables will be passed through to the execution engine as before. However, hive will not shim or map any mapreduce variables. If a variable is not supported in hive it will be silently ignored.

Build infrastructure
---

There will be a new “ql” dependency on Tez. The jars will be handled the same way hadoop jars are handled, i.e.: They will be used during compile, but not included in the final distribution. Rather we will depend on them being installed separately. The jars will only have to be present to run Tez jobs, they are not needed for regular MR execution.

# Testing

Mini Tez Cluster
---

Mini Tez Cluster will initially be the only way to run tez during unit tests. LocalRunner is not yet available. If mr.rev is set to tez all MiniMr tests will run against Tez.

References
---
[1] Gunther Hagleitner, [*Hive on Tez*](https://cwiki.apache.org/confluence/display/Hive/Hive+on+Tez#HiveonTez-Multiplereducestages), Apache Hive Design Documentation, Jan 31, 2014.