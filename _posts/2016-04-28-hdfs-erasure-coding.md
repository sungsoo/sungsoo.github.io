---
layout: post
title: Introduction to HDFS Erasure Coding in Apache Hadoop
date: 2016-04-28
categories: [computer science]
tags: [big data]

---

## Article Source

* Title: [Introduction to HDFS Erasure Coding in Apache Hadoop](https://blog.cloudera.com/blog/2015/09/introduction-to-hdfs-erasure-coding-in-apache-hadoop/)

---

# Introduction to HDFS Erasure Coding in Apache Hadoop 


**Erasure coding, a new feature in HDFS, can reduce storage overhead by
approximately 50% compared to replication while maintaining the same
durability guarantees. This post explains how it works.**

HDFS by default replicates each block three times. Replication provides
a simple and robust form of redundancy to shield against most failure
scenarios. It also eases scheduling compute tasks on locally stored data
blocks by providing multiple replicas of each block to choose from.

However, replication is expensive: the default 3x replication scheme
incurs a 200% overhead in storage space and other resources (e.g.,
network bandwidth when writing the data). For datasets with relatively
low I/O activity, the additional block replicas are rarely accessed
during normal operations, but still consume the same amount of storage
space.

Therefore, a natural improvement is to use erasure coding (EC) in place
of replication, which uses far less storage space while still providing
the same level of fault tolerance. Under typical configurations, EC
reduces the storage cost by \~50% compared with 3x replication.
Motivated by this substantial cost saving opportunity, engineers from
Cloudera and Intel initiated and drove the HDFS-EC project under
[HDFS-7285](https://issues.apache.org/jira/browse/HDFS-7285) in
collaboration with the broader Apache Hadoop community. HDFS-EC is
currently targeted for release in Hadoop 3.0.

In this post, we will describe the design of HDFS erasure coding. Our
design accounts for the unique challenges of retrofitting EC support
into an existing distributed storage system like HDFS, and incorporates
insights by analyzing workload data from some of Cloudera’s largest
production customers. We will discuss in detail how we applied EC to
HDFS, changes made to the NameNode, DataNode, and the client read and
write paths, as well as optimizations using Intel ISA-L to accelerate
the encoding and decoding calculations. Finally, we will discuss work to
come in future development phases, including support for different data
layouts and advanced EC algorithms.

Background
----------

### EC and RAID

When comparing different storage schemes, there are two important
considerations: data durability (measured by the number of tolerated
simultaneous failures) and storage efficiency (logical size divided by
raw usage).

Replication (like RAID-1, or current HDFS) is a simple and effective way
of tolerating disk failures, at the cost of storage overhead. *N*-way
replication can tolerate up to *n*-1 simultaneous failures with a
storage efficiency of 1/*n*. For example, the three-way replication
scheme typically used in HDFS tolerates up to two failures with a
storage efficiency of one-third (alternatively, 200% overhead).

*Erasure coding*(EC) is a branch of information theory which extends a
message with redundant data for fault tolerance. An EC codec operates on
units of uniformly-sized data termed cells. A codec can take as input a
number of data cells and outputs a number of parity cells. This process
is called encoding. Together, the data cells and parity cells are termed
an erasure coding group. A lost cell can be reconstructed by computing
over the remaining cells in the group; this process is called
*decoding*.

![](http://blog.cloudera.com/wp-content/uploads/2015/09/hdfs-erasure-t11.png "hdfs-erasure-t1")

Table 1. XOR (exclusive-or) operations

The simplest form of erasure coding is based on XOR (exclusive-or)
operations, shown in Table 1. XOR operations are associative, meaning
that *X* ⊕ *Y* ⊕ *Z* = (*X* ⊕ *Y*) ⊕ *Z*. This means that XOR can
generate 1 parity bit from an arbitrary number of data bits. For
example, 1 ⊕ 0 ⊕ 1 ⊕ 1 = 1. When the third bit is lost, it can be
recovered by XORing the remaining data bits {1, 0, 1} and the parity bit
1. While XOR can take any number of data cells as input, it is very
limited since it can only produce at most one parity cell. So, XOR
encoding with group size n can tolerate up to 1 failure with an
efficiency of *n*-1/*n* (*n*-1 data cells for a group of *n* total
cells), but is insufficient for systems like HDFS which need to tolerate
multiple failures.

This limitation is addressed by Reed-Solomon (RS), another form of EC.
RS uses sophisticated linear algebra operations to generate multiple
parity cells, and thus can tolerate multiple failures per group. This
makes it a common choice for production storage systems. RS is
configurable with two parameters, *k* and *m*. As illustrated in Figure
1, *RS(k,m)* works by multiplying a vector of k data cells with a
Generator Matrix (*G^T^*) to generate an extended codeword vector with
*k* data cells and *m* parity cells. Storage failures can be recovered
by multiplying the surviving cells in the codeword with the inverse of
*G^T^*—as long as k out of (*k + m*) cells are available. (Rows in
*G^T^* corresponding to failed units should be deleted before taking its
inverse.) This means that the group can tolerate the failure of any *m*
cells.

![](http://blog.cloudera.com/wp-content/uploads/2015/09/hdfs-erasure-f1.png "hdfs-erasure-f1")

Figure 1: Reed-Solomon encoding with four data units and two parity
units
([source](https://www.usenix.org/legacy/event/fast09/tech/full_papers/plank/plank.pdf))

With Reed-Solomon, the user can flexibly adjust data durability and
storage cost by choosing different values for *k* and *m*. The number of
parity cells (*m*) determines the number of simultaneous storage
failures that can be tolerated. The ratio of data cells to parity cells
determines the storage efficiency:

![](https://latex.codecogs.com/gif.latex?\frac{m}{k+m} "\frac{m}{k+m}")

Typical RS configurations such as RS (6,3) and RS (10,4) provide
superior data durability and superior storage efficiency compared to
three-way replication, since they can tolerate up to three or four
failures respectively and do so with \<50% storage overhead. Table 2
compares the fault tolerance and storage efficiency of replication, XOR,
and RS with typical parameters.

![](http://blog.cloudera.com/wp-content/uploads/2015/09/hdfs-erasure-tab2.png "hdfs-erasure-tab2")

Table 2: Comparison of replication, XOR, and RS in fault tolerance and
storage efficiency

![](http://blog.cloudera.com/wp-content/uploads/2015/09/hdfs-erasure-2new.png "hdfs-erasure-2new")

Figure 2. RAID-5 and RAID-6 illustrations
([source](https://en.wikipedia.org/wiki/Standard_RAID_levels))

EC has long been used in local storage systems, notably in the forms of
[RAID-5 and RAID-6](https://en.wikipedia.org/wiki/Standard_RAID_levels).
RAID-5 typically uses XOR encoding since it only needs to tolerate a
single disk failure, while RAID-6 uses Reed-Solomon with two parity
cells to tolerate up to two failures. The cell size is typically
configurable, with the erasure coding groups formed by the cells at the
same offset on each disk.

### EC in Distributed Storage Systems

To manage potentially very large files, distributed storage systems
usually divide files into fixed-size logical byte ranges called logical
blocks. These logical blocks are then mapped to storage blocks on the
cluster, which reflect the physical layout of data on the cluster.

![](http://blog.cloudera.com/wp-content/uploads/2015/09/hdfs-erasure-f31.png "hdfs-erasure-f3")

Figure 3. Illustration of EC with contiguous and striped layouts

The simplest mapping between logical and storage blocks is a contiguous
block layout, which maps each logical block one-to-one to a storage
block. Reading a file with a contiguous block layout is as easy as
reading each storage block linearly in sequence.

In contrast, a striped block layout breaks a logical block into much
smaller storage units, typically called cells, and writes repeated
stripes of cells round robin across a set of storage blocks. Reading a
file with a striped layout requires querying the set of storage blocks
of a logical block, then reading stripes of cells from the set of
storage blocks. This section discusses how EC can be supported on both
block layouts.

In principle, block layout (contiguous vs. striped) and redundancy form
(replication vs. EC) are two orthogonal dimensions, resulting in four
possible combinations. As surveyed in Figure 4, they are all in active
use by major storage systems. Some systems, including Ceph and QFS,
support configuring layout and/or redundancy on a per-directory or
per-file basis.

![](http://blog.cloudera.com/wp-content/uploads/2015/09/hdfs-erasure-f42.png "hdfs-erasure-f4")

Figure 4. Spectrum of existing distributed storage systems with
different block layouts and redundancy forms

As discussed before, erasure coding is advantageous over replication in
terms of storage efficiency. However, this comes at the cost of
additional complexity and more expensive failure recovery.

Along the block layout dimension, striping can provide better I/O
throughput than a contiguous layout since it can utilize multiple
spindles in parallel. However, the implication is that most reads will
be remote, stressing the need for fast full-bisection networks. This
approach contradicts the traditional MapReduce paradigm of scheduling
for data locality, though it is still possible if applications read and
write their data with awareness of the underlying cell and stripe sizes.

Design and Implementation
-------------------------

### Choosing Block Layout

For HDFS-EC, the foremost question was determining which block layout
was most suitable. A contiguous layout is simpler to implement since the
read and write path would still be very similar to the current system
with replication. However, it is only suitable when files are quite
large, since the full cost savings are only realized when writing full
stripes. For instance, with RS (10,4) a stripe with only a single 128MB
data block would still end up writing four 128MB parity blocks, for a
storage overhead of 400% (worse than 3-way replication). A contiguous
layout is also only suitable for offline or background EC, since
otherwise a client would need to buffer GBs of data blocks to calculate
parity.

On the other hand, EC with striped layout can realize storage savings
with both small and large files because the cell size is much smaller
(typically 64KB or 1MB). This overall smaller group size also enables
online EC where clients directly write erasure coded data, since only a
few megabytes of buffering are needed to calculate parity information.
One drawback is that some locality-sensitive workloads will have
suboptimal performance when running on striped blocks. To better serve
such workloads, a striped file can be converted to the contiguous
layout, but that requires almost rewriting the entire file.

Based on this analysis, file size is the key determining factor. If
cluster usage is dominated by large files—meaning six or more 128MB
blocks, enough for a full EC group under RS(6,3) scheme—then a
contiguous layout is suitable since we can avoid the implementation
issues of combining blocks from multiple small files into a single
group. However, if cluster capacity is dominated by small files, then a
striped layout is the more natural choice to achieve better cost savings
and administration.

![](http://blog.cloudera.com/wp-content/uploads/2015/09/hdfs-erasure-f5.png "hdfs-erasure-f5")

Figure 5. File-size histograms from production clusters

We conducted an empirical study of the HDFS file-size distribution at
three of Cloudera’s largest customers. Details of the analysis can be
found in our
[report](https://issues.apache.org/jira/secure/attachment/12690129/fsimage-analysis-20150105.pdf),
and Figure 5 summarizes the key findings. Most importantly, usage by
small files (less than one group) varied between 36-97% of all cluster
usage, indicating that handling small files is very important.

Based on this finding, we dedicated the first phase of HDFS-EC to
supporting EC with striped layout.

### Generalizing the Block Concept on NameNode

A major portion of this project is dedicated to generalizing the
fundamental Block concept to support data striping. The assumption of
contiguous block layout is widely and deeply embedded in HDFS internal
logic. To support the striped layout, the concept of a logical block had
to be separated from that of a storage block. The former represents a
logical byte range in a file, while the latter is the basic unit of data
chunks stored on a DataNode. Figure 6 demonstrates the concepts of
logical and storage blocks. In the example, the file /tmp/foo is
logically divided into 13 [striping
cells](https://docs.google.com/document/d/1mSmptvdQ-T2CfmNq-HIH_gGZVU7bn2l2T2Rl-LK9czk/edit#bookmark=id.gv8uten4nvw7)
(cell\_0 through cell\_12). Logical block 0 represents the logical byte
range of cells 0\~8, and logical block 1 represents cells 9\~12. Cells
0, 3, 6 form a storage block, which will be stored as a single chunk of
data on a DataNode. For conciseness the figure doesn’t include parity
blocks/cells.

A naive mechanism to support this generalization is for the HDFS
NameNode to monitor each storage block in its blocks map, which maps
from a block ID to the corresponding block, and then use another map to
go from a logical block to its member storage blocks. However, this
means small files will incur significant memory overhead on the NameNode
because striping results in many more storage blocks than replication.

To reduce this overhead we have introduced a new hierarchical block
naming protocol. Currently HDFS allocates block IDs sequentially based
on block creation time. This protocol instead divides each block ID into
2\~3 sections, as illustrated in Figure 7. Each block ID starts with a
flag indicating its layout (contiguous=0, striped=1). For striped
blocks, the rest of the ID consists of two parts: the middle section
with ID of the logical block and the tail section representing the index
of a storage block in the logical block. This allows the NameNode to
manage a logical block as a summary of its storage blocks. Storage block
IDs can be mapped to their logical block by masking the index; this is
required when the NameNode processes DataNode block reports.

We have simulated the NameNode memory usage with EC based on the three
HDFS cluster images in Figure 5. Results show that without the new
hierarchical block naming protocol, striping would increase the size of
NameNode blocks map by 250%\~440%. With the protocol, striping only
increases the NameNode blocks map by 21%\~76%. More details of the
memory overhead analysis can be found in this
[report](https://issues.apache.org/jira/secure/attachment/12690129/fsimage-analysis-20150105.pdf).

![](http://blog.cloudera.com/wp-content/uploads/2015/09/hdfs-erasure-f6.png "hdfs-erasure-f6")

Figure 6. Logical and storage blocks      

![](http://blog.cloudera.com/wp-content/uploads/2015/09/hdfs-erasure-f7.png "hdfs-erasure-f7")

Figure 7. Hierarchical block naming protocol

Because of this design, a logical block appears as a group of internal
storage blocks on NameNode. Table 3 summarizes terminologies related to
striping and EC blocks. The default EC policy is to use 6 data blocks
and 3 parity blocks, and a striping cell size of 64KB. These default
values were selected based on typical cluster and file sizes. A wider EC
schema, such as the (10,4) setting in Facebook’s EC implementation of
[HDFS-RAID](http://wiki.apache.org/hadoop/HDFS-RAID), has better storage
efficiency but leads to more expensive recovery, as well as placing a
high requirement on the number of racks in the cluster.

![](http://blog.cloudera.com/wp-content/uploads/2015/09/hdfs-erasure-t3.png "hdfs-erasure-t3")

Table 3. Glossary of EC block concepts

Supporting the logical block abstraction required updating many parts of
the NameNode. As one example, HDFS attempts to replicate
under-replicated blocks based on the risk of data loss. Previously, the
algorithm simply considered the number of remaining replicas, but has
been generalized to also incorporate information from the EC schema.
Other key changes include updating quota, fsck, balancer, and so forth.

### Client Extensions

The main I/O logic of the HDFS client is implemented in `DFSInputStream`
and `DFSOutputStream`. We have extended them into
`DFSStripedInputStream` and `DFSStripedOutputStream` with data striping
and EC support. The basic principle behind the extensions is to allow
the client node to work on multiple storage blocks in a logical block in
parallel. When used together with HDFS encryption, these extensions
operate on encrypted data—i.e., below the encryption layer.

On the output/write path, `DFSStripedOutputStream` manages a set of data
streamers, one for each DataNode storing an internal storage block in
the current logical block. The streamers mostly work asynchronously. A
coordinator takes charge of operations on the entire logical block,
including ending the current logical block, allocating a new logical
block, and so forth.

On the input/read path, `DFSStripedInputStream` translates a requested
logical byte range of data as ranges into internal storage blocks stored
on DataNodes. It then issues read requests in parallel. Upon failures,
it issues additional read requests for decoding.

### DataNode Extensions

To avoid the chance of expensive foreground data reconstruction on the
client side, it is critical to identify and fix DataNode failures in the
background. As with replication, the NameNode is responsible for
tracking missing blocks in an EC stripe and assigning recovery work to
DataNodes. The recovery work on the DataNode is handled by a new
`ErasureCodingWorker` (ECWorker) component, which does the following to
reconstruct a missing EC block:

1.  Read the data from source nodes: A dedicated thread pool,
    initialized at `ErasureCodingWorker` start time, is used to read
    data blocks from different source nodes. Base on the EC schema, it
    schedules the read requests to all source targets and ensures only
    to read minimum required input blocks for reconstruction.  

2.  Decode the data and generate the output data: Similar to EC client,
    ECWorker finishes decoding/encoding work by using the codec
    framework that will be introduced in the Erasure Codec Framework.

3.  Transfer the generated data blocks to target nodes: Once decoding is
    finished, it will encapsulate the output data to packets and send
    them to target DataNodes.

### Codec Calculation Framework

Data encoding/decoding is very CPU intensive and can be a major overhead
when using erasure coding. To mitigate this in HDFS-EC, we leverage
Intel’s open-source [Intelligent Storage Acceleration
Library](http://www.intel.com/content/www/us/en/storage/erasure-code-isa-l-solution-video.html)
(Intel ISA-L), which accelerates EC-related linear algebra calculations
by exploiting advanced hardware instruction sets like SSE, AVX, and
AVX2. ISA-L supports all major operating systems, including Linux and
Windows. 

In HDFS-EC we implemented the Reed-Solomon algorithm in two forms: one
based on ISA-L and another in pure Java (suitable for systems without
the required CPU models). We have compared the performance of these two
implementations, as well as the coder from Facebook’s HDFS-RAID
implementation. A (6,3) schema is used in all tests in this section.

Figure 8 first shows results from an in-memory encoding/decoding micro
benchmark. The ISA-L implementation outperforms the HDFS-EC Java
implementation by more than 4x, and the Facebook HDFS-RAID coder by
\~20x. Based on the results, we strongly recommend the ISA-L accelerated
implementation for all production deployments.

![](http://blog.cloudera.com/wp-content/uploads/2015/09/hdfs-erasure-f8.png "hdfs-erasure-f8")

Figure 8. Encoding and decoding performance comparison

We also compared end-to-end HDFS I/O performance with these different
coders against HDFS’s default scheme of three-way replication. The tests
were performed on a cluster with 11 nodes (1 NameNode, 9 DataNodes, 1
client node) interconnected with 10 GigE network. Figure 9 shows the
throughput results of 1) client writing a 12GB file to HDFS; and 2)
client reading a 12GB file from HDFS. In the reading tests we manually
killed two DataNodes so the results include decoding overhead.

As shown in Figure 9, in both sequential write and read and read
benchmarks, throughput is greatly constrained by the pure Java coders
(HDFS-RAID and our own implementation). The ISA-L implementation is much
faster than the pure Java coders because of its excellent CPU
efficiency. It also outperforms replication by 2-3x because the striped
layout allows the client to perform I/O with multiple DataNodes in
parallel, leveraging the aggregate bandwidth of their disk drives. We
have also tested read performance without any DataNode failure: HDFS-EC
is roughly 5x faster than three-way replication.

Note that further performance gains should be possible. With an RS (6,3)
layout, a striped layout should be able to achieve approximately a 6x
improvement in I/O throughput, or approximately 1GB/s of throughput. The
current performance does not meet the theoretical optimum partially
because the striped layout spreads logically sequential I/O requests to
multiple DataNodes, potentially degrading sequential I/O pattern on
local disk drives. We plan to add more advanced prefetching and write
buffering to the client as a future optimization.

![](http://blog.cloudera.com/wp-content/uploads/2015/09/hdfs-erasure-f9.png "hdfs-erasure-f9")

Figure 9. HDFS I/O performance comparison

Another important optimization in ISA-L is support for incremental
coding. This means applications do not have to wait for all source data
before starting the coding process. This will potentially enable HDFS-EC
to efficiently handle slow writing applications, as well as append
operations.

Future Work
-----------

This article summarizes the first development phase for HDFS-EC. Many
exciting extensions and optimizations have been identified and
documented under
[HDFS-8031](https://issues.apache.org/jira/browse/HDFS-8031). A major
follow-on task is to build a generic EC policy framework which allows
system users to deploy and configure multiple coding schemas such as
conventional Reed-Solomon,
[HitchHiker](http://www.eecs.berkeley.edu/~nihar/publications/Hitchhiker_SIGCOMM14.pdf),
LRC, and so forth. By abstracting and modularizing common codec logics,
the framework will also enable users to easily develop new EC
algorithms. We also plan to further optimize NameNode memory consumption
and reduce data reconstruction latency.

To save storage space on files belonging to locality-sensitive
workloads, we have established HDFS-EC phase II
([HDFS-8030](https://issues.apache.org/jira/browse/HDFS-8030)) to
support EC with contiguous block layout.

Conclusion
----------

Erasure coding can reduce the storage overhead of HDFS by approximately
50% compared to replication while maintaining the same durability
guarantees. This results in a substantial storage-cost savings in
hardware expenditure, since users can now store twice as much data on
the same amount of raw storage.

Implementing HDFS-EC required making improvements across many parts of
HDFS and the collaborative efforts of developers at Cloudera, Intel, and
the rest of the Apache Hadoop community. The design of HDFS-EC results
in minimal additional overhead on the NameNode through the use of a new
hierarchical block naming protocol, and also leverages the optimized
Reed-Solomon routines in Intel ISA-L for high-performance encoding and
decoding of parity information.

