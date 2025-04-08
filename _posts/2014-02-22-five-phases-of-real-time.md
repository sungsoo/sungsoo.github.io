---
layout: post
title: The Five Phases of Real Time
date: 2014-02-22
categories: [computer science]
tags: [stream computing, analytics, big data]

---

Introduction
---
*Real-time big data analytics* is an iterative process involving multiple tools and systems. [Smith says](http://www.slideshare.net/RevolutionAnalytics/realtime-big-data-analytics-from-deployment-to-production?ref=http://www.revolutionanalytics.com/news-events/free-webinars/2012/real-time-big-data-analytics/) that 

> It’s helpful to divide the process into five phases: data distillation, model development, validation and deployment, real-time scoring, and model refresh. 

At each phase, the terms “*real time*” and “*big data*” are fluid in meaning. The definitions at each phase of the process are not carved into stone. Indeed, they are *context dependent*. Like the technology stack discussed earlier, Smith’s [**five-phase process model**](http://www.slideshare.net/RevolutionAnalytics/realtime-big-data-analytics-from-deployment-to-production?ref=http://www.revolutionanalytics.com/news-events/free-webinars/2012/real-time-big-data-analytics/) is devised as a framework for predictive analytics. But it also works as a general framework for real-time big data analytics.


Five Phases of Real Time
---

1. **Data distillation** — Like unrefined oil, data in the *data layer* is crude and messy. It lacks the structure required for building models or performing analysis. The data distillation phase includes extracting features for unstructured text, combining disparate data sources, filtering for populations of interest, selecting relevant features and outcomes for modeling, and exporting sets of distilled data to a local data mart.


2. **Model development** — Processes in this phase include *feature selection*, *sampling* and *aggregation*; *variable transformation*; *model estimation*; *model refinement*; and *model benchmarking*. The goal at this phase is creating a predictive model that is powerful, robust, comprehensible and implementable. The key re‐ quirements for data scientists at this phase are speed, flexibility, productivity, and reproducibility. These requirements are critical in the context of big data: a data scientist will typically construct, refine and compare dozens of models in the search for a powerful and robust real-time algorithm.

3. **Validation and deployment** — The goal at this phase is testing the model to make sure that it works in the real world. The validation process involves re-extracting fresh data, running it against the model, and comparing results with outcomes run on data that’s been withheld as a validation set. If the model works, it can be deployed into a production environment.

4. **Real-time scoring** — In real-time systems, scoring is triggered by actions at the *decision layer* (by consumers at a website or by an operational system through an API), and the actual communications are brokered by the *integration layer*. In the scoring phase, some real-time systems will use the same hardware that’s used in the data layer, but they will not use the same data. At this phase of the process, the deployed scoring rules are “divorced” from the data in the data layer or data mart. Note also that at this phase, the limitations of Hadoop become apparent. Hadoop today is not particularly well-suited for real-time scoring, although it can be used for “near real-time” applications such as populating large tables or pre-computing scores. Newer technologies such as **Cloudera’s Impala** are designed to improve Hadoop’s real-time capabilities.

5. **Model refresh** — Data is always changing, so there needs to be a way to refresh the data and refresh the model built on the original data. The existing scripts or programs used to run the data and build the models can be re-used to refresh the models. Simple exploratory data analysis is also recommended, along with periodic (weekly, daily, or hourly) model refreshes. The refresh process, as well as validation and deployment, can be automated using web-based services such as [RevoDeployR](http://www.revolutionanalytics.com/enterprise-deployment), a part of the Revolution R Enterprise solution.

![](http://sungsoo.github.com/images/data-distillation.png)

A caveat on the refresh phase: Refreshing the model based on re-ingesting the data and re-running the scripts will only work for a limited time, since the underlying data — and even the underlying structure of the data — will eventually change so much that the model will no longer be valid. Important variables can become non-significant, non-significant variables can become important, and new data sources are continuously emerging. If the model accuracy measure begins drifting, go back to phase 2 and re-examine the data. If necessary, go back to phase 1 and rebuild the model from scratch.

References
---
[1] Mike Barlow, *Real-Time Big Data Analytics, Emerging Architecture*, pp. 17-19, O’Reilly Media, 2013.