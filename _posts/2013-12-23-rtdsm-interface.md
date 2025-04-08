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

The Network represents the internal behavior of the model or a unit in another network and is a collection of connected units. A Unit is essentially a black box that can represent anything (big or small). Ports allow flow in or out of a Unit. Nodes are used to connect ports.

#### Various network models

A variety of models may be created and utilized for different systems. For instance, a production accounting system will have a different model than a production operations dashboard that is used to monitor real-time data from a facility. However, by using PRODML, these various models may be exchanged used a the same standard format.

![image](http://sungsoo.github.com/images/02-prodml-network-model.png)

### Time Series Data-Object
The Time Series data-object describes a context free, time based series of measurement data for the purpose of targeted exchanges between consumers and providers of data services. This is intended for use in support of smart fields or high-frequency historian type interactions, not reporting. It provides a “flat” view of the data and utilizes a set of keyword-value pairs to define the business identity of the series, as described in the following generalized hierarchy.

The keyword value pairs are used to characterize the underlying nature of the values. The key value may provide part of the unique identity of an instance of a concept or it may characterize the underlying concept. For example, the following keyword value pairs are used to indicate the measured production flow of oil.

```
	<key keyword="flow">production</key> 
	<key keyword="product">oil</key>
	<key keyword="qualifier">measured</key>
```

The available keyword values are given by the *TimeSeriesKeyword* enumeration values from the *enumValuesProdml.xml* file as well as the following table.

![image](http://sungsoo.github.com/images/10-timeseries-keyword.png)

### Time Series Guidance
The PRODML Time Series data-object is intended for use in support of smart fields or high-frequency historian type interactions, not reporting.

#### Asset Identifier
In a Time Series Data-Object, the key element with the keyword of asset identifier element refers back to the Product Flow Model. The asset identifier key is a PRODML formatted URI identifier of the asset (facility) related to the value. The identifier may define a hierarchy of assets. Refer to the PRODML Identifier Specification for more information on PRODML identifiers.

The example in Figure 23 shows an asset identifier for the manifold facility (yellow highlight) assigned the unique identifier of HDR01 (blue highlight) in the naming system aramco.com (green highlight).

![image](http://sungsoo.github.com/images/03-timeseries-data.png)

#### Value Status Attribute
In a Time Series Data-Object, the value status attribute is used as an indicator of the quality of the value.

The example in Figure 24 shows several readings with an status of frozen, which indicates the sensor has been reading the same value for a specific period of time.

![image](http://sungsoo.github.com/images/04-timeseries-attribute.png)

#### Tag alias in flow model
Each measurement property in the flow model contains a tagAlias element which is used to retrieve a timeSeriesData data-object. Refer to the PRODML Identifier Specification for more information on PRODML identifiers.

![image](http://sungsoo.github.com/images/06-asset-alias.png)

#### Historian time series example XML

![image](http://sungsoo.github.com/images/05-inletpressure.png)

#### Retrieving Daily and Monthly Product Volume Reports
The PRODML productVolume data-object is a best fit for retrieving historical production data from the summaries database.

![image](http://sungsoo.github.com/images/07-timeseries-flow.png)

### Production unit measurement points
Figure 28 shows the high-level model of a production unit model of the well facility that is used throughout this example. This unit has three gas wells connected to a multi-phase flow meter via a production header. The product flows are then connected to a separator, which separates the mixed products into oil, gas, and water flows.

![image](http://sungsoo.github.com/images/08-production-unit.png)

The first step is to draw the real world diagram indicating measurement points.

![image](http://sungsoo.github.com/images/09-measurement-points.png)


### References

[1] Energistics and the PRODML SIG, Business Overview of PRODML, 30 March 2012.

[2] Energistics and the PRODML SIG, PRODML Data Schema Guide, 30 March 2012

[3] Energistics and the PRODML SIG, PRODML Identifier Specification, 30 March 2012.

[4] Energistics and the PRODML SIG, PRODML Generic Data Access (GDA) Web Service Specification, 30 March 2012.