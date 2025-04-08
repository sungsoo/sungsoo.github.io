---
layout: post
title: Understanding the SQL Server Columnstore Index 
date: 2016-02-06
categories: [computer science]
tags: [big data]

---


## Article Source
* Title: [Understanding the SQL Server Columnstore Index](http://logicalread.solarwinds.com/sql-server-columnstore-index-w02/#.VrvzXRjnJVo)
* Authors: Adam Jorgensen, Steven Wort, Ross LoForte, Brian Knight

---

# Understanding the SQL Server Columnstore Index 

*Columnstore index* is a new type of index introduced in SQL Server 2012.
It is a *column-based non-clustered index* geared toward increasing query
performance for workloads that involve large amounts of data, typically
found in data warehouse fact tables.

This new type of index stores data column-wise instead of row-wise, as
indexes currently do. For example, consider an Employee table containing
employee data, as shown in Table 1.

<strong>Table 1: Sample Employee Table</strong></p>
<table border="0">
<tbody>
<tr>
<td>FirstName</td>
<td>LastName</td>
<td>HireDate</td>
<td>Gender</td>
</tr>
<tr>
<td>Adam</td>
<td>Jorgensen</td>
<td>5/9/2008</td>
<td>Male</td>
</tr>
<tr>
<td>Sherri</td>
<td>McDonald</td>
<td>7/1/2009</td>
<td>Female</td>
</tr>
<tr>
<td>Brian</td>
<td>McDonald</td>
<td>09/15/2009</td>
<td>Male</td>
</tr>
<tr>
<td>Jose</td>
<td>Chinchilla</td>
<td>1/10/2010</td>
<td>Male</td>
</tr>
<tr>
<td>Tim</td>
<td>Murphy</td>
<td>7/1/2009</td>
<td>Male</td>
</tr>
<tr>
<td>Tim</td>
<td>Moolic</td>
<td>6/1/2008</td>
<td>Male</td>
</tr>
</tbody>
</table>

In a *row-based index*, the data in the Employee table is stored in one or more data pages, as shown in Figure 1.

<img src="http://logicalread.solarwinds.com/media/402767/nw0001-y.jpg" alt="Nw 0001-y" height="217" width="396">


In a *column-based index*, the data in the Employee table is stored in separate pages for each of the columns, as shown in Figure 2.

<img src="http://logicalread.solarwinds.com/media/402772/nw0002-y.jpg" alt="Nw 0002-y" height="158" width="397">

Performance advantages in columnstore indexes are possible by leveraging the VertiPaq compression technology, which enables large amounts of data to be compressed in-memory. This in-memory compressed store reduces the number of disk reads and increases buffer cache hit ratios because only the smaller column-based data pages that need to satisfy a query are moved into memory.</p>
<p>For wide tables, such as those commonly found in data warehouses, columnstore indexes come in handy as you essentially reduce the amount and size of data needed to be accessed for any given query. For example, consider the following query:

```sql
SELECT FirstName, LastName,
FROM EmployeeTable
WHERE HireDate >= '1/1/2010'
```

A *column-store index* is more efficient for this example because only one smaller-sized (*compressed*) data page is needed to satisfy the query. In this case, the columnstore index for the HireDate column satisfies the WHERE clause. A row-based index is not as efficient because it may need to load one or more larger-sized data pages into memory and read the entire rows, including columns not needed to satisfy the query. A larger-sized data page and additional unnecessary columns increases data size, memory usage, disk reads, and overall query time. Imagine if this table had 20 or more columns!

Columnstore indexes have some requirements and limitations, as shown in Table 2.

<p><strong>Table 2: Requirements and Limitations of Columnstore Index</strong></p>
<table border="0">
<tbody>
<tr>
<td>Description</td>
<td>Requirement/Limitation</td>
</tr>
<tr>
<td>No. of columnstore indexes per table</td>
<td>1</td>
</tr>
<tr>
<td>Index record size limit of 900 bytes</td>
<td>No limit/Not applicable</td>
</tr>
<tr>
<td>Index limit of 16 key columns</td>
<td>No limit/Not applicable</td>
</tr>
<tr>
<td>Table partitioning support</td>
<td>Yes, as a partition aligned index.</td>
</tr>
<tr>
<td>Can be combined with row-based indexes?</td>
<td>Yes, if clustered index, all columns must be present in columnstore index.</td>
</tr>
<tr>
<td>Update, Delete, Insert, Merge supported?</td>
<td>No, columnstore indexes are read-only but workarounds exist. Refer to Books Online: Best Practices: Updating Data in a Columnstore Index.</td>
</tr>
<tr>
<td>Data types that can be included in a columnstore index</td>
<td>Char, varchar except varchar(max), nchar, nvarchar except nvarchar(max), decimal and numeric except with precision greater than 18 digits, int, bigint, smallint, tinyint, float, real, bit, money, smallmoney, all date and time data types except datetimeoffset with scale greater than 2.</td>
</tr>
<tr>
<td>Data types that cannot be included in a columnstore index</td>
<td>Binary, varbinary, ntext, text, image, varchar(max), nvarchar(max), uniqueidentifier, rowversion, timestamp, sql_variant, decimal and numeric with precision greater than 18 digits, datetimeoffset with scale greater than 2, CLR types including hierarchyid and spatial types, xml.</td>
</tr>
</tbody>
</table>

Following is the basic syntax to create a columnstore index:

```sql
CREATE COLUMNSTORE INDEX idx_cs1
ON EmployeeTable (FirstName, LastName, HireDate, Gender)</textarea></div>
```

You can also create columnstore indexes using SQL Server Management Studio. Simply navigate to the Indexes section of the table, and select New Index &gt; Non-clustered Columnstore Index.