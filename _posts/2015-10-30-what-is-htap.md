---
layout: post
title: What is HTAP?
date: 2015-10-30
categories: [computer science]
tags: [big data]

---



## Article Source
* Title: [What is HTAP?](http://timoelliott.com/blog/2014/12/what-is-htap.html)
* Authors: [Timo Elliott](https://plus.google.com/+TimoElliott)

---

What is HTAP? 
=============

[![what is htap
large](http://timoelliott.com/blog/wp-content/uploads/2014/12/what-is-htap-large-608x608.jpg)](http://timoelliott.com/blog/wp-content/uploads/2014/12/what-is-htap-large.jpg)

[HTAP](http://en.wikipedia.org/wiki/Hybrid_Transactional/Analytical_Processing_(HTAP))
stands for Hybrid Transaction / Analytical Processing — and it’s the
future of business applications.

The term was [coined in early 2014 by analyst firm
Gartner](https://www.gartner.com/doc/2657815/hybrid-transactionanalytical-processing-foster-opportunities)
to describe a new generation of in-memory data platforms that can
perform both [online transaction
processing](http://en.wikipedia.org/wiki/Online_transaction_processing "Online transaction processing")
(OLTP) and [online analytical
processing](http://en.wikipedia.org/wiki/Online_analytical_processing "Online analytical processing")
(OLAP) without requiring data duplication.

For the last few decades, it has been considered best practice to
keep operational and analytic systems separate, in order to
prevent analytic workloads from disrupting operational processing. In
order to achieve adequate speeds for analytic queries, data
has typically copied from one or more operational systems to a Data Mart
or [Data Warehouse](http://en.wikipedia.org/wiki/Data_warehouse).

This approach was challenged in 2009 with the publication of a white
paper by [Dr. Hasso
Plattner](http://en.wikipedia.org/wiki/Hasso_Plattner) entitled [A
Common Database Approach for OLTP and OLAP Using an In-Memory Column
Database](http://www.sigmod09.org/images/sigmod1ktp-plattner.pdf). The
paper argued that advances in in-memory technology enabled a new
approach for standard business applications where data could be stored
just once without compromising either transactions or analytical
workloads.

HTAP systems are now commercially available, from major vendors such as
SAP with the [SAPHANA](http://saphana.com) platform, and smaller
startups such as [VoltDB](http://en.wikipedia.org/wiki/VoltDB),
[NuoDB](http://en.wikipedia.org/wiki/NuoDB),
[Clustrix](http://www.clustrix.com/), and
[MemSQL](http://www.memsql.com/).

Gartner believes that [HTAP systems can address the four major drawbacks
of this traditional
approach](http://www.zdnet.com/sql-and-nosql-fine-but-how-does-the-hybrid-database-fit-in-7000029277/):

> First, for analytics in HTAP, data doesn’t have to move from
> operational databases to data warehouses. Secondly, transactional data
> is readily available for analytics when created. Thirdly, drill-down
> from analytic aggregates always points to fresh HTAP application
> data. Finally, you eliminate or at least cut the need for multiple
> copies of the same data.

Gartner emphasizes that [in-memory databases are very different
from just using existing databases with Flash disks or in-memory
caches](http://blogs.gartner.com/donald-feinberg/2014/09/28/in-memory-dbms-vs-in-memory-marketing/).
To get the full benefits of using in-memory, databases need to take an
entirely different approach from existing disk-based systems. This may
be why, even though most of the major database manufacturers now offer
in-memory processing options, [these are typically only for analytics
only, and require a copy of the
data](http://www.bluefinsolutions.com/Blogs/John-Appleby/May-2012/Update-III-The-SAP-HANA-FAQ-answering-key-SAP/).
This in turn means there is a delay between when a new transaction being
written to the database and when it is available for analysis — i.e.
they are not HTAP systems.

While some industry analysts continue to assume in-memory systems are a
“[luxury](http://timoelliott.com/blog/2014/09/is-sap-hana-a-luxury.html)”
that is only justified in situations that require real-time processing,
[Gartner believes HTAP approaches are more
cost-effective](http://timoelliott.com/blog/2013/04/why-in-memory-computing-is-cheaper-and-changes-everything.html),
with the higher hardware costs more than outweighed by lower costs of
operations and greater flexibility. These seems to be confirmed by the
increasing numbers of organizations that have announced they are [moving
their business applications to in-memory HTAP
systems](http://sapinsider.wispubs.com/Assets/Articles/2014/August/IP-over-1200-customers-and-growing).

After extensive research, Gartner has concluded that industry disruption
through HTAP technology [is set to
grow:](https://www.gartner.com/doc/2657815/hybrid-transactionanalytical-processing-foster-opportunities)

> Hybrid transaction/analytical processing will empower application
> leaders to innovate via greater situation awareness and improved
> business agility. This will entail an upheaval in the established
> architectures, technologies and skills driven by use of in-memory
> computing technologies as enablers.

Many Big Data architectural approaches such as [Data
Lakes](http://timoelliott.com/blog/2014/12/from-data-lakes-to-data-swamps.html)continue
to separate transactional and analytical activities. The rise of HTAP
applications makes it clear that such approaches are only part of
an overall information architecture strategy.

