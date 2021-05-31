---
layout: post
title: Efficient Query Processing Using Machine Learning
date: 2021-06-04
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Efficient Query Processing Using Machine Learning](https://www.youtube.com/watch?v=iocf_yKrJc8)


---

# Efficient Query Processing Using Machine Learning

## Abstract

Given the rise of deep neural networks (DNNs), unstructured data is becoming increasingly feasible to query by using these DNNs to extract structured data from this unstructured data. For example, an object detection DNN can extract object types and positions from images and BERT DNNs can extract relations from text. Unfortunately, these DNNs can be extremely expensive for many applications, costing up to hundreds of thousands of dollars for naive methods of analysis.

In this talk, I’ll describe the TASTI system from the Stanford DAWN lab, which we have developed to reduce the cost of queries over unstructured data. We’ll first describe how to use proxy scores, which are cheap approximations of expensive DNNs, to accelerate a range of queries (including aggregation, selection, and limit queries, which we explored in the BlazeIt and SUPG systems). We’ll then describe how to generate these scores by clustering unstructured data records in a theoretical principled manner. Combined, our techniques can accelerate queries over unstructured data over **100x **compared to naive methods of executing queries.

We’ll also describe our ongoing work to apply TASTI to real world applications, including ecological analysis in collaboration with Stanford biologists and detecting wildfires.

This work is based on four publications at VLDB (BlazeIt, SUPG, Smol, TASTI) joint with Professors Peter Bailis and Matei Zaharia. Our code is open-sourced.


<iframe width="600" height="400" src="https://www.youtube.com/embed/iocf_yKrJc8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>