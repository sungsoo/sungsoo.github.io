---
layout: post
title: Using Presto to combine data from Hive and MySQL
date: 2015-09-19
categories: [computer science]
tags: [big data]

---


# Using Presto to combine data from Hive and MySQL

[Presto](http://prestodb.io/) (originated at Facebook) is a yet another
distributed SQL query engine for Hadoop that has recently generated huge
excitement. What makes Presto so interesting, especially, in comparison
to other existing engines like Cloudera Impala or Hive on Tez? The list
of key differentiators includes:

-   Presto seems to be great for ad-hoc analysis – it runs queries
    quickly and scales from gigabytes to petabytes.
-   A single Presto query can process data from multiple sources e.g.
    HDFS, MySQL, Cassandra or even Kafka.
-   Large-scale companies like
    [Facebook](https://www.facebook.com/notes/facebook-engineering/presto-interacting-with-petabytes-of-data-at-facebook/10151786197628920),
    [Netflix](http://techblog.netflix.com/2014/10/using-presto-in-our-big-data-platform.html),
    Airbnb or Dropbox like it and actively contribute to it.

Because (a) the excitement about Presto is evident, (b) running own
benchmarks is time-consuming, in this tutorial we focus on the feature
that allow us to process data from HDFS and MySQL in a single Presto
query. Such a feature is quite unique, because it’s hasn’t been provided
by other open-source projects like Hive and Impala (Impala, however, can
process Hive and HBase table in a single query).

Presto Connectors
-----------------

First, a bit of technical background. Presto supports pluggable
connectors that provide metadata and data for queries. There is Hive
connector (currently supports Text, SequenceFile, RCFile, ORC and, [in a
limited way,](https://github.com/facebook/presto/pull/1709) Parquet
formats), MySQL connector and several others. You can even implement a
custom one.

A coordinator (a master daemon) uses connectors to get metadata (such as
table schema) that is needed to build a query plan. Workers use
connectors to get actual data that will be processed by them.

![Presto
Plugins](http://getindata.com/wp-content/uploads/2014/12/Presto-Plugins.png)

Our use-case
------------

To demonstrate this feature, we use the [Last.fm Dataset – 1K
users](http://www.dtic.upf.edu/~ocelma/MusicRecommendationDataset/lastfm-1K.html)
dataset provided by [Last.fm](http://www.last.fm/). It contains profile
information (such as gender, age, country) about 1K users plus tracks
that these users had been listening to.

In our tutorial, user profile information (40 kilobytes) will be kept in
a MySQL table (something that actually makes sense in real-world
scenarios when user base is small enough), while information about
streamed tracks (2.4 gigabytes) will be uploaded to a Hive table.

Training environment
--------------------

For simplicity and quick iterations, we use an already pre-configured
single-node Hadoop YARN cluster with Hive and MySQL. An easy way to get
it is to download [Hortonworks
Sandbox](http://hortonworks.com/hdp/downloads/) (we used Hortonworks
Sandbox 2.2).

Presto installation
-------------------

Because the installation of Presto is very smooth and [well
documented](http://prestodb.io/docs/current/installation.html), we don’t
duplicate these steps here. Should you follow the instructions
carefully, you have a running Presto server in less then 10 minutes.

Please note that Presto requires Java 8.

Unfortunately, Presto on YARN is not “officially” supported yet. This
means that a Presto daemon should be installed on each node of your
cluster (and share resources with NodeManager and YARN containers, if
you happen to run YARN on the same nodes). There is, however, an
interesting blog post that describes how to [run Presto on YARN over
Apache
Twill](http://blog.cask.co/2014/04/running-presto-over-apache-twill/).

Integration between Presto and MySQL and Hive
---------------------------------------------

Please follow the instructions needed to integrate Presto with
[MySQL](http://prestodb.io/docs/current/connector/mysql.html) and
[Hive](http://prestodb.io/docs/current/connector/hive.html). In case of
Hortonworks Sandbox 2.2, files shown below contain exemplary (and
working) configuration settings.

```
$ cat etc/catalog/mysql.properties
connector.name=mysql
connection-url=jdbc:mysql://localhost:3306
connection-user=root
connection-password=
```

```
$ cat etc/catalog/hive.properties
connector.name=hive-hadoop2
hive.metastore.uri=thrift://localhost:9083
```

When these files are created, you can start Presto server.

```
[root@sandbox presto-server-0.89]$ bin/launcher run
```


## Uploading input datasets into MySQL and Hive

First we create a MySQL database and table. Then, we upload information about users into it.

```sql
[root@sandbox presto-server-0.89]$ mysql
mysql> CREATE DATABASE tutorial;
mysql> USE tutorial;
mysql> CREATE TABLE user (
    -> userid VARCHAR(15), gender CHAR(1), age SMALLINT, 
    -> country VARCHAR(50), signup VARCHAR(50)
    -> );
mysql> LOAD DATA
    -> LOCAL INFILE '/root/lastfm-dataset-1K/userid-profile.tsv'
    -> INTO TABLE user
    -> FIELDS TERMINATED BY '\t';
mysql> SELECT * FROM user LIMIT 3;
```

Next, we create a Hive database and table. Then we upload streamed tracks into it.

```sql
$ cat /tmp/create-and-populate-stream-table.hql
CREATE DATABASE IF NOT EXISTS tutorial;
USE tutorial;
CREATE TABLE IF NOT EXISTS stream(
        userid STRING,
        timestamp STRING,
        artistid STRING,
        artistname STRING,
        trackid STRING,
        trackname STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;

LOAD DATA LOCAL 
INPATH '/root/lastfm-dataset-1K/userid-timestamp-artid-artname-traid-traname.tsv'
OVERWRITE INTO TABLE stream;
$ hive -f /tmp/create-and-populate-stream-table.hql
```


## Using Presto to query both MySQL and Hive tables

Finally, we are ready to process data! :)

Let’s start the Presto terminal-based interactive shell for running queries.

```
[root@sandbox presto-server-0.89]$ ./presto --server localhost:8080
```

In one of the previous steps, we defined two catalogs:

* mysql (configured in etc/catalog/mysql.properties file)
* hive (configured in the etc/catalog/hive.properties file)


With Presto, to specify a table that you wish to process, we use the catalog.database.table naming convention e.g. mysql.tutorial.user or hive.tutorial.stream.

Without further ado, let’s run some basic queries:

* List tables in the tutorial database in MySQL

```sql
presto:default> SHOW TABLES FROM mysql.tutorial;
 Table
-------
 user
(1 row)

Query 20141227_222114_00006_u66ux, FINISHED, 1 node
Splits: 2 total, 2 done (100.00%)
0:00 [1 rows, 94B] [2 rows/s, 207B/s]
```

* Find two countries with the largest number of users

```sql
presto:default> SELECT country, COUNT(*) as cnt
             -> FROM mysql.tutorial.user GROUP BY country
             -> ORDER BY cnt DESC LIMIT 2;
    country     | cnt
----------------+-----
 United States  | 228
 United Kingdom | 126
(2 rows)

Query 20141227_225413_00032_u66ux, FINISHED, 1 node
Splits: 3 total, 3 done (100.00%)
0:00 [992 rows, 0B] [5.45K rows/s, 0B/s]
```


* Describe the stream table in Hive

```sql
presto:default> DESCRIBE hive.tutorial.stream;
   Column   |  Type   | Null | Partition Key | Comment
------------+---------+------+---------------+---------
 userid     | varchar | true | false         |
 timestamp  | varchar | true | false         |
 artistid   | varchar | true | false         |
 artistname | varchar | true | false         |
 trackid    | varchar | true | false         |
 trackname  | varchar | true | false         |
(6 rows)

Query 20141227_222534_00016_u66ux, FINISHED, 1 node
Splits: 2 total, 2 done (100.00%)
0:00 [6 rows, 1.71KB] [13 rows/s, 3.86KB/s]
```


* Find top three countries with the largest number of streams


This query actually requires combining data from MySQL (user profiles) and Hive (listened tracks).

```sql
presto:default> SELECT u.country, COUNT(*) AS cnt
             -> FROM hive.tutorial.stream s
             -> JOIN mysql.tutorial.user u
             -> ON s.userid = u.userid
             -> GROUP BY u.country
             -> ORDER BY cnt DESC
             -> LIMIT 5;
    country     |   cnt
----------------+---------
 United States  | 5023398
 United Kingdom | 2389085
                | 1113056
 Poland         |  974331
 Canada         |  842514
(5 rows)

Query 20141227_230237_00038_u66ux, FINISHED, 1 node
Splits: 79 total, 79 done (100.00%)
2:37 [19.2M rows, 2.36GB] [122K rows/s, 15.3MB/s]
```

2:37 [19.2M rows, 2.36GB] [122K rows/s, 15.3MB/s] means that it took 2min:37sec to process 19.2M rows (that equals 2.36GB) with the average speed of 122K rows/s.

![](http://sungsoo.github.com/images/presto.png)

You can find more statistics, if you navigate to Presto Web UI at [http://127.0.0.1:8080](http://127.0.0.1:8080/) (see a picture on the left).

## One SQL semantics for all

Since Presto gives you a single SQL-like interface to query data from multiple data-sources, one should understand its implications.

Presto uses ANSI SQL syntax and semantics that, for example, has several differences from HiveQL (which is loosely modeled after MySQL). Be aware of these [syntax and semantics incompatibilities](http://prestodb.io/docs/current/migration/from-hive.html) when your try to re-run your HiveQL queries in Presto.

## Summary

First impression of Presto is very positive – the installation process is problemless, the tested features work as expected, and there is actually no troubleshooting needed.

Although Hive on Tez (or possibly Hive on Spark in the nearest future) [aims to provide a single SQL-like query and BI solution on the Hadoop regardless of dataset size](http://yahoodevelopers.tumblr.com/post/85930551108/yahoo-betting-on-apache-hive-tez-and-yarn), Presto goes one step further and aims to provide also a single SQL-like query solution regardless of dataset location e.g. HDFS, RDBMS, NoSQL, proprietary data stores. This idea is really cool and it’s great to see tool that makes it happen.

Because Presto is a relatively new projects, it’s still lacking some useful features – integration with YARN (less efficient sharing of resources between Presto and other engines like MapReduce, Spark), possibility to write results back to Hive tables (problematic if you want to integrate Presto into your ETL pipelines), support for Avro, to name a few. Fortunately, Presto adoption and community is growing fast, so hopefully these features will be implemented soon. Stay tuned!



















