---
layout: post
title: Comparison - Ad-hoc vs Stored Procedure vs Dynamic SQL
date: 2014-03-25
categories: [computer science]
tags: [data management]

---

# Comparison: Ad-hoc vs Stored Procedure vs Dynamic SQL

Sometimes when you are creating a SQL query, you wonder if it’s more
sensible to use a standard T-SQL, or some other possibility. In this
post I will try to compare the three different possibilities, so that
you can make your own decision. If you read the comparison below, keep
in mind that there is no right or wrong in this. Each situation requires
a different point of view, and may offer it’s own difficulties.

<table cellpadding="5" cellspacing="1" border="0" width="630" font-size:10px;color:#000;">
<tr>
<td valign="top" width="100" style="background-color:#DEDEDE;">&nbsp;</td>
<td valign="top" style="background-color:#DEDEDE;"><b>Ad-Hoc Query</b></td>
<td valign="top" style="background-color:#DEDEDE;"><b>Stored Procedure</b></td>
<td valign="top" style="background-color:#DEDEDE;"><b>Dynamic SQL</b></td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;"><b>Use it for</b></td>
<td valign="top">Long, complex queries<br />(OLAP; for example Reporting or Analysis)</td>
<td valign="top">Short, simple queries<br />(OLTP; for example Insert, Update, Delete, Select)</td>
<td valign="top">Short, simple queries<br />(OLTP; for example Insert, Update, Delete, Select)</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;"><b>Performance</b></td>
<td valign="top">Compiled at runtime, Execution Plan stored in Cache</p>
<p>            Changed data is no issues because of re-compile</td>
<td valign="top">Compiled once at first run, and stored in Procedure Cache</p>
<p>Changed data might be a performance bottleneck. Can be<br />
            solved with recompile</td>
<td valign="top">Compiled at runtime, and execution plan is not stored<br />
            <br />(unless<br />
            using the more efficient sp_executesql)</p>
<p>            Changed data is no issue because of re-compile</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>Security</b></td>
<td valign="top">
            Permissions (read/write) on all objects (database(s)/table(s))</td>
<td valign="top">Execute permissions on SP are enough</td>
<td valign="top">
            Permissions (read/write) on all objects (database(s)/table(s))</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>Flexibility</b></td>
<td valign="top">
            If changed, your application needs to be recompiled</td>
<td valign="top">
            If changed, only need to change the SP in the database</td>
<td valign="top">If changed, your application needs to be recompiled</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>Number of Statements</b></td>
<td valign="top">
            Only 1 statement possible</td>
<td valign="top">
            Multiple statements possible</td>
<td valign="top">Multiple statements possible</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>Memory Usage</b></td>
<td valign="top">
            Uses more memory then an SP</td>
<td valign="top">
            Uses less memory then an ad-hoc query</td>
<td valign="top">Uses more memory then an SP</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>Network traffic</b></td>
<td valign="top">
            Query executes server side</p>
<p>            Query and resultset are send across<br />
            network/internet</td>
<td valign="top">
            Query executes server side</p>
<p>            Execute statement<br />
            and resultset are send<br />
            across network/internet</td>
<td valign="top">
            Query executes server side</p>
<p>            Statement<br />
            and resultset are send across<br />
            network/internet</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>Separation</b></td>
<td valign="top">
            Database logic and business logic are mostly combined in the query</td>
<td valign="top">
            Seperate database logic from business logic</td>
<td valign="top">Seperate database logic from business logic</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>Troubleshoot</b></td>
<td valign="top">
            Relatively easy to troubleshoot</td>
<td valign="top">
            Relatively easy to troubleshoot</td>
<td valign="top">Difficult to troubleshoot</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>Maintaining</b></td>
<td valign="top">
            Difficult because of several locations in applications and database</td>
<td valign="top">
            Easy because of single location</td>
<td valign="top">
            Difficult because of several locations in<br />
            applications and database</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>Access</b></td>
<td valign="top">
            Difficult to access multiple objects in different databases,<br />
            or in dynamic databases</td>
<td valign="top">
            Difficult to access multiple objects in different databases,<br />
            or in dynamic<br />
            database</td>
<td valign="top">Allows any object (database, table, columns, etc) to be referenced</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>WHERE clause</b></td>
<td valign="top">
            Fairly static WHERE clause</td>
<td valign="top">
            Fairly static WHERE clause</td>
<td valign="top">Dynamic WHERE clause (add/remove), based on parameters</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>Versioning</b></td>
<td valign="top">
            Only possible via Source Controlling your application</td>
