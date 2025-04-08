---
layout: post
title: Drilling into Big Data with Apache Drill
date: 2014-07-15
categories: [computer science]
tags: [big data, big data]

---

## Article Source

* Authors: [Steven J Vaughan-Nichols](http://blog.smartbear.com/author/sjvn/ "Posts by Steven J Vaughan-Nichols")


Drilling into Big Data with Apache Drill 
===


[![apache-drill](http://blog.smartbear.com/wp-content/uploads/2013/08/apache-drill.jpg "Apache Drill Big Data")](http://blog.smartbear.com/wp-content/uploads/2013/08/apache-drill.jpg)

*Apache’s Drill goal is striving to do nothing less than answer queries
from petabytes of data and trillions of records in less than a second.*

You can’t claim that the [Apache
Drill](http://incubator.apache.org/drill/ "Interactive Query at Scale")
programmers think small. Their design goal is for Drill to scale to
10,000 servers or more and to process petabyes of data and trillions of
records in less than a second.

If this sounds impossible, or at least very improbable, consider that
the [NSA already seems to be doing exactly the same kind of
thing](http://www.itworld.com/big-data/366825/big-data-metadata-and-traffic-analysis-what-nsa-really-doing "Big data, metadata, and traffic analysis: What the NSA is really doing").
If they can do it, open-source software can do it.

In at interview at
[OSCon](http://www.oscon.com/oscon2013 "Open Source Convention"), the
major open source convention in Portland, OR, Ted Dunning, the chief
application architect for [MapR](http://www.mapr.com/ "MapR"), a big
data company, and a Drill mentor and committer, explained the reason for
the project. “There is a strong need in the market for low-latency
interactive analysis of large-scale datasets, including nested data in
such formats as
[Avro](http://avro.apache.org/docs/1.3.0/ "Welcome to Avro!"); Apache
[Hadoop](http://hadoop.apache.org/ "Welcome to Apache™ Hadoop®!") data
serialization system; JSON ([JavaScript Object
Notation](http://www.json.org/ "Introducing JSON")); and [Protocol
Buffers](https://code.google.com/p/protobuf/ "protobuf") Google’s data
interchange format.”

As Dunning explained, big business wants fast access to big data and
none of the traditional solutions, such as a relational database
management system (RDBMS), MapReduce, or Hive, can deliver those speeds.

Dunning continued, “This need was identified by Google and addressed
internally with a system called
[Dremel](http://research.google.com/pubs/pub36632.html "Dremel: Interactive Analysis of Web-Scale Datasets").”
Dremel was the inspiration for Drill, which also is meant to complement
such [open-source big data
systems](http://wiki.apache.org/incubator/DrillProposal "DrillProposal")
as Apache Hadoop. The difference between Hadoop and Drill is that while
Hadoop is designed to achieve very high throughput, it’s not designed to
achieve the sub-second latency needed for interactive data analysis and
exploration.

Drill’s architecture is made up of four components:

-   Query languages: This layer is responsible for parsing the user’s
    query and constructing an execution plan. The initial goal is to
    support the SQL-like language used by Dremel and[Google
    BigQuery](https://developers.google.com/bigquery/docs/query-reference "Query Reference").
    It will also support Full ANSI SQL:2003.

-   Low-latency distributed execution engine: This is Drill’s heart. It
    provides the scalability and fault tolerance needed to efficiently
    query petabytes of data on 10,000 servers. Drill’s execution engine
    is based on research in distributed execution engines such as
    Dremel, Dryad, Hyracks, CIEL, Stratosphere, and columnar storage.

-   Nested data formats: This layer is responsible for supporting
    various data formats. The initial goal is to support the
    column-based format used by Dremel. Drill is designed to support
    schema-based formats such as Protocol Buffers/Dremel,
    Avro/AVRO-806/Trevni and CSV, and schema-less formats such as JSON,
    BSON (Binary JSON,)
    and[YAML](http://www.yaml.org/ "YAML Ain't Markup Language").

-   Scalable data sources: This layer is responsible for supporting data
    sources. The initial focus is to leverage Hadoop as a data source.

The distributed execution engine is written in Java. Dunning explained,
“We’re pushing the envelope in terms of high-performance execution in
Java. If you optimize Java the way you would with C++, you can get
extraordinary optimization. Java programmers have been coddled so they
assume they don’t have to optimize.”

To further speed up the queries, a specialized transaction remote
procedure call (RPC) layer is designed to work at wire speeds. Once the
requested data is in RAM, it’s kept in a column format in an array using
[Java’s
ValueVectors](http://www.jessrules.com/docs/61/api/jess/ValueVector.html "Class ValueVector")
and this, according to Dunning, is where you really get the query speed
improvements.

Jacques Nadeau, MapR’s lead developer on the Apache Drill open-source
project, explained at an OSCon session that [the columnar data structure
is better for execution in
memory](http://www.slideshare.net/ApacheDrill/oscon-2013-apache-drill-workshop-part-2 "Apache Drill: Execution")
because it improves cache locality and CPU pipelining. In storage, it
can be used to save space thanks to the fact that it lends itself to
improved data compression.

In Drill, the database schema is very late binding. Indeed, Drill
doesn’t assume that the data has a schema at all, though it uses one if
it’s there.

As you might have guessed by now, Drill loves to have as much RAM as
possible. To avoid [problems with cache
coherency](http://practical-tech.com/infrastructure/cache-coherency-now-more-than-ever/31/ "Cache Coherency: Now More Than Ever"),
Drill uses pure data flow through the memory and a lock-free
architecture.

From a deployment viewpoint, Drillbits, each node’s instance of Drill,
uses local RAM and data. Queries can be made from any such instance. The
co-ordination, query planning and optimization, scheduling, and
execution are then distributed.

Dunning is well aware of other projects to bring scalable parallel
database real-time queries to Hadoop, such as [Cloudera
Impala](http://www.cloudera.com/content/cloudera/en/products/cdh/impala.html "Cloudera Impala").
He thinks, though, that Drill’s developers realize, “We may not be the
most clever guys in the woods, so we’re open to other programmers’
ideas.”

Speaking of which, Drill is [more than ready to welcome
programmers](http://blog.smartbear.com/programming/14-ways-to-contribute-to-open-source-without-being-a-programming-genius-or-a-rock-star/ "14 Ways to Contribute to Open Source without Being a Programming Genius or a Rock Star").
In particular, Dunning said, “We’re a very welcoming, very fast moving
community. We want more query optimizing types and Java programmers. We
also need people who want to learn, who can write documentation, build
Web front-ends and RPC layers.”

At this point, Drill is very much a work in progress. “It’s not quite
production quality at this point, but by third or fourth quarter of 2013
it will become quite usable.” Specifically, Drill should be in beta by
the third quarter.

So, if Drill sounds interesting to you, you can [start
contributing](https://cwiki.apache.org/confluence/display/DRILL/Contributing "How to Contribute to Apache Drill")
as soon as you get up to speed. To do that, there’s [a weekly Google
Hangout](https://plus.google.com/hangouts/_/ef3abafa7fa601a5208bee4c26fdeade3fd19bc6?authuser=1 "Google+ Apache Hangout")
on Tuesdays at 9am Pacific time and a Twitter feed at
[@ApacheDrill](https://twitter.com/ApacheDrill "Apache Drill"). And, of
course, there’s an [Apache Drill
Wiki](https://cwiki.apache.org/confluence/display/DRILL/Apache+Drill+Wiki "Apache Drill Wiki")
and
[users’](https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=drill-user-subscribe@incubator.apache.org "drill-user-subscribe@incubator.apache.org")
and [developers’ mailing
lists](https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=drill-dev-subscribe@incubator.apache.org).
