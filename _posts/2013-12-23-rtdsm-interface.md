---
layout: post
title: Real-Time Data Stream Manager (RTDSM) Interface Specification
date: 2013-12-24
categories: [computer science]
tags: [software engineering, data management]

---

### Overview
**PRODML (Production Markup Language)** is an industry initiative to provide open, non-proprietary, standard interfaces between software tools used to monitor, manage and optimize hydrocarbon production.

This article focuses on three PRODML data-objects:
* **Product Flow Model** – static model of flow connections used to create facility models.
* **Product Volume Report** – for reporting production flows (e.g. oil, gas, water, etc.) or other parameters (e.g. valve status, reciprocating speed, etc.).
* **Time Series**– for exchanging simple time based series of measurement data.

#### Product Flow Model, Product Volume Report, and Time Series
![image](http://sungsoo.github.com/images/01-prodml-overview.png)

### Product Flow Model Data-Object
The Product Flow Model data-object can be used to define a directed graph of flow connections. The basic building block is a Unit which can be used to define the flow behavior of any facility (where the term facility represents any use of equipment to perform a function) such as a separator, a wellhead, a valve, a flow line. It utilizes a general hierarchy of:

The Network represents the internal behavior of the model or a unit in another network and is a collection of connected units. A Unit is essentially a black box that can represent anything (big or small). Ports allow flow in or out of a Unit. Nodes are used to connect ports.#### Various network models
A variety of models may be created and utilized for different systems. For instance, a production accounting system will have a different model than a production operations dashboard that is used to monitor real-time data from a facility. However, by using PRODML, these various models may be exchanged used a the same standard format.

![image](http://sungsoo.github.com/images/02-prodml-network-model.png)

### Time Series Data-ObjectThe Time Series data-object describes a context free, time based series of measurement data for the purpose of targeted exchanges between consumers and providers of data services. This is intended for use in support of smart fields or high-frequency historian type interactions, not reporting. It provides a “flat” view of the data and utilizes a set of keyword-value pairs to define the business identity of the series, as described in the following generalized hierarchy.

![image](http://sungsoo.github.com/images/10-timeseries-keyword.png)

![image](http://sungsoo.github.com/images/03-timeseries-data.png)

![image](http://sungsoo.github.com/images/04-timeseries-attribute.png)

![image](http://sungsoo.github.com/images/05-inletpressure.png)

![image](http://sungsoo.github.com/images/06-asset-alias.png)

![image](http://sungsoo.github.com/images/07-timeseries-flow.png)

![image](http://sungsoo.github.com/images/08-production-unit.png)

![image](http://sungsoo.github.com/images/09-measurement-points.png)


### References

[1] Energistics and the PRODML SIG, Business Overview of PRODML, 30 March 2012.

[2] Energistics and the PRODML SIG, PRODML Data Schema Guide, 30 March 2012

[3] Energistics and the PRODML SIG, PRODML Identifier Specification, 30 March 2012.

[4] Energistics and the PRODML SIG, PRODML Generic Data Access (GDA) Web Service Specification, 30 March 2012.