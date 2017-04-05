---
layout: post
title: Fast Data, Fast Monitoring
date: 2017-04-05
categories: [computer science]
tags: [big data, machine learning]

---

## Article Source
* Title: [Fast Data, Fast Monitoring](http://www.chongyangma.com/publications/ld/index.html)
* Authors: Christopher Tozzi

---

Fast Data, Fast Monitoring
===

Big data is old news. Today, the key to leveraging data effectively is to do *<font color="blue">fast data</font>*.

In a similar fashion, traditional incident management-which entails collecting and analyzing large volumes of monitoring information-is no longer enough. Organizations must also now do 
"*<font color="blue">fast monitoring</font>*," which  means not only collecting monitoring data; but making it actionable in  real-time.

This  post examines what fast monitoring means, and explains how incident  management teams can implement this approach to realize great benefits.

## Defining Fast Data

To understand the concept of fast monitoring, you have to understand <a href="http://www.infoworld.com/article/2608040/big-data/fast-data--the-next-step-after-big-data.html">fast data</a> - one of the newest innovations in the big data world.

Very  simply put, fast data is big data done in a fast way. Whereas big data  traditionally meant storing large amounts of information and analyzing  it later, fast data means performing data analytics on large amounts of  information as quickly as possible-ideally, in real-time. The goal is to  analyze the data when it is as actionable and relevant as possible.

Being  able to stream data from its source into an analytics platform is an  important part of leveraging fast data. This is why big data tools like Apache Spark  have become popular in recent years. By supporting streaming data  collection, as well as in-memory processing, Spark can ingest and  analyze large amounts of information at speeds much faster than  non-streaming, on-disk data analytics platforms.

## Fast Data and Incident Management

Incident  management is a different field from data analytics, but incident  management admins can learn a lot from the fast data trend. In the  infrastructure monitoring and incident management world, being able to  analyze large amounts of monitoring and alert data in real-time to  improve response is now more important than ever.

## From traditional incident management to fast incident management

The  connection between fast data and fast monitoring is not a coincidence.  In many ways, the evolution of incident management mirrors the evolution  of data analytics.

Until  about ten years ago, data, like infrastructure, was relatively small.  There was no need for most organizations to analyze petabytes of data because they didn't generate that much. Similarly, most  organizations had no need for monitoring solutions that could support  large and diverse infrastructures. They could instead get away with  basic monitoring systems to keep track of relatively small and  uncomplicated networks of servers and workstations.

Then,  in the mid-2000s, both data and infrastructure started getting much  bigger. The digitization of everything meant that organizations started  collecting reams of information, giving rise to big data. Meanwhile, the  proliferation of mobile devices, the rise of virtualization and the  need for ever-more computing power made infrastructure much larger and  more complicated. This new landscape required big monitoring.

And  within the past few years, another sea of change has taken place. In an  age when information is constantly changing, performing analytics on  data that is even just a few hours old undercuts the value of analytics.  Similarly, performing incident management on the basis of monitoring  information that is not up-to-date prevents admins from triaging and  responding to incidents effectively.

So,  while fast data and fast monitoring may require different toolsets, the  principles and motivations behind both trends are the same. Incident  management teams seeking to keep infrastructure and apps running as  smoothly as possible would do well to emulate their data-analyst  colleagues by focusing on fast monitoring.

## Facilitating Fast Monitoring

Collecting  and reacting to monitoring information quickly may sound simple enough -  but how can you make fast monitoring work in practice? The major  guidelines to follow include:

<ul>
<li><b>Centralize data collection</b>. To make sense of monitoring information as quickly as possible, you should forward all monitoring data to a <a href="https://www.pagerduty.com/applications/">central interface</a>.  This will obviate the need to switch between different dashboards or  monitoring systems, which wastes time and mental energy as well as makes  it highly difficult to understand root cause.</li>
</ul>
<ul>
<li><b>Collect all information available.</b> Traditional incident management tends to focus just on collecting  machine data and alerts. That information provides part of what you need  to do fast monitoring, but in order to react as quickly as possible to  incidents, you should have as broad a scope as possible of visibility  and insight. For instance, gathering human-generated data from tickets  and support calls should not be ignored. This also means taking  advantage of features like <a href="https://www.pagerduty.com/blog/new-api-endpoints-increase-platform-extensibility/">PagerDuty's Custom Event Transformer</a> in order to collect data from sources, such as <a href="https://www.pagerduty.com/blog/twitter-killed-call-center/">social media channels</a>, that are not traditionally a part of incident management workflows.</li>
</ul>
<ul>
<li><b>Minimize noise.</b> You're going to have a large amount of alerts, but only some of them  require action. It's therefore absolutely crucial to cut out the noise,  and suppress anything that is non-actionable, so that the number of  alerts you have to pay attention to is minimal. Alerts should  automatically be de-duplicated, and it should be easy to group related  symptoms into a single issue that requires resolution. This will  facilitate instantaneous identification of the alerts that require  attention, and trigger the appropriate response workflow in real-time.</li>
</ul>
<ul>
<li><b>Make data easy to interpret</b>.  Collecting large amounts of monitoring data and storing it in a central  location will help you to turn that data into value quickly. However,  to streamline the process fully, you also should make sure that data  from various sources is <a href="https://www.pagerduty.com/features/event-grouping-and-enrichment/">normalized into a consistent format</a> in order to promote easy analysis of all of the information on the  dashboard&nbsp;and reduce cognitive load. That way, you don't need to  memorize or contextualize all the schema from different vendors. To do  this, you need incident management solutions that can take information  in diverse forms and normalize fields universally, to generate  immediately actionable, easy-to-understand insights.</li>
</ul>

All of  these practices minimize the amount of manual analysis required from  incident management admins during a crucial incident. In turn, they  minimize the time between alert collection and action, making it  feasible for incident management staff to react to incidents as quickly  as they occur, and truly turn fast monitoring into real-time response  for improved uptime.