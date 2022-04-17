---
layout: post
title: Learned Indexing and Sampling for Improving Query Performance
date: 2022-04-16
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Big Data Analytics](https://www.youtube.com/watch?v=sHmpMoaodng)


---

# Learned Indexing and Sampling for Improving Query Performance in Big Data Analytics

* Episode 61 of the Stanford MLSys Seminar Series!
* Learned Indexing and Sampling for Improving Query Performance in Big-Data Analytics
* Speaker: Kexin Rong

## Abstract

Traditional data analytics systems improve query efficiency via fine-grained, row-level indexing and sampling techniques. However, to keep up with the data volumes, increasingly many systems store and process datasets in large partitions containing hundreds of thousands of rows. Therefore, these analytics systems must adapt traditional techniques to work with coarse-grained data partitions as a basic unit to process queries efficiently. In this talk, I will discuss two related ideas that combine learning techniques with partitioning designs to improve the query efficiency in the analytics systems. First, I will describe PS3, the first approximate query processing system that supports non-uniform, partition-level samples. PS3 reduces the number of partitions accessed by 3 to 70x to achieve the same error compared to a uniform sample of the partitions. Next, I will present OLO, an online learning framework that dynamically adapts data organization according to changes in query workload to minimize overall data access and movement. We show that dynamic reorganization outperforms a single, optimized partitioning scheme by up to 30% in end-to-end runtime. I will conclude by discussing additional open problems in this area.


<iframe width="600" height="400" src="https://www.youtube.com/embed/sHmpMoaodng" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## Bio
Kexin Rong is a postdoctoral researcher at Vmware Research Group. Her research focuses on improving the efficiency and usability of large-scale data analytics. She received her Ph.D. in computer science from Stanford, advised by Peter Bailis and Philp Levis. She is joining Georgia Tech in the fall as an assistant professor in the School of Computer Science.