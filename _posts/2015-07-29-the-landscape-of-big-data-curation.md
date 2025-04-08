---
layout: post
title: The Landscape of Big Data, Curation
date: 2015-07-29
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [The Landscape of Big Data - Curation](http://info.trianagroup.com/blog/the-landscape-of-big-data-curation)
* Authors: [Reed MacMillan](http://info.trianagroup.com/blog/author/reed-macmillan)

The Landscape of Big Data - Curation
----------

![](http://sungsoo.github.com/images/data_curation.png) Let's call curation "The 80% problem." Before data scientists can get to the yummy parts of their jobs - writing algorithms to analyze and visualize data in meaningful ways, they spend the bulk of their time ingesting, validating, transforming, correcting, and consolidating their data sources.

> Organizations seeking to "extract" the value from data sources must find ways to Extract, Transform, and Load (ETL) the data into a global schema of the consolidated data warehouse. So, what does an ETL tool let you do? It will allow you to write scripts to perform the ETL conversion, and in some cases, the tools may allow you to define your modules and line them up with boxes and arrows to do the mapping. The picture below gives an overview of the process.

![arch_of_data_curation](http://sungsoo.github.com/images/arch_of_data_curation.png)

To get a sense of how such a process may play out with your own
datasets, let's consider the flight data example referenced in the
[first Landscape of Data blog](http://info.trianagroup.com/blog/big-data-case-studies) article on Context and Case Studies. To try and determine whether the query values
that resulted from a "flight status" query were consistent across
multiple sites, they performed these queries at 3 airline websites, 8
airport websites, and 27-third-party websites such as Orbitz and
Travelocity. The focus was on 1200 flights departing from or arriving at
the hub airports of the three airlines.

The research team identified three areas of heterogeneity within the
data: **1) At the schema level; 2) At the instance level; and 3) At the
actual value level.** So, let's translate what this "heterogeneity" in
the flight data means more concretely:

1. **Schema level:** refers to the specific definitions within the different sources database fields. Examples of inconsistent field definitions are: ***arrival time vs. scheduled arrival.***

2. **Instance level:** refers to the representation on the actual
interface (presentation layer). Assume that ***arrival time*** is the
database field used by source a and ***scheduled arrival*** is the name
of the database field used by source b. They could still present the
very same name on their interfaces. For example, "Scheduled Arrival
Time." 

3. **Value level:** refers to the content which is presented next to
the description, in this case a time value.

When you focus on the left side of the picture above, this is where you
will want to think about the different schema and make sure that your
ETL allows both arrival time (source a) and scheduled arrival (source b)
to be interpreted as the same field and transformed into the new name
for these fields that you have defined in your ETL. One possible column
header for this could be "Atime." But remember that your presentation of
the actual time value could show up next to a field that reads
"Scheduled Arrival Time."

It sounds very straight-forward, but all sources are not structured, or
as readily managed as the flight arrival time data example. In fact, the
researchers were principally concerned with understanding the
differences in the values across these sources and their
trustworthiness, something that will also be key to the integrity of
your analytics.

Two striking examples of the nature of curation inside an enterprise
come from Novartis and Fedex.

-   Novartis desired to consolidate the research from 8,000 scientists,
    for a variety of reasons, including to find ways for the scientists
    to leverage the work of their colleagues more efficiently. Since the
    scientists did not follow a common naming scheme for their
    spreadsheets data, you can imagine the process of rationalizing the
    data gathered. Tough, right?
-   Fedex too was faced with the challenge of taking data from 5,000
    operational data storage sites. In fact, with only about 20
    enterprise-level data warehouses, they were faced with a question
    about how to deal with the remaining 4980 sources!

In cases where there is no chance of doing ETL -- the data sources are
too many, or too heterogeneous, there are some new solutions emerging
such as Wrangler and Tamr. Tamr is the brainchild of [Michael
Stonebreaker,](https://en.wikipedia.org/wiki/Michael_Stonebraker) and it
inverts the ETL architecture. An image of the Tamr architecture is shown
here:

![Tamr_Arch](http://sungsoo.github.com/images/Tamr_Arch.png)

Instead of a human with some tools for transformation, it's an automatic
system with a console that lets you decide what you want to do next
(e.g. ingest a new data source). One of the other really cool aspects of
[Tamr](http://www.tamr.com/) is that as it works through the ingestion of
source data, and does schema integration, it gets better and better at
learning to ingest and map sources to the global schema.

In a case where you are ingesting your 21st source and it does not
integrate well with the global schema, then you can "crowd-source" the
problem and to get the opinion of experts. There is a hierarchy of
experts with specialization built in, and at least 2 for each issue, a
junior and a senior. When the junior and senior get the same answer,
then the level of expertise of the junior is raised. You can also set
thresholds about how many of these issues are handled automatically and
how many are sent to the crowd, which can help you manage the time of
your most precious resources (experts).

If you are having trouble imagining a setting where this could be
useful, consider a mission critical cyber operations center with data
sources from different organizations coming in and needing to be
processed rapidly and integrated into the global schema. Any new data
fields could quickly be reviewed to determine if the new field should
truly be integrated or if the global schema needs to be updated. In the
case where this field's value identifies a threat, it might also present
an opportunity to assess the potential that such a value represents in
terms of its threat, and then set a kind of alert so that it is
immediately flagged when detected or suggests a set of routines that
search for anomalies which are dangerous or at least need to be
reviewed.

So, let's conclude where we started off - with the 80% problem. In the
land of big data transformations, 80% of data scientists' time is spent
ingesting, collecting, extracting and cleaning data, while only 20% is
spent on creating analytics. There is a lot of promise with products,
such as Tamr, that can make ingestion of diverse sources easier and
faster, including more efficient as the software improves over time. The
additional process that allows experts to weigh in on the fields they
review in a way that trains the tool to become smarter at ingesting
data, not only makes your curation more accurate and automatic, but
helps manage the time of the valuable experts so that only the most
esoteric data are brought to the expert's attention. Not only does this
eat away at the 80/20 problem, but it allows data scientists to spend
more time on the analytics. 

Next week, we will consider the "Clouds of Data" that enable such
expansive data sets and some of the considerations of these
architectures, in terms of elasticity, system lock-in, and privacy and
security.