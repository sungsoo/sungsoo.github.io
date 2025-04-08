---
layout: post
title: Running a cluster of virtual machines with Hadoop
date: 2014-08-13
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Running a cluster of virtual machines with Hadoop (HDFS + YARN) v2.4.1 and Spark v1.0.1 using Vagrant](http://vangjee.wordpress.com/2014/08/03/running-a-cluster-of-hadoop-hdfs-yarn-v2-4-1-with-spark-v1-0-1-on-vagrant/)


Running a cluster of virtual machines with Hadoop (HDFS + YARN) v2.4.1 and Spark v1.0.1 using Vagrant
===

I was able to set up a cluster of virtual machines (VMs) running
[Hadoop](http://hadoop.apache.org/) v2.4.1 with HDFS and YARN as well as
[Spark](https://spark.apache.org/) v1.0.1. 

The cluster setup was possible using [Vagrant](http://www.vagrantup.com/) v1.5.1 and
[VirtualBox](https://www.virtualbox.org/) v4.3.10. The project is open
source using [Apache v2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html) and is
available at [GitHub](https://github.com/vangj/vagrant-hadoop-2.4.1-spark-1.0.1). 

I created this project for multiple reasons.

-   to learn about creating a cluster of VMs with Vagrant,
-   to have a sandbox with Hadoop (HDFS + YARN),
-   to have a sandbox with Spark, and
-   to AVOID having to download the sandbox VMs from Cloudera and
    Hortonworks (it takes forever to download these VMs; I, myself, was
    ever only able to finish downloading the CDH sandbox once, and yet,
    after 24+ hours, the file was corrupted; morever, these VMs are are
    standalone VMs and do not emulate the cluster environment).

To use this project you will need to install Vagrant and VirtualBox. You
will also need to install a git client to clone the project from GitHub.
After you have the above installed, then you can change into the cloned
directory and simply type in

``` 
vagrant up
```


 Out of the box, there will be four nodes created.

```
  ----------- -------------- ------------------------------------------ ---------------
  Node Name   HDFS Daemons   YARN Daemons                               Spark Daemons
  node1       NameNode       -                                          Master
  node2       -              ResourceManager, ProxyServer, JobHistory   -
  node3       DataNode       NodeManager                                Slave
  node4       DataNode       NodeManager                                Slave
  ----------- -------------- ------------------------------------------ ---------------
```

To add more slave nodes, modify Vagrantfile. Find this line.

``` 
numNodes = 4
```

And change it to something like this.

``` 
numNodes = 6
```

This will add 2 more slave nodes; slave in the context of HDFS is a
DataNode; slave in the context of YARN is a NodeManager; slave in the
context of Spark is a Spark slave. Adding more nodes will only increase
the slave nodes (NOT the master nodes).

The nodes have the following IP addresses.

-   node1 10.211.55.101
-   node2 10.211.55.102
-   node3 10.211.55.103
-   node4 10.211.55.104

I suppose you can modify Vagrantfile to have up to 155 nodes, but, each
node is configured to have 1 GB of RAM, so your tinkering will backfire
if you try to push the limits.

After Vagrant and the bash scripts help setup your cluster for you, you
need to initialize HDFS, start HDFS, start YARN, and start SPARK
manually. To initialize the NameNode, SSH into node1.

``` 
$HADOOP_PREFIX/bin/hdfs namenode -format myhadoop
```

To start the HDFS daemons, SSH into node1 and type in the following
commands.

``` 
$HADOOP_PREFIX/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start namenode
$HADOOP_PREFIX/sbin/hadoop-daemons.sh --config $HADOOP_CONF_DIR --script hdfs start datanode
```

To start the YARN daemons, SSH into node2 and type in the following
commands.

``` 
$HADOOP_YARN_HOME/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager
$HADOOP_YARN_HOME/sbin/yarn-daemons.sh --config $HADOOP_CONF_DIR start nodemanager
$HADOOP_YARN_HOME/sbin/yarn-daemon.sh start proxyserver --config $HADOOP_CONF_DIR
$HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh start historyserver --config $HADOOP_CONF_DIR
```

To start Spark in standalone mode, SSH into node1 and type in the
following command.

``` 
$SPARK_HOME/sbin/start-all.sh
```

That’s it, you know have a cluster of VMs running Hadoop (HDFS + YARN)
and Spark.

