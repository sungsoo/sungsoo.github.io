---
layout: post
title: 10 ways to query Hadoop with SQL 
date: 2015-02-16
categories: [computer science]
tags: [big data]

---

10 ways to query Hadoop with SQL 
================================


**SQL**: old and busted. Hadoop: new hotness. That's the conventional
wisdom, but the sheer number of projects putting a convenient SQL front
end on Hadoop data stores shows there's a real need for products running
SQL queries against data that lives inside Hadoop as opposed to merely
using Hadoop's native reporting or exporting Hadoop data into a
conventional database.

MapR produces a Hadoop distribution of its own, and the newest edition
(4.0.1) bundles it with four distinct engines for querying Hadoop vial
SQL. The four are significant SQL query systems for Hadoop, but far more
SQL-for-Hadoop technology is out there, and they're built to satisfy
different needs and use cases, from the esoteric to the universal.

First, the four SQL engines that come with MapR:

**[Apache Hive](https://hive.apache.org/):**This is the original
SQL-on-Hadoop solution, which tries to emulate the behavior, syntax, and
interface(s) of MySQL, including a command-line client. It also includes
a Java API and JDBC drivers for those with an existing investment in
Java applications that do MySQL-style querying. Despite its relative
simplicity and ease of use, Hive has been slow and read-only, which has
provoked a number of initiatives to improve on it.

**[Stinger](http://hortonworks.com/labs/stinger/):**Hortonworks,
producers of its own Hadoop distribution, started the Stinger project as
a way to advance development of Apache Hive and enhance its performance.
The project's most recent incarnation, Stinger.next, has "sub-second
query response times" as one of its design goals, along with support for
transactional behaviors (inserts, updates, and deletes). These changes
are all to debut over the next 18 months, with other features like SQL
analytics to follow.

**[Apache Drill](http://incubator.apache.org/drill/):**An open source
implementation of Google's Dremel (aka BigQuery), Drill was devised to
perform low-latency querying on multiple types of data stores at once
with different query interfaces (such as Hadoop and NoSQL), and to be
highly scalable. Drill's also meant to run queries within a wide range
of execution times, lasting only a few milliseconds to running for
minutes on end. MapR claims Drill is [forward-looking, not merely
backward-compatible](http://hivedata.com/responding-to-the-need-for-sql-on-big-data-apache-drill/),
one of the reasons it's elected to put its own development efforts
behind that project.

**[Spark SQL](https://spark.apache.org/sql/):**Apache's Spark project is
for [real-time, in-memory, parallelized processing of Hadoop
data](http://www.infoworld.com/d/application-development/straight-talk-apache-spark-and-why-you-should-care-243737). 
Spark SQL builds on top of it to allow SQL queries to be written against
data. A better way to think of it might be as Apache Hive for Apache
Spark, since it reuses key pieces of Hive technology. In that sense,
it's an adjunct for those already working with Spark. (An earlier
project, [Shark](https://github.com/amplab/shark/), has been subsumed
into this one.)

Beyond these four, six others stand out:

**[Apache Phoenix](http://phoenix.apache.org/):**Its developers call it
a "SQL skin for HBase" -- a way to query HBase with SQL-like commands
via an embeddable JDBC driver built for [high
performance](http://phoenix.apache.org/performance.html) and read/write
operations. Consider it an almost no-brainer for those making use of
HBase, thanks to it being open source, aggressively developed, and
outfitted with useful features like bulk data loading.

**[Cloudera
Impala](http://www.cloudera.com/content/cloudera/en/products-and-services/cdh/impala.html):**In
some ways, Impala is another implementation of Dremel/Apache Drill,
designed to expand on Hive so that exiting Hive users can make the most
of it. Data stored in either HDFS or HBase can be queried, and the SQL
syntax is, predictably, the same as Apache Hive. But Impala's main
difference from Drill is that it's not meant to be source-agnostic; it
queries Hadoop exclusively.

**[HAWQ for Pivotal
HD](http://www.pivotal.io/big-data/pivotal-hd):**Pivotal provides its
own Hadoop distribution ([Pivotal
HD](http://www.infoworld.com/t/hadoop/pivotal-juices-hadoop-in-memory-database-and-sql-querying-238546)),
and HAWQ is a proprietary component for performing SQL queries in HDFS.
Consequently, it's a Pivotal-only product, although Pivotal stumps for
its parallel SQL processing and high compliance with SQL standards.

**[Presto](http://prestodb.io/):**Built by Facebook's engineers and used
internally at that company,  this open source query engine is
reminiscent of Apache Drill in that it's source-agnostic. It can query
both Hive and Cassandra using ANSI SQL commands, and developers can
extend the system by writing connectors for it using its service
provider interface. Some data-insertion functions are supported, but
they're still very basic: You can't perform updates, only inserts.

**[Oracle Big Data
SQL](http://www.oracle.com/us/products/database/big-data-sql/overview/index.html):**It
was only a matter of time before Oracle released its own SQL-querying
front end for Hadoop. Like Drill, it can query [both Hadoop and other
NoSQL
stores](http://www.infoworld.com/article/2608317/applications/oracle-hopes-to-make-sql-a-lingua-franca-for-big-data.html).
But unlike Drill, it's Oracle's own product, and it only integrates with
Oracle Database 12c and up, which seriously limits the market for it.

**[IBM BigSQL](http://www.ibm.com/developerworks/library/bd-bigsql/):**
It was only a matter of time before IBM did the same, although it
announced the first technology preview of BigSQL back in early 2013.
Sadly, as with Oracle's offering, it's tied to a specific IBM product on
the back end -- in this case, IBM's Hadoop, InfoSphere BigInsights. That
said, the front end can be a standard JDBC/ODBC client, and queries can
include data from IBM DB2, Teradata, or PureData Systems for Analytics
instances.