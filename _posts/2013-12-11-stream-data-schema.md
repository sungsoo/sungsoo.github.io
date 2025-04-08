---
layout: post
title: Stream Data Schema Design
date: 2013-12-11
categories: [computer science]
tags: [big data]

---
###Stream Data Schema for Real-time Data Stream Manager

###Streaming Information

   * **Type:** Environmental data: temperatures, pressures, salinity, acidity, fluid velocities etc,


   * **Nature:**
      * Relational Stream: yes
      * Text stream: no


   * **Origin:** Data is produced by sensors in oil wells and on oil and gas platforms equipments. Each oil platform has an average of 400,000.


   * **Frequency of update:**
      * from sub-second to minutes
      * In triples/minute: [10000-10] t/min
      
   * **Quality:** It varies, due to instrument/sensor issues


   * **Management /access**
      * Technology in use: Dedicated (relational and proprietary) stores
      * Problems: The ability of users to access data from different sources is limited by an insufficient description of the context
      * Means of improvement: Add context (metadata) to the data so it become meaningful and use reasoning techniques to process that metadata

###[optional] Static Information required to interpret the streaming information

   * **Type:** Topology of the sensor network, position of each sensor, the descriptions of the oil platform


   * **Origin:** Oil and gas production operations


   * **Dimension:**
      * 100s of MB as PostGIS dump
      * In triples: 10^8
      
   * **Quality:** Good


   * **Management /access**
      * Technology in use: RDBMS, proprietary technologies
      * Available Ontologies and Vocabularies: Reference Semantic Model (RSM), based on ISO 15926


### References
[1] W3C, Use cases - RDF Stream Processing Community Group, [link](http://www.w3.org/community/rsp/wiki/Use_cases)
