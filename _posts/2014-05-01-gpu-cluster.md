---
layout: post
title: GPU Cluster
date: 2014-05-01
categories: [computer science]
tags: [parallel programming]

---
# Article Source
* Title: [GPU Cluster](http://en.wikipedia.org/wiki/GPU_cluster)
* Source: [Wikipedia, the free encyclopedia](http://en.wikipedia.org/)


[![](http://sungsoo.github.com/images/cuda.png)](http://sungsoo.github.com/images/gpu-cluster.png)

# GPU GPU cluster

A **GPU cluster** is a [computer
cluster](/wiki/Computer_cluster "Computer cluster") in which each node
is equipped with a [Graphics Processing
Unit](/wiki/Graphics_Processing_Unit "Graphics Processing Unit") (GPU).
By harnessing the computational power of modern GPUs via
[General-Purpose Computing on Graphics Processing
Units](/wiki/General-Purpose_Computing_on_Graphics_Processing_Units "General-Purpose Computing on Graphics Processing Units")
(GPGPU), very fast calculations can be performed with a GPU cluster.


# Hardware (GPU)
The hardware classification of GPU clusters fall into two categories:
Heterogeneous and Homogeneous.

**Heterogeneous**

Hardware from both of the major
[IHV](/wiki/Independent_hardware_vendor "Independent hardware vendor")'s
can be used (ATi and nVidia). Even if different models of the same GPU
are used (e.g. 8800GT mixed with 8800GTX) the gpu cluster is considered
heterogeneous.

**Homogeneous**

Every single GPU is of the same hardware class, make, and model. (i.e. a
homogeneous cluster comprising 100 8800GTs, all with the same amount of
[VRAM](/wiki/VRAM "VRAM"))

Classifying a GPU cluster according to the above semantics largely
directs software development on the cluster, as different GPUs have
different capabilities that can be utilized.


# Hardware (Other)

**Interconnect**

In addition to the computer nodes and their respective GPUs, a fast
enough interconnect is needed in order to shuttle data amongst the
nodes. The type of interconnect largely depends on the number of nodes
present. Some examples of interconnects include [Gigabit
Ethernet](/wiki/Gigabit_Ethernet "Gigabit Ethernet") and
[InfiniBand](/wiki/InfiniBand "InfiniBand").

**Vendors**

[NVIDIA](/wiki/NVIDIA "NVIDIA") provides a list of dedicated Tesla
Preferred Partners (TPP) with the capability of building and delivering
a fully configured GPU cluster using the NVIDIA® Tesla™ 20-series GPGPU
processors. [AMAX Information
Technologies](/wiki/AMAX_Information_Technologies "AMAX Information Technologies"),
[Dell](/wiki/Dell "Dell"),
[Hewlett-Packard](/wiki/Hewlett-Packard "Hewlett-Packard") and [Silicon
Graphics](/wiki/Silicon_Graphics "Silicon Graphics") are some of the few
companies that provides a complete line of GPU clusters and
systems.^[[1]](#cite_note-1)^

[ATI](/wiki/ATI_Technologies "ATI Technologies")
currently^[*[when?](/wiki/Wikipedia:Manual_of_Style/Dates_and_numbers#Chronological_items "Wikipedia:Manual of Style/Dates and numbers")*]^
does not have a list of Preferred Partners. ATI Marketing has been
contacted for confirmation as this information is being constantly
updated


# Software

The software components that are required to make many GPU-equipped
machines act as one include:

1.  Operating System
2.  GPU driver for the each type of GPU present in each cluster node.
3.  Clustering API (such as the [Message Passing
    Interface](/wiki/Message_Passing_Interface "Message Passing Interface"),
    MPI).
4.  VirtualCL (VCL) cluster platform
    [[1]](http://www.MOSIX.org/txt_vcl.html) is a wrapper for OpenCL™
    that allows most unmodified applications to transparently utilize
    multiple OpenCL devices in a cluster as if all the devices are on
    the local computer.
    
# Algorithm mapping

Mapping an algorithm to run a GPU cluster is somewhat similar to mapping
an algorithm to run on a traditional [computer
cluster](/wiki/Computer_cluster "Computer cluster"). Example: rather
than distributing pieces of an array from RAM, a texture is divided up
amongst the nodes of the GPU cluster.

# References and external links


-   Are Magnus Bruaset, Aslak Tveito (2006). *Numerical Solution of
    Partial Differential Equations on Parallel Computers*. Birkhäuser.
    [ISBN](/wiki/International_Standard_Book_Number "International Standard Book Number") [3-540-29076-1](/wiki/Special:BookSources/3-540-29076-1 "Special:BookSources/3-540-29076-1"). 
-   [NCSA's Accelerator
    Cluster](http://www.iacat.uiuc.edu/resources/cluster/)
-   [GPU Clusters for High-Performance
    Computing](http://www.ncsa.illinois.edu/~kindr/papers/ppac09_paper.pdf)
-   [GPU cluster at STFC Daresbury
    Laboratory](http://www.cse.scitech.ac.uk/disco/cseht/cseht.shtml)
-   [GPU Cores Temperature Monitoring](http://www.gputemp.com)



