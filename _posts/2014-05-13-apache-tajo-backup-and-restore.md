---
layout: post
title: Apache Tajo Backup and Restore
date: 2014-05-13
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Apache Tajo™ 0.8.0 Documentation](http://tajo.apache.org/docs/0.8.0/backup_and_restore/catalog.html)

[![](http://sungsoo.github.com/images/tajo-documentation.png)](http://sungsoo.github.com/images/tajo-documentation.png)

# Backup and Restore Catalog
Now, Tajo supports a two backup methods for

* SQL dump
* Database-level backup

## SQL dump
SQL dump is an easy and strong way. If you use this approach, you don’t need to concern database-level compatiblities. If you want to backup your catalog, just use bin/tajo_dump command. The basic usage of this command is:

	$ tajo_dump table_name > outfile

For example, if you want to backup a table customer, you should type a command as follows:

	$ bin/tajo_dump customer > table_backup.sql
	$
	$ cat table_backup.sql
	-- Tajo database dump
	-- Dump date: 10/04/2013 16:28:03
	--

	--
	-- Name: customer; Type: TABLE; Storage: CSV
	-- Path: file:/home/hyunsik/tpch/customer
	--
	CREATE EXTERNAL TABLE customer (c_custkey INT8, c_name TEXT, c_address TEXT, c_nationkey INT8, c_phone TEXT, c_acctbal FLOAT8, c_mktsegment TEXT, c_comment TEXT) USING CSV LOCATION 'file:/home/hyunsik/tpch/customer';

If you want to restore the catalog from the SQL dump file, please type the below command:

	$ bin/tsql -f table_backup.sql
If you use an option ‘-a’, tajo_dump will dump all table DDLs.

	$ bin/tajo_dump -a > all_backup.sql

## Database-level backup