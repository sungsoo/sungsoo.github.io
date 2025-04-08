---
layout: post
title: Best SQL-on-hadoop Tool
date: 2015-05-28
categories: [computer science]
tags: [big data]

---


SQL on Hadoop: Drill, Impala or Spark SQL
-----------------------------------------

Drill, Impala and Spark SQL all fit into the SQL-on-Hadoop category.
Apache Drill and Spark are both top level Apache projects. Impala is
developed by Cloudera and shipped by Cloudera, MapR, Oracle and Amazon.
Spark SQL is part of the Spark project and is mainly supported by the
company Databricks. Drill is mainly pushed by Hadoop distribution MapR.
Drill, Impala and Spark SQL all show better performance than Hive, and
aim to deal with interactive queries, whereas Hive was designed to be
used in batch jobs. Since July 1st 2014, it was announced that
development on Shark (also known as Hive on Spark) were ending and focus
would be put on Spark SQL. For those familiar with Shark, Spark SQL
gives the similar features as Shark, and more. Accoding to Databricks,
Shark faced too many limitations inherent to the mapReduce paradigm and
was difficult to improve and maintain. For some benchmark on Shark vs
Spark SQL, please see
[this](http://databricks.com/blog/2014/06/02/exciting-performance-improvements-on-the-horizon-for-spark-sql.html).

Since Drill, Impala and Spark SQL are all available in YARN and can all
query Hive metastore tables, one may wonder which one to use. Let’s look
at some of the features of each of those tools.

## Drill

[Drill](http://drill.apache.org/) entered the Apache Incubator in August
2012 and was first released to the public in August 2013. Drill presents
very interesting features:

-   it can query data from multiple sources: text files, JSON files,
    Parquet files, Avro files or whatever other formats, Hive metastore,
    or other databases as MongoDB, HBase, etc.;
-   it is built to work with schema that is dynamic, as well as data
    that is complex;
-   it can work with data without having to define schema definitions
    upfront;
-   it has been optimized for interactive queries, for both performance
    and SLAs;
-   it is a in-memory execution engine for better performance;
-   it allows flexible memory allocation (how much memory Drill
    utilizes);
-   it allows security through
    [views](https://cwiki.apache.org/confluence/display/DRILL/CREATE+VIEW+Command);
-   it provides industry-standard APIs: ANSI SQL, ODBC/JDBC, RESTFul
    APIs and can be accessed by most of the BI tools (e.g., Tableau,
    MicroStrategy, QlikView, Spotfire, Pentaho, Excel, etc);
-   it supports multiple cloud storage (Amazon S3, Google Cloud Storage,
    Azure Blog Storage, Swift) and allows others by developing a storage
    plugin;
-   it supports custom applications via the REST API and Java and C
    applications via the dedicated Java and C libraries;
-   it allows to reuse UDFs and UDAFs that were built in Hive with no
    modifications
-   it allows joins for tables of different sources (example taken from
    [here](https://www.mapr.com/blog/top-10-reasons-using-apache-drill-now-part-mapr-distribution-including-hadoop#.VVnDO7xZ5Qt)

```sql 
// Hive table 'orders', HBase view 'custview' and JSON file 'clicks.json' are joined together
select custview.membership, sum(orders.order_total) 
as sales from hive.orders, custview, dfs.`/mapr/demo.mapr.com/data/nested/clicks/clicks.json` c 
where orders.cust_id=custview.cust_id and orders.cust_id=c.user_info.cust_id 
group by custview.membership order by 2; 
```

-   it supports large datasets (very scalable), trying to use memory
    when possible and spills to disk only if the working dataset does
    not fit in memory.

## Impala

[Impala](http://impala.io/) was the first to bring SQL querying to the
public in April 2013.

Impala comes with a bunch of interesting features:

-   it can query many file format such as Parquet, Avro, Text, RCFile,
    SequenceFile
-   it supports data stored in HDFS, Apache HBase and Amazon S3
-   it supports multiple compression codecs: Snappy (Recommended for its
    effective balance between compression ratio and decompression
    speed), Gzip (Recommended when achieving the highest level of
    compression), Deflate (not supported for text files), Bzip2, LZO
    (for text files only);
-   it provides security through
    -   authorization based on Sentry (OS user ID), defining which users
        are allowed to access which resources, and what operations are
        they allowed to perform
    -   authentification based on Kerberos + ability to specify Active
        Directory username/password, how does Impala verify the identity
        of the users to confirm that they are allowed exercise their
        privileges assigned to that user
    -   auditing, what operations were attempted, and did they succeed
        or not, allowing to track down suspicious activity; the audit
        data are collected by Cloudera Manager;
-   it supports SSL network encryption between Impala and client
    programs, and between the Impala-related daemons running on
    different nodes in the cluster;
    -   it allows to use UDFs and UDAFs;
    -   it orders the joins automatically to be the most efficient;
    -   it allows admission control – prioritization and queueing of
        queries within impala;
    -   it allows multi-user concurrent queries;
    -   it caches frequently accessed data in memory;
    -   it computes statistics (with COMPUTE STATS);
    -   it provides window functions (aggregation OVER PARTITION, RANK,
        LEAD, LAG, NTILE, and so on) – to provide more advanced SQL
        analytic capabilities (since version 2.0);
    -   it allows external joins and aggregation using disk (since
        version 2.0) – enables operations to spill to disk if their
        internal state exceeds the aggregate memory size;
    -   it allows subqueries inside WHERE clauses;
    -   it allows incremental statistics – only run statistics on the
        new or changed data for even faster statistics computations;
    -   it enables queries on complex nested structures including maps,
        structs and arrays;
    -   it enables merging (MERGE) in updates into existing tables;
    -   it enables some OLAP functions (ROLLUP, CUBE, GROUPING SET);
    -   it allows use of impala for inserts and updates into HBase.

## Spark SQL

[Spark SQL](https://spark.apache.org/sql/) has been announced in March
2014. It officialy replaces Shark, which has limited integration with
Spark programs. "Spark SQL conveniently blurs the lines between RDDs and
relational tables." In addition to be part of the Spark platform
allowing compatibility with the other Spark libraries (MLlib, GraphX,
Spark streaming), Spark SQL shows multiple interesting features:

-   it supports multiple file formats such as Parquet,
    [Avro](https://github.com/databricks/spark-avro),
    [Text](https://github.com/databricks/spark-csv), JSON, ORC;
-   it supports data stored in HDFS, Apache HBase (see
    [here](http://www.slideshare.net/yzhou2110/spark-meetup-v205),
    showing better performance than *Phoenix*) and Amazon S3;
-   it supports classical Hadoop codecs such as snappy, lzo, gzip;
-   it provides
    [security](https://spark.apache.org/docs/1.3.1/security.html, for
    more details) through;
    -   authentification via the use of a "shared secret"
        (spark.authenticate=true on YARN, or spark.authenticate.secret
        on all nodes if not YARN);
    -   encryption, Spark supports SSL for Akka and HTTP protocols;
    -   keeping event logs;
-   it supports UDFs, e.g.

```sql 
registerFunction("countMatches",
    lambda(pattern, text):
        re.subn(pattern, '', text)[1])
sql("SELECT countMatches('a', text) ...")
```

-   it supports concurrent queries and manages the allocation of memory
    to the jobs (it is possible to specify the storage of RDD like
    *in-memory only*, *disk only* or *memory and disk*;
-   it supports caching data in memory using a SchemaRDD columnar format
    (cacheTable(“
     “))exposing *ByteBuffer*, it can also use memory-only caching
    exposing *User object*;
-   it supports nested structures (see
    http://www.congiu.com/creating-nested-data-parquet-in-spark-sql/ for
    an example);

## Making a decision

Cloudera’s
[benchmark](http://blog.cloudera.com/blog/2014/09/new-benchmarks-for-sql-on-hadoop-impala-1-4-widens-the-performance-gap/)
in September 2014 showed much better performances than the alternatives
(Hive on Tez, Spark SQL, Presto), with a factor of 2x to 13x.
 However, Facebook has shown [recent
improvements](http://www.zdnet.com/article/how-facebook-is-speeding-up-the-presto-sql-query-engine/)
in Presto query engine competing with Impala on Parquet. Presto is used
by large companies such as Airbnb, AWS, DropBox and Netflix. Facebook
uses a new ORC reader for Presto, called DWRF (fork of ORC).
 Cloudera Impala comes with multiple advanced features such as OLAP
features and is more mature than the alternatives. A great strength of
Spark SQL is its high integration with Spark, allowing to use other
Spark libraries (e.g, MLlib for machines learning, etc) very easily.
Drill can be used outside Hadoop or Spark which makes it convenient if
data sources are coming from different environments.

## Other SQL-on-Hadoop alternatives

There are other SQL-on-Hadoop alternatives out there:

-   [Presto](https://prestodb.io/): developed by Facebook, it is
    open-source but not supported by third-party vendors as long as I
    know), it can query data from multiple sources (Hive, Cassandra,
    RDBMS, etc);
-   [Pivotal HAWQ](http://pivotal.io/big-data/pivotal-hd): developed by
    Pivotal, it has been recently open-sourced and is now available in
    the Hortonworks Data Platform (HDP), it can query data from multiple
    sources (Hive, HBase, etc);
-   [Big SQL](http://www.ibm.com/developerworks/library/bd-bigsql/):
    developed by IBM and part of its Big Insights platform, it is
    closed-source code, and can query multiple data sources (Hive,
    HBase, etc); it is probably only useful if you use IBM tools;
-   [Apache Phoenix](http://phoenix.apache.org/): top-level Apache
    project, open-source, it can only query HBase since Phoenix is
    nothing else than a relational database layer over HBase, allowing
    low latency queries over HBase data; Phoenix shows much better
    performance than Hive and Impala over HBase on some
    [benchmarks](http://phoenix.apache.org/performance.html);
-   [Apache Tajo](http://tajo.apache.org/): Apache top-level project,
    Apache Tajo is a robust big data relational and distributed data
    warehouse system for Apache Hadoop. Tajo is designed for low-latency
    and scalable ad-hoc queries, online aggregation, and ETL
    (extract-transform-load process) on large-data sets stored on HDFS
    (Hadoop Distributed File System) and other data sources;
-   [Teradata SQL-H](http://www.teradata.com/Teradata-Aster-Database):
    developed by Teradata, “with Aster SQL-H™, users of the Teradata
    Aster Discovery Platform got the ability to issue SQL and
    SQL-MapReduce® queries directly on Hadoop data as if that data had
    been in Aster all along”.
-   [Blink DB](http://blinkdb.org/): developed by people from
    Universities of MIT, California (Berkeley) and Michigan. BlinkDB is
    a massively parallel, approximate query engine for running
    interactive SQL queries on large volumes of data. “It allows users
    to trade-off query accuracy for response time, enabling interactive
    queries over massive data by running queries on data samples and
    presenting results annotated with meaningful error bars.”

