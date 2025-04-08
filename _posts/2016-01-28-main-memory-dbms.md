---
layout: post
title: Main Memory DBMS 
date: 2016-01-28
categories: [computer science]
tags: [data management, htap]

---



## Article Source
* Title: Main Memory DBMS
* Authors: PETER BONCZ, CWI, Amsterdam, The Netherlands

---

# Main Memory DBMS

## Synonyms
In-memory DBMS; MMDBMS


## Definition

A *main memory database system* is a DBMS that primarily relies on main memory for computer data storage. In contrast, conventional database management systems typically employ hard disk based persistent storage.

## Key Points
The main advantage of MMDBMS over normal DBMS technology is superior *performance*, as I/O cost is no more a performance cost factor. With I/O as main optimization focus eliminated, the architecture of main memory database systems typically aims at optimizing CPU cost and CPU cache usage, leading to different *data layout strategies* (avoiding complex tuple representations) as well as indexing structures (e.g., B-trees with lower-fan-outs with nodes of one or a few CPU cache lines).

While built on top of volatile storage, most MMDB products offer *ACID properties*, via the following mechanisms: (i) *Transaction Logging*, which records changes to the database in a journal file and facilitates automatic recovery of an in-memory database, (ii) *Non-volatile RAM*, usually in the form of static RAM backed up with battery power (*battery RAM*), or an electrically erasable programmable ROM (*EEPROM*). With this storage, the MMDB system can recover the data store from its last consistent state upon reboot, (iii) *High availability* implementations that rely on database replication, with automatic failover to an identical standby database in the event of primary database failure.

Main-memory database systems were originally popular in *real-time systems* (used in e.g., telecommunications) for their fast and more predictable performance, and this continues to be the case. However, with increasing RAM sizes allowing more problems to be addressed using a MMDBMS, this technology is proliferating into many other areas, such as on-line transaction systems, and recently in decision support. Main memory database systems are also deployed as drop-in systems that intercept read-only queries on cached data from an existing disk-based DBMS, thus reducing its workload and providing fast answers to a large percentage of the workload.

## Examples
Examples of main-memory database systems are MonetDB, SolidDB, TimesTen and DataBlitz. MySQL offers a main-memory backend based on Heap tables. The MySQL Cluster product is a parallel main memory system that offers ACID properties through high availability.


## Recommended Reading

1. Bohannon P., Lieuwen D.F., Rastogi R., Silberschatz A., Seshadri S., and Sudarshan S. *The architecture of the dali main-memory storage manager*. Multimedia Tools Appl., 4(2):115–151, 1997.
2. Boncz P.A. and Kersten M.L. *MIL primitives for querying a fragmented world*. VLDB J., 8(2):101–119, 1999.
3. DeWitt D.J., Katz R.H., Olken F., Shapiro L.D., Stonebraker M., and Wood D.A. *Implementation techniques for main memory database systems*. In Proc. ACM SIGMOD Int. Conf. on Man-
agement of Data, 1984, pp. 1–8.
4. Hvasshovd S-O., Torbjornsen O., Bratsberg S.E., and Holager P.
*The ClustRa telecom database: high availability, high throughput, and real-time response*. In Proc. 21th Int. Conf. on Very Large Data Bases, 1995, pp. 469–477.
