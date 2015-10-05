---
layout: post
title: RAMCloud Training
date: 2015-10-08
categories: [computer science]
tags: [big data, parallel computing]

---


# RAMCloud - Scalable High-Performance Storage Entirely in DRAM

In recent years DRAM has played a larger and larger role in storage systems, driven by the demands of large-scale Web applications. However, DRAM is still used primarily in limited or special-purpose ways, such as a cache for some other backing store. 

In this talk I will describe RAMCloud, a general-purpose storage system where all data lives in DRAM at all times and large-scale systems are created by aggregating the main memories of thousands of commodity servers. 

RAMCloud provides durable and available DRAM-based storage for the same cost as volatile caches, and it offers performance 10-100x faster than existing storage systems. 

By combining low latency and large scale, RAMCloud will enable a new class of applications that manipulate large datasets more intensively than has ever been possible.


<iframe width="600" height="400" src="https://www.youtube.com/embed/lcUvU3b5co8" frameborder="0" allowfullscreen></iframe>

### Biography:

John Ousterhout is Professor (Research) of Computer Science at Stanford University. His current research focuses on infrastructure for Web applications and cloud computing.

## RAMCloud: Remote Procedure Call Architecture

RAMCloud is a distributed datacenter storage system built to provide web applications with low-latency access to large data sets. This video describes the internal architecture used by RAMCloud for the client side of its remote procedure call mechanism. The mechanism is interesting in that it supports a variety of underlying network transport mechanisms, is designed for very low latency, has a flexible mechanism for retrying RPCs at several levels, and allows all RPCs to be invoked asynchronously.

<iframe width="600" height="400" src="https://www.youtube.com/embed/t_aTEJ63I74" frameborder="0" allowfullscreen></iframe>

## RAMCloud: Log Structured Memory - Part 1

RAMCloud is a distributed datacenter storage system built to provide web applications with low-latency access to large data sets. This video introduces how RAMCloud uses the same log structure to manage both durable backup copies of its data as well as its heap memory in DRAM. This is part 1 of 2 on this topic.

<iframe width="600" height="400" src="https://www.youtube.com/embed/8dSkVar2C34" frameborder="0" allowfullscreen></iframe>

## RAMCloud: Log Structured Memory - Part 2

This is part 2 of 2 on this topic.

<iframe width="600" height="400" src="https://www.youtube.com/embed/gXprpPlLl48" frameborder="0" allowfullscreen></iframe>

## RAMCloud Project
In this video, Ankita Kejriwal from Stanford presents: The RAMCloud Project. Recorded at the HPC Advisory Council Stanford Conference 2013.

<iframe width="600" height="400" src="https://www.youtube.com/embed/6B9CLcDLwmE" frameborder="0" allowfullscreen></iframe>