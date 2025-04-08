---
layout: post
title: What is map side join and reduce side join?
date: 2014-09-18
categories: [computer science]
tags: [big data]

---

What is map side join and reduce side join? 
===========================================


Two different large data can be joined in map reduce programming also.
Joins in Map phase refers as Map side join, while join at reduce side
called as reduce side join.  Lets go in detail, Why we would require to
join the data in map reduce. If one Dataset A has master data and B has
sort of transactional data(A & B are just for reference). we need to
join them on a coexisting common key for a result. It is important to
realize that we can share data with side data sharing techniques(passing
key value pair in job configuration /distribution caching) if master
data set is small. we will use map-reduce join  only when we have both
dataset is too big to use data sharing techniques.

Joins at Map Reduce is not recommended way. Same problem can be
addressed through high level frameworks like Hive or cascading. even if
you are in situation then we can use below mentioned method to join.

Map side Join
-------------

Joining at map side performs the join before data reached to map.
function It expects a strong prerequisite before joining data at map
side. Both joining techniques comes with it’s own kind of pros and cons.
Map side join could be more efficient to reduce side but strict format
requirement is very tough to  meet natively. however if we would prepare
this kind of data through some other MR jobs, will loose the expected
performance over reduce side join.

-   Data should be partitioned and sorted in particular way.
-   Each input data should be divided in same number of partition.
-   Must be sorted with same key.
-   All the records for a particular key must reside in the same
    partition.

Reduce Side Join
----------------

Reduce side join also called as Repartitioned join or Repartitioned sort
merge join and also it is mostly used join type. This type of join would
be performed at reduce side. i.e it will have to go through sort and
shuffle phase which would incur network overhead. to make it simple  we
are going to add the steps needs to be performed for reduce side join.
Reduce side join uses few terms like data source, tag and group key lets
be familiar with it.

-   **Data Source**  is referring to data source files, probably taken
    from RDBMS
-   **Tag** would be used to tag every record with it’s source name, so
    that it’s source can be identified at any given point of time be it
    is in map/reduce phase. why it is required will cover it later.
-   **Group key** is referring column to be used as join key between two
    data sources.

As we know we are going to join this data on reduce side we must prepare
in a way that it can be used for joining in reduce phase. let’s have a
look what are the steps needs to be perform.

## Map Phase

Expectation from routine map function is emit, (Key, value), while to
joining at reduce side join we would design map in a way so that it
could emit, (Key, Source Tag+Value) of every record for each data
source. This output will then go for sort and shuffle phase, as we know
these operation would based on key, so it will club all the values from
all source at one place regarding a particular key. and this data would
reach to reducer

## Reduce Phase

Reducer will create a cross product of every record of map out put for
one key and will handover to combine function.

## Combine function

whether this reduce function is going to perform inner join or outer
join  would be decided in combine function. And desired ouput format
will also be decided at this place

Please do not get confuse with combiner both are different.

