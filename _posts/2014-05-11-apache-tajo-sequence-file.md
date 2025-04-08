---
layout: post
title: Apache Tajo SequenceFile
date: 2014-05-11
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Apache Tajo™ 0.8.0 Documentation](http://tajo.apache.org/docs/0.8.0/table_management/sequencefile.html)

[![](http://sungsoo.github.com/images/tajo-documentation.png)](http://sungsoo.github.com/images/tajo-documentation.png)


# SequenceFile
## Introduce
SequenceFiles are flat files consisting of binary key/value pairs. SequenceFile is basic file format which provided by Hadoop, and Hive also provides it to create a table.

The `USING sequencefile` keywords let you create a SequecneFile. Here is an example statement to create a table using `SequecneFile`:

```sql
CREATE TABLE table1 (id int, name text, score float, type text)
USING sequencefile;
```

Also Tajo provides Hive compatibility for SequenceFile. The above statement can be written in Hive as follows:

```sql
CREATE TABLE table1 (id int, name string, score float, type string)
STORED AS sequencefile;
```

## SerializerDeserializer (SerDe)
There are two SerDe for SequenceFile as follows:

* TextSerializerDeserializer: This class can read and write data in plain text file format.
* BinarySerializerDeserializer: This class can read and write data in binary file format.

The default is the SerDe for plain text file in Tajo. The above example statement created the table using TextSerializerDeserializer.If you want to use BinarySerializerDeserializer, you can specify it by `sequencefile.serde` keywords:

```sql
CREATE TABLE table1 (id int, name text, score float, type text)
USING sequencefile with ('sequencefile.serde'='org.apache.tajo.storage.BinarySerializerDeserializer')
```

In Hive, the above statement can be written in Hive as follows:

```sql
CREATE TABLE table1 (id int, name string, score float, type string)
ROW FORMAT SERDE
 'org.apache.hadoop.hive.serde2.lazybinary.LazyBinarySerDe'
STORED AS sequencefile;
```

## Writer
There are three SequenceFile Writers based on the SequenceFile.CompressionType used to compress key/value pairs:

* Writer : Uncompressed records.
* RecordCompressWriter : Record-compressed files, only compress values.
* BlockCompressWriter : Block-compressed files, both keys & values are collected in ‘blocks’ separately and compressed. The size of the ‘block’ is configurable.

The default is Uncompressed Writer in Tajo. If you want to use RecordCompressWriter, you can specify it by `compression.type` keywords and `compression.codec` keywords:

```sql
CREATE TABLE table1 (id int, name text, score float, type text)
USING sequencefile with ('compression.type'='RECORD','compression.codec'='org.apache.hadoop.io.compress.SnappyCodec')
```

In hive, you need to specify settings as follows:

```sql
hive> SET hive.exec.compress.output = true;
hive> SET mapred.output.compression.type = RECORD;
hive> SET mapred.output.compression.codec = org.apache.hadoop.io.compress.SnappyCodec;
hive> CREATE TABLE table1 (id int, name string, score float, type string) STORED AS sequencefile;;
```

And if you want to use BlockCompressWriter, you can specify it by `compression.type` keywords and `compression.codec` keywords:

```sql
CREATE TABLE table1 (id int, name text, score float, type text)
USING sequencefile with ('compression.type'='BLOCK','compression.codec'='org.apache.hadoop.io.compress.SnappyCodec')
```

In hive, you need to specify settings as follows:

```
hive> SET hive.exec.compress.output = true;
hive> SET mapred.output.compression.type = BLOCK;
hive> SET mapred.output.compression.codec = org.apache.hadoop.io.compress.SnappyCodec;
hive> CREATE TABLE table1 (id int, name string, score float, type string) STORED AS sequencefile;;
```

For reference, you can use TextSerDe or BinarySerDe with compression keywords. Here is an example statement for this case.

```sql
CREATE TABLE table1 (id int, name text, score float, type text)
USING sequencefile with ('sequencefile.serde'='org.apache.tajo.storage.BinarySerializerDeserializer', 'compression.type'='BLOCK','compression.codec'='org.apache.hadoop.io.compress.SnappyCodec')
```

In hive, you need to specify settings as follows:

```
hive> SET hive.exec.compress.output = true;
hive> SET mapred.output.compression.type = BLOCK;
hive> SET mapred.output.compression.codec = org.apache.hadoop.io.compress.SnappyCodec;
hive> CREATE TABLE table1 (id int, name string, score float, type string)
      ROW FORMAT SERDE
        'org.apache.hadoop.hive.serde2.lazybinary.LazyBinarySerDe'
      STORED AS sequencefile;;
```      
