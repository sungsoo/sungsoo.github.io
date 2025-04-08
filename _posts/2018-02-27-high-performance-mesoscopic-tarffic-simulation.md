---
layout: post
title: High-Performance Mesoscopic Traffic Simulation
date: 2018-02-27
categories: [computer science]
tags: [design patterns]

---



# High-Performance Mesoscopic Traffic Simulation with GPU for Large Scale Networks

## Abstract

Mesoscopic Traffic Simulation is an important tool in traffic analysis and traffic management support. The balance between *traffic modeling details* and *performance* has made Mesoscopic Traffic Simulation one of the key solutions for traffic controllers and policy makers. Mesoscopic traffic simulators offer acceptable speed in simulating normal traffic. However, when traffic prediction and optimization for *large scale networks* come into context, the performance of mesoscopic traffic simulators is unsatisfactory in optimizing a massive number of control parameters for a much longer prediction horizon. This issue again emphasizes the need to further speed up mesoscopic traffic simulation. This paper proposes a comprehensive framework to massively speed up mesoscopic traffic simulation using GPU without compromising its correctness and realistic modeling property. It also gives an in-depth analysis into the trade-off between *simulation correctness* and *performance* speedup. By combining the power of GPU with optimal design and data structures, mesoscopic traffic simulation is able to speed up to more than **6 times** compared to original CPU implementation.
