---
layout: post
title: Edge Accelerated Web Platform
date: 2017-04-10
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Edge Accelerated Web Platform](http://www.ntt.co.jp/news2014/1401e/140123a.html)
* Authors: NTT Press Releases

---

# Edge Accelerated Web Platform

Announcing the "Edge computing" concept and the "Edge accelerated Web platform" prototype to improve response time of cloud applications. 
-----

**Tokyo, January 2014** - Nippon Telegraph and Telephone Corporation (NTT; TSE: 9432, NYSE: NTT) today revealed the "Edge computing" concept which can reduce the cloud application response time by factor of 100 at most, and demonstrated its first research outcome, the "*Edge accelerated Web platform*" prototype. The research and development effort leading up to the announcement has been carried out as a part of the company's strategic plan, ["*Accelerating Innovation and Collaboration for the Next Stage*"](http://www.ntt.co.jp/news2013/1311ehzt/pdf/xgxf131108d_all.pdf), and is expected to open up a new era of applications for "Smart Life and Smart Work".

Although cloud services and their use by devices such as smartphones has become quite the norm today, they are increasingly and inevitably facing the problems of poor scalability and slow response time due to their dependence on sole remote servers that may be located far away, possibly across an ocean and on the other side of the planet. Because of the finite speed of light, it takes several hundred milliseconds to interact over the Pacific Ocean, for example. These problems hinder the most
promising applications to be widely deployed, such as intelligent transport control systems (ITS) and games that necessitate real-time response time, and the M2M services that will impose huge data traffic loads on the data center.

The edge computing platform solves the problems by the simple idea of locating small servers called *edges servers* in the vicinity of the users and devices and passing to the servers some of the load of center servers and/or user's devices. The following benefits are expected (Figure 1).

![Figure 1 Edge computing platform](http://www.ntt.co.jp/news2014/1401e/image/140123aa.gif)

*Figure 1 Edge computing platform*

-   Executes real-time applications that require high-speed response at the nearer edge-servers which will satisfy the severe     real-time requirement. The communication delay is shortened to a few milliseconds, not a several hundred milliseconds.
-   Locally confines regional data processing of M2M/big data applications that incur large data traffic to edge-servers, and reduces network bandwidth.
-   Offloads some of the computation intensive processing on the user's device to edge servers and makes application processing less dependent on the device's capability. It is possible to run applications faster and improve the user's experience.

As a result, the edge computing platform makes it possible to implement new and attractive applications that require real-time responses along with regional M2M/big data transactions, as shown in Figure 2. Typical applications that have the former requirement include ITS or AR and those that have the latter requirement include smart buildings/houses and city management.

![Figure 2 Applications suitable for edge computing](http://www.ntt.co.jp/news2014/1401e/image/140123ab.gif)

*Figure 2 Applications suitable for edge computing*

The image of applications that can be realized by edge computing platform is shown in Figure 3. Through the spread of the edge computing platform, we will accelerate collaboration with ICT partners and aim at activating the market for new applications.

![Figure 3 Image of applications realized by edge computing platform](http://www.ntt.co.jp/news2014/1401e/image/140123ac.gif)

*Figure 3 Image of applications realized by edge computing platform*

As the first instance that realizes the edge computing concept, we have developed the "edge accelerated Web platform (EAWP)"; it enables Web applications to run on edge severs. EAWP is a Web application execution framework that takes full advantage of the features of the edge computing. This platform relieves the user's device from having to process the entire Web application by distributing processing loads to the edge server close to the users and devices. In consideration of the background that Web applications and their developers are rapidly increasing, our development of this platform allows Edge computing developers to use HTML standards to develop high performance applications.
The following are the key features of EAWP (Figure 4).

![Figure 4 Edge accelerated Web platform (EAWP)](http://www.ntt.co.jp/news2014/1401e/image/140123ad.gif)

*Figure 4 Edge accelerated Web platform (EAWP)*

-   The loads of heavy web application processes such as Web content evaluation and rendering are split and distributed among edge-servers and the user's device. This distribution yields high-speed Web applications whose performance is made less dependent on the capability of the user's device.
-   The distribution method and data transfer method are optimized according to the user's environment, such as device capability and the networking environment, such as fixed or mobile. For example, the processing of objects, such as images and sounds, are dynamically allocated to devices or edge-servers to suit the user's environment, and resolution and frame rate are controlled to suit the networking environment.
-   EAWP provides an execution environment equivalent to other Web engines that conform to HTML standards. Therefore, existing Web applications can be run in this distributed Web-based platform without being rewritten.

We will aim at business development from 2014 in Japan toward the realization of our vision. In addition, we will explore new
applications, and extend the edge computing platform. In parallel, we will establish the edge computing market at the global level by forming alliances with network carriers, content providers, cloud business, etc.

Our future activity is shown in <http://labolib3.aecl.ntt.co.jp/cec_en/index.html>.