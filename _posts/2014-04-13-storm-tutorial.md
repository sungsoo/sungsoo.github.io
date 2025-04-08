---
layout: post
title: Processing streaming data in Hadoop with Apache Storm 
date: 2014-04-13
categories: [computer science]
tags: [big data, big data, stream computing]

---

# Processing streaming data in Hadoop with Apache Storm 

Real-time data processing
---

In this tutorial we will walk through the process of

-   Reviewing the pre-installed Apache Storm infrastructure
-   Run a sample use case end to end

### What is Apache Storm?

[Apache Storm](http://hortonworks.com/hadoop/storm) is an open source
engine which can process data in realtime using its distributed
architecture. Storm is simple and flexible. It can be used with any
programming language of your choice.

Let’s look at the various components of a Storm Cluster:

1.  **Nimbus node.**The master node (Similar to JobTracker)
2.  **Supervisor nodes.** Starts/stops workers & communicates with
    Nimbus through Zookeeper
3.  **ZooKeeper nodes.** Coordinates the Storm cluster

Here are a few terminologies and concepts you should get familiar with
before we go hands-on:

-   **Tuples.** An ordered list of elements. For example, a “4-tuple”
    might be (7, 1, 3, 7)
-   **Streams.** An unbounded sequence of tuples.
-   **Spouts.** Sources of streams in a computation (e.g. a Twitter API)
-   **Bolts.** Process input streams and produce output streams. They
    can:
    -   Run functions;
    -   Filter, aggregate, or join data;
    -   Talk to databases.
-   **Topologies.** The overall calculation, represented visually as a
    network of spouts and bolts

Prerequisites:
--------------

A working HDP cluster – the easiest way to get a HDP cluster is to
download the [HDP 2.1 Technical
Preview](http://hortonworks.com/products/hortonworks-sandbox/)

Installation and Setup Verification:
------------------------------------

### Step 1:

Let’s check if the sandbox has storm processes up and running. Please
ssh in to the Sandbox from a terminal window on mac or using Putty:

`ssh root@127.0.0.1 -p 2222;`

Then list the processes:

`ps -ef|grep storm`

If Storm processes are running, you will see something similar to the
following:


[![](http://sungsoo.github.com/images/storm-s01.jpg)](http://sungsoo.github.com/images/storm-s01.jpg)

 If Storm processes are not running, we can manually start those as
steps below:

### Step 2:

Let’s look at Storm Home folders to see the location of it’s binaries,
libraries, etc.:

[![](http://sungsoo.github.com/images/storm-s02.jpg)](http://sungsoo.github.com/images/storm-s02.jpg)

### Step 3:

Let’s review a few configuration items:

-   storm.yaml is one of the config files you can open and review. This
    configures storm daemons like Nimbus, Zookeeper,etc.

Go to the following directory and open storm.yaml file.

`cd /usr/lib/storm/conf`

[![](http://sungsoo.github.com/images/storm-s03.jpg)](http://sungsoo.github.com/images/storm-s03.jpg)

Review the entire body of this file for the configuration options. You
can see only the top part in this screen shot

If you don’t modify this file, then it will pick up all the default
values which are listed in the following link : [Storm Default
Values](https://github.com/nathanmarz/storm/blob/master/conf/defaults.yaml)

In this case, we will use all the default values as a trial setup in the
standalone Sandbox.

### Step 4:

Let’s review and discuss about a few parameters.

-   **storm.zookeeper.servers.** This must be configured if your
    Zookeeper is running on another server/s. So, we must
    specify/configure.
    -   i.e.
        storm.zookeeper.servers: “111.222.333.444″ “555.666.777.888″
    -   storm.zookeeper.port must be assigned if you are not using
        default ports.
    -   In our case running Storm on the Sandbox, we will use default,
        which is ‘localhost’.
-   **nimbus.host.** The worker nodes need to know which machine is the
    master in order to download topology jars and confs. In our case, we
    are using default, which is ‘localhost’.
-   **ui.port.** This is the port on which the Storm UI will use. In our
    case, it is 8080.
-   **supervisor.slots.ports.** This is another important configuration.
    # of ports defined, allows that many workers per node. Here are the
    default ports:
    -   supervisor.slots.ports:
        -   6700
        -   6701
        -   6702
        -   6703
    -   In your storm.yaml file, here are a few samples listed.

[![](http://sungsoo.github.com/images/storm-s04.jpg)](http://sungsoo.github.com/images/storm-s04.jpg)

Please notice that the Zookeeper server is set as
sandbox.hortonworks.com. Also, Nimbus server is set as
sandbox.hortonworks.com. The ui.port is set at 8744.

### Step 5:

Let’s start the Storm Nimbus and Supervisor Processes:

`./storm nimbus`

[![](http://sungsoo.github.com/images/storm-s05.jpg)](http://sungsoo.github.com/images/storm-s05.jpg)

Let’s start the Supervisor Server:

`./storm supervisor`

[![](http://sungsoo.github.com/images/storm-s05-1.jpg)](http://sungsoo.github.com/images/storm-s05-1.jpg)

 Nimbus is the main master process and supervisor process is the worker
process.

### Step 6:

Let’s start the Storm UI so that we can access storm using Web UI. For
this, please open another terminal window as we didn’t run the above in
the background just to see how it runs. In this new terminal window,
please start Storm UI as follows:

`./storm ui`

[![](http://sungsoo.github.com/images/storm-s06.jpg)](http://sungsoo.github.com/images/storm-s06.jpg)

In case, you get into already running Storm UI situation, you could
always look for what is running on the port 8744 using
`netstat -ntlp|grep 8744` and kill the process using `kill -9 PID`.

### Step 7 :

Before you can access you Storm Cluster via UI, please set up your
/etc/hosts file in your local host machine (not sandbox) and map to
localhost if it is not setup.

The file hosts is usually located at c:WindowsSystem32drivers
folder in windows and in /etc folder in a Mac.

Setup as follows :

    127.0.0.1   localhost

    10.0.2.15   sandbox.hortonworks.com

Let’s save now as follows. Hosts file doesn’t have any extension.

[![](http://sungsoo.github.com/images/storm-s07.jpg)](http://sungsoo.github.com/images/storm-s07.jpg)

### Step 8 :

Let’s open the Storm UI using your browser.

[![](http://sungsoo.github.com/images/storm-s08.jpg)](http://sungsoo.github.com/images/storm-s08.jpg)

### Step 9 :

Now let’s look at a Hadoop Streaming use case using Storm’s Spouts and
Bolts processes. For this we will be using a simple use case, however it
should give you the real life experience of running and operating on
Hadoop Streaming data using this topology.

Let’s get the jar file which is available in the Storm Starter kit. This
has other examples as well, but let’s use the WordCount operation and
see how to turn it ON. We will also track this in Storm UI.

    wget http://public-repo-1.hortonworks.com/HDP-LABS/Projects/Storm/0.9.0.1/storm-starter-0.0.1-storm-0.9.0.1.jar

[![](http://sungsoo.github.com/images/storm-s09.jpg)](http://sungsoo.github.com/images/storm-s09.jpg)

### Step 10 :

In the Storm example Topology, we will be using three main parts or
processes:

1.  Sentence Generator Spout
2.  Sentence Split Bolt
3.  WordCount Bolt

You can check the classes available in the jar as follows:

    jar -xvf storm-starter-0.0.1-storm-0.9.0.1.jar | grep Sentence
    jar -xvf storm-starter-0.0.1-storm-0.9.0.1.jar | grep Split
    jar -xvf storm-starter-0.0.1-storm-0.9.0.1.jar | grep WordCount

[![](http://sungsoo.github.com/images/storm-s10.jpg)](http://sungsoo.github.com/images/storm-s10.jpg)

### Step 11 :

Let’s run the storm job. It has a Spout job to generate random
sentences. There is a split Bolt Process along with the Wordcount Bolt
Class.

Let’s run the Storm Jar file.

    /usr/lib/storm/bin/storm jar storm-starter-0.0.1-storm-0.9.0.1.jar storm.starter.WordCountTopology WordCount -c storm.starter.WordCountTopology WordCount -c nimbus.host=sandbox.hortonworks.com

[![](http://sungsoo.github.com/images/storm-s11.jpg)](http://sungsoo.github.com/images/storm-s11.jpg)

### Step 12 :

Let’s use Storm UI and look at it graphically:

[![](http://sungsoo.github.com/images/storm-s12.jpg)](http://sungsoo.github.com/images/storm-s12.jpg)

You should notice the Storm Topology, WordCount in the Topology summary.

### Step 13 :

Please click on the WordCount Topology. You will see the following:

[![](http://sungsoo.github.com/images/storm-s13.jpg)](http://sungsoo.github.com/images/storm-s13.jpg)

### Step 14 :

In this page, please click on count in the Bolt Section.

[![](http://sungsoo.github.com/images/storm-s14.jpg)](http://sungsoo.github.com/images/storm-s14.jpg)

### Step 15 :

Now if click on any port in the executor section and you will be able to
view the results.

### Step 16 :

Lastly but most importantly, you can always look at the log files in the
following folder. These logs are extremely useful for debugging or
status finding.

[![](http://sungsoo.github.com/images/storm-s16.jpg)](http://sungsoo.github.com/images/storm-s16.jpg)

You just processed streaming data using Apache Storm.

# References
[1] [*HDP 2.1: Processing streaming data in Hadoop with Apache Storm*](http://hortonworks.com/hadoop-tutorial/processing-streaming-data-near-real-time-apache-storm/), Hortonworks Blog.