---
layout: post
title: Apache Flink Seminar
date: 2015-06-22
categories: [computer science]
tags: [big data]

---


# Apache Flink: Fast and Reliable Large-scale Data Processing 

This talk presents Apache Flink from a user’s perspective, introduces the APIs and highlights the most interesting design points behind Flink, discussing how they contribute to the goals of performance, robustness, and flexibility. Finally, presenters give an outlook on Flink’s development roadmap.

Apache Flink is one of the latest addition to the Apache family of data processing engines. In short, Flink’s design aims to be as fast as in-memory engines, while providing the reliability of Hadoop. Flink contains (1) APIs in Java and Scala for both batch-processing and data streaming applications, (2) a translation stack for transforming these programs to parallel data flows and (3) a runtime that supports both proper streaming and batch processing for executing these data flows in large compute clusters.

Flink’s batch APIs build on functional primitives (map, reduce, join, cogroup, etc), and augment those with dedicated operators for iterative algorithms, and support for logical, SQL-like key attribute referencing (e.g., groupBy(“WordCount.word”). The Flink streaming API extends the primitives from the batch API with flexible window semantics.

Internally, Flink transforms the user programs into distributed data stream programs. In the course of the transformation, Flink analyzes functions and data types (using Scala macros and reflection), and picks physical execution strategies using a cost-based optimizer. Flink’s runtime is a true streaming engine, supporting both batching and streaming. Flink operates on a serialized data representation with memory-adaptive out-of-core algorithms for sorting and hashing. This makes Flink match the performance of in-memory engines on memory-resident datasets, while scaling robustly to larger disk-resident datasets.

Finally, Flink is compatible with the Hadoop ecosystem. Flink runs on YARN, reads data from HDFS and HBase, and supports mixing existing Hadoop Map and Reduce functions into Flink programs. Ongoing work is adding Apache Tez as an additional runtime backend.
This talk presents Flink from a user perspective. We introduce the APIs and highlight the most interesting design points behind Flink, discussing how they contribute to the goals of performance, robustness, and flexibility. We finally give an outlook on Flink’s development roadmap. 

<iframe width="600" height="400" src="https://www.youtube.com/embed/i_anvNqGbXE" frameborder="0" allowfullscreen></iframe>

---

<iframe width="600" height="400" src="https://www.youtube.com/embed/CX1z6YePLGA" frameborder="0" allowfullscreen></iframe>

---

## Speaker:

Kostas Tzoumas, Co-founder and CEO, Data Artisans, Committer Apache Flink

Kostas Tzoumas is a committer at Apache Flink and co-founder of data Artisans (data-artisans.com), a Berlin-based company that is developing and contributing to Apache Flink. Before founding data Artisans, Kostas was a postdoctoral researcher at TU Berlin, received a PhD in Computer Science from Aalborg University and has been with the University of Maryland, College Park, and Microsoft Research in Redmond in the course of several internships.