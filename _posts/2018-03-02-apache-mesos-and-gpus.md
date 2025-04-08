---
layout: post
title: Apache Mesos and GPUs
date: 2018-03-02
categories: [computer science]
tags: [big data]

---


## Article Source
* Title: [Apache Mesos and GPUs](http://www.nvidia.com/object/apache-mesos.html)

---


# Apache Mesos and GPUs 


![Mesophere](http://images.nvidia.com/content/products/hpc/mesophere-logo.png "Mesophere")


<iframe width="600" height="400" src="https://www.youtube.com/embed/hrXiqKGb7OQ" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>


<iframe width="600" height="400" src="https://www.youtube.com/embed/VzHVM0SCF44" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

Manage Accelerated Applications at Data Center Scale 
----------------------------------------------------

The *Tesla Accelerated Computing Platform* now supports Apache Mesos, a
popular distributed resource manager for scheduling applications across
the datacenter.

Tesla GPU accelerators are native, first-class resources in Apache Mesos
and the core frameworks, i.e. Marathon and Chronos. This enables a
diverse set of applications to share *fine-grained GPU resources* while
running in parallel on a common infrastructure.

![Manage Accelerated Applications at Data Center
Scale](http://images.nvidia.com/content/products/hpc/apache-mesos.png "Manage Accelerated Applications at Data Center Scale")

## Higher Application Throughput 

Dynamic partitioning of GPUs ensure efficient allocation of resources
per application. By delivering finer-grained GPU resources to
applications, Mesos delivers higher resource utilization and faster
application performance.

## Operational Simplicity 

GPU-accelerated applications can now be deployed on a common cluster,
sharing resources with other applications, both on premise and in cloud
infrastructures. This streamlines the data center operations
significantly by removing the overhead of maintaining multiple,
independent clusters.

## High Availability 

GPU-accelerated applications now benefit from *built-in fault tolerance*
and *self-healing* features within Mesos, improving the overall
reliability of the applications.

Popular Marathon and Chronos frameworks deliver key benefits to
GPU-accelerated applications:

- Marathon support for *long-running jobs* with REST APIs for starting, stopping, and scaling applications
- Chronos support for *cron-based batch jobs*
- Built-in high availability with the option to run any number of scheduler instances
- Service discovery, load-balancing, and health checks
- Web UI
- Native Docker support

## Deep Learning on GPU Clusters

In this video from the Nvidia Theater at SC14, Bryan Catanzaro from Baidu presents: Deep Learning on GPU Clusters.

### Abstract

Deep neural networks have recently emerged as an important tool for difficult AI problems, and have found success in many fields ranging from computer vision to speech recognition. Training deep neural networks is computationally intensive, and so practical application of these networks requires careful attention to parallelism. GPUs have been instrumental in the success of deep neural networks, because they significantly reduce the cost of network training, which then has allowed many researchers to train better networks. In this talk, I will discuss how we were able to duplicate results from a 1000 node cluster using only 3 nodes, each with 4 GPUs.

<iframe width="600" height="400" src="https://www.youtube.com/embed/brui4N2orlI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>