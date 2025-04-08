---
layout: post
title: Apache Spark and Apache Tez
date: 2014-04-27
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Big Data Joe: Things You Need To Know – Apache Spark and Apache Tez – Near Real-Time Analysis of Data at Rest](http://www.trace3.com/blog/?p=1589)


![](http://sungsoo.github.com/images/spark-vs-tez.png)

# Apache Spark and Apache Tez – Near Real-Time Analysis of Data at Rest

A buzzword for Big Data is “Real-time” and every product is stating they
are capable of doing it. But “real-time”, just like “Big Data”, is
defined by the user and what their use case and requirements are.

Apache Spark and Apache Tez focus on analysis of data at rest in a near
real-time fashion. They still require user intervention to access the
data at rest like running MapReduce or a SQL-like query, but have
optimized it so it’s not something you need take a nap while you run
your job because it’s going to take hours to get your results.

These two projects have done a lot to help you get value out of your
data more quickly, but most importantly, they have tackled the two areas
that slow down queries the most; spin up time of the processes in the
clusters needed to run the job and avoiding unnecessary writes to HDFS.

Here is a break down of these 2 projects.

Apache Spark
---

-   Creators founded company called “Databricks” and received 14mil from
    Andreessen Horowitz in it’s first round of funding.
-   Cloudera supported
-   Created to address the performance issues of MR and be a high
    performance, low latency replacement for it
-   Created before YARN
-   Has been ported to successfully to YARN and running in production
-   Due to Apache Spark being a MR replacement, it improves it’s ability
    to move outside of the normal MR functions and expand it’s set of
    possible analyses over HDFS
-   Utilizes a tool called “Shark” which makes Apache Hive Spark
    compatible to give you the ability to run SQL-like queries

How It Fits: Apache Spark
---

![](http://sungsoo.github.com/images/apache-spark.png)

Apache Tez
---

-   Hortonworks created and supported
-   Created to be run natively on YARN
-   Created to address the issues of MR and be a compliment to it.
    Apache Tez Improves the performance of existing MR jobs allowing MR
    devs to utilize it with little to no learning curve
-   Due to Apache Tez being able to support MapReduce, existing tools
    like Pig and Hive, that generate MapReduce jobs, will see a
    performance boost without having to modify their functionality
-   While Apache Tez is made to optimize MR out of the box, it does have
    the ability to replace MR in the long run as it’s functionality is
    extended

How It Fits: Apache Tez
---

![](http://sungsoo.github.com/images/yarn-3.png)

TL;DR (Too Long; Didn’t Read)
---

 There are a lot of products, projects and companies that are trying to
solve near real-time analysis of data at rest but Apache Spark and
Apache Tez seem to be the most promising. While these two projects are
tackling the same issue, due to the fact they are going about it
differently (Spark replacing MapReduce and Tez complimenting MapReduce)
I think there is room for both, at least for the time being.

Want To Know More?
---

* Apache Spark: [http://spark.apache.org/](http://spark.apache.org/)
* Databricks: [http://databricks.com/](http://databricks.com/)
* Shark: [http://shark.cs.berkeley.edu/](http://shark.cs.berkeley.edu/)
* Apache Tez:[http://tez.incubator.apache.org/](http://tez.incubator.apache.org/)
* Hortonworks: “A framework for near real-time big data processing” – [http://hortonworks.com/hadoop/tez/](http://hortonworks.com/hadoop/tez/)
* Apache Hive: [https://hive.apache.org/](https://hive.apache.org/)
