---
layout: post
title: Towards Learned Database Systems  
date: 2023-06-21
categories: [computer science]
tags: [big data]

---

### Article Source

* [Towards Learned Database Systems](https://www.youtube.com/watch?v=VtL6Y4x10O0)


---

# Towards Learned Database Systems


## Abstract
Database Management Systems (DBMSs) are the backbone for managing large volumes of data efficiently and thus play a central role in business and science today. For providing high performance, many of the most complex DBMS components such as query optimizers or schedulers involve solving non-trivial problems. To tackle such problems, very recent work has outlined a new direction of so-called learned DBMSs where core parts of DBMSs are being replaced by machine learning (ML) models which has shown to provide significant performance benefits. However, a major drawback of the current approaches to enabling learned DBMS components is that they not only cause very high overhead for training an ML model to replace a DBMS component but that the overhead occurs repeatedly which renders these approaches far from practical. Hence, in this talk, I present my vision of Learned DBMS Components 2.0 to tackle these issues. First, I will introduce data-driven learning where the idea is to learn the data distribution over a complex relational schema. In contrast to workload-driven learning, no large workload has to be executed on the database to gather training data. While data-driven learning has many applications such as cardinality estimation or approximate query processing, many DBMS tasks such as physical cost estimation cannot be supported. I thus propose a second technique called zero-shot learning which is a general paradigm for learned DBMS components. Here, the idea is to train model


<iframe width="600" height="400" src="https://www.youtube.com/embed/VtL6Y4x10O0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>