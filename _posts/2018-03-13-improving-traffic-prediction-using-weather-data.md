---
layout: post
title: Improving Traffic Prediction Using Weather Data
date: 2018-03-13
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Improving Traffic Prediction Using Weather Data - Ramya Raghavendra](https://www.youtube.com/watch?v=TmhiJiNmUYE)
* Speaker: Ramya Raghavendra

---

# Improving Traffic Prediction Using Weather Data

## Abstract

As common sense would suggest, weather has a definite impact on traffic. But how much? And under what circumstances? Can we improve *traffic* (*congestion*) *prediction* given weather data? *Predictive traffic* is envisioned to significantly impact how driver’s plan their day by alerting users before they travel, find the best times to travel, and over time, learn from new IoT data such as road conditions, incidents, etc. 

This talk will cover the *traffic prediction* work conducted jointly by IBM and the traffic data provider. As a part of this work, we conducted a case study over five large metropolitans in the US, **2.58 billion traffic records** and **262 million weather records**, to quantify the boost in accuracy of traffic prediction using weather data. We will provide an overview of our *lambda architecture* with Apache Spark being used to build *prediction models* with weather and traffic data, and Spark Streaming used to score the model and provide real-time traffic predictions. This talk will also cover a suite of extensions to Spark to analyze *geospatial* and *temporal patterns* in traffic and weather data, as well as the suite of machine learning algorithms that were used with Spark framework. Initial results of this work were presented at the National Association of Broadcasters meeting in Las Vegas in April 2017, and there is work to scale the system to provide predictions in over a 100 cities. Audience will learn about our experience scaling using Spark in offline and streaming mode, building statistical and deep-learning pipelines with Spark, and techniques to work with *geospatial* and *time-series* data.

<iframe width="600" height="400" src="https://www.youtube.com/embed/TmhiJiNmUYE" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
