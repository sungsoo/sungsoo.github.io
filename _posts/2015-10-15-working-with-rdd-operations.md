---
layout: post
title: Working with RDD Operations
date: 2015-10-15
categories: [computer science]
tags: [big data]

---

# Working with RDD Operations


## Resilient Distributed Datasets (RDD)

The primary abstraction of Spark is RDD. Remember, there are two types of RDD operations: transformations and actions. Transformations return a pointer to the new RDD. Actions return the value of the operation. RDD transformations are lazy evaluations. This means nothing is processed until an action occurs. Each transformation updates the *direct acyclic graph (DAG)*, which is only executed after an action is called. Due to this inherent behavior, Spark’s applications are fault tolerant. The DAG can be used to rebuild the data within a node.

In this lab exercise, you will work with various RDD operations and learn some of the APIs from Scala and Python.


After completing this hands-on lab, you should be able to:

* Create a RDD froman external dataset

* View the Direct Acyclic Graph(DAG) of an RDD

* Work with various RDD operations including shared variables and key-value pairs

Allow 60 minutes to complete this section of lab.


## 1.1 Uploading files to the HDFS

Step 1. Open up a docker terminal. If you closed the terminal from the previous exercise, run the commands to start up the same bdu_spark container:


```
docker start bdu_spark 

docker attach bdu_spark
```

**Note:** If the docker terminal doesn't return back with a prompt, just hit the Enter key and the prompt should appear. 

Step 2. You'll need to start up the Hadoop service if you started a new terminal. 

```
/etc/bootstrap.sh 
```

**Note:** The Hadoop name node may be in safe mode. Exit the safe mode by entering in: 

```
hdfs dfsadmin -safemode leave 
```

Step 3. Copy a log file to the HDFS. You can copy the log file from the `/opt/ibm/labfiles/` into the HDFS or you can upload any log file that you like for this exercise. Type in this command to load and rename the log file name to something shorter such as sparkLog.out 

```
hdfs dfs –put /opt/ibm/labfiles/<log filename> input/tmp/sparkLog.out 
```

Step 4. You should have the README.md file already in your image if you continued with the bdu-spark container. If not, use this command to copy it in. 

```
hdfs dfs -put /opt/ibm/labfiles/README.md input/tmp 
```

Setp 5. Copy the CHANGES.txt file located from the /opt/ibm/labfiles directory to the HDFS as well, under "input/tmp" 

```
hdfs dfs -put /opt/ibm/labfiles/CHANGES.txt input/tmp 
```

Step 6. Verify that the files were copied over by doing a listing of the HDFS       

```
hdfs dfs -ls input/tmp/
```

## 1.2 RDD operations using Scala

### 1.2.1 Analyzing a log file 

Step 1. Start the Scala Spark shell:       

```
$SPARK_HOME/bin/spark-shell 
```

Step 2. Create a RDD by loading in that log file: 

```scala
val logFile = sc.textFile("input/tmp/sparkLog.out")
``` 

Step 3. Filter out the lines that contains INFO (or ERROR, if the particular log has it) 

```scala
val info = logFile.filter(line => line.contains("INFO")) 
```

Step 4. Count the lines:       

```scala
info.count()
``` 

Step 5. Count the lines with Spark in it by combining transformation and action. 

```scala
info.filter(line => line.contains("spark")).count() 
```

Step 6. Fetch those lines as an array of Strings 

```scala
info.filter(line => line.contains("spark")).collect()
``` 

Step 7. Remember that we went over the DAG. It is what provides the fault tolerance in Spark. Nodes can re-compute its state by borrowing the DAG from a neighboring node. You can view the graph of an RDD using the toDebugString command.       

```scala
info.toDebugString
```

**￼￼￼Note:** Occasionally, it may seem like the shell has not returned back the prompt. In that case, just hit the Enter key and the prompt will show back up. ￼

### 1.2.2 Joining RDDs

