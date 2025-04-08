---
layout: post
title: Facebook Presto
date: 2014-03-05 
categories: [computer science]
tags: [big data]

---


# Presto

Presto is a *distributed SQL query engine* for big data.

See the [User Manual](http://prestodb.io/docs/current/) for deployment instructions and end user documentation.

WHAT IS PRESTO?
---

Presto is an open source distributed SQL query engine for running *interactive analytic queries* against data sources of all sizes ranging from gigabytes to petabytes.

Presto was designed and written from the ground up for interactive analytics and approaches the speed of commercial data warehouses while scaling to the size of organizations like Facebook.

WHAT CAN IT DO?
---

Presto allows querying data where it lives, including Hive, HBase, relational databases or even proprietary data stores. A single Presto query can combine data from multiple sources, allowing for analytics across your entire organization.

Presto is targeted at analysts who expect response times ranging from sub-second to minutes. Presto breaks the false choice between having *fast analytics* using an expensive commercial solution or using a slow "free" solution that requires excessive hardware.

WHO USES IT?
---

Facebook uses Presto for interactive queries against several internal data stores, including their 300PB data warehouse. Over 1,000 Facebook employees use Presto daily to run more than 30,000 queries that in total scan over a petabyte each per day.

Leading internet companies including Airbnb and Dropbox are using Presto.

> Presto is amazing. Lead engineer Andy Kramolisch got it into production in just a few days. It's an order of magnitude faster than Hive in most our use cases. It reads directly from HDFS, so unlike Redshift, there isn't a lot of ETL before you can use it. It just works.  
- Christopher Gutierrez, Manager of Online Analytics, Airbnb

---

> We're really excited about Presto. We're planning on using it to quickly gain insight about the different ways our users use Dropbox, as well as diagnosing problems they encounter along the way. In our tests so far it's been rock solid and extremely fast when applied to some of our most important ad hoc use cases.  
- Fred Wulff, Software Engineer, Dropbox

Requirements
---

* Mac OS X or Linux
* Java 7, 64-bit
* Maven 3 (for building)
* Python 2.4+ (for running with the launcher script)

Building Presto
---

Presto is a standard Maven project. Simply run the following command from the project root directory:

    mvn clean install

On the first build, Maven will download all the dependencies from the internet and cache them in the local repository (`~/.m2/repository`), which can take a considerable amount of time. Subsequent builds will be faster.

Presto has a comprehensive set of unit tests that can take several minutes to run. You can disable the tests when building:

    mvn clean install -DskipTests

Running Presto in your IDE
---

Overview
---

After building Presto for the first time, you can load the project into your IDE and run the server. We recommend using [IntelliJ IDEA](http://www.jetbrains.com/idea/). Because Presto is a standard Maven project, you can import it into your IDE using the root `pom.xml` file. In IntelliJ, choose Open Project from the Quick Start box or choose Open from the File menu and select the root `pom.xml` file.

After opening the project in IntelliJ, double check that the Java SDK is properly configured properly for the project:

* Open the File menu and select Project Structure
* In the SDKs section, ensure that a 1.7 JDK is selected (create one if none exist)
* In the Project section, ensure the Project language level is set to 7.0 as Presto makes use of several Java 7 language features

Presto comes with sample configuration that should work out-of-the-box for development. Use the following options to create a run configuration:

* Main Class: `com.facebook.presto.server.PrestoServer`
* VM Options: `-ea -Xmx2G -Dconfig=etc/config.properties -Dlog.levels-file=etc/log.properties`
* Working directory: `$MODULE_DIR$`
* Use classpath of module: `presto-server`

The working directory should be the `presto-server` subdirectory. In IntelliJ, using `$MODULE_DIR$` accomplishes this automatically.

Additionally, the Hive plugin must be configured with location of your Hive metastore Thrift service. Add the following to the list of VM options, replacing `localhost:9083` with the correct host and port (or use the below value if you do not have a Hive metastore):

    -Dhive.metastore.uri=thrift://localhost:9083

Using SOCKS for Hive or HDFS
---

If your Hive metastore or HDFS cluster is not directly accessible to your local machine, you can use SSH port forwarding to access it. Setup a dynamic SOCKS proxy with SSH listening on local port 1080:

    ssh -v -N -D 1080 server

Then add the following to the list of VM options:

    -Dhive.metastore.thrift.client.socks-proxy=localhost:1080

Using HDFS with Federation
---

If your Hive metastore references files stored on a federated HDFS, you should provide your HDFS config files as a VM option:

    -Dhive.config.resources=/etc/hadoop/conf/core-site.xml,/etc/hadoop/conf/hdfs-site.xml

Running the CLI
---

Start the CLI to connect to the server and run SQL queries:

    presto-cli/target/presto-cli-*-executable.jar

Run a query to see the nodes in the cluster:

    SELECT * FROM sys.node;

In the sample configuration, the Hive connector is mounted in the `hive` catalog, so you can run the following queries to show the tables in the Hive database `default`:

    SHOW TABLES FROM hive.default;

# Contributing to Presto

Contributor License Agreement ("CLA")
---

In order to accept your pull request, we need you to submit a CLA. You only need to do this once, so if you've done this for another Facebook open source project, you're good to go. If you are submitting a pull request for the first time, just let us know that you have completed the CLA and we can cross-check with your GitHub username.

Complete your CLA here: <https://developers.facebook.com/opensource/cla>

License
---

By contributing to Presto, you agree that your contributions will be licensed under the [Apache License Version 2.0 (APLv2)](LICENSE).

References
---
[1] [*Presto; Distributed SQL Query Engine for Big Data*](http://prestodb.io), Facebook, 2013  
[2] [*Presto 0.60 Documentation*](http://prestodb.io/docs/current/), Facebook, 2013.





