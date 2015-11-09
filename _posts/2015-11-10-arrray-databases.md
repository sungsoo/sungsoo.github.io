---
layout: post
title: Arrary Databases
date: 2015-11-10
categories: [computer science]
tags: [big data, data management]

---


* Title: [Array Databases: The Next Big Thing in Data Analytics?](http://www.datanami.com/2014/04/09/array_databases_the_next_big_thing_in_data_analytics_/)
* Authors: Alex Woodie

---

Array Databases: The Next Big Thing in Data Analytics?
======================================================

There’s no lack of database choices when it comes to building your next
big data analytics platform. Relational data stores, column-oriented
databases, in-memory data grids, graph databases, scale-out NewSQL
systems, and Hadoop will all get time in the sun. But according to
database pioneer Mike Stonebraker, none of these hold a candle to array
databases when it comes to running complex analytics on big data sets.

![](http://2s7gjr373w3x22jf92z99mgm5w.wpengine.netdna-cdn.com/wp-content/uploads/2014/04/paradigm4_logo.png)

Just a heads-up: Be careful with the word “Hadoop” around Stonebraker.
“Please don’t use the word ‘Hadoop,'” the father of Postgres, Ingres,
Vertica, VoltDB, and now SciDB says in an interview with *Datanami*.
“That means all kinds of things to all kinds of people.”

Hadoop, as Stonebraker sees it, is not the big data application and
analytics platform of the future, at least in the way that Hadoop
distributors are positioning it today. The blunt-speaking technologist
breaks the big yellow elephant down into a *three-tiered architecture*,
with the Hadoop Distributed File System (HDFS) at the bottom, MapReduce
in the middle, and an application based on Impala, Hive, Pig, or another
package running on the top.

As *SQL interfaces*, Impala and Hive provide much the same capability that
traditional data warehouses have been providing for years, he says. But
the MapReduce layer—that has almost no practical value in the big data
analytics market today, he says.

“The Google guys have to be just laughing in their beer right now
because they invented MapReduce a decade ago to serve the data storage
needs of the Google crawl of the Internet… and moved all of that to Big
Table,” Stonebraker says. “Why did they do that? Because MapReduce is a
*batch engine* and they wanted their crawl database to be updatable, as
they wanted to get Twitter feeds into it, in real time.”

“So Google has effectively abandoned MapReduce for the application for
which it was originally designed, and has moved on,” he continues. “So
what’s happened is a decade later, the rest of the world seems to think,
well because Google designed MapReduce, it must be good. And the answer
is, it’s not. It’s not good for much of anything.”

  -----------------------------------------------------------------------------------------------------------
  ![](http://2s7gjr373w3x22jf92z99mgm5w.wpengine.netdna-cdn.com/wp-content/uploads/2014/04/stonebraker.png)
  **Mike Stonebraker**
  -----------------------------------------------------------------------------------------------------------

Once you take MapReduce out of the Hadoop equation, you’re left with
just a file system, HDFS. “It’s just like the Linux file system or any
other file system,” he says. “So everyone on the planet is going to run
on HDFS–and, for that matter, support a translator from Hive into
whatever their query language is. So if you want either of those
interfaces, everyone is going to give them to you.”

In Stonebraker’s vision of the future of big data analytics, the upstart
Hadoop vendors of the world (Cloudera, Hortonworks, Facebook, etc.) will
largely transform their offerings into *SQL-compatible data warehouses*,
and sell those against the traditional data warehouse vendors with fast,
*parallelized column-oriented databases*, including Teradata, IBM,
Greenplum, HP Vertica, and Amazon Redshift (which is powered by Actian’s
ParAccel database).

Only five percent of the data analytics market will be running on
mappers and reducers, he says. “*The other 95 percent of the market wants
SQL*,” he says. “What the Hadoop vendors have figured out is what the
database vendors have known for two decades, which is the stack to
implement SQL does not include anything that looks like MapReduce.”

As Cloudera and friends battle Teradata and friends for supremacy in the
general-purpose data warehousing and business intelligence arena, the
space around them increasingly will be occupied by a crop of special
purpose engines to operate on big data sets. “Special purpose engines
are going to be way faster than general purpose ones,” he says. “XML
engines will do fine. Graph engines will do fine. Array engines will do
fine.”

*Array engines*, such as the SciDB offering that Stonebraker developed for
his latest venture, Paradigm4, are specially designed to run complex
analytics, such as correlating, clustering, predictive modeling, and
machine learning, he says.

“In my opinion, what’s going to happen over the next five years is that
everyone is going to *move from business intelligence to data science*,
and this data will be a sea change from what I’ll call *stupid analytics*,
to what I’ll call *smart analytics*, which is correlations, data
clustering, predictive modeling, data mining, Bayes classification,”
Stonebraker says. “All of these words mean *complex analytics*. All that
stuff is defined on arrays, and none of it is in SQL. So the world will
move to smart analytics from stupid analytics, and that’s where we are.”

It’s true that other types of databases support array data types. But
the folks at Paradigm4 argue that, as data sets get bigger and the
analytics become more demanding, the disadvantages of moving the data
back and forth between relational and array data types will outweigh the
advantages of storing them from the beginning in a native
multi-dimensional array data model, such as SciDB’s.

“What people have tended to do historically is they fetch the data
they’re interested in….and send it across the wire into some stat
package–think R, or SAS, or SPSS–then they run the statistics in the
stat package and put the answer back in the database system,”
Stonebraker says. “I’ve talked to lots of people who do that, and
they’re all tearing their hair out because they have to learn two
different systems. They have to copy the world over the wire, and no one
wants to do that. So what we support is doing data management and doing
complex analytics without having to move the data.”

Stonebraker, who continues to teach at MIT, co-founded Paradigm4 in the
Boston area in 2008 to attack this market opportunity. The company,
which is headed by CEO Marilyn Matz and also includes chief architect
Paul Brown, is getting particular traction in specific use cases,
including the analysis of genetic sequencing data, sensor data,
financial data and geospatial data.

Big pharmaceutical companies are interested in how SciDB can help them
match genetic information (the genotype) to the manifestation of disease
in the human body (phenotype), and so some cross-correlation among age,
race, income level, and geographic location while they’re at it. “The
cost of sequencing any human is down around $1,000, and millions of
people are going to get sequenced over the next few years,” Stonebraker
says. “And the gleam in all the pharmaceutical companies’ eyes is to
find out what in your genomic makeup correlates with diseases.”

If SQL and MapReduce is the past and hardcore data science is the future
of data analytics, then Stonebraker and SciDB might be on to something.

