---
layout: post
title: Hadoop 2.4.0 Installation on Mac OS X Mavericks
date: 2014-06-11
categories: [computer science]
tags: [big data, data management]

---

[![](http://sungsoo.github.com/images/hate-big-data.png)](http://sungsoo.github.com/images/hate-big-data.png)

---

# How to setup Hadoop 2.4.0 on Mac OS X 10.9 Mavericks 



Brief
-----

Hadoop is an open-source Apache project that enables processing of
extremely large datasets in a distributed computing environment. It can
be run in three different modes:

### Standalone Mode

Hadoop runs everything in a single JVM with no daemons. This mode is
only suitable for testing and debugging MapReduce programs during
development.

### Pseudodistributed Mode

Hadoop daemons run on the local machine, simulating a small cluster.

### Fully Distributed Mode

Hadoop daemons run on a cluster of machines.

This tutorial covers setting up Hadoop 2.4.0 stable in
a *Pseudodistributed Mode***. **Before getting started with the
 installation and configuration of Hadoop, there are some
 prerequisites.

Requirements
------------

**Java** version 1.6.* or higher is required for Hadoop. Running the
following command will prompt you for installation if you don’t already
have Java installed:

```
KIWI-GDEF@:~ sungsoo$ java -version
java version "1.7.0_51"
Java(TM) SE Runtime Environment (build 1.7.0_51-b13)
Java HotSpot(TM) 64-Bit Server VM (build 24.51-b03, mixed mode)
```

**Homebrew**. Though we can go without it, Homebrew will make installing
Hadoop on a Mac significantly easier:

```
KIWI-GDEF@:~ sungsoo$ ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
```

Remote Login Setting
---

check "Remote Login" of "Sharing" in System Preference.

![](http://sungsoo.github.com/images/remotelogin.png)

**SSH keys.**First, ensure Remote Login under System Preferences ->
Sharing is checked to enable SSH. If you have SSH keys already setup,
ssh into your localhost machine. If you don’t, set those bad boys up:

	KIWI-GDEF@:~ sungsoo$ ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa

To authorize your public key and avoid being asked for a password every
time you ssh into localhost:

	KIWI-GDEF@:~ sungsoo$ cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys

Now ssh into your localhost and allow authorization

	KIWI-GDEF@:~ sungsoo$ ssh localhost


Installation
------------

First, you should download [Hadoop 2.4.0 distribution binary](http://apache.tt.co.kr/hadoop/common/hadoop-2.4.0/hadoop-2.4.0.tar.gz) from the [http://hadoop.apache.org/releases.html](http://hadoop.apache.org/releases.html) :

You can download [Hadoop 2.4.0 source](http://apache.tt.co.kr/hadoop/common/hadoop-2.4.0/hadoop-2.4.0-src.tar.gz) from the same site.
You want a specific version of
Hadoop, you may visit [http://hadoop.apache.org/releases.html](http://hadoop.apache.org/releases.html) and
download the release of your choice. Unpack the .tar to the location of
your choice and assign ownership to the user setting up Hadoop.

Then, copy the unpacked files to /usr/local/hadoop.

	KIWI-GDEF@:~ sungsoo$ cd /usr/local
	KIWI-GDEF@:~ sungsoo$ sudo mkdir hadoop
	KIWI-GDEF@:~ sungsoo$ sudo chown sungsoo hadoop

Settings in .bash_profile	
---

* export $HADOOP_HOME environment varaible in .bash_profle file.

```
	export $HADOOP_HOME=/usr/local/hadoop
```	
	
* set executable path for hadoop (/bin and /sbin).

```
	export PATH=./:/opt/local/bin:$HADOOP_HOME/sbin:$HADOOP_HOME/bin:$PATH:
```


Configuration
-------------

Every component of Hadoop is configured using an XML file specifically
located in *$HADOOP_HOME/etc/hadoop* . MapReduce
properties go in *mapred-site.xml*, HDFS properties in
*hdfs-site.xml*and common properties in *core-site.xml. *The general
Hadoop environment properties are found in *hadoop-env.sh*.

### **hadoop-env.sh**

Assuming Homebrew was used to install Hadoop, add the following line in
hadoop-env.sh after line

“# export HADOOP_OPTS=-server”

	export HADOOP_OPTS="-Djava.security.krb5.realm=OX.AC.UK -Djava.security.krb5.kdc=kdc0.ox.ac.uk:kdc1.ox.ac.uk"

 
If Homebrew was not used, you have to add the following line as well:

	export JAVA_HOME=/Library/Java/Home



### **core-site.xml**

Note: fs.default.name value is set to localhost currently for
development purposes. If you’re setting up multiple nodes on your
network, you will have to set the value to
hdfs://<ComputerName>.local:9000. To find out your computer name, go
to System Preferences -> Sharing. For the purpose of this tutorial, we
will stick to localhost to get a feel of Hadoop in Pseudodistributed
mode.

```xml
<configuration> 
	<property> 
		<name>hadoop.tmp.dir</name>
		<value>/usr/local/hadoop/tmp</value> 
		<description>A base for other temporary directories.</description> 
	</property> 
	<property>
		<name>fs.default.name</name>
		<value>hdfs://localhost:9000</value> 
	</property>
</configuration>
```

* make /usr/local/hadoop/tmp folder.

```
	KIWI-GDEF@:~ sungsoo$ cd /usr/local/hadoop
	KIWI-GDEF@:~ sungsoo$ sudo mkdir tmp	
	KIWI-GDEF@:~ sungsoo$ sudo chown sungsoo tmp
```

### **hdfs-site.xml**

The Hadoop Distributed File System properties go in this config file.
Since we are only setting up one node, we set the value of
dfs.replication to 1.

```xml
<configuration> 
	<property> 
		<name>dfs.replication</name>
		<value>1</value> 
	</property> 
</configuration>
```


### **mapred-site.xml**

The map-reduce config below sets the job tracker port connection port.

```xml
<configuration> 
	<property> 
		<name>mapred.job.tracker</name>
		<value>localhost:9001</value> 
	</property> 
</configuration>
```


 Almost Ready!
--------------

We must format the newly installed HDFS before we can start running the
daemons. Formatting creates an empty filesystem by creating storage
directories and initial metadata.

	$ hadoop namenode -format


Unleash the Daemons
-------------------

Make sure you are still ssh’d into localhost. You can start HDFS by:

	$ start-dfs.sh


and start YARN by:

	$ start-yarn.sh


or alternatively, start all:

	$ start-all.sh



You now have Hadoop installed! Try running an example!

	KIWI-GDEF@:~ sungsoo$ cd /usr/local/hadoop/libexec
	KIWI-GDEF@:~ sungsoo$ hadoop jar hadoop-examples-1.2.1.jar pi 10 100


Monitoring
-----------

You can monitor your NameNode and DataNode:

* Namenode Information : [http://localhost:50070](http://localhost:50070)



![](http://sungsoo.github.com/images/nodeinfo.png)


Finally, run the following command to stop all daemons:

	$ stop-dfs.sh
	$ stop-yarn.sh


