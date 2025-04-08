---
layout: post
title: A New Paradigm for Approximate Query Processing
date: 2015-07-04
categories: [computer science]
tags: [big data]

---

# DAQ: A New Paradigm for Approximate Query Processing

## Abstract

Many modern applications deal with exponentially increasing data volumes and aid business-critical decisions in near real-time. Particularly in exploratory data analysis, the focus is on interactive querying and some degree of error in estimated results is tolerable. A common response to this challenge is approximate query processing, where the user is presented with a quick confidence interval estimate based on a sample of the data. In this work, we highlight some of the problems that are associated with this probabilistic approach when extended to more complex queries, both in semantic interpretation and the lack of a formal algebra. As an alternative, we propose *deterministic* approximate querying (DAQ) schemes, formalize a closed deterministic approximation algebra, and outline some design principles for DAQ schemes. We also illustrate the utility of this approach with an example deterministic online approximation scheme which uses a *bitsliced index representation* and computes the most significant bits of the result first. Our prototype scheme delivers speedups over exact aggregation and predicate evaluation, and outperforms sampling-based schemes for extreme value aggregations.