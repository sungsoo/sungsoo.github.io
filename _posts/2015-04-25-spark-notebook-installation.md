---
layout: post
title: Spark with Python Notebook on Mac 
date: 2015-04-25
categories: [computer science]
tags: [big data]

---


Spark with Python Notebook on Mac 
=================================


First thing first… 
-------------------

To use Spark we need to configure the Hadoop eco system of Yarn and
HDFS. This can be done following my previous tutorial [Installing Hadoop
on
Yosemite](http://amodernstory.com/2014/09/23/installing-hadoop-on-mac-osx-yosemite/ "Installing Hadoop on Mac OSX Yosemite Tutorial Part 1.").

Install HomeBrew 
----------------

Found here:<http://brew.sh/> or simply paste this inside the terminal

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

To install Spark
----------------

    brew install apache-spark

Will install Spark to directory /usr/local/Cellar/apache-spark/1.2.0/

Create Python HDFS directory and dataset
----------------------------------------

The directory we will be using for input and output.

    hdfs dfs -mkdir /Python

Download a book for Word Count

    wget http://www.gutenberg.org/files/30760/30760-0.txt
    mv 30760-0.txt book.txt
    hdfs dfs -put book.txt /Python/
    hdfs dfs -ls /Python/

Install Anaconda Python 
-----------------------

We’ll install Anaconda for Python because it also contains iPython and
other tools that will make working with Python easy and enjoyable.

Download and install Anaconda Python from

<http://continuum.io/downloads>

Or the direct link if it works is,

<https://drive.google.com/file/d/0B_sUSFr2psjZT0VTMDU2UlR5Mlk/view?usp=sharing>

Running iPython notebook 
------------------------

In the terminal execute

    IPYTHON_OPTS="notebook --pylab inline" pyspark

Which starts Python, creates the Spark Hdfs connection, and
automatically opens up a new Browser Window with the Python Notebook. In
the top right corner click on New Notebook.

    words = sc.textFile("hdfs://localhost:9000/Python/book.txt")

    words.filter(lambda w: w.startswith(" ")).take(5)

    counts = words.flatMap(lambda line: line.split(" ")) \
     .map(lambda word: (word, 1)) \
     .reduceByKey(lambda a, b: a + b)

    counts.saveAsTextFile("hdfs://localhost:9000/Python/spark_output1")

    counts.collect()

Python Notebook
---------------

You can view the Python Notebook here…

<http://nbviewer.ipython.org/github/marek5050/Hadoop_Examples/blob/master/SparkieNET.ipynb>

[![Screen Shot 2015-03-05 at 10.25.02
AM](https://amodernstory.files.wordpress.com/2015/03/screen-shot-2015-03-05-at-10-25-02-am.png)](https://amodernstory.files.wordpress.com/2015/03/screen-shot-2015-03-05-at-10-25-02-am.png)

[![Screen Shot 2015-03-05 at 10.25.22
AM](https://amodernstory.files.wordpress.com/2015/03/screen-shot-2015-03-05-at-10-25-22-am.png)](https://amodernstory.files.wordpress.com/2015/03/screen-shot-2015-03-05-at-10-25-22-am.png)

[![Screen Shot 2015-03-05 at 11.13.38
AM](https://amodernstory.files.wordpress.com/2015/03/screen-shot-2015-03-05-at-11-13-38-am.png)](https://amodernstory.files.wordpress.com/2015/03/screen-shot-2015-03-05-at-11-13-38-am.png)

### Additional links

<https://github.com/ipython/ipython/wiki/A-gallery-of-interesting-IPython-Notebooks>

<https://spark.apache.org/examples.html>

<https://spark.apache.org/docs/0.9.1/python-programming-guide.html>

### Datasets

<https://scans.io/series/modbus-full-ipv4>

<http://www.gutenberg.org/>

<http://meta.wikimedia.org/wiki/Data_dump_torrents#enwiki>