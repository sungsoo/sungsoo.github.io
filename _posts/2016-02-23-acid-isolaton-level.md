---
layout: post
title: ACID Isolation Level
date: 2016-02-23
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [When is "ACID" ACID? Rarely](http://www.bailis.org/blog/when-is-acid-acid-rarely/#acidtable)

---

When is "ACID" ACID? Rarely.
----

*ACID and NewSQL databases rarely provide true ACID guarantees by
default, if they are supported at all. See [the table](#acidtable).*

Many databases today differentiate themselves from their NoSQL
counterparts by claiming to support [“100%
ACID”](http://www.nuodb.com/explore/sql-cloud-database-product/)
transactions or by [“guaranteeing strong consistency
(ACID).”](http://www.aerospike.com/performance/acid-compliance/) In
reality, few of these databases—including traditional “big iron” systems
like Oracle—provide formal ACID guarantees, [even when they claim to do
so](http://docs.oracle.com/cd/E11882_01/server.112/e10713/transact.htm#i1666).

The textbook definition of ACID Isolation is
[serializability](http://en.wikipedia.org/wiki/Serializability) (e.g.,
[Architecture of a Database
System](http://db.cs.berkeley.edu/papers/fntdb07-architecture.pdf),
Section 6.2), which states that the outcome of executing a set of
transactions should be equivalent to some serial execution of those
transactions. This means that each transaction gets to operate on the
database as if it were running by itself, which [ensures database
correctness, or
consistency](http://research.microsoft.com/en-us/people/philbe/chapter1.pdf).
A database with serializability (“I” in ACID), provides arbitrary
read/write transactions and guarantees consistency (“C” in ACID), or
correctness, of the database. Without serializability, ACID,
particularly consistency, is generally not
guaranteed

Nevertheless, most publicly available databases (often claiming to
provide “ACID” transactions) do not provide serializability. I’ve
compiled the isolation guarantees provided by 18 popular databases below
(sources hyperlinked). Only three of 18 databases provide
serializability by default, and only nine provide serializability as an
option at all (shaded):

<table id="acidtable">
<tbody><tr>
<td class="dbname"><b>Database</b></td><td><b>Default Isolation</b></td><td><b>Maximum Isolation</b></td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://docs.actian.com/ingres/10s/database-administrator-guide/2349-isolation-levels">Actian Ingres 10.0/10S</a></td><td class="serializable">S</td><td class="serializable">S</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://www.aerospike.com/performance/acid-compliance/">Aerospike</a></td><td>RC</td><td>RC</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://www.akiban.com/ak-docs/admin/persistit/Transactions.html">Akiban Persistit</a></td><td>SI</td><td>SI</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://www.clustrix.com/Portals/146389/docs/Clustrix_System_Administrators_Guide_v4.1.pdf">Clustrix CLX 4100</a></td><td>RR</td><td>?</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://media.gpadmin.me/wp-content/uploads/2012/11/GPDBAGuide.pdf">Greenplum 4.1</a></td><td>RC</td><td class="serializable">S</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://publib.boulder.ibm.com/infocenter/dzichelp/v2r2/index.jsp?topic=%2Fcom.ibm.db2z10.doc.perf%2Fsrc%2Ftpc%2Fdb2z_chooseisolationoption.htm">IBM DB2 10 for z/OS</a></td><td>CS</td><td class="serializable">S</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://publib.boulder.ibm.com/infocenter/idshelp/v115/index.jsp?topic=%2Fcom.ibm.sqls.doc%2Fids_sqs_1161.htm">IBM Informix 11.50</a></td><td>Depends</td><td>RR</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://dev.mysql.com/doc/refman/5.6/en/set-transaction.html">MySQL 5.6</a></td><td>RR</td><td class="serializable">S</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://developers.memsql.com/docs/1b/isolationlevel.html">MemSQL 1b</a></td><td>RC</td><td>RC</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://msdn.microsoft.com/en-us/library/ms173763.aspx">MS SQL Server 2012</a></td><td>RC</td><td class="serializable">S</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://www.nuodb.com/nuodb-online-documentation/references/r_Lang/r_Transactions.html">NuoDB</a></td><td>CR</td><td>CR</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://docs.oracle.com/cd/B28359_01/server.111/b28318/consist.htm#autoId8">Oracle 11g</a></td><td>RC</td><td>SI</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://docs.oracle.com/cd/E17277_02/html/TransactionGettingStarted/isolation.html">Oracle Berkeley DB</a></td><td class="serializable">S</td><td class="serializable">S</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://docs.oracle.com/cd/E17277_02/html/TransactionGettingStarted/isolation.html">Oracle Berkeley DB JE</a></td><td>RR</td><td class="serializable">S</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://www.postgresql.org/docs/9.2/static/transaction-iso.html">Postgres 9.2.2</a></td><td>RC</td><td class="serializable">S</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://help.sap.com/hana/html/sql_set_transaction.html">SAP HANA</a></td><td>RC</td><td>SI</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="http://www.scaledb.com/pdfs/ScaleDB_Cluster_Manual.pdf">ScaleDB 1.02</a></td><td>RC</td><td>RC</td>
</tr>

<tr>
<td class="dbname"><a class="tablelink" href="https://voltdb.com/">VoltDB</a></td><td class="serializable">S</td><td class="serializable">S</td>
</tr>

<tr>
<td id="legendlabel"><span id="legendlabel">Legend</span></td><td colspan="2" id="legendbox"> RC: read committed, RR: repeatable read, S: serializability,<br>SI: snapshot isolation, CS: cursor stability, CR: consistent read</td>
</tr>

</tbody></table>


Instead of providing serializability, many these databases provide one
of several weaker variants, often when marketing
material and documentation claim otherwise. There is
no *fundamental* reason why a database shouldn’t *support*
serializability—[we have the
algorithms](http://research.microsoft.com/en-us/people/philbe/ccontrol.aspx),
and we’ve made great strides in improving ACID
scalability. So why not provide serializability by
default, or, at the least, provide serializability as an option at all?
One key factor is performance: serializable isolation can limit
concurrency; traditional techniques such as two-phase locking are
expensive compared to, say, [taking short read locks on data
items](http://diaswww.epfl.ch/courses/adms07/papers/GrayLocks.pdf).
Additionally, it is [impossible to simultaneously achieve high
availability and
serializability](http://www.cs.cornell.edu/courses/CS614/2004sp/papers/DGS85.pdf)
(though most of these database implementations are not highly available
anyway, even when providing weaker models). A third reason is that
transactions may be less likely to deadlock or abort due to conflicts
under weaker isolation. However, these benefits aren’t free: the
consistency anomalies that arise from the weak levels shown above are
[well-understood](http://www.cse.iitb.ac.in/dbms/Data/Courses/CS632/2009/Papers/p492-fekete.pdf)
and [quantifiable](http://www.vldb.org/pvldb/2/vldb09-185.pdf).

Where’s the silver lining? We *can* get real ACID in some of our
databases (if not by default). And, despite the fact that many other
“ACID” databases don’t provide ACID properties—at least according to
decades of research and development and formally proven guarantees
regarding database correctness (although [perhaps marketing has
rewritten the
books](https://twitter.com/CurtMonash/status/292120597947895808))—we can
still [reserve travel
tickets](http://www.oracle.com/us/corporate/customers/customersearch/sabre-holdings-1-gg-ss-1849966.html),
[use our bank
accounts](http://www.oracle.com/us/corporate/customers/customersearch/bank-of-baroda-1-db-ss-1875825.html),
and [fight crime](http://www.oracle.com/us/corporate/press/1871463).
How? One possibility is that anomalies are rare and the performance
benefits of weak isolation outweigh the cost of inconsistencies. Another
possibility is that applications are performing their own concurrency
control external to the database; database programmers can use commands
like [SELECT FOR
UPDATE](http://dev.mysql.com/doc/refman/5.5/en/innodb-locking-reads.html),
[manual LOCK
TABLE](http://dev.mysql.com/doc/refman/5.6/en/lock-tables.html), and
[UNIQUE
constraints](http://www.postgresql.org/docs/8.1/static/ddl-constraints.html)
to manually perform their own synchronization. The answer is likely a
mix of each, but, stepping back, these strategies should remind you of
what’s often done today in NoSQL-style data infrastructure: [“good
enough” consistency](http://pbs.cs.berkeley.edu/#demo) and some
hand-rolled, application-specific concurrency control. Perhaps there’s a
better question: when is “ACID” NoSQL?