---
layout: post
title: Big Data Architecture
date: 2014-06-18
categories: [computer science]
tags: [big data]

---



[![](http://sungsoo.github.com/images/data.png)](http://sungsoo.github.com/images/data.png)

---

# Big Data Architecture
In this post, we will take a closer look at the overall architecture for big data.

## Traditional Information Architecture Capabilities
To understand the high-level architecture aspects of Big Data, let’s first review a well formed logical information architecture for structured data. In the illustration, you see two data sources that use integration (ELT/ETL/Change Data Capture) techniques to transfer data into a DBMS data warehouse or operational data store, and then offer a wide variety of analytical capabilities to reveal the data. Some of these analytic capabilities include: dashboards, reporting, EPM/BI applications, summary and statistical query, semantic interpretations for textual data, and visualization tools for high-density data. In addition, some organizations have applied oversight and standardization across projects, and perhaps have matured the information architecture capability through managing it at the enterprise level.

[![](http://sungsoo.github.com/images/structured.png)](http://sungsoo.github.com/images/structured.png)

The key information architecture principles include treating data as an asset through a value, cost, and risk lens, and ensuring timeliness, quality, and accuracy of data. And, the EA oversight responsibility is to establish and maintain a balanced governance approach including using center of excellence for standards management and training.


## Adding Big Data Capabilities
The defining processing capabilities for big data architecture are to meet the volume, velocity, variety, and value requirements. Unique distributed (multi-node) parallel processing architectures have been created to parse these large data sets. There are differing technology strategies for real-time and batch processing requirements. For real-time, key-value data stores, such as NoSQL, allow for high performance, index-based retrieval. For batch processing, a technique known as “Map Reduce,” filters data according to a specific data discovery strategy. After the filtered data is discovered, it can be analyzed directly, loaded into other unstructured databases, sent to mobile devices, or merged into traditional data warehousing environment and correlated to structured data.

[![](http://sungsoo.github.com/images/unstructured.png)](http://sungsoo.github.com/images/unstructured.png)
￼￼
￼In addition to new unstructured data realms, there are two key differences for big data. First, due to the size of the data sets, we don’t move the raw data directly to a data warehouse. However, after MapReduce processing we may integrate the “reduction result” into the data warehouse environment so that we can leverage conventional BI reporting, statistical, semantic, and correlation capabilities. It is ideal to have analytic capabilities that combine a conventional BI platform along with big data visualization and query capabilities. And second, to facilitate analysis in the Hadoop environment, sandbox environments can be created.


For many use cases, big data needs to capture data that is continuously changing and unpredictable. And to analyze that data, a new architecture is needed. In retail, a good example is capturing real time foot traffic with the intent of delivering in-store promotion. To track the effectiveness of floor displays and promotions, customer movement and behavior must be interactively explored with visualization or query tools.


In other use cases, the analysis cannot be complete until you correlate it with other enterprise data - structured data. In the example of consumer sentiment analysis, capturing a positive or negative social media comment has some value, but associating it with your most or least profitable customer makes it far more valuable. So, the needed capability with Big Data BI is context and understanding. Using powerful statistical and semantic tools allow you to find the needle in the haystack, and will help you predict the future.


In summary, the Big Data architecture challenge is to meet the rapid use and rapid data interpretation requirements while at the same time correlating it with other data.


What’s important is that the key information architecture principles are the same, but the tactics of applying these principles differ. For example, how do we look at big data as an asset. We all agree there’s value hiding within the massive high-density data set. But how do we evaluate one set of big data against the other? How do we prioritize? The key is to think in terms of the end goal. Focus on the business values and understand how critical they are in support of the business decisions, as well as the potential risks of not knowing the hidden patterns.


Another example of applying architecture principles differently is data governance. The quality and accuracy requirements of big data can vary tremendously. Using strict data precision rules on user sentiment data might filter out too much useful information, whereas data standards and common definitions are still going to be critical for fraud detections scenarios.
To reiterate, it is important to leverage your core information architecture principles and practices, but apply them in a way that’s relevant to big data. In addition, the EA responsibility remains the same for big data. It is to optimize success, centralize training, and establish standards.


## An Integrated Information Architecture
One of the obstacles observed in Hadoop adoption in enterprise is the lack of integration with existing BI eco-system. At present, the traditional BI and big data ecosystems are separate causing integrated data analysis headaches. As a result, they are not ready for use by the typical business user or executive.

￼Earlier adopters of big data have often times written custom code to move the processed results of big data back into database or developed custom solutions to report and analyze on them. These options might not be feasible and economical for enterprise IT. First of all, it creates proliferations of one-off code and different standards. Architecture impacts IT economics. Big Data done independently runs the risk of redundant investments. In addition, most businesses simply do not have the staff and skill level for such custom development work.


A better option is to incorporate the Big Data results into the existing Data Warehousing platform. The power of information lies in our ability to make associations and correlation. What we need is the ability to bring different data sources, processing requirements together for timely and valuable analysis.


Here is Oracle’s holistic capability map that bridges traditional information architecture and big data architecture:


[![](http://sungsoo.github.com/images/oracle.png)](http://sungsoo.github.com/images/oracle.png)
￼
As various data are captured, they can be stored and processed in traditional DBMS, simple files, or distributed-clustered systems such as NoSQL and Hadoop Distributed File System (HDFS).


Architecturally, the critical component that breaks the divide is the integration layer in the middle. This integration layer needs to extend across all of the data types and domains, and bridge the gap between the traditional and new data acquisition and processing framework. The data integration capability needs to cover the entire spectrum of velocity and frequency. It needs to handle extreme and ever-growing volume requirements. And it needs to bridge the variety of data structures. You need to look for technologies that allow you to integrate Hadoop / MapReduce with your data warehouse and transactional data stores in a bi-directional manner.


The next layer is where you load the “reduction-results” from Big Data processing output into your data warehouse for further analysis. You also need the ability to access your structured data
￼such as customer profile information while you process through your big data to look for patterns such as detecting fraudulent activities.


The Big Data processing output will be loaded into the traditional ODS, data warehouse, and data marts, for further analysis, just as the transaction data. The additional component in this layer is the Complex Event Processing engine to analyze stream data in real time.
The Business Intelligence layer will be equipped with advanced analytics, in-database statistical analysis, and advanced visualization, on top of the traditional components such as reports, dashboards, and queries.


Governance, security, and operational management also cover the entire spectrum of data and information landscape at the enterprise level.


With this architecture, the business users do not see a divide. They don’t even need to be made aware that there is a difference between traditional transaction data and Big Data. The data and analysis flow would be seamless as they navigate through various data and information sets, test hypothesis, analyze patterns, and make informed decisions.


# Making Big Data Architecture Decisions
Information Architecture is perhaps the most complex area of IT. It is the ultimate investment payoff. Today’s economic environment demands that business be driven by useful, accurate, and timely information. And, the world of Big Data adds another dimension to the problem. However, there are always business and IT tradeoffs to get to data and information in a most cost-effective way.


## Key Drivers to Consider
Here is a summary of various business and IT drivers you need to consider when making these architecture choices.
￼￼￼
[![](http://sungsoo.github.com/images/drivers.png)](http://sungsoo.github.com/images/drivers.png)


# References
[1] *Oracle Information Architecture: An Architect’s Guide to Big Data*, An Oracle White Paper in Enterprise Architecture, August 2012.