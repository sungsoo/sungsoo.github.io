---
layout: post
title: Introduction to Data Warehousing
date: 2014-05-15
categories: [computer science]
tags: [data management]

---

## Article Source
* Title: *Database Systems, A Practical Approach to Design, Implementation, and Management*, Fourth Edition, Addition-Wesley, 2012.
* Authors: Thomas M. Connoly, Carolyn E. BEGG

[![](http://sungsoo.github.com/images/data-warehousing.png)](http://sungsoo.github.com/images/data-warehousing.png)

# Introduction to Data Warehousing
We discuss the origin and evolution of the concept of *data warehousing*. We then discuss the main benefits associated with data warehousing. We next identify the main characteristics of data warehousing systems in comparison with **Online Transaction Processing (OLTP)** systems. We conclude this section by examining the problems of developing and managing a data warehouse.


## The Evolution of Data Warehousing
Since the 1970s, organizations have mostly focused their investment in new computer systems that automate business processes. In this way, organizations gained competitive advantage through systems that offered more efficient and cost-effective services to the customer. Throughout this period, organizations accumulated growing amounts of data stored in their *operational databases*. However, in recent times, where such systems are commonplace, organizations are focusing on ways to use *operational data* to support *decision-making*, as a means of regaining competitive advantage.

Operational systems were never designed to support such business activities and so using these systems for decision-making may never be an easy solution. The legacy is that a typical organization may have numerous operational systems with overlapping and sometimes contradictory definitions, such as data types. The challenge for an organization is to turn its archives of data into a source of knowledge, so that a single *integrated*/*consolidated* view of the organization’s data is presented to the user. The concept of a data warehouse was deemed the solution to meet the requirements of a system capable of supporting decision-making, receiving data from multiple operational data sources.


## Data Warehousing Concepts
The original concept of a data warehouse was devised by IBM as the ‘*information ware- house*’ and presented as a solution for accessing data held in *non-relational systems*. The information warehouse was proposed to allow organizations to use their data archives to help them gain a business advantage. However, due to the sheer complexity and perform- ance problems associated with the implementation of such solutions, the early attempts at creating an information warehouse were mostly rejected. Since then, the concept of data warehousing has been raised several times but it is only in recent years that the potential of data warehousing is now seen as a valuable and viable solution. The latest and most successful advocate for data warehousing is Bill Inmon, who has earned the title of ‘father of data warehousing’ due to his active promotion of the concept.

### Data warehousing 

> A subject-oriented, integrated, time-variant, and non-volatile collection of data in support of management’s decision-making process.


In this definition by Inmon (1993), the data is:


* *Subject-oriented* as the warehouse is organized around the major subjects of the enter- prise (such as customers, products, and sales) rather than the major application areas (such as customer invoicing, stock control, and product sales). This is reflected in the need to store decision-support data rather than application-oriented data.

* *Integrated* because of the coming together of source data from different enterprise-wide applications systems. The source data is often inconsistent using, for example, different formats. The integrated data source must be made consistent to present a unified view of the data to the users.

* *Time-variant* because data in the warehouse is only accurate and valid at some point in time or over some time interval. The time-variance of the data warehouse is also shown in the extended time that the data is held, the implicit or explicit association of time with all data, and the fact that the data represents a series of snapshots.

* *Non-volatile* as the data is not updated in real time but is refreshed from operational systems on a regular basis. New data is always added as a supplement to the database, rather than a replacement. The database continually absorbs this new data, incremen- tally integrating it with the previous data.

There are numerous definitions of data warehousing, with the earlier definitions focusing on the characteristics of the data held in the warehouse. Alternative definitions widen the scope of the definition of data warehousing to include the processing associated with accessing the data from the original sources to the delivery of the data to the decision- makers (Anahory and Murray, 1997).

Whatever the definition, the ultimate goal of data warehousing is to integrate enterprise- wide corporate data into a single repository from which users can easily run queries, pro- duce reports, and perform analysis. In summary, a data warehouse is data management and data analysis technology.


In recent years a new term associated with data warehousing has been used, namely ‘Data Webhouse’.


### Data Webhouse

> A distributed data warehouse that is implemented over the Web with no central data repository.


The Web is an immense source of behavioral data as individuals interact through their Web browsers with remote Web sites. The data generated by this behavior is called **clickstream**. Using a data warehouse on the Web to harness clickstream data has led to the development of Data Webhouses. Further discussions on the development of this new variation of data warehousing is out with the scope of this book, however the interested reader is referred to Kimball et al. (2000).


# Benefits of Data Warehousing
The successful implementation of a data warehouse can bring major benefits to an organization including:


* *Potential high returns on investment* An organization must commit a huge amount of resources to ensure the successful implementation of a data warehouse and the cost can vary enormously from £50,000 to over £10 million due to the variety of technical solutions available. However, a study by the International Data Corporation (IDC) in 1996 reported that average three-year returns on investment (ROI) in data warehousing reached 401%, with over 90% of the companies surveyed achieving over 40% ROI, half the companies achieving over 160% ROI, and a quarter with more than 600% ROI (IDC, 1996).

* *Competitive advantage* The huge returns on investment for those companies that have successfully implemented a data warehouse is evidence of the enormous competitive advantage that accompanies this technology. The competitive advantage is gained by allowing decision-makers access to data that can reveal previously unavailable, unknown, and untapped information on, for example, customers, trends, and demands.

* *Increased productivity of corporate decision-makers* Data warehousing improves the productivity of corporate decision-makers by creating an integrated database of consistent, subject-oriented, historical data. It integrates data from multiple incom- patible systems into a form that provides one consistent view of the organization. By transforming data into meaningful information, a data warehouse allows corporate decision-makers to perform more substantive, accurate, and consistent analysis.
