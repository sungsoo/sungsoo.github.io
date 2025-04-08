---
layout: post
title: Concurrent Analytical Query Processing with GPUs
date: 2015-12-25
categories: [computer science]
tags: [big data, gpgpu]

---


Concurrent Analytical Query Processing with GPUs
======================================

## Abstract

In current databases, GPUs are used as dedicated accelerators to process each individual query. Sharing GPUs among concurrent queries is not supported, causing serious resource underutilization. Based on the profiling of an open-source GPU query engine running commonly used single-query data warehousing workloads, we observe that the utilization of main GPU resources is only up to 25%. The underutilization leads to low system throughput.

To address the problem, this paper proposes *concurrent query execution* as an effective solution. 
To efficiently share GPUs among concurrent queries for high throughput, the major challenge is to provide software support to control and resolve resource contention incurred by the sharing. Our solution relies on GPU query scheduling and device memory swapping policies to address this challenge. We have implemented a prototype system and evaluated it intensively. The experiment results confirm the effectiveness and performance advantage of our approach. By executing multiple GPU queries concurrently, system throughput can be improved by up to 55% compared with dedicated processing.

## INTRODUCTION

Multitasking has been a proven practice in computer systems to achieve high resource utilization and system throughput. However, despite the wide adoption of GPUs (Graphics Processing Units) for analytical query processing, they are still mainly used as dedicated co-processors, unable to support efficient executions of multiple queries concurrently.

Due to the *heterogeneous*, *data-driven characteristics* of GPU operations, a single query can hardly consume all GPU resources. Dedicated query processing thus often leads to resource underutilization, which limits the overall performance of the database system. In *market-critical* applications such as *high-performance data warehousing* and *multi-client dataflow analysis*, a large number of users may demand query results simultaneously. As the volume of data to be processed keeps increasing, it is also essential for user queries to make continuous progress so that new results can be generated constantly to satisfy the goal of interactive
analysis. The lack of *concurrent querying capability* restricts the adoption of GPU databases in these application fields.

While dedicated usage of GPUs is still needed for *latency-critical queries* to ensure performance isolation, databases must be improved to support *concurrent multi-query execution* as an option to maximize the throughput of nonlatency-sensitive queries on the GPU device. This consolidated usage of GPU resources enhances system efficiency and functionalities, but it makes the design of query execution engine more challenging. For maximal performance, each user query tends to reserve a large amount of GPU resources. Unlike CPUs where the operating system supports *fine-grained* context switches and *virtual memory abstractions* for resource sharing, current GPU hardware and system software provide none of these interfaces for database resource management. For example, GPU tasks cannot be *preempted* once started; *on-demand data loading* is not supported during task execution; automatic data swapping service is also missing when the device memory undergoes pressure. As a result, without efficient coordination by the database, multiple GPU queries attempting to execute simultaneously can easily cause low resource usage, system thrashing, or even query abortions, which significantly degrade, instead of enhance, overall system performance.

In this paper we present a resource management facility called *MultiQx-GPU* (Multi-Query eXecution on GPU) to address the above challenges and support efficient executions of concurrent queries in GPU databases. It ensures high resource utilization and system performance through two key components: a *query scheduler* that maintains optimal concurrency level and workload on the GPUs, and a *data swapping mechanism* to maximize the effective utilization of GPU device memory. This paper also presents a prototype implementation of MultiQx-GPU in an open-source GPU query engine and discusses several technical issues addressed by our system to ensure its usability and efficiency in practice. Through intensive experiments with a wide range of workloads, we demonstrate the effectiveness and performance advantage of our solution. By supporting concurrent query processing, MultiQx-GPU improves system throughput by up to 55% relative to the system without such support.

This paper makes the following main contributions. First, we have made a strong case for building an *effective resource sharing facility* as a part of a database to manage concurrent query executions with GPUs. Second, we have shown the *effectiveness* of our design and implementation of the software facility with intensive experiments. Finally, the software framework presented in this paper is open-source and can also be enhanced to support GPU resource sharing activities in other data processing applications, raising the *productivity* and *system utilization*.

## References

* Kaibo Wang, Kai Zhang, Yuan Yuan, Siyuan Ma, Rubao Lee, Xiaoning Ding, and Xiaodong Zhang. 2014. *Concurrent analytical query processing with GPUs*. Proc. VLDB Endow. 7, 11 (July 2014), 1011-1022. DOI=[http://dx.doi.org/10.14778/2732967.2732976](http://dx.doi.org/10.14778/2732967.2732976)