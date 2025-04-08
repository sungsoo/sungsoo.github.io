---
layout: post
title: Detailed Characteristics of an Analytic Workload
date: 2015-01-20
categories: [computer science]
tags: [big data]

---


* Article Source: *Understanding Analytic Workloads*, NETEZZA an IBM Company



## Extreme Data Volume

While there is no specific threshold that makes a data set “large,” it’s fair to say that data volumes tend to be large in analytics processing. Applications like *fraud detection*, *web analytics*, and *decision support* are all routinely associated with the largest data stores, often measured in petabytes of data. Two direct metrics combine to drive up data volume:


* **Row Cardinality (Number of Rows)** – A single table’s rows may number in the billions, tens of billions, or even hundreds of billions. Analytic workload requirements increase directly with row numbers. Simple physics dictates that when analyzing billions of rows, any inefficiency or overhead cost, no matter how small, becomes expensive.

* **Row Width (Row Size)** – It is not uncommon for tables to contain tens or hundreds of columns. Workload complexity increases as column counts increase, because larger rows consume more space, for both storage and processing. Larger row sizes also tend to introduce physical data sparsity as columns are skipped during various operations.

Data volume is further multiplied by any database management system (DBMS) that implements indexes, which store the indexed data redundantly, along with other metadata designed to streamline serial and selective data retrieval.


## Data Model Complexity

Large data volumes amplify the need for efficient, streamlined processing. Compounding large volume with complex data structures can result in processing demands that border on the unachievable. In addition to sheer size, “big data” or “extreme data” generally involves several dimensions, including:


* **Data Object Complexity (Many Tables and Relations, Views, Data Structures, Etc.)** – Data representation is typically spread across multiple data objects that must be combined, or “joined,” at run time by the processing platform. As the quantity of relationships increases, so do the magnitude and complexity of the resultant processing. If virtual objects such as views are introduced, additional processing ensues to either materialize the view or merge the base objects (underneath the view) into the overall statement plan.

* **Data Variety** – Native system data types, data codification schemes, and other implementation details tend to vary across applications, systems, and enterprises. Analytic repositories often ingest data from many varied sources, encountering many different styles and types of data. These representations frequently must be transformed and/or converted so that consistent interpretation and logical cohesion can be achieved. While some systems convert data upstream with analytic processing, it is also common for conversion to be deferred until the point at which data are analyzed. This creates a spike of additional load on the underlying processing system.

* **Data Model Style** – Nearly any modeling style can be embraced in support of analytic processing—normalized, dimensional, etc. The objective is to employ a modeling style that constitutes a reasonable compromise and is sufficiently flexible to serve a variety of use cases, such as loading, retrieval, and archiving. No single style can be considered consummate or universal.

Analytic applications often characterized by data complexity include medical diagnostics, predictive modeling, portfolio analysis, and many others. According to Gartner, mixed data types—tables, media, clickstreams, sensor/metering data, text, and so on—comprise 70%-85% of all data.

![](http://sungsoo.github.com/images/four-axes.png)

## ￼￼￼￼￼￼￼￼￼￼￼￼Variable and Unpredictable Data Traversal Paths, Patterns, and Frequencies

Effective analysis requires fast and reliable performance regardless of data traversal routes and direction. Freedom to “roam the data” with consistent performance is essential in marketing analytics, forensics, fraud detection, etc. Bottom-up, top-down, and random-path scanning are all fair game for analytic practitioners, and this variable data path requirement is a distinctive aspect of analytic workloads-one with profound architectural implications. 

OLTP architectures generally presume predefined data access paths, which can be tuned and optimized for. Caching, clustering, colocation, partitioning, and indexing are all access optimizations that reduce traverse via alternative paths
—an unacceptable result on an analytic platform.

## Set-Oriented Processing and Bulk Operations

In another distinctive feature of analytic workloads, inter-row pattern aggregates—working sets, large or small—are frequent targets of research.
This is in sharp contrast to the single-row, row-at-time, scalar analysis associated with typical transactional workloads. In a single analytics
operation, working sets of hundreds, thousands, or millions of rows are common, and the data footprint for a single query can be enormous. As working set row counts increase, workload complexity escalates, sometimes exponentially. Sample applications include weather forecasting, forensic analysis, and economic modeling, which challenge analytic infrastructure designers in a
way that transactional workloads do not.


## Multi-Step, Multi-Touch Analysis Algorithms

Like variable traversal paths and set-oriented processing, multi-step/multi-pass data scanning and analysis are commonplace during analytic research. Sophisticated pattern analysis, for example, often requires multiple touches or passes of the same data during a single investigation. Furthermore, analytic functions—programming primitives—often decompose into multiple internal steps. Cross-correlation, lead-lag analysis, moving averages and aggregates, and many other applications involve this approach. Analytic functions and capabilities embedded close to the database, or within the database itself, can accomplish such work in a single pass or in fewer passes than pure SQL, potentially reducing by orders of magnitude data movement and server resource demand.


## Complex Computation

Analytic processing frequently involves statistical analysis and/or additional sophisticated computational methods. A wide variety of mathematic and statistical operations is employed
to help distill patterns, summaries, and other “interesting” results from raw data populations. Computational complexity increases demands on the server layer and the amount of work to be performed during a given request. As you might guess, computational complexity also travels hand in hand with other analytic workload characteristics, such as set-oriented processing, multi-pass analysis, and intermediate data-staging requirements.

## Temporary or Intermediate Staging of Data

Analytic operations commonly stage intermediate data sets and interim results, particularly for multi-step/multi-pass algorithms and other sophisticated modeling and analytic methods—what-if scenario modeling, for example. These techniques presume the ability to write, retrieve, and integrate intermediate data at high volumes and high speeds, raising the processing requirements of the related queries substantially.

**A Note Regarding the Data Movement Problem** – Intermediate data staging is one of several analytic workload characteristics (including large data, multi-pass analysis, and set-oriented processing) with the potential to involve massive levels of internal data movement. Bulk data movement is a primary bottleneck and kills analytics processing performance on systems not optimized for these workloads. Architectural innovations that minimize data movement are a key feature of any analytics-oriented system.

## Change Isolation/Data Stability Implications

Because analytics research typically involves an iterative sequence of requests and traversals to discover, drill, hypothesize, verify, and so on, it’s important that any change to the underlying data be able to be isolated so as not to compromise or undermine active investigations. Predictive modeling and what-if analysis, for example, may involve longer-running requests that rely on stable underlying data sets.

Now, with the distinctive attributes of an analytic workload in mind, let’s take a closer look at several workload types before moving on to outline the characteristics of an analytics processing environment that might be expected to satisfy an analytic workload’s unique requirements.