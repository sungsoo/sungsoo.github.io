---
layout: post
title: Multi-core Parallelism in a Column-store
date: 2017-02-01
categories: [computer science]
tags: [data management]

---



Multi-core Parallelism in a Column-store
===

## Abstract

The research reported in this thesis addresses several challenges of improving the efficiency and effectiveness of parallel processing of analytical database queries on modern multi- and many-core systems, using an open-source column-oriented analytical database management system, MonetDB, for validation. In contrast to the existing work we also broaden the research from focusing on individual operators and algorithms to consider the entire system and process holistically. Resource-efficient parallel query execution requires a detailed insight into its query execution affecting parameters. We design and develop new visual analysis techniques and tools that help to identify and rank performance bottlenecks of parallel query execution on multi-core systems. We design and develop a novel learning based adaptive technique for multi-core parallel plan generation using query execution feedback. This techniques proves to be particularly efficient with concurrent workloads, a scenario which is very common in practice but has been largely uncharted in database query parallelization research. We also introduce a simple technique where a multi-socket system is treated as a distributed shared nothing database system, where the remote memory accesses could be constrained thereby having a controlled query execution performance. Many-core system architectures imitate GPU style parallel execution, however, data transfer on the PCle bus which connects Xeon-Phi co-processor to the host, is a bottleneck. We analyze the effect of streaming execution of selected queries, to utilize PCle bandwidth optimally. The lessons, experiences and insights gained in this thesis are valuable for the emerging analytical database systems in the context of multi and many-core systems.

* [Paper](https://pure.uva.nl/ws/files/7942849/Gawade_Thesis_complete.pdf)

