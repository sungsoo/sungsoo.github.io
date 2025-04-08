---
layout: post
title: Use Parquet with Impala, Hive, Pig, and MapReduce
date: 2014-08-09
categories: [computer science]
tags: [big data, big data]

---

## Article Source
* Title: [How-to: Use Parquet with Impala, Hive, Pig, and MapReduce](http://blog.cloudera.com/blog/2014/03/how-to-use-parquet-with-impala-hive-pig-mapreduce/), March 21, 2014.
* Authors: John Russell

How-to: Use Parquet with Impala, Hive, Pig, and MapReduce 
====

**The CDH software stack lets you use your tool of choice with the
Parquet file format – - offering the benefits of columnar storage at
each phase of data processing. **

An open source project co-founded by Twitter and Cloudera,
[Parquet](http://parquet.io) was designed from the ground up as a
state-of-the-art, general-purpose, columnar file format for the Apache
Hadoop ecosystem. In particular, Parquet has several features that make
it highly suited to use with [Cloudera Impala](http://impala.io) for
data warehouse-style operations:

-   **Columnar storage layout:** A query can examine and perform
    calculations on all values for a column while reading only a small
    fraction of the data from a data file or table.
-   **Flexible compression options:** The data can be compressed with any
    of several codecs. Different data files can be compressed
    differently. The compression is transparent to applications that
    read the data files.
-   **Innovative encoding schemes:** Sequences of identical, similar, or
    related data values can be represented in ways that save disk space
    and memory, yet require little effort to decode. The encoding
    schemes provide an extra level of space savings beyond the overall
    compression for each data file.
-   **Large file size:** The layout of Parquet data files is optimized
    for queries that process large volumes of data, with individual
    files in the multi-megabyte or even gigabyte range.

Impala can create Parquet tables, insert data into them, convert data
from other file formats to Parquet, and then perform SQL queries on the
resulting data files. Parquet tables created by Impala can be accessed
by Apache Hive, and vice versa.

That said, the CDH software stack lets you use the [tool of your
choice](http://blog.cloudera.com/blog/2014/02/native-parquet-support-comes-to-apache-hive/)
with the Parquet file format, for each phase of data processing. For
example, you can read and write Parquet files using Apache Pig and
MapReduce jobs. You can convert, transform, and query Parquet tables
through Impala and Hive. And you can interchange data files between all
of those components — including ones external to CDH, such as Cascading
and Apache Tajo.

In this blog post, you will learn the most important principles
involved.

Using Parquet Tables with Impala
--------------------------------

Impala can create tables that use Parquet data files; insert data into
those tables, converting the data into Parquet format; and query Parquet
data files produced by Impala or by other components. The only syntax
required is the `STORED AS PARQUET` clause on
the `CREATE TABLE` statement. After that, all `SELECT`, `INSERT`, and
other statements recognize the Parquet format automatically. For
example, a session in the impala-shell interpreter might look as
follows:

``` 
[localhost:21000] > create table parquet_table (x int, y string) stored as parquet;
[localhost:21000] > insert into parquet_table select x, y from some_other_table;
Inserted 50000000 rows in 33.52s
[localhost:21000] > select y from parquet_table where x between 70 and 100;    
```

Once you create a Parquet table this way in Impala, you can query it or
insert into it through either Impala or Apache Hive.

Remember that Parquet format is optimized for working with large data
files, typically 1GB each. Avoid using the `INSERT ... VALUES` syntax,
or partitioning the table at too granular a level, if that would produce
a large number of small files that cannot take advantage of the Parquet
optimizations for large data chunks.

Inserting data into a partitioned Impala table can be a memory-intensive
operation, because each data file requires a 1GB memory buffer to hold
the data before being written. Such inserts can also exceed HDFS limits
on simultaneous open files, because each node could potentially write to
a separate data file for each partition, all at the same time. Consider
splitting up such insert operations into one `INSERT` statement per
partition.

For complete instructions and examples, see [the Parquet section in the
Impala
documentation](http://www.cloudera.com/content/cloudera-content/cloudera-docs/Impala/latest/Installing-and-Using-Impala/ciiu_parquet.html).

Using Parquet Tables in Hive
----------------------------

To create a table named PARQUET\_TABLE that uses the Parquet format, you
would use a command like the following, substituting your own table
name, column names, and data types:

``` 
hive> create table parquet_table_name (x INT, y STRING)
  ROW FORMAT SERDE 'parquet.hive.serde.ParquetHiveSerDe'
  STORED AS
    INPUTFORMAT "parquet.hive.DeprecatedParquetInputFormat"
    OUTPUTFORMAT "parquet.hive.DeprecatedParquetOutputFormat"; 
```

 

Note: Once you create a Parquet table this way in Hive, you can query it
or insert into it through either Impala or Hive. Before the first time
you access a newly created Hive table through Impala, issue a one-time
`INVALIDATE METADATA` statement in the impala-shell interpreter to make
Impala aware of the new table.

If the table will be populated with data files generated outside of
Impala and Hive, it is often useful to create the table as an external
table pointing to the location where the files will be created:

``` 
hive> create external table parquet_table_name (x INT, y STRING)
  ROW FORMAT SERDE 'parquet.hive.serde.ParquetHiveSerDe'
  STORED AS
    INPUTFORMAT "parquet.hive.DeprecatedParquetInputFormat"
    OUTPUTFORMAT "parquet.hive.DeprecatedParquetOutputFormat"
    LOCATION '/test-warehouse/tinytable';   
```

 

To populate the table with an `INSERT` statement, and to read the table
with a `SELECT` statement, see the [Impala
documentation](http://www.cloudera.com/content/cloudera-content/cloudera-docs/Impala/latest/Installing-and-Using-Impala/ciiu_parquet.html) for
Parquet.

Select the compression to use when writing data with
the parquet.compression property, for example:

``` 
 set parquet.compression=GZIP;
 INSERT OVERWRITE TABLE tinytable SELECT * FROM texttable;
```

 

The valid options for compression are:

-   `UNCOMPRESSED`
-   `GZIP`
-   `SNAPPY`

Using Parquet Files in Pig
--------------------------

### Reading Parquet Files in Pig

Assuming the external table was created and populated with Impala or
Hive as described above, the Pig instruction to read the data is:

``` 
grunt> A = LOAD '/test-warehouse/tinytable' USING parquet.pig.ParquetLoader AS (x: int, y int);
```

 

### Writing Parquet Files in Pig

Create and populate a Parquet file with the ParquetStorer class:

``` 
grunt> store A into '/test-warehouse/tinytable' USING parquet.pig.ParquetStorer;
```

 

There are three compression options: uncompressed, snappy, and gzip. The
default is snappy. You can specify one of them once before the first
store instruction in a Pig script:

``` 
SET parquet.compression gzip;
```

 

Note that with CDH 4.5, you must add Thrift to Pig’s additional JAR
files:

``` 
export PIG_OPTS="-Dpig.additional.jars=$THRIFTJAR"
```

 

You can find Thrift as follows:

``` 
if [ -e /opt/cloudera/parcels/CDH ] ; then
  CDH_BASE=/opt/cloudera/parcels/CDH
else
  CDH_BASE=/usr
fi
THRIFTJAR=`ls -l $CDH_BASE/lib/hive/lib/libthrift*jar | awk '{print $9}' | head -1`
```

 

To use a Pig action involving Parquet files with Apache Oozie, add
Thrift to the Oozie sharelib:

``` 
sudo -u oozie hdfs dfs -put $THRIFTJAR share/lib/pig
```

 

Using Parquet Files in MapReduce
--------------------------------

MapReduce needs thrift in its `CLASSPATH` and in libjars to access
Parquet files. It also needs parquet-format in libjars. Perform the
following setup before running MapReduce jobs that access Parquet data
files:

``` 
if [ -e /opt/cloudera/parcels/CDH ] ; then
    CDH_BASE=/opt/cloudera/parcels/CDH
else
    CDH_BASE=/usr
fi
THRIFTJAR=`ls -l $CDH_BASE/lib/hive/lib/libthrift*jar | awk '{print $9}' | head -1`
export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$THRIFTJAR
export LIBJARS=`echo "$CLASSPATH" | awk 'BEGIN { RS = ":" } { print }' | grep parquet-format | tail -1`
export LIBJARS=$LIBJARS,$THRIFTJAR

hadoop jar my-parquet-mr.jar -libjars $LIBJARS
```

 

### Reading Parquet Files in MapReduce

Taking advantage of the `Example` helper classes in the Parquet JAR
files, a simple map-only MapReduce job that reads Parquet files can use
the `ExampleInputFormat` class and the `Group` value class. There is
nothing special about the reduce phase when using Parquet files; the
following example demonstrates how to read a Parquet file in a MapReduce
job. (Lines pertaining to Parquet are highlighted.)

```java
import static java.lang.Thread.sleep;
import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.Mapper.Context;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

import parquet.Log;
import parquet.example.data.Group;
import parquet.hadoop.example.ExampleInputFormat;

public class TestReadParquet extends Configured
  implements Tool {
  private static final Log LOG =
  Log.getLog(TestReadParquet.class);

    /*
     * Read a Parquet record
     */
    public static class MyMap extends
      Mapper {

      @Override
      public void map(LongWritable key, Group value, Context context) throws IOException, InterruptedException {
          NullWritable outKey = NullWritable.get();
          String outputRecord = "";
          // Get the schema and field values of the record
          String inputRecord = value.toString();
          // Process the value, create an output record
          // ...
          context.write(outKey, new Text(outputRecord));
      }
  }

  public int run(String[] args) throws Exception {

    Job job = new Job(getConf());

    job.setJarByClass(getClass());
    job.setJobName(getClass().getName());
    job.setMapOutputKeyClass(LongWritable.class);
    job.setMapOutputValueClass(Text.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(Text.class);
    job.setMapperClass(MyMap.class);
    job.setNumReduceTasks(0);

    job.setInputFormatClass(ExampleInputFormat.class);
    job.setOutputFormatClass(TextOutputFormat.class);

    FileInputFormat.setInputPaths(job, new Path(args[0]));
    FileOutputFormat.setOutputPath(job, new Path(args[1]));

    job.waitForCompletion(true);
    return 0;
  }

  public static void main(String[] args) throws Exception {
    try {
      int res = ToolRunner.run(new Configuration(), new TestReadParquet(), args);
      System.exit(res);
    } catch (Exception e) {
      e.printStackTrace();
      System.exit(255);
    }
  }
}
```

 

### Writing Parquet Files in MapReduce

When writing Parquet files you will need to provide a schema. The schema
can be specified in the `run` method of the job before submitting it;
for example:

```java 
...
import parquet.Log;
import parquet.example.data.Group;
import parquet.hadoop.example.GroupWriteSupport;
import parquet.hadoop.example.ExampleInputFormat;
import parquet.hadoop.example.ExampleOutputFormat;
import parquet.hadoop.metadata.CompressionCodecName;
import parquet.hadoop.ParquetFileReader;
import parquet.hadoop.metadata.ParquetMetadata;
import parquet.schema.MessageType;
import parquet.schema.MessageTypeParser;
import parquet.schema.Type;
...
public int run(String[] args) throws Exception {
...

  String writeSchema = "message example {n" +
  "required int32 x;n" +
  "required int32 y;n" +
  "}";
  ExampleOutputFormat.setSchema(
    job,
    MessageTypeParser.parseMessageType(writeSchema));

  job.submit();
  
```

 

or it can be extracted from the input file(s) if they are in Parquet
format:

```java 
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.LocatedFileStatus;
import org.apache.hadoop.fs.RemoteIterator;
...

public int run(String[]
  args) throws Exception {
...

String inputFile = args[0];
  Path parquetFilePath = null;
  // Find a file in case a directory was passed

  RemoteIterator it = FileSystem.get(getConf()).listFiles(new Path(inputFile), true);
  while(it.hasNext()) {
      FileStatus fs = it.next();

    if(fs.isFile()) {
      parquetFilePath = fs.getPath();
      break;
    }
  }
  if(parquetFilePath == null) {
    LOG.error("No file found for " + inputFile);
    return 1;
  }
  ParquetMetadata readFooter =
    ParquetFileReader.readFooter(getConf(), parquetFilePath);
  MessageType schema =
    readFooter.getFileMetaData().getSchema();
  GroupWriteSupport.setSchema(schema, getConf());

  job.submit(); 
```

 

Records can then be written in the mapper by composing a `Group` as
value using the `Example` classes and no key:

```java 
protected void map(LongWritable key, Text value,
  Mapper.Context context)
  throws java.io.IOException, InterruptedException {
    int x;
    int y;
    // Extract the desired output values from the input text
    //
    Group group = factory.newGroup()
      .append("x", x)
      .append("y", y);
    context.write(null, group);
  }
}
```

 

You can set ompression before submitting the job with:

``` 
ExampleOutputFormat.setCompression(job, codec);
```

 

…using one of the following codec:

-   `CompressionCodecName.UNCOMPRESSED`
-   `CompressionCodecName.SNAPPY`
-   `CompressionCodecName.GZIP`

Parquet File Interoperability
-----------------------------

Impala has included Parquet support from the beginning, using its own
high-performance code written in C++ to read and write the Parquet
files. The Parquet JARs for use with Hive, Pig, and MapReduce are
available with CDH 4.5 and higher. Using the Java-based Parquet
implementation on a CDH release prior to CDH 4.5 is not supported.

A Parquet table created by Hive can typically be accessed by Impala
1.1.1 and higher with no changes, and vice versa. Prior to Impala 1.1.1,
when Hive support for Parquet was not available, Impala wrote a dummy
SerDes class name into each data file. These older Impala data files
require a one-time `ALTER TABLE` statement to update the metadata for
the SerDes class name before they can be used with Hive. (See [the
Impala Release
Notes](http://www.cloudera.com/content/cloudera-content/cloudera-docs/Impala/latest/Cloudera-Impala-Release-Notes/cirn_incompatible_changes.html) for
details.)

A Parquet file written by Hive, Impala, Pig, or MapReduce can be read by
any of the others. Different defaults for file and block sizes,
compression and encoding settings, and so on might cause performance
differences depending on which component writes or reads the data files.
For example, Impala typically sets the HDFS block size to 1GB and
divides the data files into 1GB chunks, so that each I/O request reads
an entire data file.

There may be limitations in a particular release. The following are
known limitations in CDH 4:

-   The `TIMESTAMP` data type in Parquet files is not supported in Hive,
    Pig, or MapReduce in CDH 4. Attempting to read a Parquet table
    created with Impala that includes a `TIMESTAMP` column will fail.
-   At the time of writing, Parquet had not been tested with HCatalog.
    Without HCatalog, Pig cannot correctly read dynamically partitioned
    tables; that is true for all file formats.
-   Currently, Impala does not support table columns using nested data
    types or composite data types such as maps, structs, or arrays. Any
    Parquet data files that include such types cannot be queried through
    Impala.

Conclusion
----------

You can find full examples of Java code at the Cloudera [Parquet
examples](https://github.com/cloudera/parquet-examples) Github
repository:

-   The [TestReadParquet.java](https://github.com/cloudera/parquet-examples/blob/master/MapReduce/TestReadParquet.java) example
    demonstrates the ”identity” transform. It reads any Parquet data
    file and writes a new file with exactly the same content.
-   The [TestReadWriteParquet.java](https://github.com/cloudera/parquet-examples/blob/master/MapReduce/TestReadWriteParquet.java) example
    reads a Parquet data file, and produces a new text file in CSV
    format with the same content.

*John Russell is a technical writer at Cloudera and the author of the
O’Reilly e-book,* Cloudera Impala.
