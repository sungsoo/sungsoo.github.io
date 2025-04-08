---
layout: post
title: Dictionary-based Order-preserving String Compression 
date: 2016-02-04
categories: [computer science]
tags: [data management]

---

# Dictionary-based Order-preserving String Compression for Main Memory Column Stores

## Abstract

*Column-oriented database systems* perform better than traditional row-oriented database systems on *analytical* workloads such as those found in decision support and business intelligence applications. Moreover, recent work has shown that *lightweight compression schemes* significantly improve the query processing performance of these systems. One such a lightweight compression scheme is to use a dictionary in order to replace long (*variable-length*) values of a certain domain with shorter (*fixed-length*) integer codes. In order to further improve expensive query operations such as sorting and searching, *column-stores* often use *order-preserving compression schemes*.

In contrast to the existing work, in this paper we argue that order-preserving dictionary compression does not only pay off for attributes with a small fixed domain size but also for long string attributes with a large domain size which might change over time. Consequently, we introduce new data structures that efficiently support an *order-preserving dictionary compression* for (variable-length) string attributes with a large domain size that is likely to change over time. The main idea is that we model a dictionary as a table that specifies a mapping from string-values to arbitrary integer codes (and vice versa) and we introduce a novel *indexing* approach that provides efficient access paths to such a dictionary while compressing the index data. Our experiments show that our data structures are as fast as (or in some cases even faster than) other state-of-the-art data structures for dictionaries while being less memory intensive.