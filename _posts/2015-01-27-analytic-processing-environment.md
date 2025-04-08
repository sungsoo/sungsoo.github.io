---
layout: post
title: Analytic Processing Environment (APE)
date: 2015-01-27
categories: [computer science]
tags: [big data]

---

# Analytic Processing Environment (APE)

The key virtues of an effective analytics environment include functional richness, processing speed, and ease of use. Because analytic research is typically a guided discovery process, where future questions depend on the outcome of the current question, speed and efficiency are paramount. With faster answers, more questions can be asked.

Modeling, forecasting, decision support, forensics, and ad hoc analysis—variants and cornerstones of analytic processing—require the agility to build and test models and queries very quickly, without having to tune or otherwise redefine the underlying system. Furthermore, because analytic requirements invariably evolve over time, some degree of flexibility will be expected of any analytics environment. Server-side APE characteristics include:


* **DW-Level Storage Capacity** – Analytics and large data sets are inseparable.

* **Massively Parallel Architecture** – Analytic platforms are optimized for fast scanning and ingestion rather than fast selection. Analytic workloads tend to operate on very large data subsets, often in variable and unpredictable sequences, as opposed to the traditional OLTP data access patterns involving small bits of data accessed more or less sequentially.

* **Fast Data Movement Capacity** – Because data movement can incur onerous performance penalties during large data set operations, a fast intra-system network fabric is a common feature of modern analytic environments. Data movement can be minimized, but it cannot be eliminated entirely.

* **Minimization of Data Movement** – Processing happens close to the data, as demanded by multi-touch/multi-pass processing algorithms. Dedicated disk-CPU combinations are a common feature, as is an intelligent code optimizer. Note that most analytic architectures incorporate one or more analytic client applications, each acting as a “workbench,” issuing a series of analytic workload tasks to one or more data/analytics servers. Efficient, cooperative processing is vital. The ability to perform the heavy lifting—the actual analytic computations—in the data tier minimizes or eliminates the costly movement of data back and forth between servers and clients. Because data payloads can be so immense, data movement becomes enemy #1, the most likely barrier to success. When movement is eliminated through efficient execution in the data server layer, query response times are reduced by orders of magnitude.

* **“Shared Little” or “Shared Nothing” Environment** – The shared structures (memory, caches, etc.) common to transactional systems introduce unwanted contention and attendant performance penalties in an analytics environment, so these structures are generally minimized or omitted.

* **Set-Oriented (versus Cursor-Based) Functions** – Analytic systems need functions that operate on sets, not rows and cursors. (Set-related functions are common to most systems, whether analytic or transactional, so the shift from OLTP to analytics infrastructure is, in this case,
largely a matter of adjusting programming style.)

* **Analytic Functions Built into the Server** – Beyond basic SQL operators, the server must include analytic functions. Modern analytic systems typically include some combination of proprietary and third-party analytic function libraries, some of which are in-database.

* **Analytic Function Extensibility** – An optimal analytics platform should include a user-visible layer or interface to permit reasonably straightforward additions of end-user functions and function libraries.

* **Map-Reduce Options** – Many systems include a built-in grid option (Hadoop or variant) as required to process map-reduce tasks.

* **Streamlined and Efficient Code Plans, Data Movement, and Processing; Minimal Instructions per Data Element** – This critical architectural “feature” is actually a full set of attributes implemented to a greater or lesser degree, depending on the system, with various innovations
in code optimization, compression, hardware design, network fabrics, etc.

* **Manageable by Business Users** – To repeat, modeling, forecasting, decision support, forensics, and ad hoc analysis all require the agility to build and test models and queries very quickly, without having to tune or otherwise redefine the underlying system. Ease of use has become business critical, owing more to the lost time and opportunity costs of tuning and maintenance delays than to the real costs of personnel and expertise acquisition.

* **Integration and Support for Sophisticated Analytic Client Applications** – Although this text focuses on the server side, modern analytic environments incorporate one or more analytic client applications, each acting as a “workbench,” issuing a series of analytic workload tasks to the server tier. Tight integration and support for a variety of client-side tools are mandatory.

* **Genuine Scalability** – More so than traditional systems, high-end analytic systems now presume continued exponential growth in both data stores and analytic processing demands. Hardware additions and system upgrades that yield nearly linear scaling have evolved to meet this requirement.

* **Limited Reliance on Caching** – The combination of too much raw data and unpredictable usage patterns greatly diminishes the worth of caching and cache-related overhead.
