---
layout: post
title: Bitmap Indices 
date: 2016-02-09
categories: [computer science]
tags: [data management]

---

# Bitmap Indices

*Bitmap indices* are a specialized type of index designed for easy querying on multiple keys, although each bitmap index is built on a single key.

For bitmap indices to be used, records in a relation must be numbered sequentially, starting from, say, 0. Given a number *n*, it must be easy to retrieve the record numbered *n*. This is particularly easy to achieve if records are fixed in size, and allocated on consecutive blocks of a file. The record number can then be translated easily into a block number and a number that identifies the record within the block.


Consider a relation *r*, with an attribute *A* that can take on only one of a small number (for example, 2 to 20) values. For instance, a relation instructor info may have an attribute *gender*, which can take only values m (male) or f (female).

Another example would be an attribute income_level, where  incomes has been broken up into 5 levels: *L1: $0−9999, L2: $10,000−19,999, L3: 20,000−39,999, L4: 40,000−74,999, and L5: 75,000−∞*. Here, the raw data can take on many values, but a data analyst has split the values into a small number of ranges to simplify analysis of the data.


## Bitmap Index Structure
A *bitmap* is simply an array of bits. In its simplest form, a *bitmap index* on the attribute *A* of relation *r* consists of one bitmap for each value that *A* can take. Each bitmap has as many bits as the number of records in the relation. The *i* th bit of the bitmap for value *vj* is set to 1 if the record numbered *i* has the value *vj* for attribute *A*. All other bits of the bitmap are set to 0.


In our example, there is one bitmap for the value m and one for f. The ith bit of the bitmap for m is set to 1 if the gender value of the record numbered i is m. All other bits of the bitmap for m are set to 0. Similarly, the bitmap for f has the value 1 for bits corresponding to records with the value f for the gender attribute; all other bits have the value 0. Figure 11.35 shows an example of bitmap indices on a relation *instructor_info*.


![](http://sungsoo.github.com/images/bitmap_index.png)

![](http://sungsoo.github.com/images/bitmap-index.png)