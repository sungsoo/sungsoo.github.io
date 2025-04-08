---
layout: post
title: What is Apache Drill?
date: 2014-07-16
categories: [computer science]
tags: [big data, big data]

---

## Article Source

* Title: [Apache Drill](http://sjsubigdata.wordpress.com/2014/04/27/apache-drill/)
* Authors: [bigsjsu](http://sjsubigdata.wordpress.com/author/bigsjsu/ "View all posts by bigsjsu")


# Apache Drill

**Table of Contents**
---------------------

-   What is Apache Drill?
-   Needed For This Tutorial
-   Installing Prerequisites
-   Installing Apache Drill
-   Running Queries with Apache Drill
-   Installing Virtual Box (links)
-   Installing Ubuntu (links)
-   Sources and Links

What is Apache Drill?
---------------------

Inspired by Google’s Dremel, Apache Drill is a distributed, low-latency
system that supports interactive ad-hoc analysis for large-scale
datasets. It’s key features include full SQL, nested data support,
optional schema, and flexible and extensive architecture. The design
goal of Drill is to quickly respond to queries involving petabytes of
data. Drill is not a database; it is a query layer on top of data, and
it is supported by full table scans. It provides frameworks for parallel
processing and flexible query execution. Drill is still relatively new,
so documentation and support is limited, information is inconsistent,
and bugs are still present. In my case, troubleshooting errors or
figuring out proper syntax can go on for hours or days because of lack
of information and support.

Let us take a look at how Apache Drill gains its querying flexibility.
Drill takes a query written in natural, readable language such as SQL
and transforms it into a logical plan, and then into a physical plan
before executing it.

![](http://i.imgur.com/tfM3U8C.jpg)( Hausenblas & Nadeau, 2013)

Drill takes the source query and transforms it into a logical plan using
an interface such as an JDBC or ODBC library. The logical plan consists
of Java objects and a text form, and is usually stored in memory. The
logical plan runs through a optimizer and a physical plan is produced,
which represents the structure if computation. After the physical plan
is produced, the query is ready for execution in Drill.

![](http://i.imgur.com/XX5B3gi.png)(MapR Techonologies)

Each node, called Drillbits, is designed to maximize data locality.
Coordination, query planning, execution, etc. are all distributed. By
default, Drillbits hold all roles. Why? Because we want speed!

![](http://i.imgur.com/VNQUVYj.png)(MapR Technologies)

**Needed For This Tutorial**
----------------------------

I assume most would know how to set up Virtual Box and Ubuntu, but if
not, I have included links to setup tutorials towards the end of the
report. I am new to Linux systems, so I have written this report so that
it is easy for beginners to follow as well. To the experienced users,
bear with me.

Ubuntu 12.04.4 (I am using Oracle’s Virtual Box)\
 Ubuntu-12.04.4-desktop-amd64.iso\
 JDK 1.7\
 Maven 3.2.1

**Installing Prerequisites**
----------------------------

Ctrl+Alt+T to open a terminal:

    sudo apt-get update

Enter in your password. Now, check your Java version:\
 *Note: Whenever you use “sudo”, you will likely be prompted for your
password.*

    java –version

If Java has not yet been installed, the terminal will return “the
program ‘java’ can be found in the following packages: …” We will need
JDK 7. Install it:

    sudo apt-get install openjdk-7-jdk

*Note: Whenever you are asked if you want to continue, either enter in y
or press enter.*

\<more info\>

Try the java version command again, and you should see something similar
to:

![](http://i.imgur.com/wIRCQBt.png)

Now that Java 1.7 is installed, we will need Maven. Go to
maven.apache.org/download.cgi and download
apache-maven-3.2.1-bin.tar.gz. The Drill Wiki page says that any Maven
3.0+ will work, but this is not true. There is a bug that will cause a
build error when installing Drill, and it is only avoidable with the
current Maven (3.2.1). The information on the Drill’s wiki page is often
out dated and there doesn’t seem to be anyone actively managing it.

![](http://i.imgur.com/9w0a6JL.png)

Check to make sure Maven is not already installed:

    mvn –version

If you’ve just freshly installed Ubuntu, it shouldn’t be installed. If
it is, you could try uninstalling it with:

    sudo apt-get purge <package name>

In this case, \<package name\> is most likely “maven” or “maven2″. Next,
I installed the downloaded maven package with these steps:

    sudo tar –zxvf apache-maven-3.2.1-bin.tar.gz
    sudo mkdir –p /usr/local/apache-maven
    sudo mv apache-maven-3.2.1 /usr/local/apache-maven
    gedit ~/.profile

gedit will open, append to the bottom:

    export M2_HOME=/usr/local/apache-maven/apache-maven-3.2.1
    export M2=$M2_HOME/bin
    export MAVEN_OPTS="-Xms256m -Xmx512m"
    export PATH=$M2:$PATH

Save and close. Back at the terminal:

    sudo ln -s /usr/local/apache-maven/apache-maven-3.2.1/bin/mvn /usr/bin/mvn
    mvn -version

“mvn –version” will return something similar to:

![](http://i.imgur.com/YOaYrJJ.png)

Now that JDK 1.7 and Maven 3.2.1 is installed, we are ready to install
Apache Drill.

**Installing Apache Drill**
---------------------------

You can either install Apache Drill by installing the binaries or
compiling the source files. According to Drill’s Wiki page, the quickest
way to get started is to install the binaries, which I found out after
two days, just doesn’t work. When there are updates, the binaries are
not updated in sync with the source files. The only option is to compile
the source files (this is why Maven 3.2.1 is a prerequisite).

Install git:

    sudo apt-get install git-all

Grab the Drill files:

    git clone https://github.com/apache/incubator-drill.git

Install Drill:

    cd incubator-drill
    mvn clean install -DskipTests

*Note: System may hang if you leave out “-DskipTests” or take an absurd
amount of time to complete. Mine never completed without this option.*

![](http://i.imgur.com/dK10sHg.png)

After it is finished buildling, feed the terminal these commands:

    mkdir drill
    sudo tar xvzf distribution/target/*.tar.gz --strip=1 -C drill

**Running Queries with Apache Drill**
-------------------------------------

If there are no errors up until now, Drill should be installed and we
are ready to try some queries:

    cd drill
    bin/sqlline –u jdbc:drill:zk=local –n admin –p admin

\<more info on shell\>

*Note: You may get some permission denied errors. These are the log
files being denied permission, which you can avoid by putting sudo
before the command. You can ignore this if you want to.*

    select * from cp.`employee.json`;

*Note: employee.json is already included in the source files somewhere,
so try that command as it is.*

![](http://i.imgur.com/4J2jM12.png)

The interesting thing about Drill is that you can query your noSQL data
in natural SQL language, meaning you can run queries such as:

    select * from cp.`employee.json` where position_id=13;

    select employee_id as id, full_name as name from cp.`employee.json` where position_id=13 and first_name=’Michael’;

![](http://i.imgur.com/k5xJBTd.png)

Let us try running queries on some of our own data. The data I am going
to use is from my other project, [Lower Orbit – Yelp
Challenge/FourSquare
Dataset.](http://sjsubigdata.wordpress.com/2014/02/21/lower-orbit-foursquare-dataset/) In
particular, I am going to try running some queries on the user.json,
which contains user data that you might see on a user profile such as
name, review count, friends, etc.

First, I moved the data into the “sample-data” folder in “drill” by
opening a new terminal (Ctrl+Shift+N)

    sudo mv <source> <destination>

In my case:

    sudo mv user.json incubator-drill/drill/sample-data

Close the terminal.\
 *Note: This step gets very tedious to do when I was troubleshooting the
json file for errors caused by nested data. An easier approach is to
change the folder permissions with “sudo chown \<username\> \<path to
directory\>”.*

Unfortunately, I’ve ran into some errors that I cannot solve yet. First,
I cannot seem to run queries on a large data set on my local machine.

    select name from cp.`sample/data-user.json`;

![](http://i.imgur.com/WtSv3Fz.png)

I created a snippet of the data set containing 300 objects instead of
70,000 to at least see what kind of operations I can perform on my own
data set:

    select name, review_count from cp.`sample-data/user-short.json`;

![](http://i.imgur.com/OrYCTV0.png)

I am able to execute “select” and “from” clauses, but not the “where”
clause. I took 10 user objects out of the 70,000 user objects and found
that it was the nested data under the “friends” field that was causing
an error when I use the “where” clause.

*4/29/14 Update*

After playing around some more with the data, I found that the failures
seem to be coming from two things. A “BatchExceededException: [ Batch
exceeded in size. Capacity: 262145, Attempted: 22 ]” occurs with the
user.json, which I suspect may have to do with the file size of the
file. Secondly, I couldn’t query the data when the field
“average\_stars” contained a combination of floats and ints. For
example, one object may have average\_star: 3 and another object
average\_star: 3.6. This will cause a cast exception and the query will
not be executed.

In order to get Drill to accept my data, I had to remove a few fields
(average\_stars, elite,  and friends). I am not entirely sure why yet,
but it seems that Drill is not very stable at handling my nested data.

    select name, review_count from cp.`sample-data/user.json` where review_count > 2500 order by review_count;

![](http://i.imgur.com/g8JPYMq.png)

Here I was able to query the entire user.json file (instead of a
shortened version of it) and get these fields.

Future tasks:

-   Joins
-   Cluster mode

**Installing Virtual Box**
--------------------------

virtual box manual:
[http://www.virtualbox.org/manual/ch01.html](http://www.virtualbox.org/manual/ch01.html)

**Installing Ubuntu**
---------------------

installing Ubuntu on Virtual
Box: http://www.wikihow.com/Install-Ubuntu-on-VirtualBox

youtube video: https://www.youtube.com/watch?v=rt8wrKBKrt0

**Sources and Links**
---------------------

[https://www.digitalocean.com/community/articles/how-to-install-java-on-ubuntu-with-apt-get](https://www.digitalocean.com/community/articles/how-to-install-java-on-ubuntu-with-apt-get)

[http://askubuntu.com/questions/420281/how-to-update-maven-3-0-4-3-1-1](http://askubuntu.com/questions/420281/how-to-update-maven-3-0-4-3-1-1)

[http://mail-archives.apache.org/mod\_mbox/incubator-drill-dev/201404.mbox/browser](http://mail-archives.apache.org/mod_mbox/incubator-drill-dev/201404.mbox/browser)

[http://www.mapr.com/sites/default/files/apache\_drill\_interactive\_ad-hoc\_query\_at\_scale-hausenblas\_nadeau1.pdf](http://www.mapr.com/sites/default/files/apache_drill_interactive_ad-hoc_query_at_scale-hausenblas_nadeau1.pdf)

[https://github.com/apache/incubator-drill/blob/master/INSTALL.md](https://github.com/apache/incubator-drill/blob/master/INSTALL.md)

[https://cwiki.apache.org/confluence/display/DRILL/Apache+Drill+Wiki](https://cwiki.apache.org/confluence/display/DRILL/Apache+Drill+Wiki)

**[Introduction to Apache
Drill](https://www.slideshare.net/SwissHUG/introduction-to-apache-drill "Introduction to Apache Drill")**
from **[Swiss Big Data User Group](http://www.slideshare.net/SwissHUG)**

[About these ads](http://en.wordpress.com/about-these-ads/)