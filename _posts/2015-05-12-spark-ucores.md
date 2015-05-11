---
layout: post
title: Spark for Unconventional Cores
date: 2015-05-12
categories: [computer science]
tags: [big data]

---

[![](http://sungsoo.github.com/images/scaling_data.png)](http://sungsoo.github.com/images/scaling_data.png)

---

Spark-Ucores - Spark for Unconventional Cores
=============
Spark for Unconventional Cores (Codename SparkCL) is an open source unified programming framework for unconventional compute cores.
It is based on Java, OpenCL , the Apache Spark framework and [Aparapi-UCores](https://gitlab.com/mora/aparapi-ucores) 

Motivation
----------
The motivation behind this work is to bring unconventional compute cores such as FPGAs/GPUs/APUs/DSPs and future core types into mainstream programming use. The framework allows equal treatment of different computing devices under the Spark framework and introduces the ability to offload computations to acceleration devices. The new framework is seamlessly integrated into the standard Spark framework via a Java-OpenCL device programming layer which is based on Aparapi and a Spark programming layer that includes new kernel function types and modified Spark transformations and actions. The framework allows a single code base to target any type of compute core that supports OpenCL and easy integration of new core types into a Spark cluster.

How to get started
------------------

- Read our [SparkCL paper](http://arxiv.org/ftp/arxiv/papers/1505/1505.01120.pdf)

- Read the Working with spark text file in the docs folder: [docs/WorkingWithSpark.txt](docs/WorkingWithSpark.txt) 

- Videos and tutorials

  - You can watch a short demo [here](https://youtu.be/DF2Je03dfNg)
   [Note that the audio quality not amazing. Improved ones to be posted soon...]

  - For an introduction and the motivation for the project checkout the intro videos at:
    [Intro Part I](https://youtu.be/yXm1EM9hZws?list=PLOJY6HSc6DWnpPSmLKmr4GzkRv11QjdXw)
    [Intro Part II](https://youtu.be/WWTrkZXYoTs?list=PLOJY6HSc6DWnpPSmLKmr4GzkRv11QjdXw)
    [Intro Part III](https://youtu.be/RaUEaOy9B6A?list=PLOJY6HSc6DWnpPSmLKmr4GzkRv11QjdXw)

  - You can watch all the videos and tutorials at the [Mora Group SparkCL channel](https://www.youtube.com/playlist?list=PLOJY6HSc6DWnpPSmLKmr4GzkRv11QjdXw)

------------------
Installation Notes
------------------

- Built against 

  - spark-1.3.0-bin-hadoop2.4

  - OpenJDK 64-Bit 1.7.0_75

- For eclipse integration
 
  - Import maven project (from path to spark-ucores)

  - Set JRE System Library to JavaSE 1.7 (*) 

    (*) When imported in eclipse luna it was not the default one!


Acknowledgments
---------------
1. The Spark and Aparapi framworks without which this project would be an order of magnitude more complex.

2. Altera, Nallatech, HP and Terasic for their support and hardware contributions during various stages of this line of research in the past couple of years.


