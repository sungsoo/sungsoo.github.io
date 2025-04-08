---
layout: post
title: Release Notes - Tajo - Version 0.11.1
date: 2016-02-16
categories: [computer science]
tags: [big data]

---

Release Notes - Tajo - Version 0.11.1
=====================================

Sub-task
--------

-   [[TAJO-1855](https://issues.apache.org/jira/browse/TAJO-1855)] - Add
    document for tablespace configuration to the Configuration chapter.
-   [[TAJO-1856](https://issues.apache.org/jira/browse/TAJO-1856)] - Add
    a description about the relationship of tablespace, managed table,
    and external table to Tablespace section of Table Management chapter
-   [[TAJO-1992](https://issues.apache.org/jira/browse/TAJO-1992)] -
    \\set timezone in cli doesn't work because of casesensitive
-   [[TAJO-1993](https://issues.apache.org/jira/browse/TAJO-1993)] -
    Table Timezone doesn't work when Timezone is not exactly same.
-   [[TAJO-2024](https://issues.apache.org/jira/browse/TAJO-2024)] -
    Remove getContentSummary from HCatalogStore

Bug
---

-   [[TAJO-1578](https://issues.apache.org/jira/browse/TAJO-1578)] -
    User configuration for pull server port is ignored.
-   [[TAJO-1643](https://issues.apache.org/jira/browse/TAJO-1643)] -
    SQLParse can't parse parentheses table clause
-   [[TAJO-1753](https://issues.apache.org/jira/browse/TAJO-1753)] -
    GlobalEngine causes NPE occurs occasionally
-   [[TAJO-1921](https://issues.apache.org/jira/browse/TAJO-1921)] -
    Hbase Storage can cause NPE when the hbase cluster is restarted
-   [[TAJO-1935](https://issues.apache.org/jira/browse/TAJO-1935)] -
    Some Tasks don't work after they become TA\_ASSIGNED
-   [[TAJO-1954](https://issues.apache.org/jira/browse/TAJO-1954)] - Fix
    memory leak in physical operator
-   [[TAJO-1961](https://issues.apache.org/jira/browse/TAJO-1961)] -
    Client timezone does not work properly
-   [[TAJO-1964](https://issues.apache.org/jira/browse/TAJO-1964)] -
    TestKillQuery::testKillQueryFromInitState causes NPE
-   [[TAJO-1965](https://issues.apache.org/jira/browse/TAJO-1965)] -
    TestBlockingRpc::testServerShutdown occassionally fails
-   [[TAJO-1972](https://issues.apache.org/jira/browse/TAJO-1972)] -
    Invalid sort order with NULLS FIRST|LAST
-   [[TAJO-1977](https://issues.apache.org/jira/browse/TAJO-1977)] -
    Cannot recognize the space-contained tablename and databasename
-   [[TAJO-1978](https://issues.apache.org/jira/browse/TAJO-1978)] -
    Printout message before terminating TSQL
-   [[TAJO-1980](https://issues.apache.org/jira/browse/TAJO-1980)] -
    Printout the usage of TajoShellCommand
-   [[TAJO-1981](https://issues.apache.org/jira/browse/TAJO-1981)] -
    Invalid nulls sort order in VectorizedSorter
-   [[TAJO-2000](https://issues.apache.org/jira/browse/TAJO-2000)] -
    BSTIndex can cause OOM
-   [[TAJO-2001](https://issues.apache.org/jira/browse/TAJO-2001)] -
    DirectRawFileScanner.getProgress occasionally fails
-   [[TAJO-2010](https://issues.apache.org/jira/browse/TAJO-2010)] -
    Parquet can not read null value
-   [[TAJO-2013](https://issues.apache.org/jira/browse/TAJO-2013)] -
    FilterPushDownRule fails due to the unsupported index
-   [[TAJO-2014](https://issues.apache.org/jira/browse/TAJO-2014)] -
    TestRpcClientManager fails occasionally
-   [[TAJO-2016](https://issues.apache.org/jira/browse/TAJO-2016)] - Fix
    storage tests hangs
-   [[TAJO-2025](https://issues.apache.org/jira/browse/TAJO-2025)] -
    HBASE\_LIB/metrics-core-\*.jar should be included in CLASSPATH
-   [[TAJO-2034](https://issues.apache.org/jira/browse/TAJO-2034)] -
    Files required for executing python functions are not copied in
    testEval()
-   [[TAJO-2037](https://issues.apache.org/jira/browse/TAJO-2037)] -
    tajo-storage-hdfs tests occasionally hangs
-   [[TAJO-2038](https://issues.apache.org/jira/browse/TAJO-2038)] - NPE
    in FileScanner\#getProgress
-   [[TAJO-2066](https://issues.apache.org/jira/browse/TAJO-2066)] - Fix
    TestJoinOnPartitionedTables.testPartialFilterPushDown failure

Improvement
-----------

-   [[TAJO-1271](https://issues.apache.org/jira/browse/TAJO-1271)] -
    Improve memory usage of Hash-shuffle
-   [[TAJO-1740](https://issues.apache.org/jira/browse/TAJO-1740)] -
    Update Partition Table document
-   [[TAJO-1858](https://issues.apache.org/jira/browse/TAJO-1858)] -
    Aligning error message in execute query page of web UI is needed.
-   [[TAJO-1940](https://issues.apache.org/jira/browse/TAJO-1940)] -
    Implement HBaseTablespace::getTableVolume() method
-   [[TAJO-1950](https://issues.apache.org/jira/browse/TAJO-1950)] -
    Query master uses too much memory during range shuffle
-   [[TAJO-1966](https://issues.apache.org/jira/browse/TAJO-1966)] -
    Decrease memory usage of TajoTestingCluster
-   [[TAJO-1979](https://issues.apache.org/jira/browse/TAJO-1979)] -
    Usage of some TajoShellCommand is omitted
-   [[TAJO-1983](https://issues.apache.org/jira/browse/TAJO-1983)] -
    Improve memory usage of ExternalSortExec
-   [[TAJO-1985](https://issues.apache.org/jira/browse/TAJO-1985)] -
    Supporting Metric report via JMX
-   [[TAJO-1991](https://issues.apache.org/jira/browse/TAJO-1991)] -
    Tablespace::getVolume should take filter predication
-   [[TAJO-1998](https://issues.apache.org/jira/browse/TAJO-1998)] -
    Waiting for gracefully stopping in tajo-deamon.sh is too short
-   [[TAJO-2005](https://issues.apache.org/jira/browse/TAJO-2005)] - Add
    TableStatUpdateRewriter
-   [[TAJO-2007](https://issues.apache.org/jira/browse/TAJO-2007)] - By
    default, Optimizer should use the table volume in TableStat.
-   [[TAJO-2029](https://issues.apache.org/jira/browse/TAJO-2029)] -
    Showing query progress percentage in TAJO JDBC
-   [[TAJO-2032](https://issues.apache.org/jira/browse/TAJO-2032)] -
    Change tajo.rest.service.port to be the general style in TAJO.
-   [[TAJO-2036](https://issues.apache.org/jira/browse/TAJO-2036)] -
    Prevent out of memory in the master server, if the query result is
    large
-   [[TAJO-2040](https://issues.apache.org/jira/browse/TAJO-2040)] -
    Decrease the default size of max request for locality
-   [[TAJO-2048](https://issues.apache.org/jira/browse/TAJO-2048)] -
    QueryMaster and TajoWorker should support the exception propagation
-   [[TAJO-2050](https://issues.apache.org/jira/browse/TAJO-2050)] -
    Adopt TAJO logo in CLI
-   [[TAJO-2053](https://issues.apache.org/jira/browse/TAJO-2053)] -
    Update description for HBase configuration.
-   [[TAJO-2057](https://issues.apache.org/jira/browse/TAJO-2057)] -
    Remove redundant class loading in plan optimizer
-   [[TAJO-2060](https://issues.apache.org/jira/browse/TAJO-2060)] -
    Upgrade geoip-api-java library
-   [[TAJO-2061](https://issues.apache.org/jira/browse/TAJO-2061)] - Add
    description for EXPLAIN statement

Task
----

-   [[TAJO-1705](https://issues.apache.org/jira/browse/TAJO-1705)] -
    Update document for index support
-   [[TAJO-1852](https://issues.apache.org/jira/browse/TAJO-1852)] -
    (Umbrella) Improve documentation for tablespace support
-   [[TAJO-1854](https://issues.apache.org/jira/browse/TAJO-1854)] - Add
    in-subquery document
-   [[TAJO-1857](https://issues.apache.org/jira/browse/TAJO-1857)] -
    Rename the section of 'File Formats' to 'Data Formats' and fill
    compression section of the 'Table Management' chapter
-   [[TAJO-1906](https://issues.apache.org/jira/browse/TAJO-1906)] -
    Decrease the default size of hash map and array list for testing
-   [[TAJO-1934](https://issues.apache.org/jira/browse/TAJO-1934)] -
    Test failures in TestPgSQLQueryTests due to sort order
-   [[TAJO-1962](https://issues.apache.org/jira/browse/TAJO-1962)] - Add
    description for session variables
-   [[TAJO-1963](https://issues.apache.org/jira/browse/TAJO-1963)] - Add
    more configuration descriptions to document
-   [[TAJO-1970](https://issues.apache.org/jira/browse/TAJO-1970)] -
    Change the null first syntax
-   [[TAJO-1973](https://issues.apache.org/jira/browse/TAJO-1973)] -
    Replace 'while' loop with 'foreach'
-   [[TAJO-1975](https://issues.apache.org/jira/browse/TAJO-1975)] -
    Gathering fine-grained column statistics for range shuffle
-   [[TAJO-1989](https://issues.apache.org/jira/browse/TAJO-1989)] -
    Upgrade Maven Surefire Plugin to 2.19
-   [[TAJO-1994](https://issues.apache.org/jira/browse/TAJO-1994)] -
    Some trivial modification is needed in compression document
-   [[TAJO-2003](https://issues.apache.org/jira/browse/TAJO-2003)] - Fix
    typo in worker configuration
-   [[TAJO-2018](https://issues.apache.org/jira/browse/TAJO-2018)] -
    Remove redundant 'String.toString()'
-   [[TAJO-2028](https://issues.apache.org/jira/browse/TAJO-2028)] -
    Refining Hive Integration document including typo
-   [[TAJO-2041](https://issues.apache.org/jira/browse/TAJO-2041)] -
    Update the Team page
-   [[TAJO-2065](https://issues.apache.org/jira/browse/TAJO-2065)] -
    Increase default heap size

