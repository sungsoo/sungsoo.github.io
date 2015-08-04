---
layout: post
title: What is Hybrid Transaction/Analytical Processing (HTAP)?
date: 2015-08-07
categories: [computer science]
tags: [big data, data management]

---

## Article Source
* Title: [What is Hybrid Transaction/Analytical Processing (HTAP)?](http://www.zdnet.com/article/what-is-hybrid-transactionanalytical-processing-htap/?__scoop_post=5a2c0ef0-3a36-11e5-d425-90b11c3998fc&__scoop_topic=2632592#__scoop_post=5a2c0ef0-3a36-11e5-d425-90b11c3998fc&__scoop_topic=2632592)
* Authors:[Timo Elliott](http://www.zdnet.com/meet-the-team/us/timo.elliott/)

---

# What is Hybrid Transaction/Analytical Processing (HTAP)?

### According to analysts, in-memory Hybrid Transaction / Analytical Processing (HTAP) is the future of business applications.

According to industry analysts, Hybrid Transaction / Analytical Processing (HTAP) is the future of business applications.

The term was [coined in early 2014 by analyst firm Gartner](https://www.gartner.com/doc/2657815/hybrid-transactionanalytical-processing-foster-opportunities) to describe a new generation of in-memory data platforms that can perform both [online transaction processing](http://en.wikipedia.org/wiki/Online_transaction_processing) (OLTP) and [online analytical processing](http://en.wikipedia.org/wiki/Online_analytical_processing) (OLAP) without requiring *data duplication*.

For the last few decades, it has been considered best practice to keep operational and analytic systems separate, in order to prevent analytic workloads from disrupting operational processing. In order to achieve adequate speeds for analytic queries, data has typically copied from one or more operational systems to a Data Mart or [Data Warehouse](http://en.wikipedia.org/wiki/Data_warehouse).

This approach was challenged in 2009 with the publication of a white paper by [Dr. Hasso Plattner](http://en.wikipedia.org/wiki/Hasso_Plattner) entitled [A Common Database Approach for OLTP and OLAP Using an In-Memory Column Database](http://www.sigmod09.org/images/sigmod1ktp-plattner.pdf). The paper argued that advances in in-memory technology enabled a new approach for standard business applications where data could be stored just once without compromising either transactions or analytical workloads.

HTAP systems are now commercially available, from major vendors such as SAP with the [SAPHANA](http://saphana.com/) platform, and smaller startups such as VoltDB, NuoDB, Clustrix, and MemSQL.

Gartner believes that HTAP systems can address the four major drawbacks of this traditional approach:

First, for analytics in HTAP, data doesn't have to move from operational databases to data warehouses. Secondly, transactional data is readily available for analytics when created. Thirdly, drill-down from analytic aggregates always points to fresh HTAP application data. Finally, you eliminate or at least cut the need for multiple copies of the same data.
Gartner emphasizes that in-memory databases are very different from just using existing databases with Flash disks or in-memory caches. To get the full benefits of using in-memory, databases need to take an entirely different approach from existing disk-based systems. This may be why, even though most of the major database manufacturers now offer in-memory processing options, these are typically only for analytics only, and require a copy of the data. This in turn means there is a delay between when a new transaction being written to the database and when it is available for analysis -- i.e. they are not HTAP systems.

While some industry analysts continue to assume in-memory systems are a "luxury" that is only justified in situations that require real-time processing, Gartner believes HTAP approaches are more cost-effective, with the higher hardware costs more than outweighed by lower costs of operations and greater flexibility. These seems to be confirmed by the increasing numbers of organizations that have announced they are moving their business applications to in-memory HTAP systems.

Indiana Gov't Runs SAP in Initiative to Lower Recidivism | ZDNet
Transparency and data-driven decision making are building trust in the U.S. state of Indiana. See how government agencies are using SAP HANA to reduce recidivism...
Sponsored by SAP 
After extensive research, Gartner has concluded that industry disruption through HTAP technology is set to grow:

Hybrid transaction/analytical processing will empower application leaders to innovate via greater situation awareness and improved business agility. This will entail an upheaval in the established architectures, technologies and skills driven by use of in-memory computing technologies as enablers.
Many Big Data architectural approaches such as Data Lakes continue to separate transactional and analytical activities. The rise of HTAP applications makes it clear that such approaches are only part of an overall information architecture strategy.