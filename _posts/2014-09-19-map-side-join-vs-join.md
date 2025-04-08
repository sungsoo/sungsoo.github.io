---
layout: post
title: Map-Side Join Vs. Join
date: 2014-09-19
categories: [computer science]
tags: [big data]

---

Map-Side Join Vs. Join
======================

[![joins](http://www.edureka.in/blog/wp-content/uploads/2013/11/joins3.jpg)](http://www.edureka.in/blog/map-side-join-vs-join/)

In this blog we shall discuss about **Map-side join** and its advantages
over the normal join operation in **Hive**. But before knowing about
this, we should first understand the concept of**‘Join’** and what
happens internally when we perform the join in **Hive**.

**Join** **is a clause that combines the records of two tables (or
Data-Sets).\
**Assume that we have two tables A and B. When we perform join operation
on them, it will return the records which are the combination of all
columns o f A and B.

***Now let us understand the functionality of normal join with an
example..***

Whenever, we apply join operation, the job will be assigned to a Map
Reduce task which consists of two stages- a ***‘Map stage***’ and a
‘***Reduce stage***’. A mapper’s job during Map Stage is to *“read”* the
data from join tables and to *“return”* the **‘join key’** and **‘join
value’** pair into an intermediate file. Further, in the shuffle stage,
this intermediate file is then sorted and merged. The reducer’s job
during reduce stage is to take this sorted result as input and complete
the task of join.

[![MapReduce
joins](http://www.edureka.in/blog/wp-content/uploads/2013/11/joins1.jpg)](http://www.edureka.in/blog/map-side-join-vs-join/)

-   **Map-side Join** is similar to a join but  all the task will be
    performed by the mapper alone.
-   **The Map-side Join** will be mostly suitable for small tables to
    optimize the task.

## **How will the map-side join optimize the task?**

Assume that we have two tables of which one of them is a small table.
When we submit a map reduce task, a Map Reduce local task will be
created before the original join Map Reduce task which will read data of
the small table from HDFS and store it into an in-memory hash table.
After reading, it serializes the in-memory hash table into a hash table
file.

***In the next stage,*** when the original join Map Reduce task is
running, it moves the data in the hash table file to the Hadoop
distributed cache, which populates these files to each mapper’s local
disk. So all the mappers can load this persistent hash table file back
into the memory and do the join work as before. The execution flow of
the optimized map join is shown in the figure below. After optimization,
the small table needs to be read just once. Also if multiple mappers are
running on the same machine, the distributed cache only needs to push
one copy of the hash table file to this machine.

[![Joins](http://www.edureka.in/blog/wp-content/uploads/2013/11/joins2.jpg "Joins")](http://www.edureka.in/blog/map-side-join-vs-join/)

## **Advantages of using Map-side join:**

-   Map-side join helps in minimizing the cost that is incurred for
    sorting and merging in the *shuffle* and *reduce* stages.
-   Map-side join also helps in improving the performance of the task by
    decreasing the time to finish the task.

## **Disadvantages of Map-side join:**

-   Map side join is adequate only when one of the tables on which you
    perform map-side join operation is small enough to fit into the
    memory.  Hence it is not suitable to perform map-side join on the
    tables which are huge data in both of them.

***Simple Example for Map Reduce Joins:***

Let us create two tables:

-   **Emp**: contains details of an Employee such as Employee name,
    Employee ID and the Department she belongs to.

[![Creating tables with MapReduce
Joins](http://www.edureka.in/blog/wp-content/uploads/2013/11/Untitled-1.jpg)](http://www.edureka.in/blog/map-side-join-vs-join/)

-   **Dept:**contains the details like the Name of the Department,
    Department ID and so on.

[![Creating table using Mapreduce
joins](http://www.edureka.in/blog/wp-content/uploads/2013/11/Creating-table-using-Mapreduce-joins.jpg)](http://www.edureka.in/blog/map-side-join-vs-join/)

**Create two input files as shown in the following image to load the
data into the tables created. **

**employee.txt**

[![Creating Input
files](http://www.edureka.in/blog/wp-content/uploads/2013/11/Untitled-2.jpg)](http://www.edureka.in/blog/map-side-join-vs-join/)

**dept.txt**

[![Creating Input
Files](http://www.edureka.in/blog/wp-content/uploads/2013/11/Untitled-3.jpg "Creating Input Files")](http://www.edureka.in/blog/map-side-join-vs-join/)

**Now, let us load the data into the tables.**

[![Loading data into
tables](http://www.edureka.in/blog/wp-content/uploads/2013/11/Untitled-5.jpg "Loading data into tables")](http://www.edureka.in/blog/map-side-join-vs-join/)

Let us perform the **Map-side** **Join** on the two tables to extract
the list of departments in which each employee is working.

Here, the **second table dept** is a small table. Remember, always the
number of department will be less than the number of employees in an
organization.

[![Untitled-10](http://www.edureka.in/blog/wp-content/uploads/2013/11/Untitled-10.jpg)](http://www.edureka.in/blog/map-side-join-vs-join/)

Now let’s perform the same task with the help of normal Reduce-side
join.

[![Untitled-8](http://www.edureka.in/blog/wp-content/uploads/2013/11/Untitled-8.jpg)](http://www.edureka.in/blog/map-side-join-vs-join/)

**While executing both the joins, you can find the two differences:**

-   Map-reduce join has completed the job in less time when compared
    with the time taken in normal join.
-   Map-reduce join has completed its job without the help of any
    reducer whereas normal join executed this job with the help of one
    reducer.

Hence, **Map-side Join** is your best bet when one of the tables is
small enough to fit in memory to complete the job in a short span of
time.

In **Real-time environment**, you will be have data-sets with huge
amount of data. So performing analysis and retrieving the data will be
time consuming if one of the data-sets is of a smaller size. In such
cases *Map-side join* will help to complete the job in less time.

**References:\
**[https://www.facebook.com/notes/facebook-engineering/join-optimization-in-apache-hive/470667928919](https://www.facebook.com/notes/facebook-engineering/join-optimization-in-apache-hive/470667928919)
