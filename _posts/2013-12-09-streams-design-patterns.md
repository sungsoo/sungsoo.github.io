---
layout: post
title: Streams design patterns
date: 2013-12-09 
categories: [computer science]
tags: [big data]

---

*Design patterns* are a formalization of common structures and interactions that arise repeatedly from the process of designing a range of applications. The approach of identifying design patterns and documenting them in a standard format is a way to simplify the design process. An understanding of these common design patterns should enable you to use them as *building blocks* for your particular design. The design of an application can then be constructed as a combination of design patterns rather than a combination of individual Operators. This is easier to understand and means that you are able to benefit from the distilled design wisdom of previous successful applications.

As implementations of **Streams** grow, you should expect the number and types of design patterns to also grow. The following design patterns have been identified at this time:

- *Filter pattern* for data reduction
- *Outlier pattern* for data classification and outlier detection
- *Parallel pattern* for high volume data transformation
- *Pipeline pattern* for high volume data transformation
- *Alerting pattern* for real-time decision making and alerting
- *Enrichment pattern* for supplementing data
- *Unstructured Data pattern* for supporting unstructured data analysis
- *Consolidation pattern* for combining multiple sources
- *Merge Pattern* for combining similar sources
- *Integration Pattern* for leveraging existing analytics

###References

[1] Chuck Ballard et. al, IBM InfoSphere Streams: Harnessing Data in Motion, IBM Redbooks, pp.88, September 2010.