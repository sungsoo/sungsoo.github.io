---
layout: post
title: A Guide to Edge IoT Analytics
date: 2017-04-11
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [A guide to Edge IoT analytics](https://www.ibm.com/blogs/internet-of-things/edge-iot-analytics/)
* Authors: [Andrea Reale](https://www.ibm.com/blogs/internet-of-things/author/andrea-reale/ "Posts by Andrea Reale")


---


A Guide to Edge IoT Analytics 
=============================

Advances in embedded *Systems-on-a-Chip* (SoCs) have given rise to many commercial devices that are powerful enough to run full-fledged operating systems and complex algorithms. The devices embed a rich set of different sensors (e.g., cameras, microphone, or GPS), integrating more than one connectivity option (e.g., WiFi, Bluetooth, or Ethernet.) 
The [Raspbery Pi](https://www.raspberrypi.org/) is one example, but more and more alternatives are appearing on the market with different form factors, power footprints, computing capacities and cost.

These trends are extending the potential of the Internet of Things: while many early IoT applications were mostly about collecting data from 'Things' and sending them elsewhere for analysis, the growing
abundant computing capacity of 'Things' now allows increasingly complex computation to run on-site, without ever leaving the physical world.

Edge Computing: Integrating IoT and the Cloud
---------------------------------------------

Many refer to this trending paradigm by the term *Edge Computing* as a way to emphasize that part of the work happens right at the edge of the network where IoT connects the physical world to the Cloud. But Edge Computing is much more than having computation and data processing on IoT devices. A fundamental part of it is the strong and seamless integration between IoT and Cloud; between the physical world and the world of computation.

An Edge Computing application uses the processing power of IoT devices to filter, pre-process, aggregate or score IoT data. It uses the power and flexibility of Cloud services to run complex analytics on those data and, in a feedback loop, support decisions and actions about and on the physical world.

IBM Research in Dublin and Yorktown, in a joint effort with the IoT business unit, are designing solutions to help developers and devOps engineers build, deploy and maintain complex Edge Computing applications that use the synergistic power of IoT devices, and of IBM Watson ecosystem, including Watson IoT and IBM Cloud.

Three motivating factors for using Edge Computing
-------------------------------------------------

We have pinpointed three main *motivating factors* for using Edge Computing:

## 1. Preserve privacy

Data captured by IoT devices can contain sensitive or private information, e.g., GPS data, streams from cameras, or microphones. While an application might want to use this information to run complex analytics in the Cloud, it is important that, whenever data leaves the premises where it is generated, the privacy of sensitive content is preserved. With Edge Computing, an application can make sure that
sensitive data is pre-processed on-site, and only data that is privacy compliant is sent to the Cloud for further analysis, after having passed through a first layer of anonymizing aggregation.

## 2. Reduce latency

The power and flexibility of Cloud computing has enabled many scenarios that were impossible before. Think about how the accuracy of image or voice recognition algorithms has improved in recent years. However, this accuracy has a price: the time needed to get an image or a piece of audio recognized is significantly affected by the non-negligible yet unavoidable network delays due to data being shipped to the Cloud and results computed and sent back to the edge. When low-latency results are needed, Edge Computing applications can implement machine-learning algorithms that run directly on IoT devices, and only interact with the Cloud off the critical path, for example, to continuously train machine learning models using captured data.

## 3. Be robust to connectivity issues

Designing applications to run part of the computation directly on the Edge not only reduces latency, but potentially ensures that applications are not disrupted in case of limited or intermittent network connectivity. This can be very useful when applications are deployed on remote locations where network coverage is poor or even to reduce costs coming from expensive connectivity technologies like cellular
technologies.

*Figure 1: An example of Edge Computing architecture*

![Figure 1: An example of Edge Computing architecture](https://www.ibm.com/blogs/internet-of-things/wp-content/uploads/2017/02/Figure-1.jpg)

Edge Computing architecture
---------------------------

The physical world is divided in locations. A location is a geographical unit where one or more IoT devices are deployed. In an Edge architecture, devices can be of three types depending on their role:
Edge Gateways, Edge Devices, and Edge Sensors and Actuators.

Edge Sensors and Actuators are special purpose devices which do not have general purpose processors or operating systems. They are connected to Edge Devices or Gateways directly or via low power radio technologies.

dge Devices are general purpose devices which are able to run full-fledged operating systems and are often battery-powered. For example, devices running Linux, Android, or iOS can qualify as Edge Devices. Edge Devices run the Edge intelligence, i.e., they run computation on data they receive from sensors and they send commands to actuators. They are connected to the Cloud either directly or through the mediation of an Edge Gateway.

Edge Gateways, like Edge Devices, run full-fledged operating systems, but they typically have unconstrained power supply, more CPU power, memory and storage. Gateways can act as intermediaries between the Cloud and Edge Devices, possibly offering additional location management services.

Both Edge Gateways and Devices forward selected subsets of raw or pre-processed IoT data to services running in the Cloud, like storage services, machine learning or analytics services, and they symmetrically receive commands from the Cloud, like configurations, data queries, or machine learning models against which to locally score IoT data.

Figure 1 shows a four-level hierarchy, with Cloud as the root, and Edge Gateways as an intermediate tier above Edge Devices and Edge Sensors and Actuators; however, arbitrary trees or graphs are possible, supporting more levels of computation at the Edge or with hybrid Cloud configurations, for example.

An Edge Computing application is made of several modules, each running at different places in the hierarchy. For example, an analytics module might run in the Cloud to analyze data coming from Edge Gateways and Devices; a dashboard module might be deployed in the Cloud to provide a global data view or a query interface; a machine learning module might be deployed on Edge Gateways to interface with modules running on Edge Devices and score pre-aggregated data coming from them. An Edge Computing application should describe how modules interact and communicate, by clearly defining data flows between components, henceforth also defining visibility restrictions, business and privacy rules.

The prototype: IBM Edge IoT Analytics
-------------------------------------

[According to a survey](http://docplayer.net/18508929-The-cost-of-poor-customer-service-the-economic-impact-of-the-customer-experience-and-engagement-in-16-key-economies.html), bad customer service costs organizations \$338.5 billion globally per year in lost business. This is aggravated by the fact that achieving high coverage in capturing customer satisfaction is often difficult. The majority of customers is not filling in paper or online forms, and those who do are not necessarily a fully representative sample of the entire customer base.

Focusing on customer satisfaction, we wanted to understand the potential of bringing together the cognitive capabilities of Watson and the advantages of Edge Computing in the following scenario targeting hospitality services.

A large global hotel chain wants to improve the process used to collect customer satisfaction. They realise that spontaneous information about it is already exchanged daily at their hotels premises but is
systematically lost. Guests interact continuously with hotel employees at the reception desk, and all these interactions implicitly or explicitly convey a mood or a tone that directly links to their satisfaction.

What if this information could be somehow captured and analyzed to produce better customer insights? What if, furthermore, real-time customer satisfactions from all the hotels in the globe could be easily
queried and analyzed by the hotel management board through a simple visual dashboard and query interface?

Understanding the conversation
------------------------------

Today's IBM Watson Cloud offering already has most of the crucial intelligence to extract precious information from conversations. [Watson
Tone Analyzer](https://www.ibm.com/watson/developercloud/tone-analyzer.html) can extract conversation tones from textual transcripts and [Watson
Speech-to-Text](https://www.ibm.com/watson/developercloud/speech-to-text.html) can easily convert recorded spoken conversations into text.

However, there are important limitations in our hotels scenario, which make the use of such services in the Cloud impossible: captured guests'
conversations are very likely to contain guests' sensitive data, and sending these data to a Cloud service has important privacy implications. Moreover, transmitting continuous audio streams can be costly and subject to connectivity issues.

To address these challenges, we have built an initial proof of concept targeted to the described scenario, called**Edge IoT Analytic**.
We use Watson Speech-to-Text and Watson Tone Analyzer as Edge Gateway modules, and a distributed IoT query engine runs as a Cloud module.

In our prototype we show how inexpensive devices such as a Raspberry Pi or similar, equipped with a microphone, can be placed at the reception desks of Hotels and act as Edge Gateways.

*Figure 2: Schematic workflow for IBM Edge IoT Analytics*

![Figure 2: Schematic workflow for IBM Edge IoT
Analytics](https://www.ibm.com/blogs/internet-of-things/wp-content/uploads/2017/02/Figure-2.jpg)

As schematically outlined in Figure 2, the Edge application modules running on the gateways would capture the audio of the conversations and
run speech-to-text and tone analysis directly on the device, thus completely avoiding sending any sensitive data to the cloud. The Edge
Gateways only store the results of tone analysis, which are just numerical scores for a set of fixed tone attributes like happiness, sadness or anger, on a local database.

*Figure 3: A screenshot of the IBM Edge IoT Analytics Web dashboard*

![Figure 3: A screenshot of the IBM Edge IoT Analytics Web
dashboard](https://www.ibm.com/blogs/internet-of-things/wp-content/uploads/2017/02/Figure-3.jpg)

In order to let general Hotel management access this global information, Edge IoT Analytics has an additional module running on the Cloud as a
Bluemix service that implements a visual dashboard together with a query engine to explore IoT information (see Figure 3). From the map on the
dashboard, it is possible to visualize the devices on which the application is running. The IoT query engine, which we call EdgeSQL, implements a subset of standard SQL with extensions that make it suitable to query data stored on Edge Gateways.

Using EdgeSQL, the hotel management can build and execute queries like "what is the hotel in the chain that had the most angry interactions with guests?", "What is the average happiness of customer interactions in Rome?" or "what was the saddest conversation in Athens within the last three months?".

All the communication between Cloud and Edge leverage the services provided by the [Watson IoT Platform](https://www.ibm.com/internet-of-things/iot-solutions/watson-iot-platform/).

Future directions
-----------------

We are working to extend our prototype to a generic framework and runtime platform, to assist developers to build and devOps engineers to
deploy Edge Computing applications on heterogeneous scenarios. From the point of view of the developer, we are extending our prototype to directions such as:

-   Common on-Edge and Edge-to-Cloud data exchange capabilities with clear visibility of what stays on the Edge and what leaves it.
-   Batch and streaming data analytics frameworks and APIs which streamline and unify data analytics across cloud and Edge. This will extend the EdgeSQL prototype presented above, and also expand to a selection of well-known Big Data analytics frameworks.

From a devOps perspective, our effort aims at building the infrastructure management platform to deploy and control Edge Computing applications throughout their full life-cycle. This will include many rich features, like:

-   Possibility to define complex Edge Computing application by composing their modules which will run on different devices and environments at the Edge and on the Cloud.
-   Assisted Cloud-based deployments of Edge Computing applications, with the possibility to choose their Edge deployment targets based on geographical or other custom attributes.
-   Rich monitoring of applications status from an ad-hoc Cloud dashboard that allows access to the state of every module instance within one or more applications.
-   Versioning and controlled rolling upgrades of applications or individual modules spanning both Cloud and Edge.

For this work, we are planning to extensively build on top of existing IBM services, including the [Watson IoT Platform](http://www.ibm.com/internet-of-things/iot-solutions/watson-iot-platform/).
We believe that Edge Computing is key in exploiting the full potentials of IoT. With our work so far, we have only scratched the surface of its
many possibilities; our far reaching goal is to make it easy for everyone to build Edge Computing applications and further enable analytics and cognitive computing on the Edge.

Acknowledgements
----------------

IBM Ireland: Andrea Reale, Yiannis Gkoufas, Kostas Katrinis; IBM Yortkown: Nirmit Desai, Bongjun Ko, Keith Grueneberg. Special thanks to the people in the IoT Business Unit for their guidance and support.
