---
layout: post
title: OLAP vs. OLTP
date: 2014-03-25
categories: [computer science]
tags: [data management]

---

# OLAP vs. OLTP: what makes the difference

OLTP and OLAP are complementing technologies. You can't live without
OLTP: it runs your business day by day. So, using getting strategic
information from OLTP is usually first “quick and dirty” approach, but
can become limiting later.


![olap_vs_oltp.jpg](http://sungsoo.github.com/images/olap_vs_oltp.jpg)

**OLTP (On-line Transaction Processing)** is characterized by a large number of short on-line transactions (INSERT, UPDATE, DELETE). The main emphasis for OLTP systems is put on very fast query processing, maintaining data integrity in multi-access environments and an effectiveness measured by number of transactions per second. In OLTP database there is detailed and current data, and schema used to store transactional databases is the entity model (usually 3NF). 

**OLAP (On-line Analytical Processing)** is characterized by relatively low volume of transactions. Queries are often very complex and involve aggregations. For OLAP systems a response time is an effectiveness measure. OLAP applications are widely used by Data Mining techniques. In OLAP database there is aggregated, historical data, stored in multi-dimensional schemas (usually star schema). 

* **Star schema:** In computing, the Star Schema (also called *star-join schema*) is the simplest style of data mart schema. The star schema consists of one or more fact tables referencing any number of dimension tables. The star schema is an important special case of the snowflake schema, and is more effective for handling simpler queries.

## What is OLAP?

<iframe width="600" height="400" src="//www.youtube.com/embed/2ryG3Jy6eIY" frameborder="0" allowfullscreen></iframe>

## Introduction to OLAP
<iframe width="600" height="400" src="//www.youtube.com/embed/1Qdf5c_nmtw" frameborder="0" allowfullscreen></iframe>

 <table border="0" cellspacing="2" cellpadding="1" class="font2">
      <tr valign="middle" bgcolor="#000000">
        <td align="center"> <h4><font color="#FFFFFF"><b></b></font></h4></td>
        <td align="center"> <h4><font color="#FFFFFF"><b>OLTP System <br>Online Transaction Processing <br> (Operational System)</b></font></h4></td>
        <td align="center"> <h4><font color="#FFFFFF"><b>OLAP System <br>Online Analytical Processing <br>(Data Warehouse)</b></font></h4></td>
      </tr>
      <tr valign="middle" bgcolor="#E6E3FD">
        <td> <p align="center">Source of data</p></td>
        <td> <p align="center">Operational data; OLTPs are the original source of the data.</p></td>
        <td> <p align="center">Consolidation data; OLAP data comes from the various OLTP Databases</p></td>
      </tr>
      <tr valign="middle" bgcolor="#E6E3FD">
        <td> <p align="center">Purpose of data</p></td>
        <td> <p align="center">To control and run fundamental business tasks</p></td>
        <td> <p align="center">To help with planning, problem solving, and decision support</p></td>
      </tr>
      <tr valign="middle" bgcolor="#E6E3FD">
        <td> <p align="center">What the data</p></td>
        <td> <p align="center">Reveals a snapshot of ongoing business processes</p></td>
        <td> <p align="center">Multi-dimensional views of various kinds of business activities</p></td>
      </tr>
      <tr valign="middle" bgcolor="#E6E3FD">
        <td> <p align="center">Inserts and Updates</p></td>
        <td> <p align="center">Short and fast inserts and updates initiated by end users</p></td>
        <td> <p align="center">Periodic long-running batch jobs refresh the data</p></td>
      </tr>
      <tr valign="middle" bgcolor="#E6E3FD">
        <td> <p align="center">Queries</p></td>
        <td> <p align="center">Relatively standardized and simple queries Returning relatively few records</p></td>
        <td> <p align="center">Often complex queries involving aggregations</p></td>
      </tr>
      <tr valign="middle" bgcolor="#E6E3FD">
        <td> <p align="center">Processing Speed</p></td>
        <td> <p align="center">Typically very fast</p></td>
        <td> <p align="center">Depends on the amount of data involved; batch data refreshes and complex queries may take many hours;
                               query speed can be improved by creating indexes</p></td>
      </tr>
      <tr valign="middle" bgcolor="#E6E3FD">
        <td> <p align="center">Space Requirements</p></td>
        <td> <p align="center">Can be relatively small if historical data is archived</p></td>
        <td> <p align="center">Larger due to the existence of aggregation structures and history data; requires more indexes than OLTP</p></td>
      </tr>
      <tr valign="middle" bgcolor="#E6E3FD">
        <td> <p align="center">Database Design</p></td>
        <td> <p align="center">Highly normalized with many tables</p></td>
        <td> <p align="center">Typically de-normalized with fewer tables; use of star and/or snowflake schemas</p></td>
      </tr>
      <tr valign="middle" bgcolor="#E6E3FD">
        <td> <p align="center">Backup and Recovery</p></td>
        <td> <p align="center">Backup religiously; operational data is critical to run the business, data loss is likely to entail significant monetary loss and legal liability</p></td>
        <td> <p align="center">Instead of regular backups, some environments may consider simply reloading the OLTP data as a recovery method</p></td>
      </tr>
   <tr> 
         <td bgcolor="#FEFEE7" colspan="3" > <i>source: www.rainmakerworks.com</i></td>
       </tr>
    </table>
    

This post explores key differences between two technologies.

[OLTP](http://en.wikipedia.org/wiki/Online_analytical_processing) stands
for On Line **Transaction** Processing and is a data modeling approach
typically used to facilitate and manage usual business applications.
Most of applications you see and use are OLTP based.

[OLAP](http://en.wikipedia.org/wiki/OLTP) stands for On Line
**Analytic** Processing and is an approach to answer multi-dimensional
queries. OLAP was conceived for Management Information Systems and
Decision Support Systems but is still **widely underused**: every day I
see too much people making out business intelligence from OLTP data!

With the constant growth of data analysis and business intelligence
applications (now even in small business) understanding OLAP nuances and
benefits is a must if you want provide valid and useful analytics to
management.

The following table summarized main differences between OLPT and OLAP:

<table width="100%" cellspacing="0" cellpadding="5" bordercolor="#000000" border="1">
    <col width="85" />
    <col width="63" />
    <col width="107" />
    <tbody><tr valign="top" bgcolor="#E6E3FD">
        <td width="33%">
            <p><br />
            </p>
        </td>
        <td width="25%">
            <p>OLTP</p>
        </td>
        <td width="42%">
            <p>OLAP</p>
        </td>
    </tr>
    <tr valign="top">
        <td width="33%">
            <p>Application</p>
        </td>
        <td width="25%">
            <p>Operational: ERP, CRM, legacy apps, ...</p>
        </td>
        <td width="42%">
            <p>Management Information System, Decision Support System</p>
        </td>
    </tr>
    <tr valign="top">
        <td width="33%">
            <p>Typical users</p>
        </td>
        <td width="25%">
            <p>Staff</p>
        </td>
        <td width="42%">
            <p>Managers, Executives</p>
        </td>
    </tr>
    <tr valign="top">
        <td width="33%">
            <p>Horizon</p>
        </td>
        <td width="25%">
            <p>Weeks, Months</p>
        </td>
        <td width="42%">
            <p>Years</p>
        </td>
    </tr>
    <tr valign="top">
        <td width="33%">
            <p>Refresh</p>
        </td>
        <td width="25%">
            <p>Immediate</p>
        </td>
        <td width="42%">
            <p>Periodic</p>
        </td>
    </tr>
    <tr valign="top">
        <td width="33%">
            <p>Data model</p>
        </td>
        <td width="25%">
            <p>Entity-relationship</p>
        </td>
        <td width="42%">
            <p>Multi-dimensional</p>
        </td>
    </tr>
    <tr valign="top">
        <td width="33%">
            <p>Schema</p>
        </td>
        <td width="25%">
            <p>Normalized</p>
        </td>
        <td width="42%">
            <p>Star</p>
        </td>
    </tr>
    <tr valign="top">
        <td width="33%">
            <p>Emphasis</p>
        </td>
        <td width="25%">
            <p>Update</p>
        </td>
        <td width="42%">
            <p>Retrieval</p>
        </td>
    </tr>
</tbody></table>

<iframe width="600" height="400" src="//www.youtube.com/embed/Zd4VK3gHYs0" frameborder="0" allowfullscreen></iframe>

<iframe width="600" height="400" src="//www.youtube.com/embed/I-HVEP8xoQo" frameborder="0" allowfullscreen></iframe>

## Horizon 

OLTP databases store “live” operational information. An invoice, for
example, once paid, is possibly moved to some sort of backup store,
maybe upon period closing. On the other side **5-10 strategic analysis
are usual to identify trends.** Extending life of operational data,
would not be enough (in addition to possibly impacting performance).

Even keeping that data indexed and online for years, you would surely
face compatibility problems. It is quite improbable that your current
invoice fields and references are the same of 10 years ago!

But neither performance nor compatibility are the biggest concern under
large horizon. Real problem is business dynamics. Today business
constantly change and the traditional entity-relationship approach is
too vulnerable to changes. I will better explore this point in [next
post](why_business_intelligence_on_oltp) with a practical example.


## Refresh 

OLPT requires instant update. When you cash some money from an ATM you
balance shall be immediately updated. OLAP has not such requirement.
Nobody needs instant information to make strategic business decision.

This allows OLAP data to be refreshed daily. This means extra timing and
resources for cleansing and accruing data. If, for example, an invoice
was canceled, we wouldn't like to see its value first inflating sales
figures and later reverted.

More time and more resources would also allow better indexing to address
huge tables covering the extended horizon.



### Data Model & Schema 

This is possibly the most evident difference between two approaches.
OLTP perfectly fits traditional entity-relationship or object-oriented
models. We usually refer to information as attributes related to
entities, objects or classes, like product price, invoice amount or
client name. Mapping can be with a simple, one argument function:

 

> product » price
>
> invoice » amount
>
> client » name



Such functions can be implemented though classic tables, one row per
instance, where **each attribute is mapped to one column**.

Now, if you listen to typical business questions you perceive a
different requirement:

-   What is gross margin by product category in Europe and Asia?

-   What's our current inventory by product and warehouse?

-   Which was the evolution of return rate of different products
    acquired by different suppliers?



Are mapped as functions of multiple arguments (left side):

> Product category **×** Region » Gross margin
>
> Product **×** Warehouse » Inventory
>
> Supplier **×** Time **×** Product » Return rate

**Mapping attributes to columns do not work any more in this case**: a
multi-dimensional approach is required.

Tables do not naturally support multi-dimensional approach but
relational databases are still the most widely used, proven and reliable
approach today available. Reliability and performance is a must if we
think in storing terabytes of data along years.

The solution is use an hybrid approach based sitting on conventional
relational technology. This model employs so called **star-schema
instead of traditional normalization**.



### Emphasis 

OLPT emphasis is on update. Transaction level isolation assures that
database is always in a consistent state. This can imply in some
overhead to coordinate concurrent updates but is necessary even in small
applications.

On the other side OLAP can be updated by periodic (daily) processes that
work in standalone mode thus **consistency can be assured through update
process**.

But OLAP faces another challenge: retrieval. Suppose a telecom executive
asking how much was billed last year in communications from USA to
Japan. Can you figure how much time would it take to go ever each
individual call to get the result?

**OLTP emphasis is on retrieval** and it organizes data to return result
of ad hoc inquiries in a reasonable amount of time.



### Two worlds, two obstacles 

So, in practice you need two different databases, one for OLAP and
another one for OLTP. The second one is usually called a Data Warehouse
and is a must if you want to make serious business intelligence.

But, if this is best solution why it isn't widely adopted? Why so many
people are still trying to use BI tools on traditional OLTP database?
These are the most common reasons I have seen in practice:

1.  **Doctrine**. For years data modelers have been educated to
    normalize data and for years they have been told that data
    redundancy is first deadly sin. **Habit is worst enemy of OLAP
    approach**. Even when a star schema was officially adopted for BI
    applications, I have seen an irresistible attraction to
    *snowflaking* (I'll explain this term in next posts).

2.  **Ingenuity**. *“Let's buy a good tool that will do the magic with
    little effort!”*. This seems quite a better alternative to creating
    and feeding a second database. It doesn't work, still can be a valid
    solution if, as IT manager, you have just opened your [second
    envelope](http://www.shabbir.com/jokes/work/3envelopes.html). In
    next post **I will illustrate with practical example what will
    probably go wrong**.



Building a relational data warehouse is actually not so difficult,
neither exclusively applicable to multi-billion corporations or
terabytes of data and, in [future
posts](why_business_intelligence_on_oltp), I pretend to show a
**pragmatic and agile approach**.

For further detail on OLAP technology I suggest to read: [**Olap
Solutions -
2nd Edition**](http://eu.wiley.com/WileyCDA/WileyTitle/productCd-0471400300.html) By Erik
Tomsen,
also available at
[Amazon](http://www.amazon.com/OLAP-Solutions-Building-Multidimensional-Information/dp/0471400300/ref=sr_1_1).

# References
[1] [*OLAP vs OLTP: what makes the difference*](http://www.cbsolution.net/techniques/ontarget/olap_vs_oltp_what_makes), cbsolution.net, 2011.