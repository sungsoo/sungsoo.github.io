---
layout: post
title: DAQ Introduction
date: 2015-07-05
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [DAQ: A New Paradigm for Approximate Query Processing](http://dl.acm.org/citation.cfm?id=2777599)
* Authors: Navneet Potti,Jignesh M. Patel (University of Wisconsin - Madison)

--- 

# DAQ: A New Paradigm for Approximate Query Processing

## Introduction

As organizations collect ever-larger volumes of data and use analytics to drive their decision-making processes, the focus is often less on exactness of the result and more on timeliness or responsiveness, particularly for interactive exploratory analysis. This need is often best met with quick and approximate estimates that are either within a user-specified error tolerance or are continuously updated to be more exact over time. The most common querying paradigm in this direction is *sampling-based approximate querying* (which we call **SAQ**), where the computation is performed over a small random subset of the data. A special case is online aggregation, where a running estimate based on data seen thus far is continuously updated as the computation proceeds. The error in the estimate is specified using a confidence interval or error bars.

![](http://sungsoo.github.com/images/daq-ui.png)

SAQ schemes suffer from various shortcomings. The confidence interval estimation does not lend itself to a formal closed algebra, making it harder to formally reason about complex queries. Sometimes this method is coupled with bootstrapping and the query is run on multiple artificial samples obtained by resampling the original sample. But this approach can be computationally expensive and inaccurate for some queries. The confidence intervals also ignore the tails of the data distributions entirely, making it harder to use them when we are interested in the extreme values (e.g. aggregations like MAX). It can also be difficult for lay users to correctly interpret the semantics of confidence intervals, particularly when presented with a large number of independent estimates. 

In this work, we propose querying paradigm called deterministic approximate querying, abbreviated as DAQ. We define the DAQ approach informally for now as one where the precision of the estimate is maintained and presented in terms of deterministically guaranteed lower and upper bounds. The user interface in Figure 1 illustrates this concept using a screenshot of the intermediate results of a query in progress. The example query is an aggregation on the Census table excerpted in Table 1. The aggregate requested by the user is displayed using an interval (under “Range”) which is deterministically guaranteed to include the true average. For instance, the average MalePopulation for Narnia is guaranteed to be between 100 and 150, and the 42% “error” in the estimate is the ratio of the width of the interval relative to its midpoint. As the aggregation proceeds, the intervals get narrower and the error decreases. This process continues until either all the errors are within the tolerance specified by the user, or the user terminates the session.

![](http://sungsoo.github.com/images/census-table.png)


These deterministic guarantees remedy the issues that are associated with SAQ schemes highlighted above by simplifying the semantics, making them easier to reason about and interpret correctly. This approach allows us to develop a formal closed algebra for such schemes in Section 3 so that the approximation schemes are applicable to arbitrarily complex queries. We mention some of the desired properties of such schemes and outline some example schemes as well. We delve into one such deterministic online approximation scheme, the *Bitwise approximation scheme*, in Section 5. In our prototype, termed *Bitsliced Index implementation*, predicate evaluation and aggregation are performed using a bitsliced index representation of the columns, and the query result is computed in order of significance of the digits in the result. The empirical data presented in Section 6 shows that this scheme allows efficient approximate evaluation of queries, particularly when computing aggregates that depend on extreme values in heavy-tailed distributions.

Overall, our contributions lie in proposing the DAQ approach, developing a robust theoretical framework for handling complex queries, and empirically demonstrating the benefits and limitations of our methods. In our initial implementation, we have limited our scope to a restricted class of queries and focused on read-mostly environments. To the best of our knowledge this is the first proposal for deterministic approximate query processing, and as discussed in Section 8, there are many interesting directions for future work. We also acknowledge that this paper does not close the chapter on DAQ, but rather is its opening chapter.

We also note that DAQ and SAQ schemes are complementary to each other, as they use distinctly different techniques and provide semantically different error guarantees. While this introductory work delves into how these approaches differ from each other, these approaches can certainly also be combined, and we believe that looking at combining both schemes presents a promising avenue for future work.