<td valign="top">
            Possible via Source Controlling your database, and by commenting your SP</td>
<td valign="top">Only possible via Source Controlling your application</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>CRUD</b></td>
<td valign="top">
            Can be created by getting all your&nbsp; queries together, and looking for<br />
            specific<br />
            keywords<br />
            <br />
            (Update, Delete, Select, Etc)</td>
<td valign="top">
            Difficult to catch in a CRUD<br />
            <br />
            (Create, Read, Update, Delete) diagram</td>
<td valign="top">Difficult to catch in a CRUD (Create, Read, Update, Delete) diagram</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>Structure Update</b></td>
<td valign="top">
            Can be changed<br />
            simultaneously with structure changes</td>
<td valign="top">
            Needs to be altered when the underlying structure is changed</td>
<td valign="top">Can be changed simultaneously with structure changes</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>Searching</b></td>
<td valign="top">
            No standard way to search through</td>
<td valign="top">
            Possible to use sys.procedures to search through SP contents.</p>
<p>            Dependency window in SSMS shows SP content</td>
<td valign="top">No standard way to search through</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>Testing</b></td>
<td valign="top">
            Can be compiled/tested in code</td>
<td valign="top">
            Impossible to automatically compile without 3rd party tools</td>
<td valign="top">Difficult to test in code</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>Mapping</b></td>
<td valign="top">
            ORM (Object-relational mapping) is possible</td>
<td valign="top">
            ORM (Object-relational mapping) is impossible</td>
<td valign="top">ORM (Object-relational mapping) is impossible</td>
</tr>
<tr>
<td valign="top" align="right" style="background-color:#DEDEDE;">
            <b>Compiling</b></td>
<td valign="top">
            Compiles the whole statement</td>
<td valign="top">
            Compiles the whole statement</td>
<td valign="top">
            Only static elements can be compiled</td>
</tr>
</table>

## Why Hive is not supporting Stored Procedure?

Hive and Hbase are not support stored procedure. However, Hive plans to support Sp ([HIVE-3087](https://issues.apache.org/jira/browse/HIVE-3087)) in the future. HBase has no plan about supporting Sp since it only focuses on being a Storage and more like NoSQL.

[Hive UDF](https://cwiki.apache.org/Hive/languagemanual-udf.html) could implement some function of stored procedure, though it's not enough.

# RDBMS vs.Hadoop

Here is a comparison of the overall differences between the RDBMS and MapReduce-based systems such as Hadoop:

<table class="tableStyle greyScheme">
<thead>
<tr>
	<td width="150px" ></td>
	<th style="background-color: #DEDEDE;" width="150px" id="RDBMS">RDBMS</th>
	<th style="background-color: #DEDEDE;" id="MapReduce">MapReduce</th>
</tr>
</thead>
<tbody>
<tr>
	<td class="firstColumn" headers=""><em>Data size</em></td>
	<td headers="RDBMS">Gigabytes</td>
	<td headers="MapReduce">Petabytes</td>
</tr>
<tr>
	<td class="firstColumn" headers=""><em>Access</em></td>
	<td headers="RDBMS">Interactive and batch</td>
	<td headers="MapReduce">Batch</td>
</tr>
<tr>
	<td class="firstColumn" headers=""><em>Structure</em></td>
	<td headers="RDBMS">Fixed schema</td>
	<td headers="MapReduce">Unstructured schema</td>
</tr>
<tr>
	<td class="firstColumn" headers=""><em>Language</em></td>
	<td headers="RDBMS">SQL</td>
	<td headers="MapReduce">Procedural (Java, C++, Ruby, etc)</td>
</tr>
<tr>
	<td class="firstColumn" headers=""><em>Integrity</em></td>
	<td headers="RDBMS">High</td>
	<td headers="MapReduce">Low</td>
</tr>
<tr>
	<td class="firstColumn" headers=""><em>Scaling</em></td>
	<td headers="RDBMS">Nonlinear</td>
	<td headers="MapReduce">Linear</td>
</tr>
<tr>
	<td class="firstColumn" headers=""><em>Updates</em></td>
	<td headers="RDBMS">Read and write</td>
	<td headers="MapReduce">Write once, read many times</td>
</tr>
<tr>
	<td class="firstColumn" headers=""><em>Latency</em></td>
	<td headers="RDBMS">Low</td>
	<td headers="MapReduce">High</td>
</tr>
</tbody>
</table>

# Beyond Hadoop: Fast Ad-Hoc Queries on Big Data

<iframe width="600" height="400" src="//www.youtube.com/embed/eCbXoGSyHbg" frameborder="0" allowfullscreen></iframe>