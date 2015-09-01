---
layout: post
title: Setting up Hadoop 2.6 on Mac OS X Yosemite
date: 2015-09-01
categories: [computer science]
tags: [hadoop & mapreduce]

---


Setting up Hadoop 2.6 on Mac OS X Yosemite
==========================================

After comparing different guides on the internet, I ended up my own
version base on the Hadoop official guide with manual download. If you
prefer Homebrew, [this one would be your best
choice.](http://getblueshift.com/blog/setting-up-hadoop-2-4-and-pig-0-12-on-osx-locally/)
Actually there is no difference in the configuration of these two
methods except the file directories. Here I extend the official guide by
more details in case you need it.

Also, this guide is part of my [Hadoop tutorial
1](/hadoop-tutorial/hadoop-tutorial-1.html). It aims to setting up the
pseudo-distributed mode in single node cluster. And I will explain the
HDFS configurations and command lines in Hadoop tutorial 2.

1. Required software
--------------------

## 1) Java

Run the following command in a terminal:

    $ java -version

If Java is already installed, you can see a similar result like:

    $ java -version
    java version "1.8.0_25"
    Java(TM) SE Runtime Environment (build 1.8.0_25-b17)
    Java HotSpot(TM) 64-Bit Server VM (build 25.25-b02, mixed mode)

If not, the terminal will prompt you for installation or you can
[download Java JDK
here.](http://www.oracle.com/technetwork/java/javase/downloads/index.html)

## 2) SSH

First enable **Remote Login** in **System Preference -> Sharing**.

Now check that you can ssh to the localhost without a passphrase:

    $ ssh localhost

If you cannot ssh to localhost without a passphrase, execute the
following commands:

    $ ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
    $ cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys

2. Get a Hadoop distribution
----------------------------

You can download it from [Apache Download
Mirror.](http://www.apache.org/dyn/closer.cgi/hadoop/common/)

3. Prepare to start the Hadoop cluster
--------------------------------------

1) Unpack the downloaded Hadoop distribution.

2) Run the following command to figure out where is your Java home
directory:

    $ /usr/libexec/java_home

You can see a result like:

    $ /usr/libexec/java_home
    /Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home

3) In the distribution, edit the file **etc/hadoop/hadoop-env.sh** to
define some parameters as follows:

    # set to the root of your Java installation
    export JAVA_HOME={your java home directory}
    # set to the root of your Hadoop installation
    export HADOOP_PREFIX={your hadoop distribution directory}

4) Try the following command:

    $ cd {your hadoop distribution directory}
    $ bin/hadoop

This will display the usage documentation for the hadoop script.

Now you are ready to start your Hadoop cluster in one of the three
supported modes:

-   Standalone mode
-   Pseudo-distributed mode
-   fully-distributed mode

We will go through pseudo-distributed mode and run a MapReduce job on
YARN here. In this mode, Hadoop runs on a single node and each Hadoop
daemon runs in a separate Java process.

4. Configuration
----------------

Edit following config files in your Hadoop directory

1) etc/hadoop/core-site.xml:

    <configuration>
        <property>
            <name>fs.defaultFS</name>
            <value>hdfs://localhost:9000</value>
        </property>
    </configuration>

2) etc/hadoop/hdfs-site.xml:

    <configuration>
        <property>
            <name>dfs.replication</name>
            <value>1</value>
        </property>
    </configuration>

3) etc/hadoop/mapred-site.xml:

    <configuration>
        <property>
            <name>mapreduce.framework.name</name>
            <value>yarn</value>
        </property>
    </configuration>

4) etc/hadoop/yarn-site.xml:

    <configuration>
        <property>
            <name>yarn.nodemanager.aux-services</name>
            <value>mapreduce_shuffle</value>
        </property>
    </configuration>

5. Execution
------------

**1) Format and start HDFS and YARN**

    $ cd {your hadoop distribution directory}

Format the filesystem:

    $ bin/hdfs namenode -format

Start NameNode daemon and DataNode daemon:

    $ sbin/start-dfs.sh

Now you can browse the web interface for the NameNode at -
<http://localhost:50070/>

Make the HDFS directories required to execute MapReduce jobs:

    $ bin/hdfs dfs -mkdir /user
    $ bin/hdfs dfs -mkdir /user/{username} #make sure you add correct username here

Start ResourceManager daemon and NodeManager daemon:

    $ sbin/start-yarn.sh

Browse the web interface for the ResourceManager at -
<http://localhost:8088/>

**2) Test examples code that came with the hadoop version**

Copy the input files into the distributed filesystem:

    $ bin/hdfs dfs -put etc/hadoop input

Run some of the examples provided:

    $ bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.6.0.jar grep input output 'dfs[a-z.]+'

This example counts the words starting with "dfs" in the input.

Examine the output files:

Copy the output files from the distributed filesystem to the local
filesystem and examine them:

    $ bin/hdfs dfs -get output output
    $ cat output/*

or View the output files on the distributed filesystem:

    $ bin/hdfs dfs -cat output/*

You can see the result like:

    4 dfs.class
    4 dfs.audit.logger
    3 dfs.server.namenode.
    2 dfs.period
    2 dfs.audit.log.maxfilesize
    2 dfs.audit.log.maxbackupindex
    1 dfsmetrics.log
    1 dfsadmin
    1 dfs.servers
    1 dfs.replication
    1 dfs.file

**3) Stop YARN and HDFS**

When you're done, stop the daemons with:

    $ sbin/stop-yarn.sh
    $ sbin/stop-dfs.sh

