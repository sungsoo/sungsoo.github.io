---
layout: post
title: Queries on Compressed RDDs
date: 2015-12-31
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Succinct Spark from AMPLab: Queries on Compressed RDDs](https://databricks.com/blog/2015/11/10/succinct-spark-from-amplab-queries-on-compressed-rdds.html)
* Authors: Rachit Agarwal and Anurag Khandelwal

---

Succinct Spark from AMPLab: Queries on Compressed RDDs 
===


*This is a guest post from Rachit Agarwal and Anurag Khandelwal of the
UC Berkeley AMPLab, leads of an ongoing research project called
Succinct.*

------------------------------------------------------------------------

[Succinct](http://succinct.cs.berkeley.edu) is a *distributed data store*
that supports a wide range of point queries directly on a compressed
representation of the input data. The UC Berkeley AMPLab is very excited
to release Succinct Spark, as a Spark package, that enables search,
count, range and random access queries on compressed RDDs. This release
allows users to use Apache Spark as a document store (with search on
documents) similar to ElasticSearch, a key-value interface (with search
on values) similar to HyperDex, and an experimental DataFrame interface
(with search along columns in a table). When used as a document store,
Succinct Spark is over 75x faster than native Spark.

Succinct Spark Overview
-----------------------

*Search* is becoming an increasingly powerful primitive in big data
analytics and web services. Indeed, many web services support some form
of search — [LinkedIn search](http://www.linkedin.com/search), [Twitter
search](https://twitter.com/search-home), [Facebook
search](http://search.fb.com), Netflix search, airlines, hotels, and
services specifically built around search — Google, Bing, Yelp, to name
a few. Apache Spark supports search via full RDD scans. While fast
enough for small datasets, data scans become inefficient as dataset
become even moderately large. One way to avoid data scans is to
implement indexes, but this approach can significantly increase the
memory overhead.

The AMPLab is very excited to announce the release of Succinct Spark, as
a Spark package, that achieves a new and unique tradeoff — storage
overhead no worse (and often lower) than data-scan based techniques and
query latency comparable to index-based techniques. Succinct *enables
search (and a wide range of other queries) directly on compressed
representation of the RDDs*. What differentiates Succinct is that
queries are supported without storing any secondary indexes, without
data scans and without data decompression — all the required information
is embedded within the compressed representation and queries are
executed directly on the compressed representation.

In addition, Succinct Spark supports random access of records without
scanning the entire RDD, a functionality that we believe will
significantly speed up a large number of applications.

An example:
-----------

Consider a collection of Wikipedia articles stored on HDFS as a flat
unstructured file. Let us see how Succinct Spark supports the above
functionalities:

```scala 
// Import SuccinctRDD
import edu.berkeley.cs.succinct._

// Create a Spark RDD as a collection of articles; sc is the SparkContext
val articlesRDD = ctx.textFile("/path/to/data").map(_.getBytes)

// Compress the Spark RDD into a Succinct Spark RDD, and persist it in memory
// Note that this is a time consuming step (usually at 8GB/hour/core) since data needs to be compressed. (We are actively working on making this step faster.)
val succinctRDD = articlesRDD.succinct.persist()

// SuccinctRDD supports a set of powerful primitives directly on compressed data. Let us start by counting the number of occurrences of “Berkeley” across all Wikipedia articles
val count = succinctRDD.count("Berkeley")

// Now suppose we want to find all offsets in the collection at which “Berkeley” occurs and create an RDD containing all resulting offsets 
val offsetsRDD = succinctRDD.search("Berkeley")

// Let us look at the first ten results in the above RDD
val offsets = offsetsRDD.take(10)

// Finally, let us extract 20 bytes before and after one of the occurrences of “Berkeley”
val offset = offsets(0)
val data = succinctRDD.extract(offset - 20, 40)
```

Many more examples on using Succinct Spark are outlined
[here](http://succinct.cs.berkeley.edu/wp/wordpress/?page_id=8).

Performance
-----------

The figure compares the search performance of Succinct Spark against
native Spark. We use a 40GB collection of Wikipedia documents over a
4-server Amazon EC2 cluster with 120GB RAM (so that all systems fit in
memory). The search queries use words with varying number of occurrences
(1–10,000) with uniform random distribution across 10 bins (1–1000,
1000-2000, etc). Note that the y-axis is on log scale. We note that
Succinct Spark is over two orders of magnitude faster than Spark’s
native RDDs due to avoiding data scans. Random access on documents has
similar performance gains (with some caveats).

Below, we describe a few interesting use cases for Succinct Spark,
including a number of interfaces exposed in the release. For more
details on the Succinct Spark release (and Succinct in general), usage
and benchmark results, please see the [AMPLab blog
post](https://amplab.cs.berkeley.edu/succinct-spark-queries-on-compressed-rdds/),
[Succinct webpage](http://succinct.cs.berkeley.edu), [the NSDI
paper](https://www.usenix.org/system/files/conference/nsdi15/nsdi15-paper-agarwal.pdf),
or a more detailed [technical
report](http://www.cs.berkeley.edu/~rachit/succinct-techreport.pdf).

Succinct Spark abstractions and use cases:
------------------------------------------

Succinct Spark exposes three interfaces, each of which may have several
interesting use cases. We outline some of them below:

### SuccinctRDD 

-   *Interface:* Flat (unstructured) files
-   *Example application*: log analytics
-   *Example:* one can search across logs (e.g., errors for debugging),
    or perform random access (e.g., extract logs at certain timestamps).
-   *System with similar functionality:* Lucene.

### SuccinctKVRDD 

-   *Interface:* Semi-structured data
-   *Example application:* document stores, key-value stores
-   *Example:*
    -   (document stores) search across a collection of Wikipedia
        documents and return all documents that contain, say, string
        “University of California at Berkeley”. Extract all (or a
        part of) documents.
    -   (key-value stores) search across a set of tweets stored in a
        key-value store for tweets that contain “Succinct”. Extract all
        tweets from the user “\_ragarwal\_”.
-   *System with similar functionality:* ElasticSearch

### (An experimental) DataFrame interface 

-   *Interface:* Search and random access on structured data like tables
-   *Example applications:* point queries on columnar stores
-   *Example:* given a table with schema {userID, location,
    date-of-birth, salary, ..}, find all users who were born between
    1980 and 1985.
-   *Caveat:* We are currently working on some very exciting projects to
    support a number of additional SQL operators efficiently directly on
    compressed RDDs.

When not to use Succinct Spark
------------------------------

There are a few applications that are not suitable for Succinct Spark —
long sequential reads, and search for strings that occur very frequently
(you may not want to search for “a” or “the”). We outline the associated
tradeoffs on Succinct webpage as well.

Looking ahead
-------------

We at AMPLab are working on several interesting projects to make
Succinct Spark more memory efficient, faster and more expressive. To
give you an idea about what is next, we are going to close this post
with a hint on our next post: executing Regular Expression queries
directly on compressed RDDs. Stay tuned!

