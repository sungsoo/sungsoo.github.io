---
layout: post
title: Apache Tajo CSV (TextFile)
date: 2014-05-08
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Apache Tajo™ 0.8.0 Documentation](http://tajo.apache.org/docs/0.8.0/table_management/csv.html)

[![](http://sungsoo.github.com/images/tajo-documentation.png)](http://sungsoo.github.com/images/tajo-documentation.png)

# CSV (TextFile)
A character-separated values (CSV) file represents a tabular data set consisting of rows and columns. Each row is a plan-text line. A line is usually broken by a character line feed `\n` or carriage-return `\r`. The line feed `\n` is the default delimiter in Tajo. Each record consists of multiple fields, separated by some other character or string, most commonly a literal vertical bar `|`, comma `,` or tab `\t`. The vertical bar is used as the default field delimiter in Tajo.

## How to Create a CSV Table ?
If you are not familiar with the `CREATE TABLE` statement, please refer to the Data Definition Language [Data Definition Language](http://tajo.apache.org/docs/0.8.0/sql_language/ddl.html).

In order to specify a certain file format for your table, you need to use the `USING` clause in your `CREATE TABLE` statement. The below is an example statement for creating a table using CSV files.

```sql
CREATE TABLE
 table1 (
   id int,
   name text,
   score float,
   type text
 ) USING CSV;
```

## Physical Properties
Some table storage formats provide parameters for enabling or disabling features and adjusting physical parameters. The `WITH` clause in the `CREATE TABLE` statement allows users to set those parameters.

Now, the CSV storage format provides the following physical properties.

* `csvfile.delimiter`: delimiter character. `|` or `\u0001` is usually used, and the default field delimiter is |.
* `csvfile.null`: NULL character. The default NULL character is an empty string `''`. Hive’s default NULL character is `'\\N'`.
* `compression.codec`: Compression codec. You can enable compression feature and set specified compression algorithm. The compression algorithm used to compress files. The compression codec name should be the fully qualified class name inherited from [org.apache.hadoop.io.compress.CompressionCodec](https://hadoop.apache.org/docs/current/api/org/apache/hadoop/io/compress/CompressionCodec.html). By default, compression is disabled.
* `csvfile.serde`: custom (De)serializer class. `org.apache.tajo.storage.TextSerializerDeserializer` is the default (De)serializer class.

The following example is to set a custom field delimiter, NULL character, and compression codec:

```sql
CREATE TABLE table1 (
 id int,
 name text,
 score float,
 type text
) USING CSV WITH('csvfile.delimiter'='\u0001',
                 'csvfile.null'='\\N',
                 'compression.codec'='org.apache.hadoop.io.compress.SnappyCodec');
```

### Warning

Be careful when using \n as the field delimiter because CSV uses \n as the line delimiter. At the moment, Tajo does not provide a way to specify the line delimiter.

## Custom (De)serializer
The CSV storage format not only provides reading and writing interfaces for CSV data but also allows users to process custom plan-text file formats with user-defined (De)serializer classes. For example, with custom (de)serializers, Tajo can process JSON file formats or any specialized plan-text file formats.

In order to specify a custom (De)serializer, set a physical property csvfile.serde. The property value should be a fully qualified class name.

For example:

```sql
CREATE TABLE table1 (
 id int,
 name text,
 score float,
 type text
) USING CSV WITH ('csvfile.serde'='org.my.storage.CustomSerializerDeserializer')
```

## Null Value Handling Issues
In default, NULL character in CSV files is an empty string `''`. In other words, an empty field is basically recognized as a NULL value in Tajo. If a field domain is `TEXT`, an empty field is recognized as a string value `''` instead of NULL value. Besides, You can also use your own NULL character by specifying a physical property `csvfile.null`.

## Compatibility Issues with Apache Hive™
CSV files generated in Tajo can be processed directly by Apache Hive™ without further processing. In this section, we explain some compatibility issue for users who use both Hive and Tajo.

If you set a custom field delimiter, the CSV tables cannot be directly used in Hive. In order to specify the custom field delimiter in Hive, you need to use `ROW FORMAT DELIMITED FIELDS TERMINATED BY` clause in a Hive’s `CREATE TABLE` statement as follows:

```sql
CREATE TABLE table1 (id int, name string, score float, type string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
```

To the best of our knowledge, there is not way to specify a custom NULL character in Hive.