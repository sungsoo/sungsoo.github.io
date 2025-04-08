---
layout: post
title: Interactive Query for Hadoop with Apache Hive on Apache Tez
date: 2014-04-12
categories: [computer science]
tags: [big data, big data, tez]

---

# Interactive Query for Hadoop with Apache Hive on Apache Tez

Benefits of the Stinger Initiative delivered
---

In this tutorial, we’ll focus on taking advantage of improvements to
[Apache Hive](http://hortonworks.com/hadoop/hive) and [Apache
Tez](http://hortonworks.com/hadoop/tez) through the work completed by
the community as part of the [Stinger
initiative](http://hortonworks.com/labs/stinger). 

In this tutorial, we are going to look at some of the new features that
Hive on Tez brings to HDP 2.1:

-   Performance improvements of Hive on Tez
-   Performance improvements of Vectorized Query
-   Cost-based Optimization Plans
-   Multi-tenancy with HiveServer2
-   SQL Compliance Improvements

Prerequisites
-------------

A working HDP cluster – the easiest way to have a HDP cluster is to
download the [HDP 2.1 Technical
Preview](http://hortonworks.com/downloads) [
](http://www.hortonworks.com/sandbox)

### Download data

The dataset that we will need for this tutorial is
[here](http://s3.amazonaws.com/hw-sandbox/tutorial14/SensorFiles.zip).
Please download and save the file in a folder on your local machine.

Once you unzip the zip file – SensorFiles.zip, you will see the
following files inside. We will be using these datafiles for the
following tutorial.

![](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/dataset%20on%20local%20folder.JPG)

Let’s use the above two csv files (HVAC.csv & building.csv) to create
two new tables using the following step. Navigate to
[http://127.0.0.1:8000](http://127.0.0.1:8000) using your browser. Click
on HCat tab.

![](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/create%20table%20screen.JPG)

Now, let’s upload the above datafiles into HDFS and create two hive
tables using the following steps.

We will name the tables as per the csv file names : “hvac” and
“building”.

Click on “Create a new table from a file” on the left hand side pane.
Enter table name as “hvac” and Choose hvac.csv file from your local
system as the Input File.

![](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/hvac%20table%20naming.JPG)

Once file is specified, you will see the column names and the data
mapping as follows. You might have to scroll down little.

![](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/data%20mapping.JPG)

Click on the create button to complete the table creation process.

Repeat the above steps for creating your second table “building”.

Once these 2 tables are created, you should see the tables listed in the
HCat Screen.

![](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/HCat%20Table%20List.JPG)

Speed Improvements
------------------

To take a look at the speed improvements of Hive on Tez, we can run some
sample queries. For this we will use the above two tables – hvac and
building.

### Step 1 :

We will SSH into the VM and launch the Hive Shell.

`ssh root@127.0.0.1 -p 2222;`

the password is `hadoop`

We will run first Hive without Tez.

![Image
hive](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/run%20Hive.JPG)

### Step 2:

Please note that Hive is running using MapReduce Framework from the log
output on your screen.

    set hive.execution.engine=mr;

Then, let’s execute the hiveql as below.

```sql
    select h.*, b.country, b.hvacproduct, b.buildingage, b.buildingmgr 
    from building b join hvac h 
    on b.buildingid = h.buildingid;
```

![enter image description
here](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/map%20reduce%20job%20without%20tez.JPG)

This query was run using the MapReduce framework.

![enter image description
here](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/runtime%20hive.JPG)

Note the time it takes your query to execute. In the example above it
took 47.346 seconds.

### Step 3 :

Now we can enable Hive on Tez execution and take advantage of Directed
Acyclic Graph (DAG) execution representing the query instead of multiple
stages of MapReduce program which involved a lot of synchronization,
barriers and IO overheads. This is improved in Tez, by writing
intermediate data set into memory instead of hard disk.

Use the following step to set the execution engine to Tez:

    set hive.execution.engine=tez;

### Step 4 :

Run the same query as we had run earlier in Step 2, to see if the speed
has improved or not.

```sql
    select h.*, b.country, b.hvacproduct, b.buildingage, b.buildingmgr 
    from building b join hvac h 
    on b.buildingid = h.buildingid;
```

![enter image description
here](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/Hive%20on%20Tez.JPG)

Check the output of this job. It shows the usage of the containers.
 Here is the rest of the output log:

![enter image description
here](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/hive%20on%20tez%20time%20taken.JPG)

In this example, Hive on Tez was considerably faster than the MapReduce
execution taking 27.437 secs compared to earlier 47.346 secs.

Congratulations! You have successfully run your Hive on Tez Job.

### Step 5:

Now let’s rerun the same query from Step 2 or Step 4.

```sql
    select a.buildingid, b.buildingmgr, max(a.targettemp-a.actualtemp)
    from hvac a join building b
    on a.buildingid = b.buildingid
    group by a.buildingid, b.buildingmgr;
```

Again, it should run faster as it will use hot containers produced in
the Step 4 since you are executing in the same Hive Client session.

Here is the result.

![](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/rerun%20tez%20query.JPG)

This time the job took only 14.862 secs, a considerable improvement.

To experience this further, you could use your own dataset, upload to
your HDP Sandbox using steps above and execute with Tez and without.

### Step 6:

You can track your Hive on Tez jobs in HDP Sandbox Web UI as well.
Please go to :
[http://127.0.0.1:8088/cluster](http://127.0.0.1:8088/cluster) and track
your jobs while running or post to see the details.

![enter image description
here](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/UI%20Tracking.JPG)

You can click on your job and see further details.

Query Vectorization
-------------------

Now let’s check if the usage of Vectorization speeds this up further.

**What is Vectorization?**
 When Vectorization feature is used, it fetches 1000 rows at a time
instead of 1 for processing. So, it can process up to 3X faster with
less CPU time. This results in improved cluster utilization. It is to
address the latency Problem in Hive by extensive Container use and
reuse. Vectorization feature works on Hive tables with ORC File Format
only.

### Step 1:

Let’s create a table with ORC file format as follows:

```sql
    create table hvac_orc stored as orc as select * from hvac;
```

### Step 2:

Run the following statement to enable Tez.

    set hive.execution.engine=tez;

### Step 3:

Run the following query.

```sql
    select date, count(buildingid) from hvac group by date;
```

Note down the time taken.

### Step 4:

Now let’s run the following sql query:

```sql
    select date, count(buildingid) from hvac_orc group by date;
```

Note down the time taken and compare to step 3.

### Step 5:

Now let’s run the following steps to enable vectorization:

    set hive.vectorized.execution.enabled;

and then run the sql query from previous step

```sql
    select date, count(buildingid) from hvac_orc group by date;
```

This time it runs with a vectorized query plan, which scales very well
especially with large datasets.

### Step 6:

Let’s look at the ‘explain’ plan to confirm that it is indeed using a
vectorized query plan:

    explain select date, count(buildingid) from hvac_orc group by date;

![enter image description
here](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/vectorizedexplain.JPG)

Please note that in the explain plan, the Execution mode is
“vectorized”. When this feature is switched off, you will not see the
same line in the plan.

Stats & Cost Based Optimization (CBO)
-------------------------------------

Cost Based Optimization(CBO) engine uses statistics within Hive tables
to produce optimal query plans.

### Benefits of CBO:

1.  Reduces need of a specialists to tune queries
2.  More efficient query plans lead to better cluster utilization

### Types of Stats

There are two types of stats which could be collected so that the
optimizer could use it in the decision making process :

1.  Table Stats
2.  Column Stats

The ‘explain’ plan feature can be used to see if the correct stats are
being used.

    Note : CBO requires column stats. 

### Phases in which stats could be collected

1.  While data is inserted:`hive.stats.autographer = [true, **false**]`
2.  On existing data : table
    level`ANALYZE TABLE table [partion(key)] COMPUTE STATISTICS;`
3.  On existing data : column
    level`ANALYZE TABLE table [partion(key)] COMPUTE STATISTICS FOR COLUMNS col1,col2,...;`

### Configuration to make CBO effective for your query

1.  `hive.compute.query.using.stats = [true, **false**];`
2.  `hive.stats.fetch.column.stats = [true, **false**];`
3.  `hive.stats.fetch.partition.stats = [true, **false**];`
4.  `hive.cbo.enable = [true, **false**];`

### Step 1:

Let’s do a simple exercise. Let’s run the following query and see how
long it takes.

    select buildingid, max(targettemp-actualtemp) from hvac group by buildingid;

Please note down the time taken.

### Step 2:

Now, let’s explain the above query in Step 1.

![enter image description
here](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/hive%20without%20CBO.JPG)

Please note the the CBO feature is not used. You will see that Basic
stats is None in the ‘explain’ plan.

### Step 3:

Now, we will tune the same query so that it uses Cost Based Optimization
(CBO). Let’s collect statistics on the table hvac.

![enter image description
here](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/compute%20stats%20cbo.JPG)

You are using Tez execution engine.

### Step 4:

Let’s collect statistics of a few columns in this table hvac. To use
CBO, column level statistics are required.

![enter image description
here](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/analyze%20column.JPG)

### Step 5:

Now let’s set the 4 settings in hive as follows and run explain on the
query.

![enter image description
here](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/hive%20with%20cbo.JPG)

Note that the Plan says that it is using stats now.

### Step 6:

Let’s rerun the query now and observe if it runs faster. You will see
better gain with a good volume of dataset than the one we are working
with.

```sql
select buildingid, max(targettemp-actualtemp) from hvac group by buildingid;
```

Please note down total time taken and compare to Step 1.

Multi-tenancy with HiveServer2
------------------------------

There could be contentions when multiple users run large queries
simultaneously. Processing queries with many containers could lead to
lower latency. For this, 3 controls could be put in place:

-   Container re-use timeout
-   Tez split wave tuning
-   Round Robin Queuing setup

### Diagnose: Job Viewer

Hive Job Viewer available in Ambari is a simple exploration and
troubleshooting Graphical tool for Hive jobs.

The purposes of this Job Viewer are as follows:

-   Visualize execution DAG
-   Drill Down into individual stages for:
    -   Execution status
    -   Duration
    -   Number of bytes read and written, No of containers, etc.
         DAG Viewer is releasing soon, which will be available in
        Ambari.

To see the job executions visually, you can follow these steps:

### Step 1:

Please go to your Web UI using
[http://127.0.0.1:8000/about/](http://127.0.0.1:8000/about/) and turn on
Ambari. If needed, you might have to add more memory to your VM. Once
Ambari is turned on, you will see the following screen.

![Image](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/Ambari.JPG)

### Step 2:

Now, go to hive terminal and execute any simple query.

```sql
select count(*) from hvac;
```

### Step 3:

Please go to the following Ambari URL to view the job execution
visually.

    http://127.0.0.1:8080/#/login

Enter username as “admin” and password as “admin”.
 ![enter image description
here](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/Ambari.JPG)

### Step 4:

In the following screen, please go to the Jobs tab:
 ![enter image description
here](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/ambari%20screen.JPG)

### Step 5:

You will see your jobs that you have run in Step 2 or earlier. Please
click on any of your jobs.
 ![enter image description
here](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/Ambari%20Jobs.JPG)

### Step 6:

You will see here the job execution visually. You can click on various
datapoints and get further details.

![enter image description
here](http://hortonassets.s3.amazonaws.com/tutorial/stinger/images/Ambari%20DAG.JPG)

SQL Compliance
--------------

There are several SQL query enhancements in this version of Hive.

### Query Enhancements Support extensions:

-   Expanded Join Semantics – Supports from table1, table2 where
    table1.col1=table2.col2
-   IN, NOT IN subqueries in WHERE Clause
-   EXISTS and NOT EXISTS
-   Correlated Subqueries with equality operation only
-   Common Table Expressions (CTE)
-   The CHAR datatype – trailing White Space

### Authorization System enhancements:

-   SQL Authorizations : Actions
    -   Grant/Revoke
        -   Create
        -   Insert
        -   Select
        -   Drop
        -   Delete
        -   All
            -   Create Roles & Grant with admin option
            -   Using views to restrict data visibility

# References
[1] [*HDP2.1: Interactive Query for Hadoop with Apache Hive on Apache Tez*](http://hortonworks.com/hadoop-tutorial/supercharging-interactive-queries-hive-tez/), Hortonworks Blog.