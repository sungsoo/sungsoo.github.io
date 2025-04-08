---
layout: post
title: Creating Applications using Spark Streaming
date: 2015-10-17
categories: [computer science]
tags: [big data, spark]

---

# Creating a Spark application using Spark Streaming

This section focuses on *Spark Streams*, an easy to build, scalable, *stateful* (e.g. sliding windows) stream processing library. Streaming jobs are written the same way Spark batch jobs are coded and support Java, Scala and Python. In this exercise, taxi trip data will be streamed using a socket connection and then analyzed to provide a summary of number of passengers by taxi vendor. This will be implemented in the Spark shell using Scala.

There are two files under /home/virtuser/labdata/streams. The first one is the nyctaxi100.csv which will serve as the source of the stream. The other file is a python file, taxistreams.py, which will feed the csv file through a socket connection to simulate a stream.

Once started, the program will bind and listen to the **localhost socket 7777**. When a connection is made, it will read ‘nyctaxi100.csv’ and send across the socket. The sleep is set such that one line will be sent every 0.5 seconds, or 2 rows a second. This was intentionally set to a high value to make it easier to view the data during execution.


Step 1. Open a new terminal.

Step 2. Create a new folder, PythonStreams under /home/virtuser.

```
mkdir -p /home/virtuser/PythonStreams
```

Step 3. Copy the taxistream.py and the nyctaxi100.csv file.

```
cp /opt/ibm/labfiles/streams/nyctaxi100.csv /home/virtuser/PythonStreams
cp /opt/ibm/labfiles/streams/taxistreams.py /home/virtuser/PythonStreams
```

Step 4. Update the contents of the /home/virtuser/taxistreams.py file to reflect the path of the nyctaxi100.csv. The file current looks for the nyctaxi100.csv file under: /home/biadmin/PythonStreams/. Change it to /home/virtuser/PythonStreams/.


Step 5. Change directory into the PythonStreams folder.


Step 6. To invoke the standalone Python program, issue the following command:

```
python taxistreams.py
```
The program has been started and is awaiting Spark Streams to connect and receive the data.


Step 7. **Start a new docker window.**

```
docker exec -it bdu_spark bash
```

Step 8. Start the spark-shell.

```
$SPARK_HOME/bin/spark-shell
```

Step 9. Turn off logging for this shell so that you can see the output of the application:

```scala
import org.apache.log4j.Logger
import org.apache.log4j.Level 

Logger.getLogger("org").setLevel(Level.OFF) 
Logger.getLogger("akka").setLevel(Level.OFF)
```

Step 10. Import the required libraries. Copy and paste this into the shell.

```scala
import org.apache.spark._
import org.apache.spark.streaming._
import org.apache.spark.streaming.StreamingContext._
```

Step 11. Create the StreamingContext by using the existing SparkContext (sc). It will be using a 1 second window, which means the stream is divided to 1 second batches and each batch becomes a RDD. This is intentional to make it easier to read the data during execution.

```scala
val ssc = new StreamingContext(sc,Seconds(1))
```
 
Step 12. Create the socket stream that connects to the localhost socket 7777. This matches the port that the Python script is listening. Each stream will be a lines RDD.

```scala
val lines = ssc.socketTextStream("localhost",7777)
```

Step 13. Next, put in the business logic to split up the lines on each comma and mapping pass(15), which is the vendor, and pass(7), which is the passenger count. Then this is reduced by key resulting in a summary of number of passengers by vendor.

```scala
val pass = lines.map(_.split(",")).
map(pass=>(pass(15),pass(7).toInt)).
reduceByKey(_+_)
```

Step 14. Print out to the console. This command tells Spark streaming to print, but it doesn't exactly print it yet because our application hasn't started. The next step will start the application.

```scala
pass.print()
```

Step 15. The next two lines starts the stream. Copy and paste both in at once.

```scala
ssc.start()
ssc.awaitTermination()
```

￼Step 16. It will take a few cycles for the connection to be recognized, and then the data is sent. In this case, 2 rows per second of taxi trip data is receive in a 1 second window.

Step 17. In the Python terminal, the contents of the file are printed as they are streamed.

Step 18. Use `CTRL+C` to get out of each terminal window to stop the programs.

This is just a simple example showing how you can take streaming data into Spark and do some type of processing on it. In the case here, the taxi and the number of passengers was extracted from the data stream.
