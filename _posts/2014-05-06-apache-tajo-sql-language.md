---
layout: post
title: Apache Tajo SQL Language
date: 2014-05-06
categories: [computer science]
tags: [big data, yarn]

---

## Article Source
* Title: [Apache Tajo™ 0.8.0 Documentation](http://tajo.apache.org/docs/0.8.0/sql_language.html)

[![](http://sungsoo.github.com/images/tajo-documentation.png)](http://sungsoo.github.com/images/tajo-documentation.png)


# Data Model
## Data Types

<table border="1" class="docutils">
<colgroup>
<col width="6%" />
<col width="8%" />
<col width="15%" />
<col width="7%" />
<col width="26%" />
<col width="38%" />
</colgroup>
<thead valign="bottom">
<tr class="row-odd"><th class="head">Supported</th>
<th class="head">SQL Type Name</th>
<th class="head">Alias</th>
<th class="head">Size (byte)</th>
<th class="head">Description</th>
<th class="head">Range</th>
</tr>
</thead>
<tbody valign="top">
<tr class="row-even"><td>O</td>
<td>boolean</td>
<td>bool</td>
<td>1</td>
<td>&nbsp;</td>
<td>true/false</td>
</tr>
<tr class="row-odd"><td>&nbsp;</td>
<td>bit</td>
<td>&nbsp;</td>
<td>1</td>
<td>&nbsp;</td>
<td>1/0</td>
</tr>
<tr class="row-even"><td>&nbsp;</td>
<td>varbit</td>
<td>bit varying</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr class="row-odd"><td>O</td>
<td>smallint</td>
<td>tinyint, int2</td>
<td>2</td>
<td>small-range integer value</td>
<td>-2^15 (-32,768) to 2^15 (32,767)</td>
</tr>
<tr class="row-even"><td>O</td>
<td>integer</td>
<td>int, int4</td>
<td>4</td>
<td>integer value</td>
<td>-2^31 (-2,147,483,648) to 2^31 - 1 (2,147,483,647)</td>
</tr>
<tr class="row-odd"><td>O</td>
<td>bigint</td>
<td>bit varying</td>
<td>8</td>
<td>larger range integer value</td>
<td>-2^63 (-9,223,372,036,854,775,808) to 2^63-1 (9,223,372,036,854,775,807)</td>
</tr>
<tr class="row-even"><td>O</td>
<td>real</td>
<td>int8</td>
<td>4</td>
<td>variable-precision, inexact, real number value</td>
<td>-3.4028235E+38 to 3.4028235E+38 (6 decimal digits precision)</td>
</tr>
<tr class="row-odd"><td>O</td>
<td>float[(n)]</td>
<td>float4</td>
<td>4 or 8</td>
<td>variable-precision, inexact, real number value</td>
<td>&nbsp;</td>
</tr>
<tr class="row-even"><td>O</td>
<td>double</td>
<td>float8, double precision</td>
<td>8</td>
<td>variable-precision, inexact, real number value</td>
<td>1 .7E–308 to 1.7E+308 (15 decimal digits precision)</td>
</tr>
<tr class="row-odd"><td>&nbsp;</td>
<td>number</td>
<td>decimal</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr class="row-even"><td>&nbsp;</td>
<td>char[(n)]</td>
<td>character</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr class="row-odd"><td>&nbsp;</td>
<td>varchar[(n)]</td>
<td>character varying</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr class="row-even"><td>O</td>
<td>text</td>
<td>text</td>
<td>&nbsp;</td>
<td>variable-length unicode text</td>
<td>&nbsp;</td>
</tr>
<tr class="row-odd"><td>&nbsp;</td>
<td>binary</td>
<td>binary</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr class="row-even"><td>&nbsp;</td>
<td>varbinary[(n)]</td>
<td>binary varying</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr class="row-odd"><td>O</td>
<td>blob</td>
<td>bytea</td>
<td>&nbsp;</td>
<td>variable-length binary string</td>
<td>&nbsp;</td>
</tr>
<tr class="row-even"><td>&nbsp;</td>
<td>date</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr class="row-odd"><td>&nbsp;</td>
<td>time</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr class="row-even"><td>&nbsp;</td>
<td>timetz</td>
<td>time with time zone</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr class="row-odd"><td>&nbsp;</td>
<td>timestamp</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr class="row-even"><td>&nbsp;</td>
<td>timestamptz</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr class="row-odd"><td>O</td>
<td>inet4</td>
<td>&nbsp;</td>
<td>4</td>
<td>IPv4 address</td>
<td>&nbsp;</td>
</tr>
</tbody>
</table>

## Using real number value (real and double)
The real and double data types are mapped to float and double of java primitives respectively. Java primitives float and double follows the IEEE 754 specification. So, these types are correctly matched to SQL standard data types.

* float[( n )] is mapped to either float or double according to a given length n. If n is specified, it must be bewtween 1 and 53. The default value of n is 53.
* If 1 <- n <- 24, a value is mapped to float (6 decimal digits precision).
* If 25 <- n <- 53, a value is mapped to double (15 decimal digits precision).
* Do not use approximate real number columns in WHERE clause in order to compare some exact matches, especially the - and <> operators. The > or < comparisons work well.

# Data Definition Language
## CREATE DATABASE
### Synopsis

	CREATE DATABASE [IF NOT EXISTS] <database_name>

IF NOT EXISTS allows CREATE DATABASE statement to avoid an error which occurs when the database exists.

## DROP DATABASE
### Synopsis

DROP DATABASE [IF EXISTS] <database_name>
`IF EXISTS` allows `DROP DATABASE` statement to avoid an error which occurs when the database does not exist.

## CREATE TABLE
### Synopsis

	CREATE TABLE [IF NOT EXISTS] <table_name> [(<column_name> <data_type>, ... )]
	[using <storage_type> [with (<key> = <value>, ...)]] [AS <select_statement>]

	CREATE EXTERNAL TABLE [IF NOT EXISTS] <table_name> (<column_name> <data_type>, ... )
	using <storage_type> [with (<key> = <value>, ...)] LOCATION '<path>'

`IF NOT EXISTS` allows `CREATE [EXTERNAL] TABLE` statement to avoid an error which occurs when the table does not exist.

### Compression
If you want to add an external table that contains compressed data, you should give ‘compression.code’ parameter to CREATE TABLE statement.

```
create EXTERNAL table lineitem (
L_ORDERKEY bigint,
L_PARTKEY bigint,
...
L_COMMENT text)
USING csv WITH ('csvfile.delimiter'='|','compression.codec'='org.apache.hadoop.io.compress.DeflateCodec')
LOCATION 'hdfs://localhost:9010/tajo/warehouse/lineitem_100_snappy';
```

**compression.codec parameter can have one of the following compression codecs:**

* org.apache.hadoop.io.compress.BZip2Codec
* org.apache.hadoop.io.compress.DeflateCodec
* org.apache.hadoop.io.compress.GzipCodec
* org.apache.hadoop.io.compress.SnappyCodec

## DROP TABLE
### Synopsis

	DROP TABLE [IF EXISTS] <table_name> [PURGE]

`IF EXISTS` allows `DROP DATABASE` statement to avoid an error which occurs when the database does not exist. `DROP TABLE` statement removes a table from Tajo catalog, but it does not remove the contents. If `PURGE` option is given, `DROP TABLE` statement will eliminate the entry in the catalog as well as the contents.


### INSERT (OVERWRITE) INTO
`INSERT OVERWRITE` statement overwrites a table data of an existing table or a data in a given directory. Tajo’s `INSERT OVERWRITE` statement follows `INSERT INTO SELECT `statement of SQL. The examples are as follows:

	create table t1 (col1 int8, col2 int4, col3 float8);

	-- when a target table schema and output schema are equivalent to each other
	INSERT OVERWRITE INTO t1 SELECT l_orderkey, l_partkey, l_quantity FROM lineitem;
	-- or
	INSERT OVERWRITE INTO t1 SELECT * FROM lineitem;

	-- when the output schema are smaller than the target table schema
	INSERT OVERWRITE INTO t1 SELECT l_orderkey FROM lineitem;

	-- when you want to specify certain target columns
	INSERT OVERWRITE INTO t1 (col1, col3) SELECT l_orderkey, l_quantity FROM lineitem;

In addition, `INSERT OVERWRITE` statement overwrites table data as well as a specific directory.

	INSERT OVERWRITE INTO LOCATION '/dir/subdir' SELECT l_orderkey, l_quantity FROM lineitem;


# Queries
## Overview
### Synopsis

```
SELECT [distinct [all]] * | <expression> [[AS] <alias>] [, ...]
  [FROM <table name> [[AS] <table alias name>] [, ...]]
  [WHERE <condition>]
  [GROUP BY <expression> [, ...]]
  [HAVING <condition>]
  [ORDER BY <expression> [ASC|DESC] [NULL FIRST|NULL LAST] [, ...]]
```

## From Clause
## Where Clause
## Groupby Clause
## Select list


# SQL Expressions
## Arithmetic Expressions
## Type Casts
A type cast converts a specified-typed data to another-typed data. Tajo has two type cast syntax:

	CAST ( expression AS type )
	expression::type
## String Expressions
## Function Call
function_name ([expression [, expression ... ]] )


# Predicates
## IN Predicate
IN predicate provides row and array comparison.

### Synopsis

	column_reference IN (val1, val2, ..., valN)
	column_reference NOT IN (val1, val2, ..., valN)

Examples are as follows:

	-- this statement filters lists down all the records where col1 value is 1, 2 or 3:
	SELECT col1, col2 FROM table1 WHERE col1 IN (1, 2, 3);

	-- this statement filters lists down all the records where col1 value is neither 1, 2 nor 3:
	SELECT col1, col2 FROM table1 WHERE col1 NOT IN (1, 2, 3);

You can use ‘IN clause’ on text data domain as follows:

	SELECT col1, col2 FROM table1 WHERE col2 IN ('tajo', 'hadoop');

	SELECT col1, col2 FROM table1 WHERE col2 NOT IN ('tajo', 'hadoop');

## String Pattern Matching Predicates
### LIKE
LIKE operator returns true or false depending on whether its pattern matches the given string. An underscore (_) in pattern matches any single character. A percent sign (%) matches any sequence of zero or more characters.

### Synopsis

	string LIKE pattern
	string NOT LIKE pattern

## ILIKE
ILIKE is the same to LIKE, but it is a case insensitive operator. It is not in the SQL standard. We borrow this operator from PostgreSQL.

### Synopsis

	string ILIKE pattern
	string NOT ILIKE pattern

## SIMILAR TO
### Synopsis

	string SIMILAR TO pattern
	string NOT SIMILAR TO pattern

It returns true or false depending on whether its pattern matches the given string. Also like LIKE, `SIMILAR TO` uses `_` and `%` as metacharacters denoting any single character and any string, respectively.

In addition to these metacharacters borrowed from LIKE, ‘SIMILAR TO’ supports more powerful pattern-matching metacharacters borrowed from regular expressions:

| metacharacter |  	description | 
| --- | --- |
| &#124;	 | denotes alternation (either of two alternatives). | 
| * |  denotes repetition of the previous item zero or more times. | 
| +  | denotes repetition of the previous item one or more times. | 
| ? | 	denotes repetition of the previous item zero or one time. | 
| {m} | 	denotes repetition of the previous item exactly m times. | 
| {m,}	 | denotes repetition of the previous item m or more times. | 
| {m,n} | 	denotes repetition of the previous item at least m and not more than n times. | 
| [] | 	A bracket expression specifies a character class, just as in POSIX regular expressions. | 
| ()	 | Parentheses can be used to group items into a single logical item. | 

Note that .` is not used as a metacharacter in SIMILAR TO operator.

## Regular expressions
Regular expressions provide a very powerful means for string pattern matching. In the current Tajo, regular expressions are based on Java-style regular expressions instead of POSIX regular expression. The main difference between java-style one and POSIX’s one is character class.

### Synopsis

	string ~ pattern
	string !~ pattern

	string ~* pattern
	string !~* pattern
	
| operator |	Description |
| --- | --- |
| ~	 | It returns true if a given regular expression is matched to string. Otherwise, it returns false. | 
| !~ | 	It returns false if a given regular expression is matched to string. Otherwise, it returns true. | 
| ~* | 	It is the same to ‘~’, but it is case insensitive. | 
| !~*	 | It is the same to ‘!~’, but it is case insensitive. | 

Here are examples:

	'abc'   ~   '.*c'               true
	'abc'   ~   'c'                 false
	'aaabc' ~   '([a-z]){3}bc       true
	'abc'   ~*  '.*C'               true
	'abc'   !~* 'B.*'               true
	
Regular expressions operator is not in the SQL standard. We borrow this operator from PostgreSQL.

*Synopsis for REGEXP and RLIKE operators*

	string REGEXP pattern
	string NOT REGEXP pattern

	string RLIKE pattern
	string NOT RLIKE pattern
	
But, they do not support case-insensitive operators.
