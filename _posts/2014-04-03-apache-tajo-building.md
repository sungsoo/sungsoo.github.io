---
layout: post
title: Build Instructions for Apache Tajo 
date: 2014-04-03 
categories: [computer science]
tags: [big data]

---


Apache Tajo
========================
Tajo is a *relational* and *distributed data warehouse system* for Hadoop.
Tajo is designed for *low-latency* and *scalable ad-hoc queries*, *online
aggregation* and *ETL* on large-data sets by leveraging advanced database
techniques. It supports **SQL standards**. It has its own query engine which
allows *direct* control of distributed execution and data flow. As a result,
Tajo has a variety of *query evaluation strategies* and more optimization
opportunities. In addition, Tajo will have a native *columnar execution* and
and its *optimizer*.


# Build instructions for Tajo

### Requirements:

* Unix System
* JDK 1.6 or higher
* Maven 3.0 or higher
* Protocol Buffers 2.5.0
* Internet connection for first build (to fetch all Maven and Tajo dependencies)

---------

### Maven main modules:

  **tajo**                            **(Main Tajo project)**  

         - tajo-project           (Parent POM for all Tajo Maven modules. )  
                                  (All plugins & dependencies versions are defined here.)  
         - tajo-algebra  
         - tajo-catalog  
         - tajo-client  
         - tajo-common  
         - tajo-core  
         - tajo-docs  
         - tajo-jdbc  
         - tajo-project  
         - tajo-rpc  
         - tajo-storage  
         - tajo-dist              (Tajo distribution assembler)  

--------------

### Maven build goals:

 * Clean                     : mvn clean
 * Compile                   : mvn compile
 * Run tests                 : mvn test
 * Run integrating tests     : mvn verify
 * Create JAR                : mvn package
 * Run findbugs              : mvn compile findbugs:findbugs
 * Install JAR in M2 cache   : mvn install
 * Build distribution        : mvn package [-Pdist][-Dtar]

### Build options:
 
  * Use -Dtar to create a TAR with the distribution (using -Pdist)
  * Use -Dhadoop.version to build with the specific hadoop version (-Dhadoop.version=2.3.0)

### Tests options:
  * Use -DskipTests to skip tests when running the following Maven goals:
    'package',  'install', 'deploy' or 'verify'
  * -Dtest=<TESTCLASSNAME>,<TESTCLASSNAME#METHODNAME>,....
  * -Dtest.exclude=<TESTCLASSNAME>
  * -Dtest.exclude.pattern=**/<TESTCLASSNAME1>.java,**/<TESTCLASSNAME2>.java

---------

### Building distributions:

Create binary distribution

  $ mvn package -Pdist -DskipTests -Dtar