Step 8. Next, you are going to create RDDs for the README and the CHANGES file. 

```scala
val readmeFile = sc.textFile("input/tmp/README.md") 

val changesFile = sc.textFile("input/tmp/CHANGES.txt") 
```

Step 9. How many Spark keywords are in each file? 

```scala
readmeFile.filter(line => line.contains("Spark")).count() 

changesFile.filter(line => line.contains("Spark")).count()
``` 

Step 10. Now do a WordCount on each RDD so that the results are (K,V) pairs of (word,count)

```
val readmeCount = readmeFile.flatMap(line => line.split(" ")).map(word => (word, 1)).reduceByKey(_ + _) 

val changesCount = changesFile.flatMap(line => line.split(" ")).map(word => (word, 1)).reduceByKey(_ + _)
```

Step 11. To see the array for either of them, just call the collect function on it.

```scala
readmeCount.collect()       

changesCount.collect()
```

Step 12. Now let's join these two RDDs together to get a collective set. The join function combines the two datasets (K,V) and (K,W) together and get (K, (V,W)). Let's join these two counts together       

```scala
val joined = readmeCount.join(changesCount)
``` 

Step 13. Cache the joined dataset.       

```scala
joined.cache()
``` 

Step 14. Print the value to the console       

```scala
joined.collect.foreach(println) 
```

Step 15. Let's combine the values together to get the total count. The operations in this command tells Spark to combine the go from (K,V) and (K,W) to (K, V+W). The ._ notation is a way to access the value on that particular index of the key value pair. 

```scala
val joinedSum = joined.map(k => (k._1, (k._2)._1 + (k._2)._2))       

joinedSum.collect() 
```

Step 16. To check if it is correct, print the first five elements from the joined and the joinedSum RDD

```scala
joined.take(5).foreach(println)       

joinedSum.take(5).foreach(println)
```

### 1.2.3 Shared variables 

Broadcast variables are useful for when you have a large dataset that you want to use across all the worker nodes. Instead of having to send out the entire dataset, only the variable is sent out.


Step 17. In the same shell from the last section, create a broadcast variable. Type in 

```scala
val broadcastVar = sc.broadcast(Array(1,2,3)) 
```

Step 18. To get the value, type in:       

```scala
broadcastVar.value 
```

Accumulators are variables that can only be added through an associative operation. It is used to implement counters and sum efficiently in parallel. Spark natively supports numeric type accumulators and standard mutable collections. Programmers can extend these for new types. Only the driver can read the values of the accumulators. The workers can only invoke it to increment the value. 

Step 19. Create the accumulator variable. Type in:       

```scala
val accum = sc.accumulator(0)
``` 

Step 20. Next parallelize an array of four integers and run it through a loop to add each integer value to the accumulator variable. Type in: 

```scala
sc.parallelize(Array(1,2,3,4)).foreach(x => accum += x)
``` 

Step 21. To get the current value of the accumulator variable, type in: 

```scala
accum.value 
```

You should get a value of 10. 

This command can only be invoked on the driver side. The worker nodes can only increment the accumulator.

### 1.2.4 Key-value pairs 

You have already seen a bit about key-value pairs in the Joining RDD section. Here is a brief example of how to create a key-value pair and access its values. Remember that certain operations such as map and reduce only works on key-value pairs. 

Step 22. Create a key-value pair of two characters. Type in:       

```scala
val pair = ('a', 'b')
```

Step 23. To access the value of the first index, type in: 

```scala
pair._1
```

Step 24. To access the value of the second index, type in: 

```scala
pair._2
``` 

Step 25. Quit the Scala shell by typing in

```
CTRL + D
```

## Summary

Having completed this exercise, you should now be able perform various RDD operations, view the DAG of an RDD and also perform join operations to combine two datasets into one. You should be able to user shared variables such as broadcast and accumulators. Finally, you saw how to use Spark and Scala to determine the top ten taxis based on the numbers of trips from a sample dataset.
