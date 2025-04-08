---
layout: post
title: Announcing Apache Pig 0.13.0 
date: 2014-07-27
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Announcing Apache Pig 0.13.0](http://hortonworks.com/blog/announcing-apache-pig-0-13-0-usability-improvements-progress-toward-pig-tez/), June 21, 2014.
* Authors: [Daniel Dai](http://hortonworks.com/blog/author/daniel_dai/)


# Announcing Apache Pig 0.13.0 


## Usability Improvements and Progress Towards Pig on Tez


The Apache Pig community released Pig 0.13. earlier this month. Pig uses
a simple scripting language to perform complex transformations on data
stored in Apache Hadoop. The Pig community has been working diligently
to prepare Pig to take advantage of the DAG processing capabilities in
[Apache Tez](http://hortonworks.com/hadoop/tez "Apache Tez"). We also
improved usability and performance. [![Screen Shot 2014-07-21 at
10.18.35
AM](http://hortonworks.com/wp-content/uploads/2014/07/Screen-Shot-2014-07-21-at-10.18.35-AM.png)](http://hortonworks.com/wp-content/uploads/2014/07/Screen-Shot-2014-07-21-at-10.18.35-AM.png)

This blog post summarizes the progress we’ve made.

## Support for Backends Other Than MapReduce

We made the Pig 0.13 architecture more general to support multiple
backends beyond just MapReduce, while maintaining backward
compatibility. This is an important step towards allowing Pig to run on
Tez, which will improve Pig’s latency. We expect to deliver Pig on Tez
with Apache Pig 0.14 in about three months.

## Low Latency for Small Jobs

Traditionally, Pig launches MapReduce jobs for every query. This is not
efficient for small jobs because of MapReduce’s latency (it may take
longer to launch MapReduce than it takes to complete the job).

Pig 0.13 introduces two features to deal with small jobs: direct HDFS
access and auto local mode.

In direct HDFS access mode, Pig fetches input files from HDFS and
processes the query directly in Pig. This happens only when you do a
“dump” in Pig, and the script is simple; it contains only LIMIT, FILTER,
UNION, STREAM or FOREACH. By default, Direct HDFS access mode is on. If
you want to turn it off, set the property *opt.fetch* to “false”.

In auto local mode, Pig runs the query in Hadoop local mode. This
happens when the size of input data is less than 100MB (specified by
*pig.auto.local.input.maxbytes*). By default, auto local mode is off.
You can turn it on by setting *pig.auto.local.enabled* to “true”.

If both modes are enabled, Pig first checks whether the query is
eligible for Direct HDFS access mode. If not, Pig then checks if it is
eligible for auto local mode. If both are not eligible, Pig launches
regular MapReduce to run the query.

## Blacklist and Whitelist Operators

The goal of this feature is to give administrators more control over
user scripts by providing the ability to blacklist or/and whitelist
certain commands and operations. Pig exposes operators that might not be
safe in a multitenant environment. For example, “sh” invokes shell
commands, “set” allows users to change non-final configs. While these
operations are tremendously useful in general, the ability to disable
them protects Pig users from making errors. The default behavior remains
the same: no filters are applied on commands and operators.

Here is an example of a Blacklist config that disables the FILTER
operator:

`grunt> set pig.blacklist FILTER; grunt> B = FILTER A by $0 == 123; 2014-07-10 13:33:16,708 [main] ERROR org.apache.pig.tools.grunt.Grunt - ERROR 1855: filter is disabled`

Whitelist is the inverse of Blacklist. It allows users to disable all
commands and operators that are not a part of the whitelist.

Here’s a Whitelist example that will disallow every command and operator
other than “load”, “filter” and “store”.:

 `pig.whitelist=load,filter,store`

## User Level jar Cache

If the user registers some jars in a Pig script, Pig used to ship those
jars to HDFS each time such a script was run. That created lots of
duplicated entries in HDFS, and wasted time uploading the jars. In 0.13,
Pig introduced a user level jar cache, which caches those jars on HDFS.
If the jar is already in cache, Pig does not upload it again. The jar
cache is located in */tmp/{user.name}/.pigcache* (and can be overridden
by *pig.user.cache.location*). By default, this feature is off. You can
turn it on by setting *pig.user.cache.enabled* to true.

## Pig hadoop2 jar

Before 0.13, Pig contained the pig.jar that works with Hadoop 1. This
meant that users wanting to use Pig with Hadoop 2 needed to recompile
with the flag “-Dhadoopversion=23″. This was cumbersome and confusing
for the many Pig users moving to Hadoop 2.

In Pig 0.13, Pig bundles both*pig-h1.jar* and *pig-h2.jar*. When you use
Pig, point the **HADOOP\_HOME** environment variable correctly, and the
Pig script will figure out the version of Hadoop you are using and pick
the right*pig.jar* to use.

## Support for Accumulo

We added support for Accumulo in Pig 0.13. The syntax for
AccumuloStorage is similar to HBaseStorage. Here is one example:\

`my_data = LOAD 'accumulo://table_name?connection_options' USING o.a.p.b.hadoop.accumulo.AccumuloStorage('column_spec’) AS (row:chararray, columns:map[]); STORE my_data INTO 'accumulo://table_name?connection_options' USING o.a.p.b.hadoop.accumulo.AccumuloStorage('*') AS ('column_spec');`

The detailed syntax can be found
[here](http://pig.apache.org/docs/r0.13.0/func.html#AccumuloStorage "Pig Syntax").

## UDFs with Variable Input Arguments

Pig 0.13 provides support for specification of variable input arguments
for UDFs. You could use variable input arguments in a UDF before, but it
was not possible to specify input schema through getArgToFuncMapping.
This was undesirable since Pig couldn’t do static type checking and
couldn’t override the UDF with a different input schema.

Here is an example of the variable input arguments now possible in Pig
0.13:

```java
public class MyUDF extends EvalFunc<String> {
….
  public List<FuncSpec> getArgToFuncMapping() throws FrontendException {
        List<FuncSpec> funcList = new ArrayList<FuncSpec>();
        Schema s = new Schema();
        s.add(new Schema.FieldSchema(null, DataType. INTEGER));
        s.add(new Schema.FieldSchema(null, DataType.CHARARRAY));
        funcList.add(new FuncSpec(this.getClass().getName(), s));
  }
  public SchemaType getSchemaType() {
        return SchemaType.VARARG;
  }
}
```

In this example, MyUDF accepts the INTEGER and CHARARRAY input schemas.
The last field of the schema (CHARARRAY) can be repeated

## Acknowledgments

Credit and thanks go to the 48 contributors that contributed to Pig
0.13. Specific credit goes to:

-   Aniket Mokashi for contributing auto local mode and user level
    cache;
-   Lorand Bendig for contributing HDFS direct fetch and UDFs with
    variable input arguments;
-   Prashant Kommireddi for contributing blacklist and whitelist
    operators, Josh Elser for contributing AccumuloStorage;
-   Cheolsoo Park and Achal Soni for implementing the pluggable backend;
-   Rohini Palaniswamy for tirelessly providing bug fixes and community
    support; and
-   Mark Wagner for major refactoring the POPackage

NOTE: there are a few backward incompatible changes in Pig 0.13. Be sure
to [check those
here](https://cwiki.apache.org/confluence/display/PIG/Pig+0.13+Backward+Compatibility "check those here").

## Resources

-   [Download Pig
    0.13](http://apache.spinellicreations.com/pig/pig-0.13.0/ "Download Pig")
-   [Pig 0.13 Release
    Documentation](http://pig.apache.org/docs/r0.13.0/ "Release Documentation")
