---
layout: post
title: Tackling Data Curation
date: 2015-07-27
categories: [computer science]
tags: [big data]

---

# Tackling Data Curation

## What is data curation? And how is it different from data integration?

[*Data integration*](http://searchdatamanagement.techtarget.com/resources/Enterprise-data-integration-EDI-software) sometimes just refers to the act of putting two independently constructed schemas together without the thought that you have to clean dirty data, without the thought that you have to transform dirty data. Data curation is the end-to-end process of creating good data.

The other thing is that data curation inevitably requires *human interaction*, whereas people talk about data integration as an automated, hands-off process sometimes.

## Data integration has long been a CIO headache. What makes this so hard?

Say you're the human resources person in Paris, and I'm the human resources person in New York. My company buys your company, or we're two divisions of the same company. You have employees; I have employees. Your employees have salaries; my employees have salaries. But let's say you call it "salaries," while I call it "wages." So we have to normalize the attribute names. Your salaries are in euros -- after taxes -- with a lunch allowance, because that's how it is in France. My salaries are gross in U.S. dollars and do not include a lunch allowance. So there's a fairly elaborate transformation from one of our salaries to another or from both of our salary representations -- there's a cleaning problem, a [deduplication problem](http://searchdatabackup.techtarget.com/definition/source-deduplication), and all of this stuff is hard.

## How has [big data compounded the problem](http://searchcio.techtarget.com/news/2240039561/Big-Data-Probing-global-warming-with-object-database-engine)?

Stonebraker: If you go back 20 years to the mid-90s, enterprises universally put together customer facing data using ETL systems. This was led by the retail space, and it was wildly successful. But the systems were integrating fairly modest kinds of data and fairly modest data sources.

Around 2000, I got to visit Miller Beer [MillerCoors LLC] in Milwaukee, which had a traditional data warehouse composed of ETL-style sales data of beer -- by brand, by time period, by zip code [and] by distributor. It turned out to be a year where it was widely forecast El Nino was coming; this was in November. The weather guys are figuring out that El Nino screws up the U.S. weather during winter -- it's warmer than normal in New England and wetter than normal on the west coast.

So I asked the Miller Beer guys, 'Are beer sales correlated with temperature or precipitation, because there's this El Nino thing coming?' The business analysts all said, 'Gee, I really wish we could answer that question.' But, of course, weather data and temperature data were not in the data warehouse.

The *business intelligence* guys have an insatiable demand for more. I think the driving difficulty of data integration is this insatiable demand for more. And it's not without merit because the return on investment from [integrating more and more kinds of data](http://searchcio.techtarget.com/answer/When-does-more-data-trump-clean-data) is generally positive.

## You've stated the traditional tools and practices for data integration aren't really working. Why?

Stonebraker: Let's look at traditional ETL. The basic idea is somebody creates a global schema up front -- think of it as [master data management](http://searchdatamanagement.techtarget.com/definition/master-data-management). For every data source, you send a programmer out into the field to find the business owner; you have him interview the business owner, figure out what data looks like, what it is and how to extract it. He writes extract routines, he writes transformation and cleaning routines, and he then loads it into data warehouse.

There are two big problems with this approach. The first big problem is the global schema: If you have 10 data sources, you can create one up front. If you have 500 data sources, no one knows what the data schema looks like in advance. Constructing a global schema won't scale.

> The driving difficulty of data integration is this insatiable demand for more. And it's not without merit because the return on investment from integrating more and more kinds of data is generally positive.  
- Michael Stonebraker, researcher at MIT's Computer Science and Artificial Intelligence Laboratory

Let me give you a good example: One of Tamr's customers is [Novartis](https://www.novartis.com/), the drug company. They have a traditional customer-facing data warehouse of sales; they're performing that using traditional [ETL tools](http://searchdatamanagement.techtarget.com/answer/ETL-tools-What-you-do-and-dont-want). However, they've got 10,000 bench scientists -- biologists and chemists -- who are doing 'wet' stuff in the lab and writing down experimental results; think of them as an electronic lab notebook. So they've got 10,000 electronic lab notebooks, each one independently constructed by a bench scientist. Novartis wants to put those 10,000 -- think of them as spreadsheets -- together. You want to [integrate 10,000 spreadsheets](http://www.eusprig.org/horror-stories.htm), all independently constructed, and there's no common ontology of terms, no common ontology of chemical IDs. They are all independently constructed with whatever that scientist wanted to put in them. Moreover, not all of them are even in English, since Novartis has a whole bunch of scientists in Switzerland who are recording stuff in German.

What's the global schema? No one has a clue. It's a problem of scale.

## What's the second problem with ETL?

Stonebraker: The second problem is, if you send a programmer out to look at a data source, he's the one who's got to clean it. In the case of Novartis, it turns out there's a genomics term called ICU-50; there's also a genomics term called ICE-50. So the programmer's got to clean that data. The problem is, he has no clue whether an ICE-50 and an ICU-50 are the same things or are different things. He's a programmer. He's not a business owner or a domain specialist.

At the end of the day, the only person who is capable of deciding whether an ICU-50 and an ICE-50 are the same or different is the domain specialist. They are the ones who actually have to answer these questions. So you've got no global schema up front, and when you have to involve humans, you've got the wrong humans involved.

**Tamr's solution is to combine domain expertise and [machine learning](http://searchcio.techtarget.com/opinion/Machine-learning-embedded-analytics-and-big-data-march-ahead-in-2014). How does the tool work?**

Stonebraker: If a column is named 'wages' in one data source and 'salaries' in another data source, with automatic techniques, you have no idea if those are the same or different. [Tamr] asks a domain expert, a human, 'are these the same or are these different?' And he says yes or no. So whenever Tamr doesn't know the answer, it asks a human. And in the process, it builds up a training database of answers to questions. So, if it ever sees wages and salaries again, it knows they are the same thing. Moreover, if the human says 'wages' and 'salary' are the same, [Tamr] has a bunch of statistical techniques that say wage and salary -- without the 's' on the end -- are probably the same thing.

You can say what level of confidence you require for an automated system to do a checking process without a human. So a human administrator, who we call the data shepherd, can say if the system is 95% confident about answers to questions, do them automatically and don't have a human check them.

This is in the eye of the beholder: It costs money to check decisions, and you can decide how important is it to get total accuracy versus how much money are you willing to spend with human checkers.

Basically, with deduplication and schema integration, [Tamr] asks a human when it doesn't know, and we have statistical models that get smarter and smarter over time by taking advantage of the answer to previously asked questions. In the process, if you insist on 100% accuracy, everything will get checked. And even there, we offer an [ROI](http://searchcio.techtarget.com/definition/ROI) because we organize the checking and make it efficient for humans. And if you're willing to tackle that process 100%, then it's all gravy.