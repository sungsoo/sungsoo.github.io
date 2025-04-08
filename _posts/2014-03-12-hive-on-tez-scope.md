---
layout: post
title: Functional Requirements of Hive on Tez Phase I
date: 2014-03-12 
categories: [computer science]
tags: [big data]

---

### Summary

* Article Source: [*Hive on Tez*](https://cwiki.apache.org/confluence/display/Hive/Hive+on+Tez#HiveonTez-Multiplereducestages)  
* Author: Gunther Hagleitner

# Scope

The rest of this document describes the first phase of Hive/Tez integration. The goals are:

* Bring Tez concepts and primitives into Hive, make them available to all Hive developers
* Take advantage of TEZ through MRR (Multiple reduce-stage jobs)
* Take advantage of TEZ through MPJ (multi-parent shuffle joins)

Limiting the integration to the fairly simple MRR/MPJ pattern will require minimal changes to the planner and execution framework while speeding up a wide variety of queries. At the same time it will allow us to build a solid foundation for future improvements.

# Functional requirements of phase I


* Hive continues to work as is on clusters that do not have TEZ
	* MR revisions 20, 20S, 23 continue to work unchanged
* Hive can optionally submit MR jobs to TEZ without any additional improvements
	* Hive can treat TEZ like just another hadoop 23 instance
* Hive can optionally detect chains of MR jobs and optimize them to a single DAG of the form MR* and submit it to TEZ
* Hive can optionally detect when a join has multiple parent tasks and combine them into a single DAG of a tree shape.
* Hive will display the MRR optimization in explain plans
* Hive will give appropriate feedback to the user about progress and completion status of the query when running MRR queries
* The user will be able to get statistics and diagnostic information as before (counters, logs, debug info on the console)
* Hive has unit tests to cover all new functionality

The following things are out of scope for the first phase.

* Local tasks will still run as MR only
* Only Map and Reduce Tez tasks with SimpleEdges will be used (i.e.: no new tasks, new input/output/processors, no new edge types)
* No multi-output task optimizations will be introduced


One new configuration variable will be introduced.

* hive.optimize.tez   
hive.execution.engine (changed in [HIVE-6103](https://issues.apache.org/jira/browse/HIVE-6103))
	* **True**   
		tez: Submit native TEZ dags, optimized for MRR/MPJ  
	* **False**   
		mr (default): Submit single map, single reduce plans
		
**Note**: It is possible to execute an MR plan against TEZ. In order to do so, one simply has to change the following variable (assuming tez is installed on the cluster):
mapreduce.framework.name = yarn-tez

# Example


Here’s a TPC-DS query and plans with and without tez optimizations enabled.  

The query (rewritten for hive).

```sql
select
  i_item_desc
  ,i_category
  ,i_class
  ,i_current_price
  ,i_item_id
  ,itemrevenue
  ,itemrevenue*100/sum(itemrevenue) over
    (partition by i_class) as revenueratio
from
  (select
     i_item_desc
     ,i_category
     ,i_class
     ,i_current_price
     ,i_item_id
     ,sum(ws_ext_sales_price) as itemrevenue
   from
     web_sales
     join item on (web_sales.ws_item_sk = item.i_item_sk)
     join date_dim on (web_sales.ws_sold_date_sk = date_dim.d_date_sk)
   where
     i_category in ('1', '2', '3')
     and year(d_date) = 2001 and month(d_date) = 10
   group by
     i_item_id
     ,i_item_desc
     ,i_category
     ,i_class
     ,i_current_price) tmp
order by
  i_category
  ,i_class
  ,i_item_id
  ,i_item_desc
  ,revenueratio;
```

Plan with TEZ
---

**Stage 0**:  
	Local Work: Generate hash table for date dim  
**Stage 1**:  
	Map: SMB join item + web_sales, mapjoin date_dim + web_sales, map-side group by/aggregate  
**Reduce 1**:   
	Reduce side group by/aggregate, shuffle for windowing  
**Reduce 2**:   
	Compute windowing function, shuffle for order by  
**Reduce 3**:   
	Order by, write to HDFS  

Plan without TEZ
---

Local Work: Generate hash table for date dim

**Stage 1:**  
*Map*: SMB join item + web_sales, mapjoin date_dim + web_sales, map-side group by/aggregate  
*Reduce*: Reduce side group by/aggregate, write to HDFS

**Stage 2:**  
*Map*: Read tmp file, shuffle for windowing  
*Reduce*: Compute windowing function, write to HDFS

**Stage 3:**  
*Map*: Read tmp file, shuffle for order by  
*Reduce*: Order by, write to HDFS


References
---
[1] Gunther Hagleitner, [*Hive on Tez*](https://cwiki.apache.org/confluence/display/Hive/Hive+on+Tez#HiveonTez-Multiplereducestages), Apache Hive Design Documentation, Jan 31, 2014.