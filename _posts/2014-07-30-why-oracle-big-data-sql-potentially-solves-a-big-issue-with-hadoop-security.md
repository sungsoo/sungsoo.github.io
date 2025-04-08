---
layout: post
title: Why Oracle Big Data SQL Potentially Solves a Big Issue with Hadoop Security 
date: 2014-07-30
categories: [computer science]
tags: [big data, big data]

---

## Article Source
* Title: [Why Oracle Big Data SQL Potentially Solves a Big Issue with Hadoop Security](http://www.rittmanmead.com/2014/07/why-oracle-big-data-sql-potentially-solves-a-big-issue-with-hadoop-security/)
* Authors: [Mark
Rittman](http://www.rittmanmead.com/author/mark-rittman/ "Posts by Mark Rittman")



# Why Oracle Big Data SQL Potentially Solves a Big Issue with Hadoop Security

Oracle announced their Big Data SQL product a couple of weeks ago, which
effectively extends Exadata’s query-offloading to Hadoop data sources.
[I covered the launch a few days
afterwards](http://www.rittmanmead.com/2014/07/taking-a-look-at-the-new-oracle-big-data-sql/),
focusing on how it implements Exadata’s SmartScan on Hive and NoSQL data
sources and provides a single metadata catalog over both relational, and
Hadoop, data sources. In a Twitter conversation later in the day though,
I made the comment that in my opinion, the biggest benefit of Big Data
SQL will be in its ability to extend Oracle’s security model to Hadoop
data sources, because Hadoop security Hadoop security is still a bit of
a mess:

> To me the greatest benefit of Big Data SQL is the single
> security model; even with Sentry, Hadoop security is fragmented and a
> mess (IMO)
>
> — Mark Rittman (@markrittman) [July 17,
> 2014](https://twitter.com/markrittman/statuses/489870224054030336)

I’ve been working on an Oracle Big Data Appliance project over the past
few weeks, as the technical architect and initial sysadmin for the
cluster, and it’s given me a first-hand experience of what security’s
like on a Hadoop cluster. Over the past few weeks I’ve had to come up
with a security policy covering HDFS, Hive and the Cloudera management
tools (Cloudera Manager, Hue etc), and try and implement an access and
authorisation approach that ensures only designated people can log in,
and when they’re in, they can only see the data they’re supposed to see.
Hadoop at this point, to my mind, suffers from a couple of major issues
when it comes to security:

-   It’s fragmented, in that each tool or Hadoop product tends to have
    its own security setup, and the documentation is all split up,
    rapidly goes out of date, and is more of a reference than a tutorial
    ([Cloudera’s Security
    documentation](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Security-Guide/CDH5-Security-Guide.html)
    is one of the better examples, but it still splits the key
    information you need over several sections and several other docs)
-   It’s full of holes, such that the default security setup is
    considered insecure in terms of users being able to spoof their
    details, and making it more secure is again an exercise in hunting
    through docs, with some pretty complex configuration steps you need
    to perform (for example, configuring Kerebos authentication, a
    prerequisite for things like Apache Sentry)

If we take a typical security policy that a large enterprise customer’s
going to want to put in place, it’ll look something like this:

-   Users should only be able to log in via their corporate LDAP
    account, and we’ll want that login process to be secure so it can’t
    easily be bypassed
-   We want to be able to secure our datasets, so that only authorised
    users can view particular datasets, and there’s likely to be some
    groups we grant read-only access to, and others we grant read-write
-   The data loading processes for the Hadoop cluster need to be
    locked-down so they can’t overwrite the datasets of other
    applications
-   Our security policy ideally needs to sync-up, or be an extension of,
    our existing enterprise security policy, not something we maintain
    separately
-   We need to be able to audit and review who’s actually accessing what
    dataset, to ensure that these policies are being followed and
    enforced
-   We also need the ability to obfuscate or depersonalise data before
    it gets into the cluster, and also have the option of encrypting the
    data at-rest as well as on-the-wire

Back in the early days of Hadoop these types of security policy weren’t
often needed, as the users of the Hadoop cluster were typically a small
set of data scientists or analysts who’d been cleared already to view
and work with the data in the cluster (or more likely, they did it and
just didn’t tell anyone). But as we move to enterprise information
management architectures such as the one outlined in my two-part blog
post series a few weeks ago
([pt.1](http://www.rittmanmead.com/2014/06/introducing-the-updated-oracle-rittman-mead-information-management-reference-architecture-pt1-information-architecture-and-the-data-factory/),
[pt.2](http://www.rittmanmead.com/2014/06/introducing-the-updated-oracle-rittman-mead-information-management-reference-architecture-pt2-delivering-the-data-factory/)),
the users of Hadoop and other “data reservoir” data sources are likely
to increase significantly in number as data from these systems becomes
just another part of the general enterprise data set.

![NewImage](http://www.rittmanmead.com/wp-content/uploads/2014/07/NewImage2.png "NewImage.png")

But in practice, this is hard to do. Let’s start with HDFS first, the
Hadoop Distributed File System on which most Hadoop data is stored. HDFS
aims to look as similar to a Linux or Unix-type filesystem as possible,
with similar commands (mkdir, ls, chmod etc) and the same [POSIX
permissions
model](http://hadoop.apache.org/docs/r2.3.0/hadoop-project-dist/hadoop-hdfs/HdfsPermissionsGuide.html),
where files and directories are associated with an owner and a group and
where permissions are set for that owner, the group and all others. For
example, in the HDFS file listing below, the
“/user/cust\_segment\_analysis” directory is owned by the user
“mrittman” and the group “marketing”, with the directory owner having
full read, write and subdirectory traversal access to the directory, the
group having read-only and subdirectory traversal access, and all others
having no access at all.

```
[root@bdanode1 ~]# hadoop fs -ls /user
Found 13 items
drwxrwxrwx   - admin    admin               0 2014-06-02 16:06 /user/admin
drwxr-x---   - mrittman marketing           0 2014-07-26 21:31 /user/cust_segment_analysis
drwxr-xr-x   - hdfs     supergroup          0 2014-05-27 13:19 /user/hdfs
drwxrwxrwx   - mapred   hadoop              0 2014-05-25 20:47 /user/history
drwxrwxr-t   - hive     hive                0 2014-06-04 16:31 /user/hive
drwxr-xr-x   - hue      hue                 0 2014-05-31 18:51 /user/hue
drwxrwxr-x   - impala   impala              0 2014-05-25 20:54 /user/impala
drwxrwxr-x   - oozie    oozie               0 2014-05-25 20:52 /user/oozie
drwxrwxrwx   - oracle   oracle              0 2014-06-09 21:38 /user/oracle
drwxr-xr-x   - root     root                0 2014-06-06 16:25 /user/root
drwxr-xr-x   - sample   sample              0 2014-05-31 18:51 /user/sample
drwxr-x--x   - spark    spark               0 2014-05-25 20:45 /user/spark
drwxrwxr-x   - sqoop2   sqoop               0 2014-05-25 20:53 /user/sqoop2
```

Which all sounds great until you then have another group that needs
read-write access to the directory, but you’re limited to just one group
permissions setting for the directory which you’ve already used to set
up read-only access for that particular group. If you therefore need to
set up different sets of security access for different groups, you
typically then end-up creating multiple HDFS directories and multiple
copies of the dataset in question, assigning each copy to a different
group, which isn’t all that convenient and gives you other problems in
terms of maintenance and keeping it all in-sync.

What you of course need is something like the “access control lists”
(ACLs) you get with operating systems like Windows NT and MacOS, where
you can define an arbitrary number of user groups and then assign each
of them their own permission set on the directory and the files it
contains. The most recent versions of Hadoop actually implement a form
of ACL for HDFS, with this feature making its way into the
[recently-released Cloudera
CDH5.1](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Security-Guide/cdh5sg_hdfs_ext_acls.html),
but these ACLs are an addition to the standard POSIX user, group, others
model and aren’t recommended for all files in your HDFS filesystem as
[according to the Hadoop
docs](http://hadoop.apache.org/docs/r2.4.0/hadoop-project-dist/hadoop-hdfs/HdfsPermissionsGuide.html#ACLs_Access_Control_Lists)
*“Best practice is to rely on traditional permission bits to implement
most permission requirements, and define a smaller number of ACLs to
augment the permission bits with a few exceptional rules. A file with an
ACL incurs an additional cost in memory in the NameNode compared to a
file that has only permission bits.”*Still, it’s better than not having
them at all, and I’d imagine using this feature for particular
directories and sets of files that need more than one set of group
permissions configured for them.

In most cases though, the way you’ll present data out to non-technical
end-users and applications is through Hive and Impala tables, or through
tools like Pig and Spark. Under the covers, these tools still use HDFS
permissions to control access to the data within Hive and Impala tables,
but again by default you’re limited to granting access to whole HDFS
directories, or the files contained within those directories. Something
that addresses this issue is a product called [Apache
Sentry](http://incubator.apache.org/projects/sentry.html), an
open-source project within the Hadoop family that enables role-based
access control for Hive and Impala tables. [Oracle are one of the
co-founders of the Sentry
project](http://www.oracle.com/us/corporate/press/2054822) and include
it in the base software on the Big Data Appliance, and using Sentry [you
can grant SELECT, INSERT or ALL privileges to a
group](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH4/4.6.0/CDH4-Security-Guide/cdh4sg_Sentry.html#concept_hmt_vv4_wk_unique_1)
on a particular Hive or Impala table, rather than on the underlying HDFS
directories and files. A form of fine-grained access control can be set
up using Sentry by creating views with particular row-level security
settings, giving you the basics of a database-like security policy that
you can apply over the main way that users access data in the cluster.

But Sentry itself has a few significant prerequisites – you have to
enable Kerebos authentication on your cluster, which you should do
anyway because of the risk of account spoofing, but is still a
significant thing to set up – and of course you need to link Hive and
Impala to your corporate LDAP server and configure them to work in the
way that Sentry requires. Most importantly though, you’re still left
with the situation where you’ve got two separate security setups – the
one for your corporate data warehouse and relational data sources, and
another for data accessed on Hadoop, and it’s still hard to be sure,
what with all the disparate products and partially-complete open-source
products, whether data in your Hadoop cluster is still really secure
(though products like [Cloudera
Navigator](http://www.cloudera.com/content/cloudera/en/products-and-services/cloudera-enterprise/cloudera-navigator.html)
aim to provide some form of data governance and auditing over these
datasets); and, there’s still no straightforward way to remove
individual customers’ data out of the Hadoop dataset (“data redaction”),
no easy way to obfuscate or mask data, and no easy way (apart from the
Hive views mentioned before) to restrict users to accessing only certain
columns in a Hive or Impala table.

And so this is where Oracle’s Big Data SQL product could be very
interesting. Big Data SQL takes the Exadata model of moving as much
filtering and column-projection as it can to the storage server, adding
Oracle SmartScan functionality to the Hadoop node and allowing it to
understand the full Oracle SQL dialect (and PL/SQL security functions),
rather than just the subset of SQL provided by HiveQL and Impala SQL.

![NewImage](http://www.rittmanmead.com/wp-content/uploads/2014/07/NewImage3.png "NewImage.png")

More importantly, it’ll enable a single unified data dictionary over
both Oracle and Hadoop data sources, presenting Hive tables and NoSQL
data as regular Oracle tables and allowing the DBA to create data
security, redaction and row-level filtering policies over both
relational and Hadoop data – giving you potentially the ability to
define a single security policy across all data in your overall
information management architecture.

![NewImage](http://www.rittmanmead.com/wp-content/uploads/2014/07/NewImage4.png "NewImage.png")

So I think this is actually a “big deal”, and potentially even more
game-changing that the SmartScan functionality that got most of the
attention with the Big Data SQL product launch. How well it’ll work
in-practice, and how much will be enabled on day one it’s hard to say,
but this feature meets a real need that our customers are finding now,
so I’ll be very interested to try it out when the product becomes
available (presumably) later in the year.

## Related posts:

-   [List of our Recent “Getting Started” Hadoop
    Articles](http://www.rittmanmead.com/2014/05/list-of-our-recent-getting-started-hadoop-articles/ "List of our Recent “Getting Started” Hadoop Articles")
-   [Taking a Look at the New Oracle Big Data
    SQL](http://www.rittmanmead.com/2014/07/taking-a-look-at-the-new-oracle-big-data-sql/ "Taking a Look at the New Oracle Big Data SQL")
-   [OBIEE 11.1.1.7, Cloudera Hadoop & Hive/Impala Part 1 : Install and
    Set-up an EC2 Hadoop
    Cluster](http://www.rittmanmead.com/2014/01/obiee-11-1-1-7-cloudera-hadoop-hiveimpala-part-1-install-and-set-up-an-ec2-hadoop-cluster/ "OBIEE 11.1.1.7, Cloudera Hadoop & Hive/Impala Part 1 : Install and Set-up an EC2 Hadoop Cluster")
