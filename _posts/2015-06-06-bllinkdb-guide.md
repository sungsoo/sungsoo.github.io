---
layout: post
title: BlinkDB User Guide
date: 2015-06-06
categories: [computer science]
tags: [big data]

---


# BlinkDB User Guide 


BlinkDB supports a subset of SQL nearly identical to that implemented by
Hive/Shark. This guide assumes you have some familiarity with Hive and
Shark, and focuses on the extra functionality included in BlinkDB. Those
who need a refresher can refer to the [Hive
Documentation](https://cwiki.apache.org/confluence/display/Hive/Home)
and [Shark
Documentation](https://github.com/amplab/shark/wiki/Shark-User-Guide)

## BlinkDB Query Language

BlinkDB is backwards compatible with Shark and supports all unmodified
Shark queries. In addition to this, BlinkDB introduces a `SAMPLEWITH`
operator that expects `sampling ratio` as a parameter and returns a
statistical random sample of the original dataset with that sampling
ratio. These samples can be created offline using the CTAS (Create Table
as Select) operator. For instance, let us assume that we have a table
called `logs` in our warehouse. A 1% random sample `logs_sample` of
`logs` can be created as:

    $ CREATE TABLE logs_sample AS SELECT * FROM logs SAMPLEWITH 0.01

**NOTE**: These samples can be created on any materialized view as well
using the `SAMPLEWITH` operator. For instance, one can invoke the
`SAMPLEWITH` operator on tables with WHERE clauses
(`SELECT * FROM logs WHERE src="hive" SAMPLEWITH 0.1`), JOINS
(`SELECT * FROM logs_1 JOIN logs_2 ON (logs_1.id = logs_2.id) SAMPLEWITH 0.2`),
UNION ALL etc.

Any sample table can also be cached in memory using the shark.cache
table property:

    $ CREATE TABLE ... TBLPROPERTIES ("shark.cache" = "true") AS SELECT ...

Similar to Shark, BlinkDB supports a shortcut for caching a sample table
in memory. Simply append \_cached to the table name when using CREATE
TABLE AS SELECT, and that table will be cached in memory. To disable
this shortcut, see the Shark configuration options section. Below is an
example:

    $ CREATE TABLE logs_last_month_sample_cached AS
      SELECT * FROM logs WHERE time > date(...) SAMPLEWITH 0.01;

Once a sample is created, BlinkDB expects the user to specify the number
of rows in the sample and the original dataset (which could be a native
table or a materialized view) using the `blinkdb.sample.size` and
`blinkdb.dataset.size` configuration operations. This allows BlinkDB to
perform appropriate bias correction in calculating error bars and scale
the output accordingly. The number of rows in the sample and original
dataset can be found out by simply executing a `COUNT(1)` query on the
sample and the original dataset.

    $ set blinkdb.sample.size=13358102;
    $ set blinkdb.dataset.size=1378291493;

Once this is done, users can execute any simple aggregation function
(such as `APPROX_AVG()`, `APPROX_COUNT` or `APPROX_SUM`) on the sampled
dataset. The returned answer would be an approximation of the original
and will be augmented by appropriate error bars at 99% confidence, i.e.
so say, that 99% of the time, the true answer should lie between
Answer +/- Error. Below are few examples:

    $ SELECT APPROX_COUNT(1) FROM logs_sample WHERE src="hive";
    $ SELECT dt, APPROX_AVG(foo) FROM logs_sample GROUP BY dt;
    $ SELECT dt, APPROX_SUM(bar) FROM logs_sample GROUP BY dt;

## BlinkDB CLI

The easiest way to run BlinkDB is to start a BlinkDB Command Line Client
(CLI) and begin executing queries. The BlinkDB CLI connects directly to
the Hive Metastore, so it is compatible with existing Hive deployments.
BlinkDB executables are available in the `bin/` directory. To start the
BlinkDB CLI, simply run:

    $ ./bin/blinkdb                            # Start CLI for interactive session
    $ ./bin/blinkdb -e "SELECT * FROM foo"     # Run a specific query and exit
    $ ./bin/blinkdb -i queries.hql             # Run queries from a file
    $ ./bin/blinkdb -H                         # Start CLI and print help

You can enter queries into the CLI directly, or use a flag to pass it a
file. The BlinkDB CLI will only work correctly if the HIVE\_HOME
environment variable is set (see Configuration). Alternative versions of
the CLI exist which print out more information: `bin/blinkdb-withinfo`
and `bin/blinkdb-withdebug`.

## Configuration Options

Configuration variables are environment vars that must be set for the
BlinkDB driver and slaves to run correctly. These are specified in
`conf/blinkdb-env.sh`. A few of the more important ones are described
here:

    HIVE_HOME     # Path to directory containing patched Hive jars
    HIVE_CONF_DIR # Optional, a different path containing Hive configuration files 
    SPARK_MEM     # How many much memory to allocate for slaves (e.g '1500m', '5g')








