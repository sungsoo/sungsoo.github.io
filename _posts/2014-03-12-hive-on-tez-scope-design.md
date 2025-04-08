---
layout: post
title: Design of Hive on Tez
date: 2014-03-12 
categories: [computer science]
tags: [big data]

---

### Summary

* Article Source: [*Hive on Tez*](https://cwiki.apache.org/confluence/display/Hive/Hive+on+Tez#HiveonTez-Multiplereducestages)  
* Author: Gunther Hagleitner

# Design

Summary of changes
---


Changes that impact current hive code paths.

* Split MR compilation from SemanticAnalyzer (simple)
* Break MapRedWork into MapWork and ReduceWork (straight forward but a number of changes)
* Move execution specific classes from exec to exec.mr package (simple)
* Move some functions from ExecDriver to exec.Utilities to share between Tez and MR
* Build system: Add tez dependencies and tez testing  

I believe that all of these are valuable by themselves and make the code cleaner and easier to maintain. Especially the second item will touch quite a few places in the code though. None of them change functionality.  

New code paths (only active when running Tez).
  
* **Execution**: TezWork, TezTask, TezJobMonitor (small)  
* **Planning**: Compiler to generate TezTasks, Perform physical optimizations on Tez (large)  

The following outlines the changes across the various hive components.

# Execution layer


We’ve initially investigated to add Tez as a simple shim option to the code base. This didn’t work out mostly because Tez’ API is very different from the MR api. It does not make much sense to move the entire “execute” infrastructure to the shim layer. That would require large code changes with little benefit. Instead there will be separate “Task” implementations for MR and TEZ and hive will decide at runtime which implementation to use.

We’re planning to have two packages.

* org.apache.hadoop.hive.ql.exec.mr  
* org.apache.hadoop.hive.ql.exec.tez

Both will contain implementations of the Task interface, which is used to encapsulate units of work to be scheduled and executed by the Driver class.

Both of these packages will have classes for job monitoring and job diagnostics, although they are package private and do not follow a common interface.

Job submission
---

Currently ExecDriver and MapRedTask (both are of type “Task”) will submit map-reduce work via JobClient (either via local-job runner or against the cluster). All MR specific job submission concepts are hidden behind these classes.

We will add a TezTask as the entry point for Tez execution. TezTask will hide building of the job DAG and orchestrate monitoring and diagnostics of DAG execution.

Hive’s driver will still deal with a graph of Tasks to handle execution. No changes are required to handle this. The only difference is that now the planner might transparently add TezTasks to the mix at runtime.

Job monitoring
---

We will add a TezJobMonitor class that handles printing of status as well as reporting the final result. This class provides similar functions than HadoopJobExecHelper used for MR processing. TezJobMonitor will also retrieve and print the top level exception thrown at execution time.

Job diagnostics
---

Basic ‘job succeeded/failed’ as well as progress will be as discussed in “Job monitoring”.  Hive’s current way of trying to fetch additional information about failed jobs will not be available in phase I.

Currently Tez offers limited debugging support once a job is complete. The only way to get access to detailed logs, counters, etc is to look at the log of the AM, find the appropriate url for specific task logs and access them through copy and paste. This will change over time and historical logging information will be accessible, but for the first phase debugging support will be limited.

Counters
---

API for retrieving counters will be different in Tez and we will thus add a shim api for that. Incrementing counters at execution time will work unchanged.

Job execution
---
The basic execution flow will remain unchanged in phase I. ExecMapper/ExecReducer will be used through Tez’ MR compat layer. The operator plan + settings will be communicated via ‘scratch dir’ as before. ExecMapper/Reducer will load and configure themselves accordingly.


References
---
[1] Gunther Hagleitner, [*Hive on Tez*](https://cwiki.apache.org/confluence/display/Hive/Hive+on+Tez#HiveonTez-Multiplereducestages), Apache Hive Design Documentation, Jan 31, 2014.