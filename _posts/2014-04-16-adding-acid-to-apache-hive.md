---
layout: post
title: Adding ACID to Apache Hive 
date: 2014-04-16
categories: [computer science]
tags: [big data, big data]

---

# Article Source
* Title: [Adding ACID to Apache Hive](http://hortonworks.com/blog/adding-acid-to-apache-hive/)
* Authors: [Owen
O'Malley](http://hortonworks.com/blog/author/owen_omalley/ "Posts by Owen O'Malley")

Adding ACID to Apache Hive 
==========================

I’ve been working on MapReduce frameworks since mid 2005 (Hadoop’s since
the start of 2006) and a fundamental feature has always been incredible
throughput to access data, but no ACID transactions. That is changing.

Recently, while working with a customer that is using [Apache
Hive](http://hortonworks.com/hadoop/hive) to process terabytes (and
growing quickly) of sales data, they asked how to handle a business
requirement to update millions of records in their sales table each day.
Hive doesn’t provide the right features to satisfy that requirement,
however it is extensible, which enabled the customer create a custom
InputFormat and OutputFormat that did.  So, rather than building a new
SQL engine on Hadoop, they solved the problem by customizing Hive.

## **HIVE-5317 - **Implement insert, update, and delete in Hive with full ACID support

We want to provide that generalized UPDATE capability to the rest of the
Hive community without creating a new SQL engine on top of Hadoop.

The material below represents a general approach for incorporating ACID
transactions in Hive.  It represents our thoughts  with the feedback of
the broad Hive community.  A jira ticket has been entered
([HIVE-5317](https://issues.apache.org/jira/browse/HIVE-5317)), that
outlines the requirements and general approach and we are excited that
the broad community has taken part in the discussion of how to complete
this important project.

## The Requirements and Use Cases

It’s clear that there is a desire for update or delete records at less
than partition granularity. Furthermore, although Hive can insert to a
partition, such additions are visible immediately when written instead
of when the transaction completes. Typical relevant use cases are:

-   Once an hour, a set of inserts and updates (up to 500k rows) for
    various dimension tables (eg. customer, inventory, stores) needs to
    be processed. The dimension tables have primary keys and are
    typically bucketed and sorted on those keys.
-   Once a day a small set (up to 100k rows) of records need to be
    deleted for regulatory compliance.
-   Once an hour a log of transactions is exported from a RDBS and the
    fact tables need to be updated (up to 1m rows) to reflect the new
    data. The transactions are a combination of inserts, updates, and
    deletes. The table is partitioned and bucketed.
-   Streaming inserts coming from Flume or Storm applications into a
    Hive table, which are available to be read by Hive queries in less
    than 15 seconds.

It is critical that we integrate this functionality into Hive using
standard SQL syntax. In particular, over the course of the project,
we’ll add the following standard SQL statements to Hive:

```sql 
INSERT INTO tbl SELECT ...
INSERT INTO tbl VALUES ...
UPDATE tbl SET ... WHERE ...
DELETE FROM tbl WHERE ...
MERGE INTO tbl USING src ON ... WHEN MATCHED THEN ... WHEN NOT MATCHED THEN …
SET TRANSACTION LEVEL ...
BEGIN/END TRANSACTION
```

## Transaction Model

It is easy to overlook the fact that adding insert, update, and delete
commands will exacerbate Hive’s lack of transaction model. Therefore, a
critical part of the work will be adding a transaction model to Hive.
Hive’s metastore will track the read and write transactions and assign a
globally unique transaction id to each write transaction. Read
operations will be given the list of completed transaction ids and will
ignore the output of all other transactions, providing a consistent view
of all of the tables, even if some of their tasks are re-executed after
a node failure.

When a read operation starts, it provides the tables it is reading and
requests the current set of committed transaction ids. This set will be
represented as the maximum committed transaction

id and the list of transaction ids that are still in flight. Each
MapReduce job launched as part of the query will have exactly the same
set of valid transaction ids provided in the JobConf and thus the reader
will present a consistent snapshot view of the input tables from the
time at the start of the command.

Write operations will provide the list of tables being read and the list
of tables being written and get a list of valid transaction ids to read
from and a write transaction id. Any data that is read will only include
the valid transaction ids or their write transaction id. All data that
is written will be tagged with the write transaction id.

In both cases, when the command is finished, it must notify the
metastore. Since the metastore must identify (and abort) abandoned
transactions, the Hive client must notify the metastore that the command
is still running every 10 minutes or the transaction will be aborted.
The metastore will maintain the list of tables being read and the
corresponding transaction ids so that it can schedule compacted data to
be deleted after the last reader finishes.

Before a write transaction is committed in the metastore, all of the
HDFS files for that transaction must be in their final location.
Similarly, before a write transaction is aborted in the metastore all of
the files must have been deleted from HDFS. This ensures that any valid
transaction id that is given to a reader will only have correct HDFS
files associated with it.

## InputFormat

The heart of the approach is merging the HDFS in the tasks. Hive’s
warehouse layout will remain the same and look like
*\$database/\$table/\$partition*. Inside of each partition (or the table
directory, if the table isn’t partitioned), instead of a set of files
named with the bucket id (eg. *000000\_0*) there will be a directories
with the base rows and the deltas that have modified that base. The base
files will be stored in a directory named *base\_\$etid*and the deltas
will be stored in directories named *delta\_\$btid\_\$etid*, where
\$btid is the first transaction id included in the file and \$etid is
the first transaction id not included in the file. This naming scheme
will enable us to leave both the pre and post compaction files while the
clients using the pre compaction files finish. Within each directory,
the rows must be consistently bucketed so that each bucket can be
processed independently.

In theory the base files can be in any format, but ORC will be required
for the first version. Every row in the table is uniquely identified by
the transaction id of the transaction that inserted it (or 0 for the
base file), the row id, and the implicit bucket number. The
implementation of delta files will be ORC files with a row format of:

```sql
create table deltaFile (
 operation int,      -- 0 = insert, 1 = delete, 2 = update
 transactionId long, -- transaction that inserted the row
 rowId long,         -- row id
 rowData struct(...) -- for insert and update, the columns
 );
```

For sorted tables, the base and delta files will be sorted by the sort
columns, while unsorted tables will be sorted by descending transaction
id and ascending row id. Since the base and delta files are sorted
identically, it is a simple merge sort to combine them. ORC’s integer
run length encoding will compress the delta files very effectively.

The RecordReader will open the base file and each of the delta files and
do a merge sort to provide a single view to the reading operator.[\
](#_msocom_1)

When the read query is done, it will inform the metastore that it is no
longer reading the tables so that obsolete versions of the tables can be
garbage collected.

## OutputFormat

When one of the insert, update, or delete commands starts, it gets the
valid transaction ids for reading and a transaction id to write to. The
first version of the project will do auto-commit of the transaction when
each query finishes. Because each of the delta files is labeled with the
transaction ids, none of the data associated with a transaction is read
before the transaction is committed.

The delta files are written as ORC files with a smaller stripe size
(32MB), a smaller buffer size (32K), and no compression. This is because
many of the files will be very small and lowering the sizes will reduce
the resource requirements for reading the files.

For the insert command, the tasks will write the delta file with the
insert rows. Meanwhile, updates and deletes will read the current table
with the record reader and will write a new delta file with the delete
and update commands.

While any query is running, the client will heartbeat to the metastore
every N minutes to ensure the transaction isn’t removed for inactivity.
After the command finishes, the transaction will be committed by the
Hive metastore or be aborted.

## Compaction

Periodically the system must rewrite the smaller delta files into larger
ones (minor compaction) and rewriting the delta files into the base file
(major compaction). Since the compactions may take relatively large
amount of time, they should not block other updates. This is possible
because although they are rewriting the data, they are semantically
equivalent of the previous data.

To preserve read throughput over time, compactions must happen regularly
and therefore automatically. In particular, since reading the table
involves doing a N-­way merge sort, we must bound the size of N to a
relatively small number. Minor compactions should be automatically
scheduled for a table when we have more than 10 committed deltas. The
minor compaction

asks the metastore for the smallest in­flight transaction id and will
compact all transactions that are strictly less than it. Once the minor
compaction is done, the directory with the output is moved into the
partition’s directory with the name *delta\_\$bid\_\$eid.*The previous
delta directories will be scheduled for garbage collection once the
transactions using the previous version have finished.

When more than 10% of the records are coming from delta files instead of
the base, a major compaction should be triggered. We will also need a
time based trigger to do major compactions during times when the cluster
is less busy. The major compaction will request the lowest in­flight
transaction id and re­write the base with the merged transaction that
are less than it. When the compaction is done, the output is moved to
*base\_\$etid*and the old base is scheduled for garbage collection.
Because compaction will change the row ids, the major compaction will
also output a set of files that translate from the previous major
compaction to the new one. The translation files will be stored in the
base directory and be named *base\_\$etid/\_translation\_\$bucketid*. To
keep the translation files small, it is sufficient to write the old
transaction id, row id, and the number of sequential rows. With this
encoding, the translation files should be proportional to the size of
the deltas rather than the size of the base. After the major compaction
is finished, if there are deltas using the old base file the system
should schedule a minor compaction to be run. When the minor compaction
is done, the translation files can be scheduled for garbage collection.
Until the minor compaction finishes, the record reader will need to
merge the translation files together with the old delta files to find
the updated or deleted records.

## Why Not HBase?

One of the questions that comes up when we discuss this project is why
don’t we just use Hive over HBase, since HBase already supports updates
to values. There are several different issues that we’ve observed:

-   HBase doesn’t support consistency at any level other than a single
    row update. A transaction model to support distributed transactions
    would need to be added.
-   Many Hive users don’t have HBase installed and requiring it imposes
    a significant operational overhead.
-   HBase is designed to support low latency point lookups rather than
    high throughput scans over large ranges of the table.
-   HBase has a single sort key that is partitioned by range and doesn’t
    support Hive’s richer partition, sort order, and bucketing
    strategies. This limits the ability of the user to layout the table
    for various varieties of queries.
-   HBase’s storage format is row-major instead of columnar, which means
    that if your query only needs two out of a hundred columns, the
    query must read and deserialize all of the data for the row’s
    hundred columns.

# Conclusion

Since we’ve filed the Jira on [Hive
Updates](https://issues.apache.org/jira/browse/HIVE-5317) there has been
a great discussion on the proposal from the community at large and drawn
an audience of 41 watchers. The approach is validated by the active use
at the original customer. We are in the process of pushing the design to
the next level and starting development.

As always, we do all of our development in the open at Apache to gain
strength from discussions with the community rather than dump a huge
patch on the open source project just before the project’s next release.


# References
[1] [Owen O'Malley](http://hortonworks.com/blog/author/owen_omalley/ "Posts by Owen O'Malley"), [*Adding ACID to Apache Hive*](http://hortonworks.com/blog/adding-acid-to-apache-hive/), HortonWorks Blog, October 11th, 2013.