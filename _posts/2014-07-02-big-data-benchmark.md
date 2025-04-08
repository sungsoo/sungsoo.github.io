---
layout: post
title: Big Data Benchmark
date: 2014-07-02
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Big Data Benchmark](https://amplab.cs.berkeley.edu/benchmark/)
* Authors: Justin Erickson, Marcel Kornacker, and Dileep Kumar

[![](http://sungsoo.github.com/images/benchmark.png)](http://sungsoo.github.com/images/benchmark.png)

Introduction
------------

Several analytic frameworks have been announced in the last year. Among
them are inexpensive data-warehousing solutions based on traditional
Massively Parallel Processor (MPP) architectures
([Redshift](http://aws.amazon.com/redshift/)), systems which impose
MPP-like execution engines on top of Hadoop
([Impala](http://blog.cloudera.com/blog/2012/10/cloudera-impala-real-time-queries-in-apache-hadoop-for-real/),
[HAWQ](http://www.greenplum.com/news/press-release/emc-introduces-worlds-most-powerful-hadoop-distribution-pivotal-hd))
and systems which optimize MapReduce to improve performance on
analytical workloads ([Shark](http://shark.cs.berkeley.edu/),
[Stinger/Tez](http://hortonworks.com/blog/100x-faster-hive/)). This
benchmark provides [quantitative](#results) and
[qualitative](#discussion) comparisons of five systems. It is entirely
hosted on EC2 and can be reproduced directly from your computer.

-   [Redshift](http://aws.amazon.com/redshift/) - a hosted MPP database
    offered by Amazon.com based on the ParAccel data warehouse. We
    tested Redshift on HDDs.
-   [Hive](http://hive.apache.org/) - a Hadoop-based data warehousing
    system. (v0.12)
-   [Shark](http://shark.cs.berkeley.edu/) - a Hive-compatible SQL
    engine which runs on top of the [Spark](http://spark-project.org)
    computing framework. (v0.8.1)
-   [Impala](http://blog.cloudera.com/blog/2012/10/cloudera-impala-real-time-queries-in-apache-hadoop-for-real/)
    - a Hive-compatible[\*](#discussion) SQL engine with its own
    MPP-like execution engine. (v1.2.3)
-   [Stinger/Tez](http://hortonworks.com/blog/announcing-stinger-phase-3-technical-preview)
    - Tez is a next generation Hadoop execution engine currently in
    development (v0.2.0)

This remains a ***work in progress*** and will evolve to include
additional frameworks and new capabilities. We welcome
[contributions](#contributions).

## What this benchmark is not 

This benchmark is not intended to provide a comprehensive overview of
the tested platforms. We are aware that by choosing default
configurations we have excluded many optimizations. The choice of a
simple storage format, compressed SequenceFile, omits optimizations
included in columnar formats such as
[ORCFile](http://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.0.0.2/ds_Hive/orcfile.html)
and [Parquet](http://parquet.io/). For now, we've targeted a simple
comparison between these systems with the goal that the results are
**understandable and reproducible**.

## What is being evaluated? 

This benchmark measures response time on a handful of relational
queries: scans, aggregations, joins, and UDF's, across different data
sizes. Keep in mind that these systems have very different sets of
capabilities. MapReduce-like systems (Shark/Hive) target flexible and
large-scale computation, supporting complex User Defined Functions
(UDF's), tolerating failures, and scaling to thousands of nodes.
Traditional MPP databases are strictly SQL compliant and heavily
optimized for relational queries. The workload here is simply one set of
queries that most of these systems these can complete.

## Changes and Notes (February 2014) 

-   We changed the Hive configuration from Hive 0.10 on CDH4 to Hive
    0.12 on HDP 2.0.6. As a result, direct comparisons between the
    current and previous Hive results should not be made. It is
    difficult to account for changes resulting from modifications to
    Hive as opposed to changes in the underlying Hadoop distribution.
-   We have added
    [Tez](http://hortonworks.com/blog/announcing-stinger-phase-3-technical-preview/)
    as a supported platform. **It is important to note that Tez is
    currently in a preview state**.
-   Hive has improved its query optimization, which is also inherited by
    Shark. This set of queries does not test the improved optimizer.
-   We have changed the underlying filesystem from Ext3 to Ext4 for
    Hive, Tez, Impala, and Shark benchmarking.

## Dataset and Workload 

Our dataset and queries are inspired by the benchmark contained in [a
comparison of approaches to large scale
analytics](http://database.cs.brown.edu/sigmod09/benchmarks-sigmod09.pdf).
The input data set consists of a set of unstructured HTML documents and
two SQL tables which contain summary information. It was generated using
[Intel's Hadoop benchmark
tools](https://github.com/intel-hadoop/HiBench) and data sampled from
the [Common Crawl](http://commoncrawl.org) document corpus. There are
three datasets with the following schemas:

+-------------------------+-------------------------+-------------------------+
| `Documents`             | `Rankings`              | `UserVisits`            |
+=========================+=========================+=========================+
| *Unstructured HTML      | *Lists websites and     | *Stores server logs for |
| documents*              | their page rank*        | each web page*          |
+-------------------------+-------------------------+-------------------------+
|                         |     pageURL VARCHAR(300 |     sourceIP VARCHAR(11 |
|                         | )                       | 6)                      |
|                         |     pageRank INT        |     destURL VARCHAR(100 |
|                         |     avgDuration INT     | )                       |
|                         |                         |     visitDate DATE      |
|                         |                         |     adRevenue FLOAT     |
|                         |                         |     userAgent VARCHAR(2 |
|                         |                         | 56)                     |
|                         |                         |     countryCode CHAR(3) |
|                         |                         |     languageCode CHAR(6 |
|                         |                         | )                       |
|                         |                         |     searchWord VARCHAR( |
|                         |                         | 32)                     |
|                         |                         |     duration INT        |
+-------------------------+-------------------------+-------------------------+

-   [Query 1](#query1) and [Query 2](#query2) are exploratory SQL
    queries. We vary the size of the result to expose scaling properties
    of each systems.

    -   Variant A: **BI-Like** - result sets are small (e.g., could fit
        in memory in a BI tool)
    -   Variant B: **Intermediate** - result set may not fit in memory
        on one node
    -   Variant C: **ETL-Like** - result sets are large and require
        several nodes to store
-   [Query 3](#query3) is a join query with a small result set, but
    varying sizes of joins.

-   [Query 4](#query4) is a bulk UDF query. It calculates a simplified
    version of PageRank using a sample of the [Common
    Crawl](http://commoncrawl.org) dataset.

### Hardware Configuration 

For Impala, Hive, Tez, and Shark, this benchmark uses the m2.4xlarge EC2
instance type. Redshift only has very small and very large instances, so
rather than compare identical hardware, we *fix the cost* of the cluster
and opt to purchase a larger number of small nodes for Redshift. We use
a scale factor of 5 for the experiments in all cases.

### Instance stats

  Framework                  Instance Type   Memory    Storage         Virtual Cores   \$/hour
  -------------------------- --------------- --------- --------------- --------------- ---------
  Impala, Hive, Tez, Shark   m2.4xlarge      68.4 GB   1680GB (2HDD)   8               1.640
  Redshift                   dw.hs1.xlarge   15 GB     2 TB (3HDD)     2               .85

### Cluster stats

  Framework                  Instance Type   Instances   Memory   Storage          Virtual Cores   Cluster \$/hour
  -------------------------- --------------- ----------- -------- ---------------- --------------- -----------------
  Impala, Hive, Tez, Shark   m2.4xlarge      5           342 GB   8.4 TB (10HDD)   40              **\$8.20**
  Redshift                   dw.hs1.xlarge   10          150 GB   20 TB (30HDD)    20              **\$8.50**

## Results | February 2014 

We launch EC2 clusters and run each query several times. We report the
median response time here. Except for Redshift, all data is stored on
HDFS in compressed SequenceFile format. Each query is run with seven
frameworks:

  ------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  **Redshift**        Amazon Redshift with default options.
  **Shark - disk**    Input and output tables are on-disk compressed with gzip. OS buffer cache is cleared before each run.
  **Impala - disk**   Input and output tables are on-disk compressed with snappy. OS buffer cache is cleared before each run.
  **Shark - mem**     Input tables are stored in Spark cache. Output tables are stored in Spark cache.
  **Impala - mem**    Input tables are coerced into the OS buffer cache. Output tables are on disk (Impala has no notion of a cached table).
  **Hive**            Hive on HDP 2.0.6 with default options. Input and output tables are on disk compressed with snappy. OS buffer cache is cleared before each run.
  **Tez**             Tez with the configuration parameters specified [here](http://public-repo-1.hortonworks.com/HDP-LABS/Projects/Stinger/StingerTechnicalPreviewInstall.pdf). Input and output tables are on disk compressed with snappy. OS buffer cache is cleared before each run.
  ------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 1. Scan Query 

    SELECT pageURL, pageRank FROM rankings WHERE pageRank > X

Query 1A\
32,888 results

Query 1B\
3,331,851 results

Query 1C\
89,974,976 results

This query scans and filters the dataset and stores the results.

This query primarily tests the throughput with which each framework can
read and write table data. The best performers are Impala (mem) and
Shark (mem) which see excellent throughput by avoiding disk. For on-disk
data, Redshift sees the best throughput for two reasons. First, the
Redshift clusters have more disks and second, Redshift uses columnar
compression which allows it to bypass a field which is not used in the
query. Shark and Impala scan at HDFS throughput with fewer disks.

Both Shark and Impala outperform Hive by 3-4X due in part to more
efficient task launching and scheduling. As the result sets get larger,
Impala becomes bottlenecked on the ability to persist the results back
to disk. Nonetheless, since the last iteration of the benchmark Impala
has improved its performance in materializing these large result-sets to
disk.

Tez sees about a 40% improvement over Hive in these queries. This is in
part due to the container pre-warming and reuse, which cuts down on JVM
initialization time.

### 2. Aggregation Query 

    SELECT SUBSTR(sourceIP, 1, X), SUM(adRevenue) FROM uservisits GROUP BY SUBSTR(sourceIP, 1, X)

Query 2A\
2,067,313 groups

Query 2B\
31,348,913 groups

Query 2C\
253,890,330 groups

This query applies string parsing to each input tuple then performs a
high-cardinality aggregation.

Redshift's columnar storage provides greater benefit than in Query 1
since several columns of the `UserVistits` table are un-used. While
Shark's in-memory tables are also columnar, it is bottlenecked here on
the speed at which it evaluates the `SUBSTR` expression. Since Impala is
reading from the OS buffer cache, it must read and decompress entire
rows. Unlike Shark, however, Impala evaluates this expression using very
efficient compiled code. These two factors offset each other and Impala
and Shark achieve roughly the same raw throughput for in memory tables.
For larger result sets, Impala again sees high latency due to the speed
of materializing output tables.

### 3. Join Query 

    SELECT sourceIP, totalRevenue, avgPageRank
    FROM
      (SELECT sourceIP,
              AVG(pageRank) as avgPageRank,
              SUM(adRevenue) as totalRevenue
        FROM Rankings AS R, UserVisits AS UV
        WHERE R.pageURL = UV.destURL
           AND UV.visitDate BETWEEN Date(`1980-01-01') AND Date(`X')
        GROUP BY UV.sourceIP)
      ORDER BY totalRevenue DESC LIMIT 1

Query 3A\
485,312 rows

Query 3B\
53,332,015 rows

Query 3C\
533,287,121 rows

This query joins a smaller table to a larger table then sorts the
results.

When the join is small (3A), all frameworks spend the majority of time
scanning the large table and performing date comparisons. For larger
joins, the initial scan becomes a less significant fraction of overall
response time. For this reason the gap between in-memory and on-disk
representations diminishes in query 3C. All frameworks perform
partitioned joins to answer this query. CPU (due to hashing join keys)
and network IO (due to shuffling data) are the primary bottlenecks.
Redshift has an edge in this case because the overall network capacity
in the cluster is higher.

### 4. External Script Query 

    CREATE TABLE url_counts_partial AS 
      SELECT TRANSFORM (line)
        USING "python /root/url_count.py" as (sourcePage, destPage, cnt) 
      FROM documents;
    CREATE TABLE url_counts_total AS 
      SELECT SUM(cnt) AS totalCount, destPage 
      FROM url_counts_partial 
      GROUP BY destPage;

Query 4 (phase 1)

Query 4 (phase 2)

Query 4 (total)

This query calls an external Python function which extracts and
aggregates URL information from a web crawl dataset. It then aggregates
a total count per URL.

Impala and Redshift do not currently support calling this type of UDF,
so they are omitted from the result set. Impala UDFs must be written in
Java or C++, where as this script is written in Python. The performance
advantage of Shark (disk) over Hive in this query is less pronounced
than in 1, 2, or 3 because the shuffle and reduce phases take a
relatively small amount of time (this query only shuffles a small amount
of data) so the task-launch overhead of Hive is less pronounced. Also
note that when the data is in-memory, Shark is bottlenecked by the speed
at which it can pipe tuples to the Python process rather than memory
throughput. This makes the speedup relative to disk around 5X (rather
than 10X or more seen in other queries).

## Discussion

These numbers compare performance on SQL workloads, but raw performance
is just one of many important attributes of an analytic framework. The
reason why systems like Hive, Impala, and Shark are used is because they
offer a high degree of flexibility, both in terms of the underlying
format of the data and the type of computation employed. Below we
summarize a few qualitative points of comparison:

  System     SQL variant                  Execution engine   UDF Support      Mid-query fault tolerance   Open source   Commercial support   HDFS Compatible
  ---------- ---------------------------- ------------------ ---------------- --------------------------- ------------- -------------------- -----------------
  Hive       Hive QL (HQL)                MapReduce          Yes              Yes                         Yes           Yes                  Yes
  Tez        Hive QL (HQL)                Tez                Yes              Yes                         Yes           Yes                  Yes
  Shark      Hive QL (HQL)                Spark              Yes              Yes                         Yes           Yes                  Yes
  Impala     Some HQL + some extensions   DBMS               Yes (Java/C++)   No                          Yes           Yes                  Yes
  Redshift   Full SQL 92 (?)              DBMS               No               No                          No            Yes                  No

FAQ
---

#### What's next?

We would like to include the columnar storage formats for Hadoop-based
systems, such as
[Parquet](http://blog.cloudera.com/blog/2013/03/introducing-parquet-columnar-storage-for-apache-hadoop/)
and [RC file](http://en.wikipedia.org/wiki/RCFile). We would also like
to run the suite at higher scale factors, using different types of
nodes, and/or inducing failures during execution. Finally, we plan to
re-evaluate on a regular basis as new versions are released.

We wanted to begin with a relatively well known workload, so we chose a
variant of the Pavlo benchmark. This benchmark is heavily influenced by
relational queries (SQL) and leaves out other types of analytics, such
as machine learning and graph processing. The largest table also has
fewer columns than in many modern RDBMS warehouses. In future iterations
of this benchmark, we may extend the workload to address these gaps.

#### How is this different from the 2008 Pavlo et al. benchmark?

This benchmark is not an attempt to exactly recreate the environment of
the Pavlo at al. benchmark. Instead, it draws on that benchmark for
inspiration in the dataset and workload. The most notable differences
are as follows:

1.  We run on a public cloud instead of using dedicated hardware.
2.  We require the results are materialized to an output table. This is
    necessary because some queries in our version have results which do
    not fit in memory on one machine.
3.  The dataset used for Query 4 is an actual web crawl rather than a
    synthetic one.
4.  Query 4 uses a Python UDF instead of SQL/Java UDF's.
5.  We create different permutations of queries 1-3. These permutations
    result in shorter or longer response times.
6.  The dataset is generated using the newer
    [Intel](https://github.com/intel-hadoop/HiBench) generator instead
    of the original C scripts. The newer tools are well supported and
    designed to output Hadoop datasets.

#### Did you consider comparing Vertica, Teradata, SAP Hana, MongoDB, Postgres, RAMCloud, SQLite, insert-dbms-or-query-engine-here... etc?

We've started with a small number of EC2-hosted query engines because
our primary goal is producing verifiable results. Over time we'd like to
grow the set of frameworks. We actively welcome contributions!

#### This workload doesn't represent queries I run -- how can I test these frameworks on my own workload?

We've tried to cover a set of fundamental operations in this benchmark,
but of course, it may not correspond to your own workload. The prepare
scripts provided with this benchmark will load sample data sets into
each framework. From there, you are welcome to run your own types of
queries against these tables. Because these are all easy to launch on
EC2, you can also load your own datasets.

#### Do these queries take advantage of different Hadoop file formats or data-layout options, such as Hive/Impala/Shark partitions or Redshift sort columns?

For now, no. The idea is to test "out of the box" performance on these
queries even if you haven't done a bunch of up-front work at the loading
stage to optimize for specific access patterns. For this reason we have
opted to use simple storage formats across Hive, Impala and Shark
benchmarking.

That being said, it is important to note that the various platforms
optimize different use cases. As it stands, only Redshift can take
advantage of its columnar compression. However, the other platforms
could see improved performance by utilizing a columnar storage format.
Specifically, Impala is likely to benefit from the usage of the Parquet
columnar file format.

We may relax these requirements in the future.

#### Why didn't you test Hive in memory?

We did, but the results were very hard to stabilize. The reason is that
it is hard to coerce the entire input into the buffer cache because of
the way Hive uses HDFS: Each file in HDFS has three replicas and Hive's
underlying scheduler may choose to launch a task at any replica on a
given run. As a result, you would need 3X the amount of buffer cache
(which exceeds the capacity in these clusters) and or need to have
precise control over which node runs a given task (which is not offered
by the MapReduce scheduler).

Contributing a New Framework 
----------------------------

We plan to run this benchmark regularly and may introduce additional
workloads over time. We welcome the addition of new frameworks as well.
The only requirement is that running the benchmark be reproducible and
verifiable in similar fashion to those already included. The best place
to start is by contacting [Patrick Wendell](mailto:pwendell@gmail.com)
from the U.C. Berkeley AMPLab.

Run This Benchmark Yourself 
---------------------------

*Since Redshift, Shark, Hive, and Impala all provide tools to easily
provision a cluster on EC2, this benchmark can be easily replicated.*

## Hosted data sets 

To allow this benchmark to be easily reproduced, we've prepared various
sizes of the input dataset in S3. The scale factor is defined such that
each node in a cluster of the given size will hold \~25GB of the
`UserVisits` table, \~1GB of the `Rankings` table, and \~30GB of the web
crawl, uncompressed. The datasets are encoded in `TextFile` and
`SequenceFile` format along with corresponding compressed versions. They
are available publicly at
`s3n://big-data-benchmark/pavlo/[text|text-deflate|sequence|sequence-snappy]/[suffix]`.

  S3 Suffix   Scale Factor   `Rankings` (rows)   `Rankings` (bytes)   `UserVisits` (rows)   `UserVisits` (bytes)   `Documents` (bytes)
  ----------- -------------- ------------------- -------------------- --------------------- ---------------------- ---------------------
  /tiny/      small          1200                77.6KB               10000                 1.7MB                  6.8MB
  /1node/     1              18 Million          1.28GB               155 Million           25.4GB                 29.0GB
  /5nodes/    5              90 Million          6.38GB               775 Million           126.8GB                136.9GB

## Launching and Loading Clusters 

1.  Create an Impala, Redshift, Hive/Tez or Shark cluster using their
    provided provisioning tools.

-   Each cluster should be created in the US East EC2 Region
-   For Redshift, use the [Amazon AWS
    console](https://console.aws.amazon.com/redshift/). Make sure to
    whitelist the node you plan to run the benchmark from in the
    Redshift control panel.
-   For Impala, use the [Cloudera Manager EC2 deployment
    instructions](http://blog.cloudera.com/blog/2013/03/how-to-create-a-cdh-cluster-on-amazon-ec2-via-cloudera-manager/).
    Make sure to upload your own RSA key so that you can use the same
    key to log into the nodes and run queries.
    -   **Note:** In order to use Ext4 as the underlying file system
        additional steps must be taken on each host machine. See the
        Ext4 section below.
-   For Shark, use [Spark/Shark EC2 launch
    scripts](http://spark-project.org/docs/latest/ec2-scripts.html).
    These are available as part of the latest Spark distribution.
    -   **Note:** In order to use the same settings that were used in
        the benchmark, such as Ext4, you must make a modification to the
        Spark EC2 script. See the Ext4 section below.

<!-- -->

        $> ec2/spark-ec2 -s 5 -k [KEY PAIR NAME] -i [IDENTITY FILE] --hadoop-major-version=2 -t "m2.4xlarge" launch [CLUSTER NAME] 

**NOTE:** You must set **AWS\_ACCESS\_KEY\_ID** and
**AWS\_SECRET\_ACCESS\_KEY** environment variables.

-   For Hive and Tez, use the following instructions to launch a cluster

### Using Ext4 

#### Shark

Modify ec2/spark\_ec2.py:

    Change: ssh(master, opts, "rm -rf spark-ec2 && git clone https://github.com/mesos/spark-ec2.git -b v2")
    To:     ssh(master, opts, "rm -rf spark-ec2 && git clone https://github.com/ahirreddy/spark-ec2.git -b ext4-update")

#### Impala

Run the following commands on each node provisioned by the Cloudera
Manager. These commands must be issued after an instance is provisioned
but before services are installed.

      dev=/dev/xvdb
      sudo umount $dev
      sudo mkfs.ext4 -E lazy_itable_init=0,lazy_journal_init=0 $dev
      sudo mount -o defaults,noatime,nodiratime $dev

      dev=/dev/xvdc
      sudo mkdir /data0
      sudo mkfs.ext4 -E lazy_itable_init=0,lazy_journal_init=0 $dev
      sudo mount -o defaults,noatime,nodiratime $dev
      sudo mount -t ext4 -o defaults,noatime,nodiratime $dev /data0

#### Hive/Tez

By default our HDP launch scripts will format the underlying filesystem
as Ext4, no additional steps are required.

### Launching Hive and Tez Clusters 

This command will launch and configure the specified number of slaves in
addition to a Master and an Ambari host.

              $> AWS_ACCESS_KEY_ID=[AWS ID] AWS_SECRET_ACCESS_KEY=[AWS SECRET]
              ./prepare-hdp.sh --slaves=N --key-pair=[INSTANCE KEYPAIR]
              --identity-file=[SSH PRIVATE KEY] --instance-type=[INSTANCE TYPE]
              launch [CLUSTER NAME]

Once complete, it will report both the internal and external hostnames
of each node.

1.  SSH into the Ambari node as root and run `ambari-server start`
2.  Visit port 8080 of the Ambari node and login as admin to begin
    cluster setup.
3.  When prompted to enter hosts, you must use the interal EC2
    hostnames.
4.  Install all services and take care to install all master services on
    the node designated as master by the setup script.
5.  This installation should take 10-20 minutes. Load the benchmark data
    once it is complete.

To install Tez on this cluster, use the following command. It will
remove the ability to use normal Hive.

        $> ./prepare-benchmark.sh --hive-tez --hive-host [MASTER REPORTED BY SETUP
        SCRIPT] --hive-identity-file [SSH PRIVATE KEY]

### Loading Benchmark Data 

Scripts for preparing data are included in the [benchmark github
repo](https://github.com/amplab/benchmark.git). Use the provided
`prepare-benchmark.sh` to load an appropriately sized dataset into the
cluster. \
\
 `./prepare-benchmark.sh --help`

Here are a few examples showing the options used in this benchmark

+-------------------------+-------------------------+-------------------------+
| Redshift                | Shark                   | Impala/Hive             |
+=========================+=========================+=========================+
|     $> ./prepare-benchm |     $> ./prepare-benchm |     $> ./prepare-benchm |
| ark.sh                  | ark.sh                  | ark.sh                  |
|       --redshift        |       --shark           |       --impala          |
|       --aws-key-id=[AWS |       --aws-key-id=[AWS |       --aws-key-id=[AWS |
|  KEY ID]                |  KEY ID]                |  KEY ID]                |
|       --aws-key=[AWS KE |       --aws-key=[AWS KE |       --aws-key=[AWS KE |
| Y]                      | Y]                      | Y]                      |
|       --redshift-userna |       --shark-host=[SHA |       --impala-host=[NA |
| me=[USERNAME]           | RK MASTER]              | ME NODE]                |
|       --redshift-passwo |       --shark-identity- |       --impala-identity |
| rd=[PASSWORD]           | file=[IDENTITY FILE]    | -file=[IDENTITY FILE]   |
|       --redshift-host=[ |       --scale-factor=5  |       --scale-factor=5  |
| ODBC HOST]              |       --file-format=tex |       --file-format=seq |
|       --redshift-databa | t-deflate               | uence-snappy            |
| se=[DATABASE]           |                         |                         |
|       --scale-factor=5  |                         |                         |
+-------------------------+-------------------------+-------------------------+
|     $> ./run-query.sh   |     $> ./run-query.sh   |     $> ./run-query.sh   |
|     --redshift          |     --shark             |     --impala            |
|     --redshift-username |     --shark-host=[SHARK |     --impala-hosts=[COM |
| =[USERNAME]             |  MASTER]                | MA SEPARATED LIST OF IM |
|     --redshift-password |     --shark-identity-fi | PALA NODES]             |
| =[PASSWORD]             | le=[IDENTITY FILE]      |     --impala-identity-f |
|     --redshift-host=[OD |     --query-num=[QUERY  | ile=[IDENTITY FILE]     |
| BC HOST]                | NUM]                    |     --query-num=[QUERY  |
|     --redshift-database |                         | NUM]                    |
| =[DATABASE]             |                         |                         |
|     --query-num=[QUERY  |                         |                         |
| NUM]                    |                         |                         |
+-------------------------+-------------------------+-------------------------+

Hive/Tez

    $> ./prepare-benchmark.sh
    --hive
    --hive-host [MASTER REPORTED BY SETUP SCRIPT]
    --hive-slaves [COMMA SEPARATED LIST OF SLAVES]
    --hive-identity-file [SSH PRIVATE KEY]
    -d [AWS ID]
    -k [AWS SECRET]
    --file-format=sequence-snappy
    --scale-factor=5