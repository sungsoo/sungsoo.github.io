---
layout: post
title: Stream Data Processing for Performance Evaluation of the Equipment in an Offshore Plant
date: 2014-03-13 
categories: [computer science]
tags: [publications]

---

#### Key Words
*stream computing, complex event processing, stream data processing*


# Abstract

In recent years, big data is great interest to production an operation work in the offshore plants as well as enterprise resource planning. Being able to predict future equipment performance based on historical results, or to identify sub-par production zones, can be used to shift assets to more productive areas. Equipment maintenance is one of the important applications for production efficiency of an offshore plant.
 
In this paper, we present the stream data processing architecture for computing the performance of the centrifugal compressor. Our system consists of two major components; *virtual tag stream generator* (VTSG) and *real-time data stream manager* (RTDSM). Virtual tag stream generator creates virtual raw sensor data of the compressor, such as, temperature, pressure, flow rate, and sends to real-time data stream manager. Real-time data stream manager, which is based on the Esper for java as a complex event processing engine, handles stream sources such as tag streams in the compressor. In order to provide the scalability of our system, we exploit parallel programming approach to process massive amount of stream data using multi-core CPUs. In addition, we provide experimental evidence demonstrating the improvements of stream data processing for centrifugal compressor.

        

References
---
[1] RecipCOM, Expertise, *reciprocating compressor monitoring and protection tailored to your needs*, HOERBIGER, 2011.  
[2] Expertise Beyond Controls, *Compressor Performance Advisor Software*, 2012.  
[3] Lauren Neal, *Performance Monitoring of an Offshore Gas Compressor*, Matrikon, Nov. 2006.  
[4] M.S. Akhtar, *Performance Monitoring of High Pressure Centrifugal Compressors for Enhanced Gas Production*, Gas Processors Association European Chapter Conference, Sep. 1996.  
[5] Gas Machinery Research Council, *Guideline for Field Testing of Gas Turbine and Centrifugal Compressor Performance*, August 2006.  
[6] A. Sumilammi, J. Leppakoski, *Gas Compressor Unit Performance Monitoring using Fuzzy Clustering*, 23rd World Gas Conference, Amsterdam 2006.  
[7] OSIsoft, *ProcessPlugins Condition Monitor of Gas Turbine driven Process Gas Compressors*, 2010.  
[8] Haridoss Padmanabhan, *Condition Based Maintenance of Rotating Equipments on OSI PI Platform – Refineries/Petrochem Plants*, 2010.  
[9] Bently Performance SE, *Helping protect and manage all machinery*, fact sheet, 2013.  
[10] *Offshore Platforms & FPSOs – Bently Nevada Asset Condition Monitoring*, GE Energy, 2012.  
[11] *Offshore Oil and Gas Production Systems*, Presentation Material.