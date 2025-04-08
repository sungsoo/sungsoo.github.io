---
layout: post
title: Workload Types
date: 2015-01-21
categories: [computer science]
tags: [big data]

---


* Article Source: *Understanding Analytic Workloads*, NETEZZA an IBM Company


![](http://sungsoo.github.com/images/evolution-analytics.png)

# Workload Types and Sample SQL

Workloads do not fall reliably into neat categories; they fall along a continuum with some recognizable waypoints. We’ll look briefly at four points along the spectrum:

작업부하는 깔끔한 범주에 믿을만하게 떨어지지 않고, 인식할 수 있는 여러지점의 연속선상에 떨어진다.
여기서 우리는 작업부하와 관련한 네가지 지점에대 간략히 살펴본다.

* Online Transaction Processing (OLTP): 온라인 트랜잭션 처리
* Light-to-Moderate Decision Support: 경중량 의사 결정
* Heavier Decision Support and Business Intelligence (BI) 
* Complex, In-Database Analytics: 복잡한 데이터베이스 분석

To illustrate various SQL usage patterns, let’s examine some SQL excerpts from several benchmark suites developed by the Transaction Processing Performance Council (TPC). 
These excerpts are comparatively realistic while remaining simple enough to be useful for illustration. (You can skip the actual code examples without missing the key points about workload types and how they differ.)

## Online Transaction Processing (OLTP)
In OLTP, the primary operations are (a) creating data records; (b) updating data records; and (c) retrieving data records, usually as singletons or small sets.
Optimal SQL for OLTP tends to be:


* **Precise** – Highly targeted to as few tables and rows as necessary. Each SQL data manipulation language (DML) statement typically modifies data in only one table.

* **Prescribed** – Coded, compiled, and “locked in.” OLTP queries are almost never ad hoc or adjusted at run time based on variables or other input.

* **Minimalist** – Touching only the necessary database objects and columns.

* **Transactional** – Multiple steps packaged in a single transaction, or “unit of work.”


The following SQL statements are excerpted from the TPC-C benchmark. Keep in mind that additional, “invisible” statements (triggers, referential integrity, etc.) are often implied, and these execute in the background, or “behind the scenes”:


```sql
EXEC SQL SELECT o_c_id INTO :c_id FROM orders
	WHERE o_id = :no_o_id AND o_d_id = :d_id AND o_w_id = :w_id;
EXEC SQL UPDATE orders SET o_carrier_id = :o_carrier_id
	WHERE o_id = :no_o_id AND o_d_id = :d_id AND o_w_id = :w_id;
EXEC SQL UPDATE order_line SET ol_delivery_d = :datetime
	WHERE ol_o_id = :no_o_id AND ol_d_id = :d_id AND ol_w_id =￼ :w_id;
EXEC SQL SELECT SUM(ol_amount) INTO :ol_total FROM order_line
	WHERE ol_o_id = :no_o_id AND ol_d_id = :d_id AND ol_w_id = :w_id;
EXEC SQL UPDATE customer SET c_balance = c_balance + :ol_total 
	WHERE c_id = :c_id AND c_d_id = :d_id AND c_w_id = :w_id;
EXEC SQL COMMIT WORK;
```

This SQL is compact, precise, and streamlined. There is no activity of an analytic nature involved here.


It’s important to recognize that while basic operational facts are captured in the mainline OLTP SQL, more complex calculations, if required, are often deferred to post-processing and/or analytical phases in order to minimize the processing effort and data storage footprint of the primary OLTP application.

**Another Note Regarding Data Movement** – Ultimately, most workloads consist of multiple steps, or building blocks, and the fundamental building block is often an SQL statement. This is true for nearly all workload types. In general, it is beneficial to accomplish as much as possible in each step rather than subdivide processing tasks into a large number of discrete sub-steps. The goal is to minimize data movement and its attendant performance penalty. More steps equal more back-and-forth, more messaging, more data shipping and staging, more data movement, and degraded performance.


## Light-to-Moderate Decision Support
Next, we’ll look at SQL that was designed roughly a decade ago to represent “Decision Support and Reporting.” This code differs substantially from the OLTP example, because the primary usage pattern here is retrieval rather than data creation.


## Heavier Decision Support/Business Intelligence (BI)
Now we’ll look at a slightly more complex retrieval example from TPC-DS, which is a little more recent and also somewhat more sophisticated. This benchmark is positioned to model decision support, which typically involves some amount of analytic activity.


These SQL segments include operations that are analytic in nature (particularly Q51), as evidenced by the SQL Analytic functions Over (Partition by ...), and these segments are considerably more complex than our previous examples. In particular:

* The activity is retrieval only.
* Multiple database objects are involved in a single SQL statement.
* Some minor calculations are being performed, but no heavy, complex computation.
* The selectivity of the SQL is uncertain—depending on the data values supplied and the data population, it could be selective or not.
* There is some aggregation and sorting happening via GROUP BY and ORDER BY clauses.
* Multiple sets of rows are being processed in a single execution using the SQL Analytic functions.
* There is sub-query refactoring. The SQL WITH clause represents an optimization commonly found in complex retrieval statements.
* The statements themselves are larger and more involved, with multiple sub-queries, phrases, features, etc.


## Complex, In-Database Analytics
Finally, to get an idea of still greater analytic complexity, we’ll touch on the notion of in-database analytics—sophisticated analytic functionality that resides within the data server platform and that can perform advanced analytical operations very efficiently via simple, straightforward application statements.
In market analysis, revenue forecasting, predictive modeling, and other business processes and applications, important analytic exercises include:

* Segmentation
* Selection
* Response Attribution
* Loyalty/Churn Analysis
* Geospatial Analysis
* And Many Others


Each of these analyses may involve very complex, sophisticated analytic operations against vast data repositories. A given enterprise’s implementation typically involves a variety of integrated applications, which are unique and tailored to the local procedures, data, and computing technology stack. Common analytic primitives include:

* Linear Regression
* Quantile Calculation
* Random Sampling
* Principal Component Analysis
* Bayesian Network Analysis
* Canonical Correlation
* And Many Others


Unlike straight SQL systems, the interface to in-database analytics is not standardized, and the code
that interacts with them is less transportable. Accordingly, no public benchmarks exist in this space
and no code examples are offered here. However, note that on modern, state-of-the-art analytic
platforms, many of the analytic primitives listed above can be invoked with a single application
statement. A key benefit of systems architected for analytic workloads is that the advanced analytics
code has been optimized for the platform on which it executes, and ideally, this code executes locally with a minimal amount of data movement or transport. This differs from traditional analytic applications, which run on a separate tier and must physically move data from the storage server(s) to the analytics server(s) for processing, after which any results must be moved back again for safekeeping.
Variety