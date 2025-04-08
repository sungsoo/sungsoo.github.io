---
layout: post
title: Characteristics of an Analytic Workload
date: 2015-01-19
categories: [computer science]
tags: [big data]

---

* Article Source: *Understanding Analytic Workloads*, NETEZZA an IBM Company



# Characteristics of an Analytic Workload

## Introduction


Before selecting, constructing, or deploying an analytic infrastructure, it makes sense to try to understand the basic characteristics and requirements of an analytic workload. Later, in addition to helping us outline an effective analytic infrastructure, these workload criteria can be used to evaluate a specific project or problem, yielding a rough measure of analytic complexity.

An *analytic workload* will exhibit one or more of the following characteristics, each of which elevates a given workload’s degree of difficulty:


* Extreme data volume
* Data model complexity
* Variable and unpredictable traversal paths, patterns, and frequencies
* Set-oriented processing and bulk operations
* Multi-step, multi-touch analysis algorithms
* Complex computation
* Temporary or intermediate staging of data
* Change isolation/data stability implications

Rating each of these characteristics on 1-10 scale yields the following general comparison for some idealized sample workloads:

![](http://sungsoo.github.com/images/analytic-and-transactional-workloads.png)