---
layout: post
title: A Learned Spatial Index for Range and kNN Queries 
date: 2022-05-01
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [A Learned Spatial Index for Range and kNN Queries](https://www.youtube.com/watch?v=tLBjK-lFaPQ)


---

# A Learned Spatial Index for Range and kNN Queries

* Authors: Songnian Zhang, Suprio Ray, Rongxing Lu, Yandong Zheng

## Abstract

A corpus of recent work has revealed that the learned index can improve query performance while reducing the storage overhead. It potentially offers an opportunity to address the spatial query processing challenges caused by the surge in location-based services. Although several learned indexes have been proposed to process spatial data, the main idea behind these approaches is to utilize the existing one-dimensional learned models, which requires either converting the spatial data into one-dimensional data or applying the learned model on individual dimensions separately. As a result, these approaches cannot fully utilize or take advantage of the information regarding the spatial distribution of the original spatial data. To this end, in this paper, we exploit it by using the spatial (multi-dimensional) interpolation function as the learned model, which can be directly employed on the spatial data.  Specifically, we design an efficient SPatial inteRpolation functIon based Grid index (SPRIG) to process the range and kNN queries. Detailed experiments are conducted on real-world datasets. The results indicate that, compared to the traditional spatial indexes, our proposed learned index can significantly improve the index building and query processing performance with less storage overhead. Moreover, in the best case, our index achieves up to an order of magnitude better performance than ZM-index in range queries and is about 2.7x, 3x, and 9x faster than the multi-dimensional learned index Flood in terms of index building, range queries, and kNN queries, respectively.

<iframe width="600" height="400" src="https://www.youtube.com/embed/tLBjK-lFaPQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>