---
layout: post
title: Hadoop-RDMA
date: 2015-05-20
categories: [computer science]
tags: [big data]

---

# High Performance and Scalable Hadoop using RDMA for Big Data Analytics


<iframe width="600" height="400" src="https://www.youtube.com/embed/TeWWxi3jHx4" frameborder="0" allowfullscreen></iframe>

# High Performance MPI, PGAS and Big Data (Hadoop & Spark) over InfiniBand 

<iframe width="600" height="400" src="https://www.youtube.com/embed/exUzF__jHZE" frameborder="0" allowfullscreen></iframe>

## RDMA-Apache-Hadoop-2.x 0.9.6 Features

-   Based on Apache Hadoop 2.6.0
-   High performance design with native InfiniBand and RoCE support at
    the verbs level for HDFS, MapReduce, and RPC components
-   Compliant with Apache Hadoop 2.6.0 APIs and applications
-   Easily configurable for different running modes (HHH, HHH-M, HHH-L,
    and MapReduce over Lustre) and different protocols (native
    InfiniBand, RoCE, and IPoIB)
-   On-demand connection setup
-   HDFS over native InfiniBand and RoCE
    -   RDMA-based write
    -   RDMA-based replication
    -   Parallel replication support
    -   Overlapping in different stages of write and replication
    -   Enhanced hybrid HDFS design with in-memory and heterogeneous
        storage (HHH)
        -   Supports three modes of operations
            -   HHH (default) with I/O operations over RAM disk, SSD,
                and HDD
            -   HHH-M (in-memory) with I/O operations in-memory
            -   HHH-L (Lustre-integrated) with I/O operations in local
                storage and Lustre
        -   Policies to efficiently utilize heterogeneous storage
            devices (RAM Disk, SSD, HDD, and Lustre)
            -   Greedy and Balanced policies support
            -   Automatic policy selection based on available storage
                types
        -   Hybrid replication (in-memory and persistent storage) for
            HHH default mode
        -   Memory replication (in-memory only with lazy persistence)
            for HHH-M mode
        -   Lustre-based fault-tolerance for HHH-L mode
            -   No HDFS replication
            -   Reduced local storage space usage
-   MapReduce over native InfiniBand and RoCE
    -   RDMA-based shuffle
    -   Prefetching and caching of map output
    -   In-memory merge
    -   Advanced optimization in overlapping
        -   map, shuffle, and merge
        -   shuffle, merge, and reduce
    -   Optional disk-assisted shuffle
    -   High performance design of MapReduce over Lustre
        -   Supports two shuffle approaches
            -   Lustre read based shuffle
            -   RDMA based shuffle
        -   Hybrid shuffle based on both shuffle approaches
            -   Configurable distribution support
        -   In-memory merge and overlapping of different phases
-   RPC over native InfiniBand and RoCE
    -   JVM-bypassed buffer management
    -   RDMA or send/recv based adaptive communication
    -   Intelligent buffer allocation and adjustment for serialization
-   Tested with
    -   Mellanox InfiniBand adapters (DDR, QDR, and FDR)
    -   RoCE support with Mellanox adapters
    -   Various multi-core platforms
    -   RAM Disks, SSDs, HDDs, and Lustre



## RDMA-Apache-Hadoop-1.x 0.9.9 Features

Based on Apache Hadoop 1.2.1

High performance design with native InfiniBand and RoCE support at the
verbs-level for HDFS, MapReduce, and RPC components

Compliant with Apache Hadoop 1.2.1 APIs and applications

Easily configurable for native InfiniBand, RoCE, and the traditional
sockets-based support (Ethernet and InfiniBand with IPoIB)

On-demand connection setup

HDFS over native InfiniBand and RoCE

-   RDMA-based write
-   RDMA-based replication
-   Parallel replication support

MapReduce over native InfiniBand and RoCE

RDMA-based shuffle

Prefetching and caching of map outputs

In-memory merge

Advanced optimization in overlapping

-   map, shuffle, and merge
-   shuffle, merge, and reduce

RPC over native InfiniBand and RoCE

-   JVM-bypassed buffer management
-   RDMA or send/recv based adaptive communication
-   Intelligent buffer allocation and adjustment for serialization

Tested with

-   Mellanox InfiniBand adapters (DDR, QDR, and FDR)
-   RoCE support with Mellanox adapters
-   Various multi-core platforms
-   Different file systems with disks and SSDs

## RDMA-Memcached 0.9.3 Features

Memcached server designs based on Memcached 1.4.22

Memcached client designs based on libMemcached 1.0.18

High performance design with native InfiniBand and RoCE support at the
verbs-level for Memcached Server and Client

High performance design of SSD-assisted hybrid memory

Compliant with libMemcached APIs and applications

Support for both RDMA-enhanced and socket-based Memcached clients

Easily configurable for native InfiniBand, RoCE, and the traditional
sockets-based support (Ethernet and InfiniBand with IPoIB)

On-demand connection setup

Tested with

-   Native Verbs-level support with Mellanox InfiniBand adapters (DDR,
    QDR and FDR)
-   RoCE support with Mellanox adapters
-   Various multi-core platforms
-   SSD

## OSU HiBD-Benchmarks 0.7.1 Features

Memcached Benchmarks

-   Get Microbenchmark
-   Set Microbenchmark
-   Mixed Get/Set Microbenchmark

