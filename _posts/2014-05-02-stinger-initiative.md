---
layout: post
title: The Stinger Initiative From HortonWorks With Hadoop
date: 2014-05-02
categories: [computer science]
tags: [big data]

---

[![](http://sungsoo.github.com/images/stinger.png)](http://sungsoo.github.com/images/stinger.png)


Visit [http://www.g33ktalk.com](http://www.g33ktalk.com) for more videos and tech talks. 

The **Stinger Initiative** is a *collection of development threads* in the Hive community that will deliver **100X performance improvements** as well *full SQL compatibility*.

# The Stinger Initiative From HortonWorks With Hadoop

<iframe width="600" height="400" src="//www.youtube.com/embed/wTRGw-eS1CA" frameborder="0" allowfullscreen></iframe>



## ORC File & Vectorization - Improving Hive Data Storage and Query Performance

<iframe width="600" height="400" src="//www.youtube.com/embed/GV7vpR7vpjM" frameborder="0" allowfullscreen></iframe>


## The Stinger Initiative - Making Apache Hive 100 Times Faster (Part I)

**Apache Hive** and its **HiveQL** interface has become the *de facto* **SQL interface for Hadoop**. Apache Hive was originally built for large-scale operational batch processing and it is very effective with reporting, data mining, and data preparation use cases. These usage patterns remain very important but with widespread adoption of Hadoop, the enterprise requirement for Hadoop to become more real time or interactive has increased in importance as well. Enabling Hive to answer human-time use cases (i.e. queries in the 5-30 second range) such as big data exploration, visualization, and parameterized reports without needing to resort to yet another tool to install, maintain and learn can deliver a lot of value to the large community of users with existing Hive skills and investments. 

To this end, we have launched the Stinger Initiative, with input and participation from the broader community, to enhance Hive with more SQL and better performance for these human-time use cases. We believe the performance changes we are making today, along with the work being done in Tez will transform Hive into a single tool that Hadoop users can use to do report generation, ad hoc queries, and large batch jobs spanning 10s or 100s of terabytes.


<iframe width="600" height="400" src="//www.youtube.com/embed/HvRenqum7Cs" frameborder="0" allowfullscreen></iframe>


## Tez + Hive

* Gunter Hagleitner, Architect, Hortonworks: Apache Tez

Tez is an effort to develop a *generic application framework* which can be used to process arbitrarily *complex data-processing tasks* and also a *re-usable* set of data-processing primitives which can be used by other projects. By providing a more **expressive DAG of tasks** for a job, Tez attempts to provide significantly enhanced data-processing capabilities for projects like Apache Pig, Apache Hive, Cascading etc.

Gunther Hagleitner has been contributing to various hadoop projects for over four years both at Yahoo! as well as Hortonworks. He is a PMC member of the Apache Tez project. Before Hadoop, Gunther has been working on database technology for more than a decade. At Hortonworks he is leading Hive efforts in the Stinger project.


<iframe width="600" height="400" src="//www.youtube.com/embed/S5vmnbjm_tA" frameborder="0" allowfullscreen></iframe>