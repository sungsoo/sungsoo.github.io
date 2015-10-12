---
layout: post
title: Working with RDD Operations
date: 2015-10-15
categories: [computer science]
tags: [big data, spark]

---

# Working with RDD Operations


## Resilient Distributed Datasets (RDD)
The primary abstraction of Spark is RDD. Remember, there are two types of RDD operations: transformations and actions. Transformations return a pointer to the new RDD. Actions return the value of the operation. RDD transformations are lazy evaluations. This means nothing is processed until an action occurs. Each transformation updates the direct acyclic graph (DAG), which is only executed after an action is called. Due to this inherent behavior, Spark’s applications are fault tolerant. The DAG can be used to rebuild the data within a node.In this lab exercise, you will work with various RDD operations and learn some of the APIs from Scala and Python.
After completing this hands-on lab, you should be able to:* Create a RDD froman external dataset
* View the Direct Acyclic Graph(DAG)of an RDD
* Work with various RDD operations including shared variables and key-value pairsAllow 60 minutes to complete this section of lab.
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

```
val logFile = sc.textFile("input/tmp/sparkLog.out")
``` 

Step 3. Filter out the lines that contains INFO (or ERROR, if the particular log has it) 

```
val info = logFile.filter(line => line.contains("INFO")) 
```

Step 4. Count the lines:       

```
info.count()
``` 

Step 5. Count the lines with Spark in it by combining transformation and action. 

```
info.filter(line => line.contains("spark")).count() 
```

Step 6. Fetch those lines as an array of Strings 

```
info.filter(line => line.contains("spark")).collect()
``` 

Step 7. Remember that we went over the DAG. It is what provides the fault tolerance in Spark. Nodes can re-compute its state by borrowing the DAG from a neighboring node. You can view the graph of an RDD using the toDebugString command.       

```
info.toDebugString```
**￼￼￼Note:** Occasionally, it may seem like the shell has not returned back the prompt. In that case, just hit the Enter key and the prompt will show back up. ￼