---
layout: post
title: Why does MapReduce + GPU Computing?
date: 2014-07-09
categories: [computer science]
tags: [gpgpu, big data]

---



## Article Source
* Title: [Why does MapReduce + GPU Computing?](https://sites.google.com/site/mapreduceongpu/home/why-how)

[![](http://sungsoo.github.com/images/gpumapreduce.png)](http://sungsoo.github.com/images/gpumapreduce.png)



# Why does MapReduce + GPU Computing?

## MapReduce Model 

MapReduce has been getting widely used in today's big data processing work. This highly scalable model for distributed programming on clusters of computer was raised by Google in the paper, "MapReduce: Simplified Data Processing on Large Clusters", by Jeffrey Dean and Sanjay Ghemawat and has been implemented in many programming languages and frameworks, such as Apache Hadoop, Pig, Hive, etc. The reasons for the success of MapReduce are listed in the paper: 
It relieves the burden of the programmers dealing with distributed programming, "since it hides the details of parallelization, fault-tolerance, locality optimization, and load balancing";

A wide range of computing problems could be presented in MapReduce model, e.g. generation of data for Google's production web search service, for sorting, for data mining, for machine learning, and many other systems;

The scability of MapReduce is up to thousands of machines which is suitable for the real workload.

![](http://sungsoo.github.com/images/mapreduce_jobcycle.png) 

**Figure 1: MapReduce Job Cycle, from "How MapReduce Works in Hadoop" lecture slides by Shivanth Babu**


## MapReduce Constraints
In spite the great sucess of MapReduce, we may still want to consider the few constraints of Hapdoop MapReduce Model. In Azinta Systems Blog, he raised a few interesting constraints for MapReduce, which contributed to the reasons for MapReduce + GPU Computing:

"The Hadoop MapReduce framework is typically applied to large batch-oriented computations that are primarily concerned with time to job completion and not real-time computations."

"All the intermediate output from each map and reduce stage is materialized to disk before it can be consumed by the next stage or produce output. This strategy is a simple and elegant checkpoint/restart fault tolerance mechanism that is essential for large-scale commodity machines with high-failure rates but comes with a performance price." 

"Each node within a MapReduce cluster is typically a 2 – 4 core CPU and the network link between nodes are typically1Gb/s Ethernet links.  No GPU co-processors are attached to the nodes and in order to get the processing speed-up hundreds or thousands of servers must be used. This leads to an initial substantial up-front investment required to build your own private large-scale MapReduce cluster plus high on-going power consumptions costs."

"Moving in-house MapReduce computations to an external MapReduce cloud service, whilst eliminating initial upfront hardware build and operational costs, may still result in substantial usage fees if hundreds or thousands of machines are required. Furthermore there is still the problem of moving large data sets to the cloud if your MapReduce jobs consume hundreds of terabytes of data.  This is a data transfer issue that is sometimes overlooked."

## Possibilities Leveraged by GPU Computing

There are many approaches to tackle those constraints,e.g. modified MapReduce for real-time analysis, graph and matrix processing, but maybe the fast evolvements in GPU Computing would give us some insights. 

![](http://sungsoo.github.com/images/gpu-computing-image-1.png) 

**Figure 2: CPU+GPU, from http://www.nvidia.com/object/what-is-gpu-computing.html**

GPU (Graphics Processing Unit), was designed originally for graphics processing. Now, because of its highly parallel feature and has developed towards a more general purpose processor, GPGPU(General Purpose GPU), for scientific and engineering applications. In this paper, "GPU Computing" by John D. Owens, Mike Houston, David Luebke, Simon Green,John E. Stone, and James C. Phillips, in 2008, GPGPU has been described as "powerful, programmable, and highly parallel - are increasingly targeted general-purpose computing applications." This paper has listed suitable algorithms and applications that can exploit the strength of GPU, such as sort, search, differential equations, linear algebra. These algorithms and applications could be exactly expressed by MapReduce, and hence why not we run MapReduce on GPU?

There are many interesting papers discussed the great potentials of GPU in the past (see more at III. Reference & More Fun?) while these years, the concept of GPU Computing has further developed into a form of "CPU+GPU combination", which leverages the excellences of both. NVIDIA, the leading company for GPU explains this approach as "because CPUs consist of a few cores optimized for serial processing, while GPUs consist of thousands of smaller, more efficient cores designed for parallel performance. Serial portions of the code run on the CPU while parallel portions run on the GPU." 

OpenCL(Open Computing Language) also serves as a low-level API for GPU computing on CUDA-powered GPUs, where CUDA is the most prior model designed by NVIDIA. This makes possible for programmers to launch kernels and hence MapReduce on a GPU with C programming language.

## How does MapReduce + GPU Computing?

## Challenges Ahead & Approaches 

Many past research works have been done to explore and implement MapReduce framework on GPUs, such as Mars, StreamMR, MapCG, GPMR, etc(see at III. Reference & More Fun?). They have encountered several common challenges and come with their own approaches, but we may wonder whether their concerns and assumptions are still valid if we move the implementations of MapReduce to the GPU cluster cloud?

The main challenges for implementation of MapReduce on GPU and possible approaches are listed below:
The current GPU provides no lock support, which imposes a challenge for synchronization among large number of processors. Most of the MapReduce implementations provide atomic free or lock free scheme to tackle this issue. For Mars, it has a two-step scheme to prefix sum and count the intermediate results and then write results into the output array. Both StreamMR and MapCG argued that this scheme had a large overhead and inefficiency. StreamMR proposed opportunistic preprocessing to reduce unnecessary counting computation and implemented atomic-free hash tables to group intermediate results. MapCG also used hash table to group intermediate results and implemented a specialized memory allocator composed of global buffer with atomicAdd() operation provided by GPU to ensure parallelism. This challenge still stays with us when we implement in GPU cluster on Amazon EC2.

It is difficult to ensure even workload allocation across GPU threads to maximize GPU’s utility. This challenge has been addressed by Mars, GPMR, etc. In order to achieve massive threads parallelism, Mars would initialize a large number of threads, and assign a certain number of key value pairs automatically to each thread while GPMR implemented concepts of chunk, partial reduction and accumulation for MapReduce.

The commonly used GPU library, CUBLAS, is still at relatively low level and lacks the most conventional operations for MapReduce such as string processing and files manipulation. Many past papers have provide basic API, library and configurations for MapReduce.

Handling datasets greater than the device memory is another concern of Mars and GPMR in the past, but will the GPU on Amazon EC2 relieve this concern? The experiment metrics for the past research could be modified in terms of size and scale. For example, the largest data size for StringMatch(SM) is 256MB and for matrix multiplication is 2048 * 2048, and this may not be suitable for GPU on Amazon EC2.

Most of the implementations of MapReduce are for solo GPU, not GPU cluster. In Amazon EC2, there are 2 x NVIDIA Tesla ”Fermi” M2050 GPUs in the cluster. The synchronization challenge has been addressed by GPMR model.

Co-prossessing GPU and CPU is another synchronization challenge. In MapCG, a new MapReduce framework was designed to have MapCG API to translate to CPU code and GPU cod at runtime. MapCG evaluated the performance for CPU+GPU co-processing was not significant better than same type of processors due to application types and overheads. We could explore how to reduce the overhead and have a classifier to assign applications or tasks to the most suitable processors.

## Other Successful Stories

There are some other interesting papers modeled MapReduce on GPU and tested the model on a specific problem with remarkable improvements. One interesting example is MITHRA, "MITHRA: Multiple data Independent Tasks on a Heterogeneous Resource Architecture", by Reza Farivar, Abhishek Verma, Ellick M. Chan, Roy H. Cambell, has showed the performance improvements for scientific simulation problems, especially the Black Scholes option pricing, with their designed model MITHRA. This model leverages both Apache Hadoop and NVIDIA CUDA. You could find more interesting papers or stories at III. Reference &  More Fun?

