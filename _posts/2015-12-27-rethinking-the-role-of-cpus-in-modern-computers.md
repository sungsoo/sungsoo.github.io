---
layout: post
title: Rethinking the Role of CPUs in Modern Computers
date: 2015-12-27
categories: [computer science]
tags: [machine learning]

---


Rethinking the Role of CPUs in Modern Computers
===

## Accelerator-Centric Operating Systems: Rethinking the Role of CPUs in Modern Computers

Hardware accelerators, like GPUs, storage/network I/O accelerators and media processors, have become the key to achieving performance and power goals in modern computing systems. Unlike CPUs, accelerators continue to enjoy significant growth in power efficiency and performance, while in parallel gaining improved programmability and versatility. However, building efficient systems that realize the potential of accelerator hardware advances today is incredibly difficult. In this talk I will argue that the root cause of this complexity is the growing conceptual gap between the accelerator-reach hardware and CPU-centric software stack, and in particular, the lack of adequate operating system abstractions for programs running natively on accelerators. I will demonstrate the benefits of accelerator-centric OS design on the example of native file system (GPUfs) and networking (GPUnet) layers for massively parallel GPUs. These layers expose well-understood standard I/O abstractions like files and sockets directly to programs running on GPUs, and abstract away the complexity of the underlying heterogeneous hardware while removing the CPU from both control and data path for performance. GPUfs and GPUnet break the constrained accelerator-as-coprocessor model and streamline the development of high-performance, distributed applications like in-GPU-memory MapReduce and a new class of low-latency, high-throughput GPU-native network services.

<iframe width="600" height="400" src="https://www.youtube.com/embed/62MK0uesMQM" frameborder="0" allowfullscreen></iframe>

## Brief Bio
Mark Silberstein is an assistant professor at the Electrical Engineering Department, Technion. Mark's research is on computer systems with programmable computational accelerators, operating systems, and systems security. Mark did his PhD in Computer Science at the Technion, where his work led to the development of an online distributed system for genetic linkage analysis system, Superlink-online, which today serves geneticists worldwide. Prior to joining the Technion faculty he spent two years as a postdoc at the University of Texas at Austin.