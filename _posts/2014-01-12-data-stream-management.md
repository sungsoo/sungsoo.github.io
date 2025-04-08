---
layout: post
title: Data Stream Management
date: 2014-01-12 
categories: [computer science]
tags: [big data]

---

Introduction
---

Many applications process *high volumes of streaming data*. Examples include Internet traffic analysis, sensor networks, Web server and error log mining, financial tickers and on-line trading, real-time mining of telephone call records or credit card transactions, tracking the GPS coordinates of moving objects, and analyzing the results of scientific experiments. In general, a data stream is a data set that is produced incrementally over time, rather than being available in full before its processing begins. Of course, completely static data are not practical, and even traditional databases may be updated over time. However, new problems arise when processing *unbounded streams* in nearly real time. In this lecture, we survey these problems and their solutions.


Overview of Data Stream Management
---


We use *network monitoring* as a running example. Figure 1.1 illustrates a simple IP network with high-speed routers and links in the core, and hosts (clients and servers) at the edge. A large network contains thousands of routers and links, and its core links may carry many thousands of packets per second; in fact, optical links in the Internet backbone can reach speeds of over *100 million packets* per second. 

#### Figure 1.1 A simple network 
![](http://sungsoo.github.com/images/simple-network.png)

The traffic flowing through the network is itself a high-speed data stream, with each data packet containing fields such as a timestamp, the source and destination IP addresses, and ports. Other network monitoring data streams include real-time system and alert logs produced by routers, routing and configuration updates, and periodic performance measurements. Examples of performance measurements are the *average router CPU utilization* over the last five minutes and the number of inbound and outbound packets of various types over the last five minutes. Understanding these data streams is crucial for managing and troubleshooting a large network. However, it is not feasible to perform complex operations on high-speed streams or to keep transmitting Terabytes of raw data to a data management system. Instead, we need *scalable* and *flexible* end-to-end data stream management solutions, ranging from real-time low-latency alerting and monitoring, ad-hoc analysis and early data reduction on raw streaming data, to long-term analysis of processed data.


We will discuss two complementary techniques for end-to-end stream processing: *Data Stream Management Systems* (**DSMSs**) and *Streaming Data Warehouses* (**SDWs**). Figure 1.2 compares DSMSs, SDWs and traditional data management systems in terms of *data rates* on the y-axis,and *query complexity* and *available storage* on the x-axis. Traditional data warehouses occupy the bottom left corner of the chart, as they are used for *complex off-line analysis* of large amounts of relatively static, historical data (warehouse updates are usually batched together and applied during downtimes). 

#### Figure 1.2: Comparison of Data Stream Management Systems and Streaming Data Warehouses with traditional database and warehouse systems.
![](http://sungsoo.github.com/images/comparison-dsms.png)

*Database Management Systems* (**DBMSs**) handle somewhat more *dynamic workloads*, consisting of ad-hoc queries and data manipulation statements, i.e., insertions, updates and deletions of a single row or groups of rows. On the other hand, DSMSs lie in the top right corner as they evaluate continuous queries on data streams that accumulate over time. In applications such as troubleshooting a live network, the data rates may be so high that only the simplest continuous queries that require very little working memory and *per-tuple processing* are feasible, such as simple filters and simple aggregates over *non-overlapping windows*. Furthermore, we may have to return approximate answers over an incrementally maintained sample of the stream. Other streaming sources, such as sensor networks, may have lower data rates. If so, it may be possible to answer more complex queries on-line, such as aggregates over sliding windows of recent data. Even then, a DSMS needs to do all the data processing in main memory due to the high overhead of disk I/O. Finally, SDWs, also known as *Active Data Warehouses*, combine the *real-time response* of a DSMS (by attempting to load and propagate new data across materialized views as soon as they arrive) with a data warehouse’s ability to manage Terabytes of historical data on secondary storage. In network monitoring, an SDW may store traffic streams that have been pre-aggregated or otherwise pre-processed by a DSMS, as well as various *network performance* and configuration feeds that arrive with a wide range of inter-arrival times, e.g., once a minute to once a day.


Table 1.1 summarizes the differences between DBMSs and DSMSs. The processing model of a DBMS is *pull-based* or *query-driven*, in which *short-lived queries* are executed once (when posed) by “pulling” the current state of the database. 

![](http://sungsoo.github.com/images/table01-summary.png)


In a DSMS, the processing model is *push-based* or *data-driven*, where *continuous queries* are issued once and generate new results as new data arrive. That is, rather than evaluating transient (asked once and then “forgotten”) queries on persistent data, a DSMS evaluates *persistent queries* on transient, append-only data. For example, in network monitoring, some continuous queries may run for several minutes or several hours to troubleshoot specific problems; other queries gather routine performance measurements and may run for weeks or even months. Query processing strategies are also different. A DBMS typically has (*random*) access to all the data during query execution and employs a *fixed query plan* to generate exact answers. In contrast, a DSMS must process a data stream in one sequential pass, using *limited working memory*, and may adjust its query plans in response to changes in the data. Since DSMSs must support many continuous queries that run for a *long period* of time, *multi-query optimization* becomes important. Furthermore, DSMSs may generate approximate answers and must do so with strict latency requirements.

Figure 1.3 shows an abstract system architecture of a DSMS. On the left, an input buffer captures the streaming inputs. Optionally, an input monitor may collect various statistics such as inter-arrival times or drop some incoming data in a controlled fashion (e.g., via random sampling) if the system cannot keep up. The working storage component temporarily stores recent portions of the stream and/or various summary data structures needed by queries. 

#### Figure 1.3: Abstract reference architecture of a DSMS.
![](http://sungsoo.github.com/images/abstract-reference-architecture.png)

Depending on the arrival rates, this ranges from a small number of counters in fast RAM to memory-resident sliding windows. Local storage may be used for metadata such as foreign key mappings, e.g., translation from numeric device IDs that accompany router performance data to more user-friendly router names. Users may directly update the metadata in the local storage, but the working storage is used only for query processing. *Continuous queries* are registered in the *query repository* and converted into execution plans; similar queries may be grouped for shared processing. While superficially similar to relational query plans, continuous query plans also require buffers, inter-operator queues and scheduling algorithms to handle continuously streaming data. Conceptually, each operator consumes a data stream and returns a modified stream for consumption by the next operator in the pipeline. The query processor may communicate with the input monitor and may change the query plans in response to changes in the workload and the input rates. Finally, results may streamed to users, to alerting or event-processing applications, or to a SDW for permanent storage and further analysis.
Next, we summarize the differences between a traditional data warehouse and a SDW in Table1.2.

![](http://sungsoo.github.com/images/table02-summary.png)

The fundamental difference is the *higher frequency* and *asynchronous nature of updates*— rather than refreshing the entire warehouse periodically, a SDW attempts to load new data as they arrive so that any applications or triggers that depend on the data can take immediate action. Furthermore, a SDW makes recent and historical data available for analysis. This requires, among other things, a fast *Extract-Transform-Load* (ETL) process and efficient update propagation across layers of materialized views in order to keep up with the inputs.

In Figure 1.4, we illustrate an abstract system architecture of a SDW. Data streams or feeds arrive periodically from various sources, often in the form of text or gzipped files. 

#### Figure 1.4: Abstract reference architecture of a SDW.
![](http://sungsoo.github.com/images/abstract-achitecture-sdw.png)

An *update scheduler* decides which file or batch of files to load next. The data then pass through an ETL process, as in traditional data warehouses. Examples of ETL tasks include *unzipping* compressed files, and simple *data cleaning* and *standardization* (e.g., converting strings to lower or upper case or converting timestamps to GMT). *Base tables* are sourced directly from the *raw* files, while *derived tables* correspond to *materialized views* (over base or other derived tables). Base and derived tables are usually partitioned by time so that arrivals of new data only affect the most recent partitions. Furthermore, users may specify (or the system may automatically infer) *partition dependencies* between derived tables and their sources. For instance, if a base table B is partitioned into 5-minute chunks and a derived table D is partitioned by hour (e.g., perhaps D computes hourly aggregates on B), then we know that the most recent partition of D depends on the twelve most recent partitions of B. **Partition dependencies** enable *efficient update propagation* in an SDW, as we can identify specific derived table partitions that need to be updated in response to an update of a base table. In addition to choosing raw files to load, the scheduler is also responsible for choosing which derived table to update next.


References
---

[1] Lukasz Golab, M. Tamer Özsu, *Data Stream Management*, SYNTHESIS LECTURES ON DATA MANAGEMENT, Morgan & Claypool publishers, 2010.