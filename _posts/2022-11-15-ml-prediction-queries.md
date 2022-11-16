---
layout: post
title: End-to-end Optimization of Machine Learning Prediction Queries
date: 2022-11-15
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [End-to-end Optimization of Machine Learning Prediction Queries](https://www.youtube.com/watch?v=kEQawdld3Kg)


---

# End-to-end Optimization of Machine Learning Prediction Queries

This is the video presented at SIGMOD 2022 for the paper "End-to-end Optimization of Machine Learning Prediction Queries"
by Kwanghyun Park, Karla Saur, Dalitso Banda, Rathijit Sen Matteo Interlandi, Konstantinos Karanasos

## Abstract

Prediction queries are widely used across industries to perform advanced analytics and draw insights from data. They include a data processing part (e.g., for joining, filtering, cleaning, featurizing the datasets) and a machine learning (ML) part invoking one or more trained models to perform predictions. These parts have so far been optimized in isolation, leaving significant opportunities for optimization unexplored. We present Raven, a production-ready system for optimizing prediction queries. Raven follows the enterprise architectural trend of collocating data and ML runtimes. It relies on a unified intermediate representation that captures both data and ML operators in a single graph structure to unlock two families of optimizations. First, it employs logical optimizations that pass information between the data part (and the properties of the underlying data) and the ML part to optimize each other. Second, it introduces logical-to-physical transformations that allow operators to be executed on different run-times (relational, ML, and DNN) and hardware (CPU, GPU). Novel data-driven optimizations determine the runtime to be used for each part of the query to achieve optimal performance. Our evaluation shows that Raven is able to improve performance of prediction queries on Apache Spark and SQL Server by up to 13.1x and 330x, respectively. Finally, for complex models where GPU acceleration is beneficial, Raven provides up to 8× speedup compared to state-of-the-art systems.


<iframe width="600" height="400" src="https://www.youtube.com/embed/kEQawdld3Kg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
