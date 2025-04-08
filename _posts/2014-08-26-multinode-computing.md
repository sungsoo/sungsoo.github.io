---
layout: post
title: Multinode Computing
date: 2014-08-26
categories: [computer science]
tags: [parallel computing]

---

MULTINODE COMPUTING
===

As you increase the requirements (CPU, memory, storage space) needed on a single machine, costs rapidly increase. While a 2.6 GHz processor may cost you $250 USD, the same processor at 3.4 GHz may be $1400 for less than a 1 GHz increase in clock speed. A similar relationship is seen for both speed and size memory, and storage capacity.


Not only do costs scale as computing requirements scale, but so do the power requirements and the consequential heat dissipation issues. Processors can hit 4–5 GHz, given sufficient supply of power and cooling.


In computing you often find the law of diminishing returns. There is only so much you can put into a single case. You are limited by cost, space, power, and heat. The solution is to select a reasonable balance of each and to replicate this many times.


Cluster computing became popular in 1990s along with ever-increasing clock rates. The concept was a very simple one. Take a number of commodity PCs bought or made from off-the-shelf parts and connect them to an off-the-shelf 8-, 16-, 24-, or 32-port Ethernet switch and you had up to 32 times the performance of a single box. Instead of paying $1600 for a high performance processor, you paid $250 and bought six medium performance processors. If your application needed huge memory capacity, the chances were that maxing out the DIMMs on many machines and adding them together was more than sufficient. Used together, the combined power of many machines hugely outperformed any single machine you could possible buy with a similar budget.

All of a sudden universities, schools, offices, and computer departments could build machines much more powerful than before and were not locked out of the high-speed computing market due to lack of funds. Cluster computing back then was like GPU computing todayda disruptive technology that changed the face of computing. Combined with the ever-increasing single-core clock speeds it provided a cheap way to achieve parallel processing within single-core CPUs.

Clusters of PCs typically ran a variation of LINUX with each node usually fetching its boot instructions and operating system (OS) from a central master node. For example, at CudaDeveloper we have a tiny cluster of low-powered, atom-based PCs with embedded CUDA GPUs. It’s very cheap to buy and set up a cluster. Sometimes they can simply be made from a number of old PCs that are being replaced, so the hardware is effectively free.

However, the problem with cluster computing is it’s only as fast as the amount of internode communication that is necessary for the problem. If you have 32 nodes and the problem breaks down into 32 nice chunks and requires no internode communication, you have an application that is ideal for a cluster. If every data point takes data from every node, you have a terrible problem to put into a cluster.
Clusters are seen inside modern CPUs and GPUs. Look back at Figure 1.1, the CPU cache hierarchy. If we consider each CPU core as a node, the L2 cache as DRAM (Dynamic Random Access Memory), the L3 cache as the network switch, and the DRAM as mass storage, we have a cluster in miniature (Figure 1.6).

[![](http://sungsoo.github.com/images/typical-cluster-layout.png)](http://sungsoo.github.com/images/typical-cluster-layout.png)


The architecture inside a modern GPU is really no different. You have a number of streaming multiprocessors (SMs) that are akin to CPU cores. These are connected to a shared memory/L1 cache. This is connected to an L2 cache that acts as an inter-SM switch. Data can be held in global memory storage where it’s then extracted and used by the host, or sent via the PCI-E switch directly to the memory on another GPU. The PCI-E switch is many times faster than any network’s interconnect.

[![](http://sungsoo.github.com/images/gpus-cluster.png)](http://sungsoo.github.com/images/gpus-cluster.png)


The node may itself be replicated many times, as shown in Figure 1.7. This replication within a controlled environment forms a cluster. One evolution of the cluster designs are distributed applications. Distributed applications run on many nodes, each of which may contain many processing elements including GPUs. Distributed applications may, but do not need to, run in a controlled environment of a managed cluster. They can connect arbitrary machines together to work on some common problem, BOINC and Folding@Home being two of the largest examples of such applications that connect machines together over the Internet.
