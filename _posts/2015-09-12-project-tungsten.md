---
layout: post
title: Project Tungsten 
date: 2015-09-12
categories: [computer science]
tags: [big data]

---



# Project Tungstun


Overview
========

Based on our observation, majority of Spark workloads are not bottlenecked by I/O or network, but rather *CPU and memory*. This project focuses on 3 areas to improve the *efficiency of memory and CPU* for Spark applications, to push performance closer to the limits of the underlying hardware.

## Memory Management and Binary Processing

* *Avoiding non-transient Java objects* (store them in binary format), which reduces GC overhead.
* Minimizing memory usage through *denser in-memory data format*, which means we spill less.
* Better *memory accounting* (size of bytes) rather than relying on heuristics
* For operators that understand data types (in the case of DataFrames and SQL), work directly against binary format in memory, i.e. have no serialization/deserialization

## Cache-aware Computation

* Faster *sorting* and *hashing* for aggregations, joins, and shuffle

## Code Generation

* Faster expression evaluation and DataFrame/SQL operators
* Faster serializer

Several parts of project Tungsten leverage the DataFrame model, which gives us more semantics about the application. We will also retrofit the improvements onto Spark’s RDD API whenever possible.

## Deep Dive into Project Tungsten Bringing Spark Closer to Bare Metal 

Josh Rosen (Databricks)

<iframe width="600" height="400" src="https://www.youtube.com/embed/5ajs8EIPWGI" frameborder="0" allowfullscreen></iframe>

## From DataFrames to Tungsten A Peek into Spark's Future 

Reynold Xin (Databricks)

<iframe width="600" height="400" src="https://www.youtube.com/embed/VbSar607HM0" frameborder="0" allowfullscreen></iframe>
