---
layout: post
title: Ensuring the Validity, Veracity, and Volatility of Big Data
date: 2014-03-24
categories: [computer science]
tags: [big data]

---

## Summary

* Article Source: Big Data for Dummies, Chapter 17  
* Authors: Judith Hurwitz, et. al

High *volume*, high *variety*, and high *velocity* are the essential characteristics of big data. These characteristics are covered in detail in Chapter 1 [1]. But other characteristics of big data are equally important, especially when you apply big data to operational processes. This **second set of “V” characteristics** that are key to operationalizing big data includes

* **Validity**: Is the data *correct* and *accurate* for the intended usage?  
* **Veracity**: Are the results *meaningful* for the given problem space?  
* **Volatility**: How *long* do you need to *store* this data?


# Data validity

It stands to reason that you want accurate results. But in the initial stages of *analyzing petabytes of data*, it is likely that you won’t be worrying about how valid each data element is. That initial stream of big data might actually be quite dirty. In the initial stages, it is more important to see whether any relationships exist between elements within this massive data source than to ensure that all elements are valid.

However, after an organization determines that parts of that *initial data analysis are important*, this subset of big data needs to be validated because it will now be applied to an operational condition. When the data moves from *exploratory* to *actionable*, data must be *validated*. The validity of big data sources and subsequent analysis must be *accurate* if you are to use the results for decision making or any other reasonable purpose. Valid input data followed by correct processing of the data should yield accurate results. With big data, you must be extra vigilant with regard to validity. For example, in healthcare, you may have data from a clinical trial that could be related to a patient’s disease symptoms. But a physician treating that person cannot simply take the clinical trial results as though they were directly related to the patient’s condition without validating them.

# Data Veracity

A considerable difference exists between a Twitter data stream and telemetry data coming from a weather satellite. Why would you want to integrate two seemingly disconnected data sources? Imagine that the weather satellite indicates that a storm is beginning in one part of the world. How is that storm impacting individuals who live in the path of that storm? With about half a billion users, it is possible to *analyze Twitter streams* to determine the impact of a storm on local populations. Therefore, using Twitter in combination with data from a weather satellite could help researchers understand the *veracity* of a weather prediction.


Just because you have data from a weather satellite, that doesn’t mean the data is a truthful representation of the weather on the ground in a specific geography. If you want to get a truthful representation of the weather, you might *correlate* a social media stream (like Twitter) with the satellite data for a specific area. If people within the area publish observations about the weather and they align with the data from the satellite, you have established the veracity of the current weather. While *veracity* and *validity* are related, they are independent indicators of the *efficacy* of data and process.


# Data volatility


If you have valid data and can prove the veracity of the results, *how long does the data need to “live” to satisfy your needs?* In a standard data setting, you can keep data for decades because you have, over time, built an understanding of what data is important for what you do with it. You have established rules for data currency and availability that map to your work processes. For example, some organizations might only keep the most recent year of their customer data and transactions in their business systems. This will ensure rapid retrieval of this information when required. If they need to look at a prior year, the IT team may need to restore data from offline storage to honor the request. With big data, this problem is magnified.


If storage is limited, you must look at the big data sources to determine what you need to gather and how long you need to keep it. With some big data sources, you might just need to gather data for a quick analysis. For example, if you are interested in the experiences of hybrid car owners, you might want to tap into Facebook and Twitter feeds to collect all the posts/tweets about hybrid cars. You could then store the information locally for further processing. If you do not have enough storage for all this data, you could process the data “on the fly” (as you are gathering it) and only keep relevant pieces of information locally. How long you keep big data available depends on a few factors:


* How much data is kept at the source?  
* Do you need to process the data repeatedly?
* Do you need to process the data, gather additional data, and do more processing?
* Do you have rules or regulations requiring data storage?
* Do your customers depend on your data for their work?
* Does the data still have value or is it no longer relevant?


Due to the *volume*, *variety*, and *velocity* of big data, you need to understand *volatility*. For some sources, the data will always be there; for others, this is not the case. Understanding what data is out there and for how long can help you to define retention requirements and policies for big data.

Big data and analytics can open the door to all kinds of new information about the things that are most interesting in your day-to-day life. As a consumer, big data will help to define a better profile for how and when you purchase goods and services. As a patient, big data will help to define a *more customized approach* to treatments and health maintenance. As a professional, big data will help you to identify better ways to design and deliver your products and services. This will only happen when big data is integrated into the operating processes of companies and organizations.

# References
[1] Judith Hurwitz, et. al, *Big Data for Dummies*, John Wiley & Sons, Inc, 2013.
