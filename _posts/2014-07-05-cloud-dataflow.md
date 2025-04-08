---
layout: post
title: Google Cloud Dataflow, a Cloud-native data processing service
date: 2014-07-05
categories: [computer science]
tags: [big data]

---



## Article Source
* Title: [Sneak peek: Google Cloud Dataflow, a Cloud-native data processing service](http://googlecloudplatform.blogspot.kr/2014/06/sneak-peek-google-cloud-dataflow-a-cloud-native-data-processing-service.html)
* Authors: Frances Perry, Software Engineer

[![](http://sungsoo.github.com/images/cloud-dataflow.png)](http://sungsoo.github.com/images/cloud-dataflow.png)

# Google Cloud Dataflow, a Cloud-native data processing service

In today's world, information is being generated at an incredible rate.
However, unlocking insights from large datasets can be cumbersome and
costly, even for experts.Google Cloud Platform Blog

 
 It doesn’t have to be that way. Yesterday, at [Google
I/O](https://www.google.com/io), you got a sneak peek of Google Cloud
Dataflow, the latest step in our effort to make data and analytics
accessible to everyone. You can use Cloud Dataflow:
 

-   for data integration and preparation (e.g. in preparation for
    interactive SQL in BigQuery)
-   to examine a real-time stream of events for significant patterns and
    activities
-   to implement advanced, multi-step processing pipelines to extract
    deep insight from datasets of any size


 In these cases and many others, you use Cloud Dataflow’s data-centric
model to easily express your data processing pipeline, monitor its
execution, and get actionable insights from your data, free from the
burden of deploying clusters, tuning configuration parameters, and
optimizing resource usage. Just focus on your application, and leave the
management, tuning, sweat and tears to Cloud Dataflow. 
 
 Cloud Dataflow is based on a highly efficient and popular model used
internally at Google, which evolved from
[MapReduce](http://research.google.com/archive/mapreduce.html) and
successor technologies like
[Flume](http://dl.acm.org/citation.cfm?id=1806638) and
[MillWheel](http://research.google.com/pubs/pub41378.html). The
underlying service is language-agnostic. Our first SDK is for Java, and
allows you to write your entire pipeline in a single program using
intuitive Cloud Dataflow constructs to express application semantics. 
 
 Cloud Dataflow represents all datasets, irrespective of size, uniformly
via PCollections (“parallel collections”). A PCollection might be an
in-memory collection, read from files on [Cloud
Storage](https://cloud.google.com/products/cloud-storage/), queried from
a [BigQuery](https://cloud.google.com/products/bigquery/) table, read as
a stream from a [Pub/Sub](https://developers.google.com/pubsub/) topic,
or calculated on demand by your custom code.
 
 Because PCollections can be arbitrarily large, Cloud Dataflow includes
a rich library of PTransforms (“parallel transforms”), which you can
customize with your own application logic. For example, ParDo (“parallel
do”) runs your code over each element in a PCollection independently
(like both the Map and Reduce functions in MapReduce or WHERE in SQL),
and GroupByKey takes a PCollection of key-value pairs and groups
together all pairs with the same key (like the Shuffle step of MapReduce
or GROUP BY and JOIN in SQL). In addition, anyone can define new custom
transformations by composing other transformations -- this extensibility
lets you write reusable building blocks which can be shared across
programs. Cloud Dataflow provides a starter set of these composed
transforms out of the box, including Count, Top, and Mean. 
 
 Writing in this modular, high-level style naturally leads to pipelines
that make multiple logical passes over the same data. Cloud Dataflow
automatically optimizes your data-centric pipeline code by collapsing
multiple logical passes into a single execution pass. However, this
doesn't turn the system into a black box: as you can see below, Cloud
Dataflow’s monitoring UI uses the building block concept to show you the
pipeline as you wrote it, not as the system chooses to execute it.

![](https://lh4.googleusercontent.com/oJ5wG4q7Wc5AxosNcvcIWqJ7i6PwkaMEsbGcblMcp4V9JQ9w1hbHnQqNK2khWmntUUVRa0_BEDi7qzXssCQnBjupoZIiBOk06ova0svp7Qvn9hwh1UXs5cJ0M4cwADDvDw)![](https://lh4.googleusercontent.com/f3c6eNr8Dt_UyEgojV7zHuXJZFWdYT4JFlwCo7XjypUQSwINLu2PR2Nh_xnM_GLpyf-5MghrDwCxko8nJyzKLqhx6W7tt_Hu37iZcjApYmTkydAr4-VPkvMAB6kHyEI75w)
 *Code snippet and monitoring UI from the Cloud Dataflow demo in the IO
keynote.*
 
 The same Cloud Dataflow pipeline may run in different ways, depending
on the data sources. As you start designing or debugging, you can run
against data local to your development environment. When you’re ready to
scale up to real data, that same pipeline can run in parallel batch mode
against data in Cloud Storage or in distributed real-time processing
mode against data coming in via a Pub/Sub topic. This flexibility makes
it trivial to transition between different stages in the application
development lifecycle: to develop and test applications, to adapt an
existing batch pipeline to track time-sensitive trends, or to fix a bug
in a real-time pipeline and backfill the historical results.
 
 When you use Cloud Dataflow, you can focus solely on your application
logic and let us handle everything else. You should not have to choose
between scalability, ease of management and a simple coding model. With
Cloud Dataflow, you can have it all.
