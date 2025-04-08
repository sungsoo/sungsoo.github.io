---
layout: post
title: Sparrow Paper Review
date: 2015-10-02
categories: [computer science]
tags: [big data]

---

# Paper Review

# Sparrow: Distributed, Low Latency Scheduling 

## Abstract
Large-scale data analytics frameworks are shifting towards shorter task durations and larger degrees of parallelism to provide low latency. However, scheduling highly parallel jobs that complete in hundreds of milliseconds poses a major challenge for cluster schedulers, which will need to place millions of tasks per second on appropriate nodes while offering millisecond-level latency and high availability. We demonstrate that a decentralized, randomized sampling approach provides nearoptimal performance while avoiding the throughput and availability limitations of a centralized design. We implement and deploy our scheduler, Sparrow, on a real cluster and demonstrate that Sparrow performs within 14% of an ideal scheduler.

![](http://sungsoo.github.com/images/sparrow-technique.png)


## Summary:
In this paper, the authors propose a scheduling system from a set of
machines that operate autonomously without a centralized state. Their
distributed design provides good scalability, and actually supports many
requests by adding additional schedulers. Their approach provides
scheduling every task by probing two random servers and placing the task
on the server with fewer queued tasks. They introduce three different
techniques to make the power of two choices effective in cluster running
parallel jobs. Their evaluation results show Sparrow achieves a good
performance of within 12% of an ideal scheduler!

## Pros:
For sure the main contribution of the paper is to propose a
decentralized design with high scalability and availability features.
Providing 3 different techniques to make the power of two choices
effective was a good contribution. The late binding was a good one since
it supports both server queue length, and race conditions!

Strong evaluation based on a 110-machine cluster to showcase performance
improvement was a big plus.

## Cons:
Sparrow assumes that a *long-running executor* process is already running
on each worker machine for, so that it need only to send a short task
description when a task is launched.

Also the authors assumed that each job runs as a single wave of tasks
when doing the evaluations. In real clusters, jobs may run as multiple
waves of tasks!

The authors make a few simplifying assumptions in their analysis. They
assume zero network latency, an infinitely huge number of servers. Also
that each server runs a single task at a time.

Thoughts for further development:
There are many avenues for future work in this interesting paper. One
thing to mention is to consider their simplified assumptions as
extension of their analysis. Also as for evaluation, they should note
that in real clusters, jobs may run as multiple waves of tasks!

## Critiques/Questions:
They assumed zero network latency. Is it acceptable for their analysis?!

