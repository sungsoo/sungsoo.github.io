---
layout: post
title: Creating a Spark Applications
date: 2015-10-16
categories: [computer science]
tags: [big data]

---

# Creating a Spark Applications

This lab exercise will show you how to create a Spark application, link and compile it with the respective programming languages, and run the applications on the Spark cluster. The goal of this lab exercise is to show you how to create and run a Spark program. It is not to focus on how to program in Scala, Python, or Java. The business logic can be anything you need it to be for your application.

After completing this hands-on lab, you should be able to:


* *Create, compile, and run Spark applications using Scala*

Allow 30-60 minutes to complete this section of lab.


## 1.1 Creating a Spark application using Scala

The full class is available on the image under the examples subfolder of Spark or you can also find it on Spark's website. In this exercise, you will go through the steps needed to create a SparkPi program, to estimate the value of Pi. Remember that the goal of these applications is to learn the context of Spark, and not necessarily programming in Scala.
The application will be packaged using SBT. This has been set up on the system already and added to the $PATH variable, so you can invoke it anywhere.

Step 1. Open up a docker terminal.

Step 2. Create a new subdirectory /home/virtuser/SparkPi:

```
mkdir -p /home/virtuser/SparkPi
```

Step 3. Under the SparkPi directory, set up the typical directory structure for your application. Once that is in place and you have your application code written, you can package it up into a JAR using sbt and run it using spark-submit.

```
mkdir -p /home/virtuser/SparkPi/src/main/scala 
```

Your directory should look like this:

Step 4. The SparkPi.scala file will be under src/main/scala/ directory. Change to the scala directory and create this file:

```
cat > SparkPi.scala
```

Step 5. At this point, copy and paste the contents here into the newly created file:

```scala
/** Import the spark and math packages */
import scala.math.random
import org.apache.spark._
/** Computes an approximation to pi */
object SparkPi {
def main(args: Array[String]) {
** Create the SparkConf object */
val conf = new SparkConf().setAppName("Spark Pi") /** Create the SparkContext */
val spark = new SparkContext(conf)
/** business logic to calculate Pi */
val slices = if (args.length > 0) args(0).toInt else 2
val n = math.min(100000L * slices, Int.MaxValue).toInt // avoid overflow
val count = spark.parallelize(1 until n, slices).map { i => val x = random * 2 - 1
val y = random * 2 - 1
if (x*x + y*y < 1) 1 else 0
}.reduce(_ + _)
/** Printing the value of Pi */
println("Pi is roughly " + 4.0 * count / n)
/** Stop the SparkContext */
spark.stop()
}
}
```
Step 6. To quit out of the file, type `CTRL + D`

Step 7. Remember, you can have any business logic you need for your application in your scala class. This is just a sample class. Let's spend a few moments analyzing the content of SparkPi.scala. Type in the following to view the content:

```
more SparkPi.scala
```

Step 8. The next two lines are the required packages for this application.

```scala
import scala.math.random
import org.apache.spark._
```
      
Step 9. Next you create the SparkConf object to define the application's name.

```scala
val conf = new SparkConf().setAppName("Spark Pi")
```

Step 10. Create the SparkContext:

```scala
val spark = new SparkContext(conf)
```

Step 11. The rest that follows is the business logic required to calculate the value of Pi.

```scala
val slices = if (args.length > 0) args(0).toInt else 2
val n = math.min(100000L * slices, Int.MaxValue).toInt // avoid overflow
```

Step 12. Create an RDD by using transformations and actions:

```scala
val count = spark.parallelize(1 until n, slices).map { i => val x = random * 2 - 1
val y = random * 2 - 1
if (x*x + y*y < 1) 1 else 0
      }.reduce(_ + _)
```
      
Step 13. Print out the value of Pi:

```scala
println("Pi is roughly " + 4.0 * count / n)
```
      
Step 14. Finally, the last line is to stop the SparkContext:

```scala
spark.stop()
```
      
Step 15. At this point, you have completed the SparkPi.scala class. The application depends on the Spark API, so you will also include a sbt configuration file, SparkPi.sbt. This file adds a repository that Spark depends on. Change to the home directory of the SparkPi folder:

```
cd ../../..
```

Step 16. and create this file.

```
cat > sparkpi.sbt
````

Step 17. Copy and paste this into the sparkpi.sbt file:

```
name := "SparkPi Project"
version := "1.0"
scalaVersion := "2.10.4"
libraryDependencies += "org.apache.spark" %% "spark-core" % "1.3.1"
```

Step 18. Now your folder structure under SparkPi should look like this:

```
     ./sparkpi.sbt
     ./src
     ./src/main
     ./src/main/scala
     ./src/main/scala/SparkPi.scala
```
     
Step 19. While in the top directory of the SparkPi application, run the sbt tool to create the JAR file:

```
sbt package
```

It will take a long time to create the package initially because of all the dependencies. 
Step out for a cup of coffee or tea or grab a snack.

**Note:** You may need to return back into the bash and start the Hadoop service. Use these commands

```
docker start bdu_spark 
docker attach bdu_spark 
/etc/bootstrap.sh
```

Step 20. Make sure you are in your SparkPi directory.


Step 21. Use spark-submit to run the application.

```
$SPARK_HOME/bin/spark-submit \
--class "SparkPi" \
--master local[4] \ target/scala-2.10/sparkpi-project_2.10-1.0.jar
```

Step 22. In the midst of all the output, you should be able to find out the calculated value of Pi.

Step 23. Congratulations, you created and ran a Spark application using Scala!


## Summary

Having completed this exercise, you should know how to create, compile and run a Scala and a Python application. Each application requires some import statements followed by the creation of the SparkConf and a SparkContext to be use within the program. Once you have the SparkContext, you code up the business logic for the application. At the end of the application, be sure to stop the SparkContext. For all three types of application, you run it with spark-submit. If there are dependencies required, you would supply it alongside the code. You can use sbt, maven, or other system builds to create the JAR packages required for the application.