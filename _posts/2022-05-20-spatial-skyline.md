---
layout: post
title: Spatial Skyline Queries on Triangulated Irregular Networks
date: 2022-05-20
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Spatial Skyline Queries on Triangulated Irregular Networks](https://www.youtube.com/watch?v=ybS-SbpCJf4)


---

# Spatial Skyline Queries on Triangulated Irregular Networks

* Authors: Yuta Kasai, Kento Sugiura, Yoshiharu Ishikawa


## Abstract

A spatial skyline query is a query to find a set of data points that are not spatially dominated by other data points, given a set of data points P and query points Q in a multidimensional space. The query enumerates the skyline points based on distance in a multidimensional space. However, existing spatial skyline queries can lead to large errors with actual travel distances in geospaces because the query is based on the Euclidean distances. Therefore, we propose a spatial skyline query on triangulated irregular networks (TINs), which are frequently used to represent the surface of an object as a terrain. We define a spatial skyline query based on more-accurate travel distances considering the TIN distance instead of the Euclidean distance. We also propose an efficient solution method using indexes to find nearest-neighbor points in TIN space and reduce the numbers of unnecessary data points and TIN vertices.
The proposed method achieves a computational complexity of O(|P'||Q|N'^2 + |P'|^2|Q|), where P' and N' are the reduced set of data points and number of TIN vertices, respectively, based on the range of query points. The proposed method can process a query faster than can the naive method with \Theta(|P||Q|N^2+|P|^2|Q|), where N is the number of TIN vertices. Moreover, experiments verify that the proposed method is faster than the naive method by using a spatial index to reduce the numbers of unnecessary data points and TIN vertices.


<iframe width="600" height="400" src="https://www.youtube.com/embed/ybS-SbpCJf4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>