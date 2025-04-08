---
layout: post
title: Spark Cluster Configuration
date: 2015-10-21
categories: [computer science]
tags: [big data]

---


# Spark Cluster Configuration

## Description ##
 Very simple Spark cluster configuration with Vagrant. I used [standalone cluster configuration](https://spark.apache.org/docs/latest/cluster-overview.html). There are two virtual marchines.

  * Spark master
    - IP : 192.168.18.31
    - Web UI: ```http://localhost:8080/```
    - It has a worker service too.
  * Spark slave
   - IP : 192.168.18.31
   - It has a worker service.

## How to run ##

 1. Run ```vagrant up```
 2. Connect master VM by ```vagrant ssh spark_master```
 3. Launch http://localhost:8080/
 4. Run the command below.

```
 $> spark-submit --master spark://192.168.18.31:7077  /home/vagrant/spark/examples/src/main/python/pi.py

```

 5. Watch Web UI what's going on.


## Test for Spark cluster ##

### Run python code in cluster. ###

```
 $> spark-submit --master spark://192.168.18.31:7077 /master/rdd_test.py
```

### Run python code with numpy or scipy in cluster. ###

 Spark master copies libraries to cllient automatically. So **Don't need to worry to deploy python libraries into client node.**  Just install python library on Spark master only.

```
#Numpy example
 $> spark-submit --master spark://192.168.18.31:7077 /master/numpy_example.py

#Scipy example
 $> spark-submit --master spark://192.168.18.31:7077 /master/scipy_example.py"

```

### Run python code with external execution file in cluster.  ###

 Spark can run external execution file in cluster. Then we sholud send external execution file by using ```addFile()```. See the ```external_exe_example.py``` in project.


```
 #Compile C code. Numpy example
  $> gcc sum_of_number.c -o sum_of_number #It sums the numbers in argument.

 #Run script
  $> spark-submit --master spark://192.168.18.31:7077 /master/external_exe_example.py"

```


## More Info ##

* I just configured servers in public network for learning. ** NEVER CONFIGURE SERVER LIKE IT FOR REAL SERVICE.** .
* I used pre-built Spark to save time. It can miss several package. So you should build Spark if you need full features of Spark.