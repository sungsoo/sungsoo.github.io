---
layout: post
title: Why NoSQL?
date: 2014-07-08
categories: [computer science]
tags: [big data]

---



## Article Source
* Title: [Why NoSQL?](http://www.couchbase.com/why-nosql/nosql-database)

[![](http://sungsoo.github.com/images/nosql.png)](http://sungsoo.github.com/images/nosql.png)

# Why NoSQL? 

Three trends disrupting the database status quo
-----------------------------------------------

Interactive applications have changed dramatically over the last 15
years, and so have the data management needs of those apps. Today, three
interrelated megatrends – Big Data, Big Users, and Cloud Computing – are
driving the adoption of NoSQL technology. And NoSQL is increasingly
considered a viable alternative to relational databases, especially as
more organizations recognize that operating at scale is better achieved
on clusters of standard, commodity servers, and a schema-less data model
is often better for the variety and type of data captured and processed
today.

[Why NoSQL?
 Download the White Paper
 Available now](http://info.couchbase.com/WhyNoSQLWhitepaper.html)

## Big Users

Not that long ago, 1,000 daily users of an application was a lot and
10,000 was an extreme case. Today, with the growth in global Internet
use, the increased number of hours users spend online, and the growing
popularity of smartphones and tablets, it's not uncommon for apps to
have millions of users a day.

![](http://sungsoo.github.com/images/Figure1a.png)

Supporting large numbers of concurrent users is important but, because
app usage requirements are hard to predict, it’s just as important to
dynamically support rapidly growing (or shrinking) numbers of concurrent
users:

-   A newly launched app can go viral, growing from zero to a million
    users overnight – literally.
-   Some users are active frequently, while others use an app a few
    times, never to return.
-   Seasonal swings like those around Christmas or Valentine’s Day
    create spikes for short periods.

The large numbers of users combined with the dynamic nature of usage
patterns is driving the need for more easily scalable database
technology. With relational technologies, many application developers
find it difficult, or even impossible, to get the dynamic scalability
and level of scale they need while also maintaining the performance
users demand. Many are turning to NoSQL for help.

## Big Data

Data is becoming easier to capture and access through third parties such
as Facebook, D&B, and others. Personal user information, geo location
data, social graphs, user-generated content, machine logging data, and
sensor-generated data are just a few examples of the ever-expanding
array of data being captured. It’s not surprising that developers want
to enrich existing applications and create new ones made possible by it.
And the use of the data is rapidly changing the nature of communication,
shopping, advertising, entertainment, and relationship management. Apps
that don’t leverage it quickly will quickly fall behind.

![](http://sungsoo.github.com/images/Figure2a.png)

Developers want a very flexible database that easily accommodates new
data types and isn’t disrupted by content structure changes from
third-party data providers. Much of the new data is unstructured and
semi-structured, so developers also need a database that is capable of
efficiently storing it. Unfortunately, the rigidly defined, schema-based
approach used by relational databases makes it impossible to quickly
incorporate new types of data, and is a poor fit for unstructured and
semi-structured data. NoSQL provides a data model that maps better to
these needs.

## Cloud Computing

Today, most new applications (both consumer and business) use a
three-tier Internet architecture, run in a public or private cloud, and
support large numbers of users.

In the three-tier architecture, applications are accessed through a web
browser or mobile app that is connected to the Internet. In the cloud, a
load balancer directs the incoming traffic to a scale-out tier of
web/application servers that process the logic of the application. The
scale-out architecture at the web/application tier works beautifully.
For every 10,000 (or however many) new concurrent users, you simply add
another commodity server to the web application tier to absorb the load.

At the database tier, relational databases were originally the popular
choice. Their use was increasingly problematic however, because they are
a centralized, share-everything technology that scales up rather than
out. This made them a poor fit for applications that require easy and
dynamic scalability. NoSQL databases have been built from the ground up
to be distributed, scale-out technologies and therefore fit better with
the highly distributed nature of the three-tier Internet architecture.

# Why are developers considering NoSQL?

## More flexible data model

Relational and NoSQL data models are very different. The relational
model takes data and separates it into many interrelated tables that
contain rows and columns. Tables reference each other through foreign
keys that are stored in columns as well.  When looking up data, the
desired information needs to be collected from many tables (often
hundreds in today’s enterprise applications) and combined before it can
be provided to the application. Similarly, when writing data, the write
needs to be coordinated and performed on many tables.

NoSQL databases have a very different model. For example, a
document-oriented NoSQL database takes the data you want to store and
aggregates it into documents using the JSON format. Each JSON document
can be thought of as an object to be used by your application. A JSON
document might, for example, take all the data stored in a row that
spans 20 tables of a relational database and aggregate it into a single
document/object. Aggregating this information may lead to duplication
of  information, but since storage is no longer cost prohibitive, the
resulting data model flexibility, ease of efficiently distributing the
resulting documents and read and write performance improvements make it
an easy trade-off for web-based applications.

![](http://sungsoo.github.com/images/Figure5a.png)

Another major difference is that relational technologies have rigid
schemas while NoSQL models are schemaless. Relational technology
requires strict definition of a schema prior to storing any data into a
database. Changing the schema once data is inserted is a big deal,
extremely disruptive and frequently avoided – the exact opposite of the
behavior desired in the Big Data era, where application developers need
to constantly – and rapidly – incorporate new types of data to enrich
their apps.

In comparison, document databases are schemaless, allowing you to freely
add fields to JSON documents without having to first define changes. The
format of the data being inserted can be changed at any time, without
application disruption.

## Scalability and performance advantages

To deal with the increase in concurrent users (Big Users) and the amount
of data (Big Data), applications and their underlying databases need to
scale using one of two choices: scale up or scale out. Scaling up
implies a centralized approach that relies on bigger and bigger servers.
Scaling out implies a distributed approach that leverages many standard,
commodity physical or virtual servers.

### Scale up with relational technology: limitations at the database tier

At the web/application tier of the three-tier Internet architecture, a
scale out approach has been the default for many years and worked
extremely well. As more people use an application, more commodity
servers are added to the web/application tier, performance is maintained
by distributing load across an increased number of servers, and the cost
scales linearly with the number of users.

![](http://sungsoo.github.com/images/Figure6a.png)

Prior to NoSQL databases, the default scaling approach at the database
tier was to scale up. This was dictated by the fundamentally
centralized, shared-everything architecture of relational database
technology. To support more concurrent users and/or store more data, you
need a bigger and bigger server with more CPUs, more memory, and more
disk storage to keep all the tables. Big servers tend to be highly
complex, proprietary, and disproportionately expensive, unlike the
low-cost, commodity hardware typically used so effectively at the
web/application server tier.

### Scale out with NoSQL technology at the database tier

NoSQL databases were developed from the ground up to be distributed,
scale out databases. They use a cluster of standard, physical or virtual
servers to store data and support database operations. To scale,
additional servers are joined to the cluster and the data and database
operations are spread across the larger cluster. Since commodity servers
are expected to fail from time-to-time, NoSQL databases are built to
tolerate and recover from such failure making them highly resilient.

NoSQL databases provide a much easier, linear approach to database
scaling. If 10,000 new users start using your application, simply add
another database server to your cluster. Add ten thousand more users and
add another server. There’s no need to modify the application as you
scale since the application always sees a single (distributed) database.

![](http://sungsoo.github.com/images/Figure7a.png)

At scale, a distributed scale out approach also usually ends up being
cheaper than the scale up alternative. This is a consequence of large,
complex, fault tolerant servers being expensive to design, build and
support. Licensing costs of commercial relational databases can also be
prohibitive because they are priced with a single server in mind. NoSQL
databases on the other hand are generally open source, priced to operate
on a cluster of servers, and relatively inexpensive.

While implementations differ, NoSQL databases share some characteristics
with respect to scaling and performance:

-   Auto-sharding – A NoSQL database automatically spreads data across
    servers, without requiring applications to participate. Servers can
    be added or removed from the data layer without application
    downtime, with data (and I/O) automatically spread across the
    servers. Most NoSQL databases also support data replication, storing
    multiple copies of data across the cluster, and even across data
    centers, to ensure high availability and support disaster recovery.
    A properly managed NoSQL database system should never need to be
    taken offline, for any reason, supporting 24x365 continuous
    operation of applications.
-   Distributed query support – “Sharding” a relational database can
    reduce, or eliminate in certain cases, the ability to perform
    complex data queries. NoSQL database systems retain their full query
    expressive power even when distributed across hundreds of servers.
-   Integrated caching – To reduce latency and increase sustained data
    throughput, advanced NoSQL database technologies transparently cache
    data in system memory. This behavior is transparent to the
    application developer and the operations team, compared to
    relational technology where a caching tier is usually a separate
    infrastructure tier that must be developed to, deployed on separate
    servers, and explicitly managed by the ops team.
