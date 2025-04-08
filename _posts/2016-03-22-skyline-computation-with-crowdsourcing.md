---
layout: post
title: CrowdSky; Skyline Computation with Crowdsourcing
date: 2016-03-22
categories: [computer science]
tags: [data management]

---

# CrowdSky: Skyline Computation with Crowdsourcing

## Abstract 


In this paper, we propose a *crowdsourcing-based approach* to solving
*skyline queries* with incomplete data. Our main idea is to leverage
crowds to infer the pair-wise preferences between tuples when
the values of tuples in some attributes are unknown. Specifically,
our proposed solution considers three key factors used in existing
crowd-enabled algorithms: (1) minimizing a *monetary cost* in identifying
a crowdsourced skyline by using a dominating set, (2) reducing
the number of rounds for *latency* by parallelizing the questions
asked to crowds, and (3) improving the *accuracy* of a crowdsourced
skyline by dynamically assigning the number of crowd
workers per question. We evaluate our solution over both simulated
and real crowdsourcing using the Amazon Mechanical Turk. Compared
to a sort-based baseline method, our solution significantly
minimizes the monetary cost, and reduces the number of rounds up
to two orders of magnitude. In addition, our dynamic majority voting
method shows higher accuracy than both static majority voting
method and the existing solution using unary questions.

## References

* Jongwuk Lee et. al, [CrowdSky: Skyline Computation with Crowdsourcing](http://openproceedings.org/2016/conf/edbt/paper-173.pdf), *19th International Conference on Extending Database Technology (EDBT)*

