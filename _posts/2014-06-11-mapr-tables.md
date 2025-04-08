---
layout: post
title: M7 - Native Storage for MapR Tables
date: 2014-06-11
categories: [computer science]
tags: [big data, big data]

---

## Article Source
* Title: [M7 - Native Storage for MapR Tables](http://doc.mapr.comhttp://doc.mapr.com/display/MapR/M7+-+Native+Storage+for+MapR+Tables)
* Authors: [Peter Conrad](http://doc.mapr.comhttp://doc.mapr.com/display/~admin) and [Paul Echeverri](http://doc.mapr.comhttp://doc.mapr.com/display/~pecheverri) 



[![](http://sungsoo.github.com/images/mapr-tables.png)](http://sungsoo.github.com/images/mapr-tables.png)

---

# About MapR Tables

In the 3.0 release of the MapR distribution for Hadoop, MapR-FS enables
you to create and manipulate tables in many of the same ways that you
create and manipulate files in a standard UNIX file system. This
document discusses how to set up your MapR installation to use MapR
tables. For users experienced with standard Apache HBase, this document
describes the differences in capabilities and behavior between MapR
tables and Apache HBase tables.

## MapR-FS Handles Structured and Unstructured Data 

The 3.0 release of the MapR distribution for Hadoop features a unified
architecture for files and tables, providing distributed data
replication for structured and unstructured data. Tables enable you to
manage *structured* data, as opposed to the unstructured data management
provided by files. The structure for structured data management is
defined by a *data model*, a set of rules that defines the relationships
in the structure.

By design, the data model for tables in MapR focuses on columns, similar
to the open-source standard Apache HBase system. Like Apache HBase, MapR
tables store data structured as a nested sequence of key/value pairs,
where the value in one pair serves as the key for another pair. Apache
HBase works with MapR tables. With a properly licensed MapR
installation, you can use MapR tables exclusively or work in a mixed
environment with Apache HBase tables.

MapR tables are implemented directly within MapR-FS, yielding a
familiar, open-standards API that provides a high-performance datastore
for tables. MapR-FS is written in C and optimized for performance. As a
result, MapR-FS runs significantly faster than JVM-based Apache HBase.
The diagram below compares the application stacks for different HBase
implementations.

![](http://sungsoo.github.com/images/hbase_stack_comparison.png)

## Benefits of Integrated Tables in MapR-FS 

The MapR cluster architecture provides the following benefits for table
storage, providing an enterprise-grade HBase environment.

-   MapR clusters with HA features recover instantly from node failures.
-   MapR provides a unified namespace for tables and files, allowing
    users to group tables in directories by user, project, or any other
    useful grouping.
-   Tables are stored in volumes on the cluster alongside unstructured
    files. Storage policy settings for
    [volumes](http://doc.mapr.com/display/MapR/Managing+Data+with+Volumes) apply to tables
    as well as files.
-   Volume mirrors and snapshots provide flexible, reliable read-only
    access.
-   Table storage and MapReduce jobs can co-exist on the same nodes
    without degrading cluster performance.
-   The use of MapR tables imposes no administrative overhead beyond
    administration of the MapR cluster.
-   Node upgrades and other administrative tasks do not cause downtime
    for table storage.

## The MapR Implementation of HBase 

MapR's implementation supports the core HBase API. Programmers who are
used to writing code for the HBase API will have immediate, intuitive
access to MapR tables. MapR delivers faithfully on the original vision
for Google's BigTable paper, using the open-standard HBase API.

MapR's implementation of the HBase API provides enterprise-grade high
availability (HA), data protection, and disaster recovery features for
tables on a distributed Hadoop cluster. MapR tables can be used as the
underlying key-value store for Hive, or any other application requiring
a high-performance, high-availability key-value datastore. Because MapR
uses the open-standard HBase API, many legacy HBase applications can
continue to run on MapR without modification.

MapR has extended `hbase shell` to work with MapR tables in addition to
Apache HBase tables. Similar to development for Apache HBase, the
simplest way to create tables and column families in MapR-FS, and put
and get data from them, is to use `hbase shell`. MapR tables can be
created from the [MapR Control
System](http://doc.mapr.com/display/MapR/MapR+Control+System) (MCS) user interface or from
the Linux [command line](http://doc.mapr.com/display/MapR/table), without the need to
coordinate with a database administrator. You can treat a MapR table
just as you would a file, specifying a path to a location in a
directory, and the table appears in the same namespace as your regular
files. You can also create and manage [column
families](http://doc.mapr.com/display/MapR/table+cf) for your table from the MCS or
directly from the command line.


* The Apache HBase API exposes many low-level administrative functions that can be tuned for performance or reliability. The reliability and functionality of MapR tables renders these low-level functions moot, and these low-level calls are not supported for MapR tables. See [MapR Table Support for Apache HBase API](http://doc.mapr.com/display/MapR/MapR+Table+Support+for+Apache+HBase+API) for detailed information.

During [data
migration](http://doc.mapr.com/display/MapR/Migrating+Between+Apache+HBase+Tables+and+MapR+Tables)
or other specific scenarios where you need to refer to a MapR table of
the same name as an Apache HBase table in the same cluster, you can [map
the table
namespace](http://doc.mapr.com/display/MapR/Mapping+Table+Namespace+Between+Apache+HBase+Tables+and+MapR+Tables)
to enable that operation.

To summarize:

-   The MapR table API works with the core HBase API.
-   MapR tables implement the HBase feature set.
-   You can use MapR tables as the datastore for Hive applications.

## Effects of Decoupling API and Architecture 

The following features of MapR tables result from decoupling the HBase
API from the Apache HBase architecture:

-   MapR's High Availability (HA) cluster architecture eliminates the
    RegionServer component of traditional Apache HBase architecture,
    which was a single point of failure and bottleneck for scalability.
    In MapR-FS, MapR tables are HA at all levels, similar to other
    services on a MapR cluster.
-   MapR-FS allows an unlimited number of tables, with cells up to 16MB.
-   MapR tables can have up to 64 column families, with no limit on
    number of columns.
-   MapR-FS automates compaction operations and splitting for MapR
    tables.
-   Crash recovery is significantly faster than Apache HBase.

## The HBase Data Model 

Apache HBase stores structured data as a nested series of maps. Each map
consists of a set of key-value pairs, where the value can be the key in
another map. Keys are kept in strict lexicographical order: 1, 10, and
113 come before 2, 20, and 213.

In descending order of granularity, the elements of an HBase entry are:

-   **Key**: Keys define the rows in an HBase table.
-   **Column family**: A column family is a key associated with a set of
    columns. Specify this association according to your individual use
    case, creating sets of columns. A column family can contain an
    arbitrary number of columns. MapR tables support up to 64 column
    families.
-   **Column**: Columns are keys that are associated with a series of
    timestamps that define when the value in that column was updated.
-   **Timestamp**: The timestamp in a column specifies a particular data
    write to that column.
-   **Value**: The data written to that column at the specific
    timestamp.

This structure results in versioned values that you can access flexibly
and quickly. Because Apache HBase and MapR tables are *sparse*, any of
the column values for a given key can be null.

## Example HBase Table 

This example uses JSON notation for representational clarity. In this
example, timestamps are arbitrarily assigned.

```json
{
 "arbitraryFirstKey" : {
     "firstColumnFamily" : {
          "firstColumn" : {
               10 : "valueFive",
               7 : "valueThree",
               4 : "valueOne",
               }
          "secondColumn" : {
               16 : "valueEight",
               1 : "valueSeven",
               }
          }
     "secondColumnFamily" : {
          "firstColumn" : {
               37 : "valueFive",
               23 : "valueThree",
               11 : "valueSeven",
               4 : "valueOne",
               }
          "secondColumn" : {
               15 : "valueEight",
               }
          }
     }
 "arbitrarySecondKey" : {
     "firstColumnFamily" : {
          "firstColumn" : {
               10 : "valueFive",
               4 : "valueOne",
               }
          "secondColumn" : {
               16 : "valueEight",
               7 : "valueThree",
               1 : "valueSeven",
               }
          }
     "secondColumnFamily" : {
          "firstColumn" : {
               23 : "valueThree",
               11 : "valueSeven",
               }
          }
     }
}
```

HBase queries return the most recent timestamp by default. A query for
the value in "arbitrarySecondKey"/"secondColumnFamily:firstColumn"
returns `valueThree`. Specifying a timestamp with a query for
"arbitrarySecondKey"/"secondColumnFamily:firstColumn"/11 returns
`valueSeven`.

# Using MapR and Apache HBase Tables Together 

MapR table storage is independent from Apache HBase table storage,
enabling a single MapR cluster to run both systems. Users typically run
both systems concurrently, particularly during the migration phase.
Alternately, you can leave Apache HBase running for existing
applications, and use MapR tables for new applications. You can set up
[namespace
mappings](http://doc.mapr.com/display/MapR/Mapping+Table+Namespace+Between+Apache+HBase+Tables+and+MapR+Tables)
for your cluster to run both MapR tables and Apache HBase tables
concurrently, during
[migration](http://doc.mapr.com/display/MapR/Migrating+Between+Apache+HBase+Tables+and+MapR+Tables)
or on an ongoing basis.

# Current Limitations 

-   Custom HBase filters are not supported.
-   User permissions for column families are not supported. User
    permissions for tables and columns are supported.
-   HBase authentication is not supported.
-   HBase replication is handled with [Mirror
    Volumes](http://doc.mapr.com/display/MapR/Mirror+Volumes).
-   Bulk loads using the HFiles workaround are not supported and not
    necessary.
-   HBase coprocessors are not supported.
-   Filters use a different regular expression library from
    `java.util.regex.Pattern`. See [Supported Regular Expressions in
    MapR
    Tables](http://doc.mapr.com/display/MapR/Supported+Regular+Expressions+in+MapR+Tables)
    for a complete list of supported regular expressions.
-   The maximum row size is 16MB.

# Administering MapR Tables 

The [MapR Control System](http://doc.mapr.com/display/MapR/MapR+Control+System) and the
[command-line interface](http://doc.mapr.com/display/MapR/API+Reference) provide a compact
set of features for [adding and managing tables](http://doc.mapr.com/display/MapR/table).
In a traditional HBase environment, cluster administrators are typically
involved in provisioning tables and column families, because of
limitations on the number of tables and column families that Apache
HBase can support. MapR supports a virtually unlimited number of tables
with up to 64 column families, reducing administrative overhead.

HBase programmers can use the API function calls to create as many
tables and column families as needed for the particular application.
Programmers can also use tables to store intermediate data in a
multi-stage MapReduce program, then delete the tables without assistance
from an administrator. See [Working With MapR Tables and Column
Families](http://doc.mapr.com/display/MapR/Working+With+MapR+Tables+and+Column+Families)
for more information.

# Related Topics 

-   [Setting Up MapR-FS to Use
    Tables](http://doc.mapr.com/display/MapR/Setting+Up+MapR-FS+to+Use+Tables)
-   [Working With MapR Tables and Column
    Families](http://doc.mapr.com/display/MapR/Working+With+MapR+Tables+and+Column+Families)
-   [Mapping Table Namespace Between Apache HBase Tables and MapR
    Tables](http://doc.mapr.com/display/MapR/Mapping+Table+Namespace+Between+Apache+HBase+Tables+and+MapR+Tables)
-   [Protecting Table Data](http://doc.mapr.com/display/MapR/Protecting+Table+Data)
-   [Migrating Between Apache HBase Tables and MapR
    Tables](http://doc.mapr.com/display/MapR/Migrating+Between+Apache+HBase+Tables+and+MapR+Tables)
