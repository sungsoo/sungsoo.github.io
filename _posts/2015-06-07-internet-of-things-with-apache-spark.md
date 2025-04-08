---
layout: post
title: The Internet of Things Transforms Transactions with Apache Spark
date: 2015-06-07
categories: [computer science]
tags: [big data]

---


## Article Source
* Title: [The Internet of Things Transforms Transactions with Apache Spark](http://ht.ly/2Znom0?__scoop_post=951d0d90-0924-11e5-ab7b-001018304b75&__scoop_topic=2632326#__scoop_post=951d0d90-0924-11e5-ab7b-001018304b75&__scoop_topic=2632326)
* Authors: [Jelani Harper](http://www.dataversity.net/contributors/jelani-harper)

---

# The Internet of Things Transforms Transactions with Apache Spark

The **Internet of Things (IoT)** is slated to transform the nature of transactional data from a rigid, performance optimized process, to a dynamic, on-the-fly one capable of handling the pace and variety of Big Data. There are several reasons to believe Apache Spark will play a formidable role in this transformation:

* **In-Memory analytics**: Spark utilizes an in-memory analytics approach that is typically faster than most disk based methods—so much so that it has been reported as [significantly outperforming](http://insidebigdata.com/2015/03/06/8-reasons-apache-spark-hot/) Hadoop.
* **Machine Learning iterations**: This Big Data parallel-processing framework is primed for Machine Learning algorithms that utilize its swiftness for the sort of rapid iterations required to draw conclusions from and make improvements with immense data sets.
* **Hadoop compatible**: Although some view it as competitive with Hadoop, Spark was actually designed to run on HDFS (but it doesn’t have to). In doing so it can add substantial value to one of the most established and widely used Big Data platforms.


With vendor support for Spark including MapR, Cloudera, IBM, Data Stax, Intel, Hortonworks, and other Big Data platforms, its effect on Big Data, the IoT, and transactional data is arguably burgeoning throughout the data sphere.

## Additional Benefits

Additionally, Spark has attracted so much attention in the Big Data space because of its benefits:

* **Reduced infrastructure**: Part of the utility of the high performance speeds of this platform is that they are generated while requiring fewer nodes and clusters than those of more traditional Big Data platforms.
* **Open Source aspect**: The open source nature of the solution yields up front cost advantages.
* **Application building**: The diversity of code options greatly assists with application building and decreasing time to value.
* **Accelerated performance**: Spark’s tremendous speed not only facilitates real time analytics, but enables users to incorporate many more data sources than they otherwise would be able to.
* **Data Science and developer friendly nature**: Although Spark was written in Scala, it contains APIs for popular programming languages such as SQL, Java, and Python. The assortment of code languages is exploited by the platform’s underlying engine, which can determine how to complete jobs on a cluster, thereby ‘hiding’ some of the complexity associated with writing code.

## Potential Drawbacks

Part of the reason that Spark is unlikely to supplant Hadoop and its ecosystem for the present includes the fact that it:

* **Lacks autonomy**: Although additional components of the Spark platform include a [Semantic Graph](http://www.dataversity.net/the-mathematics-of-data-graph-analytics-as-a-service/) analytics engine, a Machine Learning library, and tools for data streaming, its autonomy is circumscribed by a lack of a resource manager or file system, which can simply increase its dependency on Hadoop.
* **Is still immature**: Having influenced the data landscape over the past five years, Spark still remains a technology that is in the process of maturing.
* **Lacks use cases**: Enterprise-level deployments of Spark that have demonstrated consistency and performance strengths over time are still in the process of materializing.
* **Is not primed for operations**: Primed for analytics, Spark is less effective in operations due to rigidity in its core abstraction that produces difficulty in making a single change in a data set, and which frequently requires copying the entire set to do so.

## IoT Transactions

Current real-time Big Data applications that incorporate elements of both analytics and transactions include standards such as fraud detection, recommender engines, or any variety of Industrial Internet applications pertaining to [*equipment asset management and preventative maintenance*](http://www.dataversity.net/monetizing-industrial-internet-things/). These applications hint at the value that Spark can provide and the way that the IoT will affect transactions, because they offer a starting point for how the former can already be used.

What the Internet of Things is helping to herald is sophistication in the nature of transactions in which any assortment of analytics (real-time, predictive, and even historic) is required to not only provide insight, but also actually trigger action that expands upon the possibilities of most current transactions. For instance, while most real-time fraud detection systems simply provide approval or denial based on a finite amount of factors, the shift in transactions the IoT is causing can greatly increase the number of those factors. For the consumer, that might mean options for a smart vehicle to obtain gas or for a smart home to reduce power consumption. Regardless of the individual circumstance, the rapidly iterative nature of Spark’s extreme expedience to facilitate Machine Learning algorithms will be well served.

## Cloud Ramifications

Spark’s utility extends beyond the Internet of Things and its sophisticated transactions and includes a number of repercussions for the Cloud as well, which has become the de facto home for Big Data applications. Most of its IoT transaction capabilities can apply to general Cloud deployments where its advantages of combining graph analytics, SQL, and sensor data processing or streaming are most useful—especially with time-sensitive data requirements. The nexus point between IoT transactions and the Cloud that Spark can play an integral role in is the expansion of Clouds to what amount to IoT Clouds. [Labeled as ‘fogs’](https://www.linkedin.com/pulse/20140822065109-246665791-fog-computing-from-the-center-to-the-edge-of-the-cloud), IoT clouds help to create a situation in which a Cloud’s core resources (such as bandwidth and storage) are decentralized and pushed to its extremities in order to aggregate these resources across Clouds. In the case of the IoT, all of the interconnected devices will have their own Clouds that are effectively aggregated to conserve resources and reinforce interconnectivity—which will require the sort of Machine Learning algorithms and graph analytics that Spark can readily provision.

## Data Streaming

Another vital aspect of Spark is its tools for data streaming and accommodating continuously generated machine or sensor data. Although there is no shortage of options for streaming data, one of the distinguishing points of Spark’s tool is that it processes events in a batch-like method during brief intervals of time in which events are continuously collected. Although Spark’s streaming capabilities represent just one of many options of this technology that is still maturing, it helps to provide a gestalt of sorts with its other non-streaming capabilities (discussed above). Thus, the platform ensures that it can still enable the sort of speed necessary for real-time analytics on Big Data sets that are nimble enough for transactions in an Internet of Things world.

## Under the Hood

At the abstraction level, Spark consists of a number of collections known as *Resilient Distributed Datasets* (RDD), which are intractable and based on local files (such as HDFS or others).There are several collection operations common to solutions written in Scala that apply to RDD, including parallelized versions of foreach and map. Other functions include capabilities for reduce-by which consolidates entries according to a certain function pertaining to a specific key, and join capabilities that collect entries from a pair of RDD based on a shared key. Of particular use is the fact that Spark internalizes the operation sequence that resulted in a particular set of data, and can reconstruct that sequence in the event of node failure.

## Dynamic Transactions

Given its propensity for enhancing Hadoop and the ubiquity of this Big Data platform, it is unlikely that the upstart Spark will replace Hadoop in the near future. Its assortment of tools, however, will help to facilitate an environment in Data Management where vendors continue to push the envelope for real-time analytics that exploit many of the aspects of Big Data (Machine Learning, graph analytics, streaming, continued SQL support, multiple development languages, and in-memory technologies) that will ensure that this technology has continued relevance. Redefining the nature of transactions, particularly in the impending wake of the Internet of Things, may be the best way for ensuring that failing Big Data initiatives do not contribute to this technology’s untimely demise. Dynamic transactions based on all data, real-time and otherwise, can impact the enterprise’s ROI in a number of ways from marketing to improved customer relations.

