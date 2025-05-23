---
layout: post
title: Running Hadoop MapReduce on Tachyon
date: 2015-11-08
categories: [computer science]
tags: [big data]

---

* Title: [Running Hadoop MapReduce on Tachyon](https://github.com/amplab/tachyon/wiki/Running-Hadoop-MapReduce-on-Tachyon)
* Authors: Haoyuan Li, AMPLab

---

Running Hadoop MapReduce on Tachyon
============


This guide describes how to get Tachyon running with Hadoop MapReduce,
so that one can use their MapReduce programs with files stored on
Tachyon with relative ease.

## Prerequisites

The prerequisite for this part is that you have [Java
7](https://github.com/amplab/tachyon/wiki/Java-setup/). We also assume
that the user is running on Tachyon 0.3.0 or later and have set up
Tachyon and Hadoop in accordance to these guides [Local
Mode](https://github.com/amplab/tachyon/wiki/Running-Tachyon-Locally) or [Cluster
Mode](https://github.com/amplab/tachyon/wiki/Running-Tachyon-on-a-Cluster)

Ensure that the `hadoop/conf/core-site.xml` file in your Hadoop
installation's conf directory has the following property added:

```xml
    <property>
      <name>fs.tachyon.impl</name>
      <value>tachyon.hadoop.TFS</value>
    </property>
```

This will allow for your MapReduce jobs to use Tachyon for its input and
output files. If you are using HDFS as the underlying store for Tachyon,
it may be necessary to add this property to the `hdfs-site.xml` conf
file as well.

## Distributing Tachyon Executables

In order for the MapReduce job to be able to use files via Tachyon, we
will need to distribute the Tachyon jar amongst all the nodes in the
cluster. This will allow the TaskTracker and JobClient to have all the
requisite executables to interface with Tachyon.

We are presented with three options that for distributing the jars as
outlined by this
[guide](http://blog.cloudera.com/blog/2011/01/how-to-include-third-party-libraries-in-your-map-reduce-job/)
from Cloudera.

Assuming that Tachyon will be used prominently, it is best to ensure
that the Tachyon jar will permanently reside on each node, so that we do
not rely on the Hadoop DistributedCache to avoid the network costs of
distributing the jar for each job (Option 1), and don't significantly
increase our job jar size by packaging Tachyon with it (Option 2). For
this reason, of the three options laid out, it is recommended to highly
consider the third route, by installing the Tachyon jar on each node.

-   For installing Tachyon on each node, one must place the
    `tachyon-0.3.0-jar-with-dependencies.jar`, located in the
    `tachyon/target` directory, in the `$HADOOP_HOME/lib` directory of
    each node, and then restart all of the TaskTrackers. One downfall of
    this approach is that the jars must be installed again for each
    update to a new release.

-   One may also run a job by using the `-libjars` command line option
    when using `hadoop jar...`, and specifying
    `/path/to/tachyon/target/tachyon-0.3.0-jar-with-dependencies.jar` as
    the argument. This will place the jar in the Hadoop
    DistributedCache, and is desirable only if one is updating the
    Tachyon jar a non-trivial amount of times.

-   For those interested in the second option, please revisit the
    Cloudera guide for more assistance. One must simply package the
    Tachyon jar in the `lib` subdirectory of the job jar. This option is
    however most undesirable as for every change in Tachyon, we must
    recreate the job jar, and incurs a network cost for every job by
    increasing the size of the job jar.

In order to make the Tachyon executables available to the JobClient, one
can also install the Tachyon jar in the `$HADOOP_HOME/lib` directory, or
modify `HADOOP_CLASSPATH` by changing `hadoop-env.sh` to:

    $ export HADOOP_CLASSPATH=/path/to/tachyon/target/tachyon-0.3.0-jar-with-dependencies.jar

This will allow the code that creates the Job and submits it to
reference Tachyon if necessary.

## Example

For simplicity, we will assume a psuedo-distributed Hadoop cluster.

    $ cd $HADOOP_HOME
    $ ./bin/stop-all.sh
    $ ./bin/start-all.sh

Because we have a psuedo-distributed cluster, by copying the Tachyon jar
into `$HADOOP_HOME/lib`, this makes the Tachyon executables available to
both the TaskTrackers and the JobClient. We can now verify that it is
working by the following:

    $ cd $HADOOP_HOME
    $ ./bin/hadoop jar hadoop-examples-1.0.4.jar wordcount -libjars /path/to/tachyon-dev/target/tachyon-0.3.0-jar-with-dependencies.jar tachyon://localhost:19998/X tachyon://localhost:19998/X-wc

Where X is some file on Tachyon and, the results of the wordcount job is
in the X-wc directory.

For example, you have text files in HDFS directory
`/user/hduser/gutenberg/`. You can run the following:

    $ cd $HADOOP_HOME
    $ ./bin/hadoop jar hadoop-examples-1.0.4.jar wordcount -libjars /path/to/tachyon-dev/target/tachyon-0.3.0-jar-with-dependencies.jar tachyon://localhost:19998/user/hduser/gutenberg /user/hduser/output

Thus, the above command tell the wordcount to load the files from HDFS
directory `/user/hduser/gutenberg/` to Tachyon and then save the output
result to HDFS `/user/hduser/output/`

