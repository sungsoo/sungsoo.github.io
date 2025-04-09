---
layout: post
title: Graph Partitioning
date: 2018-01-17
categories: [computer science]
tags: [parallel computing]

---


## Article Source
* Title: [Using Graph Partitioning in Distributed Systems Design](https://www.youtube.com/watch?v=QHkhyY9atkE)

---

## Graph Partitioning

### Definition

*Graph partitioning* is a technique for dividing work amongst processors to make effective use of a parallel computer.

## Using Graph Partitioning in Distributed Systems Design

* Featuring: Alon Shalita, Software Engineer at Facebook; and Igor Kabiljo Software Engineer at Facebook

### Abstract

Large graph datasets, like online social networks or the world wide web, introduce new challenges to the field of systems design. Their size requires scaling resources *horizontally* by splitting data and queries across several computation units, but standard sharding and routing schemes that ignore the inherent graph structure of the datasets result in suboptimal performance characteristics.  In this talk, we present an efficient distributed algorithm for *graph partitioning*, the problem of dividing a graph into equally sized components with as few edges connecting these components as possible, and show how its results can be used for optimizing distributed systems serving graph based datasets.

<iframe width="600" height="400" src="https://www.youtube.com/embed/QHkhyY9atkE" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>