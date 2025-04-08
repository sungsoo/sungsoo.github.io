---
layout: post
title: Apache Tajo™ 0.8.0 Configuration
date: 2014-05-04
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Apache Tajo™ 0.8.0 Documentation](http://tajo.apache.org/docs/0.8.0/configuration.html)

[![](http://sungsoo.github.com/images/tajo-documentation.png)](http://sungsoo.github.com/images/tajo-documentation.png)

# Preliminary
## catalog-site.xml and tajo-site.xml
Tajo’s configuration is based on Hadoop’s configuration system. Tajo uses two config files:

* catalog-site.xml - configuration for the catalog server.
* tajo-site.xml - configuration for other tajo modules.

Each config consists of a pair of a name and a value. If you want to set the config name `a.b.c` with the value `123`, add the following element to an appropriate file.

```xml
<property>
  <name>a.b.c</name>
  <value>123</value>
</property>
```

Tajo has a variety of internal configs. If you don’t set some config explicitly, the default config will be used for for that config. Tajo is designed to use only a few of configs in usual cases. You may not be concerned with the configuration.

In default, there is no tajo-site.xml in `${TAJO}/conf` directory. If you set some configs, first copy `$TAJO_HOME/conf/tajo-site.xml.templete` to `tajo-site.xml`. Then, add the configs to your tajo-site.

## tajo-env.sh
tajo-env.sh is a shell script file. The main purpose of this file is to set shell environment variables for TajoMaster and TajoWorker java program. So, you can set some variable as follows:

	VARIABLE=value
	
If a value is a literal string, type this as follows:

	VARIABLE='value'
	
# Cluster Setup
## Fully Distributed Mode
A fully distributed mode enables a Tajo instance to run on [Hadoop Distributed File System (HDFS)](http://wiki.apache.org/hadoop/HDFS). In this mode, a number of Tajo workers run across a number of the physical nodes where HDFS data nodes run.

In this section, we explain how to setup the cluster mode.

## Settings
Please add the following configs to tajo-site.xml file:

```xml
<property>
  <name>tajo.rootdir</name>
  <value>hdfs://hostname:port/tajo</value>
</property>
<property>
  <name>tajo.master.umbilical-rpc.address</name>
  <value>hostname:26001</value>
</property>
<property>
  <name>tajo.master.client-rpc.address</name>
  <value>hostname:26002</value>
</property>
<property>
  <name>tajo.catalog.client-rpc.address</name>
  <value>hostname:26005</value>
</property>
```

## Workers
The file `conf/workers` lists all host names of workers, one per line. By default, this file contains the single entry `localhost`. You can easily add host names of workers via your favorite text editor.

For example:

	$ cat > conf/workers
	host1.domain.com
	host2.domain.com
	....

	<ctrl + d>

## Make base directories and set permissions
If you want to know Tajo’s configuration in more detail, see Configuration page. Before launching the tajo, you should create the tajo root dir and set the permission as follows:

	$ $HADOOP_HOME/bin/hadoop fs -mkdir       /tajo
	$ $HADOOP_HOME/bin/hadoop fs -chmod g+w   /tajo

## Launch a Tajo cluster
Then, execute start-tajo.sh

	$ $TAJO_HOME/bin/start-tajo.sh

### Note

In default, each worker is set to very little resource capacity. In order to increase parallel degree, please read [*Worker Configuration*](http://tajo.apache.org/docs/0.8.0/configuration/worker_configuration.html).

### Note

In default, TajoMaster listens on 127.0.0.1 for clients. To allow remote clients to access TajoMaster, please set tajo.master.client-rpc.address config to tajo-site.xml. In order to know how to change the listen port, please refer [*Configuration Defaults*](http://tajo.apache.org/docs/0.8.0/configuration/configuration_defaults.html).

# Tajo Master Configuration
## Tajo Rootdir
Tajo uses HDFS as a primary storage layer. So, one Tajo cluster instance should have one tajo rootdir. A user is allowed to specific your tajo rootdir as follows:

```xml
<property>
  <name>tajo.rootdir</name>
  <value>hdfs://namenode_hostname:port/path</value>
</property>
```

Tajo rootdir must be a url form like `scheme://hostname:port/path`. The current implementaion only supports `hdfs://` and `file://` schemes. The default value is `file:///tmp/tajo-${user.name}/`.

## TajoMaster Heap Memory Size
The environment variable TAJO_MASTER_HEAPSIZE in conf/tajo-env.sh allow Tajo Master to use the specified heap memory size.

If you want to adjust heap memory size, set `TAJO_MASTER_HEAPSIZE` variable in `conf/tajo-env.sh` with a proper size as follows:

	TAJO_MASTER_HEAPSIZE=2000
	
The default size is 1000 (1GB).	

# Worker Configuration
## Worker Heap Memory Size
The environment variable `TAJO_WORKER_HEAPSIZE` in `conf/tajo-env.sh` allow Tajo Worker to use the specified heap memory size.

If you want to adjust heap memory size, set `TAJO_WORKER_HEAPSIZE` variable in `conf/tajo-env.sh` with a proper size as follows:

	TAJO_WORKER_HEAPSIZE=8000
	
The default size is 1000 (1GB).

## Temporary Data Directory
TajoWorker stores temporary data on local file system due to out-of-core algorithms. It is possible to specify one or more temporary data directories where temporary data will be stored.

`tajo-site.xml`

```xml
<property>
  <name>tajo.worker.tmpdir.locations</name>
  <value>/disk1/tmpdir,/disk2/tmpdir,/disk3/tmpdir</value>
</property>
```

## Maximum number of parallel running tasks for each worker
In Tajo, the capacity of running tasks in parallel are determined by available resources and workload of running queries. In order to specify it, please see [Worker Resources] (#ResourceConfiguration) section.

<a name="ResourceConfiguration"></a>
## Worker Resources
Each worker can execute multiple tasks simultaneously. In Tajo, users can specify the total size of memory and the number of disks for each worker. Available resources affect how many tasks are executed simultaneously.

In order to specify the resource capacity of each worker, you should add the following configs to `tajo-site.xml`.

<table border="1" class="docutils">
<colgroup>
<col width="32%" />
<col width="25%" />
<col width="18%" />
<col width="24%" />
</colgroup>
<thead valign="bottom">
<tr class="row-odd"><th class="head">property name</th>
<th class="head">description</th>
<th class="head">value type</th>
<th class="head">default value</th>
</tr>
</thead>
<tbody valign="top">
<tr class="row-even"><td>tajo.worker.resource.cpu-cores</td>
<td>the number of cpu cores</td>
<td>integer</td>
<td>1</td>
</tr>
<tr class="row-odd"><td>tajo.worker.resource.memory-mb</td>
<td>memory size (MB)</td>
<td>integer</td>
<td>1024</td>
</tr>
<tr class="row-even"><td>tajo.worker.resource.disks</td>
<td>the number of disks</td>
<td>integer</td>
<td>1</td>
</tr>
</tbody>
</table>

### Note

Currently, QueryMaster requests 512MB memory and 1.0 disk per task for the backward compatibility.
Example
Assume that you want to give 5120 MB memory, 6.0 disks, and 24 cores on each worker. The example configuration is as follows:

`tajo-site.xml`

```xml
<property>
  <name>tajo.worker.resource.tajo.worker.resource.cpu-cores</name>
  <value>24</value>
</property>
<property>
  <name>tajo.worker.resource.memory-mb</name>
  <value>5120</value>
</property>
<property>
  <name>tajo.worker.resource.tajo.worker.resource.disks</name>
  <value>6.0</value>
</property>
```

## Dedicated Mode

Tajo provides a dedicated mode that allows each worker in a Tajo cluster to use whole available system resources including cpu-cores, memory, and disks. For this mode, a user should add the following config to tajo-site.xml :

```xml
<property>
  <name>tajo.worker.resource.dedicated</name>
  <value>true</value>
</property>
```

In addition, it can limit the memory capacity used for Tajo worker as follows:


<table border="1" class="docutils">
<colgroup>
<col width="34%" />
<col width="35%" />
<col width="14%" />
<col width="17%" />
</colgroup>
<thead valign="bottom">
<tr class="row-odd"><th class="head">property name</th>
<th class="head">description</th>
<th class="head">value type</th>
<th class="head">default value</th>
</tr>
</thead>
<tbody valign="top">
<tr class="row-even"><td>tajo.worker.resource.dedicated-memory-ratio</td>
<td>how much memory to be used in whole memory</td>
<td>float</td>
<td>0.8</td>
</tr>
</tbody>
</table>


# Catalog Configuration
If you want to customize the catalog service, copy `$TAJO_HOME/conf/catalog-site.xml.template` to `catalog-site.xml`. Then, add the following configs to `catalog-site.xml`. Note that the default configs are enough to launch Tajo cluster in most cases.

* tajo.catalog.master.addr - If you want to launch a Tajo cluster in distributed mode, you must specify this address. For more detail information, see [Default Ports](#DefaultPorts).
* tajo.catalog.store.class - If you want to change the persistent storage of the catalog server, specify the class name. Its default value is tajo.catalog.store.DerbyStore. In the current version, Tajo provides three persistent storage classes as follows:

<table border="1" class="docutils">
<colgroup>
<col width="42%" />
<col width="58%" />
</colgroup>
<thead valign="bottom">
<tr class="row-odd"><th class="head">Driver Class</th>
<th class="head">Descriptions</th>
</tr>
</thead>
<tbody valign="top">
<tr class="row-even"><td>tajo.catalog.store.DerbyStore</td>
<td>this storage class uses Apache Derby.</td>
</tr>
<tr class="row-odd"><td>tajo.catalog.store.MySQLStore</td>
<td>this storage class uses MySQL.</td>
</tr>
<tr class="row-even"><td>tajo.catalog.store.MemStore</td>
<td>this is the in-memory storage. It is only used
in unit tests to shorten the duration of unit
tests.</td>
</tr>
<tr class="row-odd"><td>tajo.catalog.store.HCatalogStore</td>
<td>this storage class uses HiveMetaStore.</td>
</tr>
</tbody>
</table>



# MySQLStore Configuration 

In order to use MySQLStore, you need to create database and user on MySQL for Tajo.

	mysql> create user 'tajo'@'localhost' identified by 'xxxxxx';
	Query OK, 0 rows affected (0.00 sec)

	mysql> create database tajo;
	Query OK, 1 row affected (0.00 sec)

	mysql> grant all on tajo.* to 'tajo'@'localhost';
	Query OK, 0 rows affected (0.01 sec)

And then, you need to prepare MySQL JDBC driver on the machine which can be ran TajoMaster. If you do, you should set `TAJO_CLASSPATH` variable in `conf/tajo-env.sh` with it as follows:

	export TAJO_CLASSPATH=/usr/local/mysql/lib/mysql-connector-java-x.x.x.jar

Or you just can copy jdbc driver into `$TAJO_HOME/lib`.

Finally, you should add the following config to *conf/catalog-site.xml*.

```xml
<property>
  <name>tajo.catalog.store.class</name>
  <value>org.apache.tajo.catalog.store.MySQLStore</value>
</property>
<property>
  <name>tajo.catalog.jdbc.connection.id</name>
  <value><mysql user name></value>
</property>
<property>
  <name>tajo.catalog.jdbc.connection.password</name>
  <value><mysql user password></value>
</property>
  <property>
  <name>tajo.catalog.jdbc.uri</name>
  <value>jdbc:mysql://<mysql host name>:<mysql port>/<database name for tajo>?createDatabaseIfNotExist=true</value>
</property>
```

## HCatalogStore Configuration
Tajo support HCatalogStore to integrate with hive. If you want to use HCatalogStore, you just do as follows.

First, you must compile source code and get a binary archive as follows:

```
$ git clone https://git-wip-us.apache.org/repos/asf/tajo.git tajo
$ mvn clean package -DskipTests -Pdist -Dtar -Phcatalog-0.1x.0
$ ls tajo-dist/target/tajo-0.8.0-SNAPSHOT.tar.gz
```

Tajo support to build based on hive 0.11.0 and hive 0.12.0. If you use hive 0.11.0, you have to set `-Phcatalog-0.11.0`. And if you use hive 0.12.0, you have to set `-Phcatalog-0.12.0`.

Second, you must set your hive home directory to `HIVE_HOME` variable in `conf/tajo-env.sh` with it as follows:

	export HIVE_HOME=/path/to/your/hive/directory

Third, if you need to use jdbc to connect HiveMetaStore, you have to prepare mysql jdbc driver on host which can be ran TajoMaster. If you prepare it, you should set jdbc driver file path to `HIVE_JDBC_DRIVER_DIR` variable in `conf/tajo-env.sh` with it as follows:

	export HIVE_JDBC_DRIVER_DIR=/path/to/your/mysql_jdbc_driver/mysql-connector-java-x.x.x-bin.jar

Lastly, you should add the following config to conf/catalog-site.xml :

```xml
<property>
  <name>tajo.catalog.store.class</name>
  <value>org.apache.tajo.catalog.store.HCatalogStore</value>
</property>
```

# Configuration Defaults
## Tajo Master Configuration Defaults

<table border="1" class="docutils">
<colgroup>
<col width="24%" />
<col width="53%" />
<col width="9%" />
<col width="13%" />
</colgroup>
<thead valign="bottom">
<tr class="row-odd"><th class="head">Service Name</th>
<th class="head">Config Property Name</th>
<th class="head">Description</th>
<th class="head">default address</th>
</tr>
</thead>
<tbody valign="top">
<tr class="row-even"><td>Tajo Master Umbilical Rpc</td>
<td>tajo.master.umbilical-rpc.address</td>
<td>&nbsp;</td>
<td>localhost:26001</td>
</tr>
<tr class="row-odd"><td>Tajo Master Client Rpc</td>
<td>tajo.master.client-rpc.address</td>
<td>&nbsp;</td>
<td>localhost:26002</td>
</tr>
<tr class="row-even"><td>Tajo Master Info Http</td>
<td>tajo.master.info-http.address</td>
<td>&nbsp;</td>
<td>0.0.0.0:26080</td>
</tr>
<tr class="row-odd"><td>Tajo Catalog Client Rpc</td>
<td>tajo.catalog.client-rpc.address</td>
<td>&nbsp;</td>
<td>localhost:26005</td>
</tr>
</tbody>
</table>


## Tajo Worker Configuration Defaults

<table border="1" class="docutils">
<colgroup>
<col width="24%" />
<col width="53%" />
<col width="9%" />
<col width="13%" />
</colgroup>
<thead valign="bottom">
<tr class="row-odd"><th class="head">Service Name</th>
<th class="head">Config Property Name</th>
<th class="head">Description</th>
<th class="head">default address</th>
</tr>
</thead>
<tbody valign="top">
<tr class="row-even"><td>Tajo Worker Peer Rpc</td>
<td>tajo.worker.peer-rpc.address</td>
<td>&nbsp;</td>
<td>0.0.0.0:28091</td>
</tr>
<tr class="row-odd"><td>Tajo Worker Client Rpc</td>
<td>tajo.worker.client-rpc.address</td>
<td>&nbsp;</td>
<td>0.0.0.0:28092</td>
</tr>
<tr class="row-even"><td>Tajo Worker Info Http</td>
<td>tajo.worker.info-http.address</td>
<td>&nbsp;</td>
<td>0.0.0.0:28080</td>
</tr>
</tbody>
</table>