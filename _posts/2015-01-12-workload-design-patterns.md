---
layout: post
title: 11 Core Big Data Workload Design Patterns
date: 2015-01-12
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [11 Core Big Data Workload Design Patterns](http://www.datasciencecentral.com/profiles/blogs/11-core-big-data-workload-design-patterns)
* Authors: [Derick Jose](http://www.datasciencecentral.com/profile/derickjose)


As big data use cases proliferate in telecom, health care, government, Web 2.0, retail etc there is a need to create a library of big data workload patterns.  
We have created a big data workload design pattern to help map out common solution constructs. There are 11 distinct workloads showcased which have common patterns across many business use cases.

1. Synchronous streaming real time event sense and respond workload
2. Ingestion of High velocity events - insert only (no update) workload
3. High node Social graph traversing
4. ‘Needle in a haystack’ workloads
5. Multiple event stream mash up & cross referencing events across both streams
6. Text indexing workload on large volume semi structured data
7. Looking for absence of events in event streams in a moving time window
8. High velocity, concurrent inserts and updates workload
9. Semi & Unstructured data ingestion
10. Sequence analysis workloads
11. Chain of thought  workloads for data forensic work
 
## Data Workload-1:  Synchronous streaming real time event sense and respond workload
It essentially consists of matching incoming event streams with predefined behavioural patterns & after observing signatures unfold in real time, respond to those patterns instantly.
Let’s take an example:  In  registered user digital analytics  scenario one specifically examines the last 10 searches done by registered digital consumer, so  as to serve a customized and highly personalized page  consisting of categories he/she has been digitally engaged. Also depending on whether the customer has done price sensitive search or value conscious search (which can be inferred by examining the search order parameter in the click stream) one can render budget items first or luxury items first
Similarly let’s take another example of real time response to events in  a health care situation.  In hospitals patients are tracked across three event streams – respiration, heart rate and blood pressure in real time. (ECG is supposed to record about 1000 observations per second). These event streams can be matched for patterns which indicate the beginnings of fatal infections and medical intervention put in place
 
10 more  additional patterns are showcased at
 [http://blog.fluturasolutions.com/2012/08/11-core-big-data-workload-...](http://blog.fluturasolutions.com/2012/08/11-core-big-data-workload-design.html)

## Data Workload-2:  Ingestion of High velocity events - insert only (no update) workload
This is a unique workload widely experienced while ingesting terabytes of sensor and machine generated data. These are insert only workloads with no updates or lookup workloads
Example: Ingesting millions of micro events streaming from log files , Firewall alarms, sensor data, and the click stream data torrent. It is estimated that a Boeing flight has the potential to generate 200 terabytes of data on a single flight. Data from vibration sensors, temperature sensors, strain gauges, position data, speed etc … Imagine ingesting all this data for all the flights !

## Workload-3: High node Social graph traversing
This is a unique workload where finding interrelationship around nodes in a network is vital. This workload is computation and read intensive as node statistics need to be computed and children of a node need to be read dynamically.
Example: In the telecom industry where there are millions of pre paid and post paid subscribers, the CDR (Call Detail Record ) consists of terabytes of switch logs which contain important patterns regarding inter-relationships between subscribers. This can be mined using graph databases to understand if certain new gaming applications or apps which are downloaded are getting viral with friends and family circles by traversing computation intensive graph traversals
Similarly in social websites, millions of interrelationship are stored as a graph and  one needs to traverse large complex graphs and  map key influencers who are capable of influencing a marketing outcome or to recommend a friend to expand the social network to its edges

## Workload-4 : ‘Needle in a haystack’ workloads
Looking for a small string or attribute value from the terabytes of data across multiple attributes is a very common read workload specifically in machine data use cases
Example :  While processing terabytes of  sensor data from engines one may look for specific temperature and Rpm conditions behind an automobile breakdown. Similiarly security specialists investigating a network breach incident may wade thru steams of granular log data from multiple devices before homing in on crucial events vital to giving clues about the cause of an attack

## Workload-5 :  Multiple event stream mash up & cross referencing events across both streams
Usually events in isolation may not have significance but taken together as a string of events occurring in a timeline there importance amplifies especially across multiple event streams
 Example : In telecom there is a need to mash up firewall events on a timeline along with router events to detect patterns in a distributed denial of services ( DDOS) attack

## Workload-6 : Text indexing workload on large volume semi structured data
While processing semi structured data tools like Lucene needs to index the strings
Example : In medical scenarios, one need to identify all encounters of a patient with the doctor which has specific disease keywords and then analyze the health outcome of the patient

## Workload-7 : Looking for absence of events in event streams in a moving time window
While most pattern detection consists of behaviour/patterns exhibited, it also makes sense to look out for ABSENCE of specific events across moving time windows as they may alert to a risk or a revenue potential
Example: In an online travel website, its important to sort thru the avalanche of log file data flowing in and isolate search instances which did NOT result in a booking event. So we are traversing a moving time window where there is a sequence of search events which do not have a book event.

## Workload-8: High velocity, concurrent inserts and updates workload
Its very common to have thousands of users across the world update or insert based on booking or gaming applications
Example: Thousands of flight orders bookings, payment transactions online

## Workload-9 : Semi & Unstructured data ingestion
 It is said that 80 % of the worlds information is unstructured and bringing it into repositories to analyze them may yield previously untapped intelligence
Example: Medical records – xray, ecg results  need to be digitized ( unstructured )and doctors observations on the patient ( semi structured ) need to be recorded
  
  
## Workload-10 : Sequence analysis workloads
It is very common to chunk pieces of events together and examine if there are patterns which tell a story regarding the problem context
Example :  In genome and life sciences, DNA sequencing a crucial. Similarly in the telecom industry there are a lot of dropped calls from a switch which needs to be analyzed using sequence analysis processes to understand events leading to that outcome of interest.

## Workload-11 : Chain of thought ad hoc workload for data forensic work
This workload is primarily triggered by power users or analysts who are the ‘Data Marco Polos’ exploring  large oceans of data with questions previously not thought off. They cast a wide net and often come up with few patterns. But when they identify a pattern it has huge repercussions for the organisation
Example :  Pricing analysts want to investigate consumer behaviour before they price a service.  They may have a sequence of hypothesis to test in a certain sequence before arriving at the optimal price point. Similiarly Infrastructure specialists want to confirm or reject hypothesis regarding effect of newly launched apps on digital traffic by sequencing a specific set of hypothesis regarding app engagement and its effect on network infrastructure load
 
These Big data design patterns are template for identifying and solving commonly occurring big data workloads. The big data workloads stretching today’s storage and computing architecture could be human generated or machine generated. The big data design pattern may manifest itself in many domains like telecom, health care that can be used in many different situations. But irrespective of the domain they manifest in the solution construct can be used. Big data patterns also help prevent architectural drift. Once the set of big data workloads associated with a business use case is identified it is easy to map the right architectural constructs required to service the workload - columnar, Hadoop, name value, graph databases, complex event processing (CEP) and machine learning processes

10 more additional patterns are showcased at
 [http://blog.fluturasolutions.com/2012/08/11-core-big-data-workload-...](http://blog.fluturasolutions.com/2012/08/11-core-big-data-workload-design.html)
 
It is our endeavour to make it collectively exhaustive and mutually exclusive with subsequent iteration.

As Leonardo Vinci said “Simplicity is the ultimate sophistication”. 
Big data workload design patterns help simplify the decomposition of the business use cases into workloads. The workloads can then be mapped methodically to various building blocks of Big data solution architecture. Yes there is a method to the madness J