---
layout: post
title: MapD (Massively Parallel Database) Overview
date: 2015-06-16
categories: [computer science]
tags: [gpgpu, big data, hadoop & mapreduce]

---

## Article Source
* Title: [WHY MAPD? THE POSSIBILITIES OF 1000X FASTER DATA EXPLORATION WITH GPUS](http://www.mapd.com/blog/2015/06/04/mapd/)

---

# MapD (Massively Parallel Database) Overview


MapD is a next-generation data analytics platform designed to process billions of records in milliseconds using GPUs. It features a relational database backend with advanced visualization and analytic features to enable hyper-interactive exploration of large datasets. The inspiration for MapD came from our own struggles wrestling with big data, marked by frustrating encounters with tempermental clusters and overnight queries.

Such "data trauma" is rampant. Even though our customers come from a diverse set of verticals, their pain points read much like our own. Each struggles to extract the value from their datasets only to find their existing tools are not up to the task. Whether querying these datasets takes hours, minutes or even tens of seconds, the customers yearn for something more – they want access to the insight hidden in their data at interactive speeds.

These customers aren’t using “slow” tools like traditional disk-based RDBMS or Hadoop. They are using state-of-the-art in-memory column stores expressly designed for analytic workloads. And yet partially because of the limitations of CPUs these tools run on, and partially because they do not even fully utilize that hardware, they are not fast enough.

The conventional solution in this situation is to throw more hardware at the problem. Depending on the dataset size, tens, hundreds or even thousands of servers may be provisioned in an effort to achieve the desired level of performance. While such an approach makes both the hardware and software vendors happy, it is no magic bullet. To begin with, big server footprints require lots of space, power, cooling, and technicians – all of which translate to significant expense for the organization. Second, the overhead of network I/O imposes a significant performance penalty on large distributed deployments, and given a cluster of a large enough size, may impose a latency tax such that even the simplest queries cannot be answered below a certain minimum time threshold.

This was the status quo that MapD was born into and was designed to ameliorate. MapD was built from the ground up to couple the fastest possible hardware with the fastest possible software to achieve orders-of-magnitude speedups over other systems. On the hardware side of the equation we leverage the massive parallelism and memory bandwidth of graphics processors (GPUs), originally designed for rendering video games but now turned general purpose compute engines that excel at parallelizable tasks like linear algebra and database queries. We then write our code to extract every ounce of performance out of that hardware, compiling our queries on-the-fly using LLVM to avoid cache misses and ensure maximum vectorization. To avoid having to move data to the GPUs at query time, “hot” data is cached in fast GPU memory, which today can range as high as 192GB per server (if the working dataset cannot fit on the GPUs, then MapD can execute on CPU). The net result is up to three orders of magnitude speed increase on standard SQL queries over other in-memory systems, comparing server-to-server.