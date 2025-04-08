---
layout: post
title: Agile Big Data
date: 2014-02-25
categories: [computer science]
tags: [agile, analytics, big data]

---

> We are uncovering better ways of developing software by doing it and helping others do it. Through this work we have come to value:  
**Individuals and interactions** over processes and tools  
**Working software** over comprehensive documentation  
**Customer collaboration** over contract negotiation Responding to change over following a plan  
That is, while there is value in the items on the right, we value the items on the left more.   
—The Agile Manifesto

Agile Big Data
---

Agile Big Data is a development methodology that copes with the unpredictable realities of creating analytics applications from data at scale. It is a guide for operating the Hadoop data refinery to harness the power of big data.


Warehouse-scale computing has given us enormous storage and compute resources to solve new kinds of problems involving storing and processing unprecedented amounts of data. There is great interest in bringing new tools to bear on formerly intractable problems, to derive entirely new products from raw data, to refine raw data into profitable insight, and to productize and productionize insight in new kinds of analytics applications. These tools are processor cores and disk spindles, paired with visualization, statistics, and machine learning. This is *data science*.


At the same time, during the last 20 years, the World Wide Web has emerged as the dominant medium for information exchange. During this time, software engineering has been transformed by the “**agile**” revolution in how applications are conceived, built, and maintained. These new processes bring in more projects and products on time and under budget, and enable small teams or single actors to develop entire applications spanning broad domains. This is *agile software development*.


But there’s a problem. Working with real data in the wild, doing data science, and performing serious research takes time—longer than an agile cycle (on the order of months). It takes more time than is available in many organizations for a project sprint, meaning today’s applied researcher is more than pressed for time. Data science is stuck on the old-school software schedule known as the *waterfall* method.


Our problem and our opportunity come at the intersection of these two trends: how can we incorporate data science, which is applied research and requires exhaustive effort on an unpredictable timeline, into the agile application? How can analytics applications do better than the waterfall method that we’ve long left behind? How can we craft applications for unknown, evolving data models?


The book[1] attempts to synthesize two fields, agile development and big data science, to meld research and engineering into a productive relationship. To achieve this, it presents a lightweight toolset that can cope with the uncertain, shifting sea of raw data. The book goes on to show you how to iteratively build value using this stack, to get back to agility and mine data to turn it to dollars.


Agile Big Data aims to put you back in the driver’s seat, ensuring that your applied research produces useful products that meet the needs of real users.

Agile Big Data Teams
---

Products are built by teams of people, and agile methods focus on people over process, so Agile Big Data starts with a team.


Data science is a broad discipline, spanning analysis, design, development, business, and research. The roles of Agile Big Data team members, defined in a spectrum from customer to operations, look something like Figure 1-1:


![](http://sungsoo.github.com/images/agile-big-data-team.png)

These roles can be defined as:

* **Customers** use your product, click your buttons and links, or ignore you completely. Your job is to create value for them repeatedly. Their interest determines the success of your product.
* **Business development** signs early customers, either firsthand or through the creation of landing pages and promotion. Delivers traction from product in market.
* **Marketers** talk to customers to determine which markets to pursue. They determine the starting perspective from which an Agile Big Data product begins.
* **Product managers** take in the perspectives of each role, synthesizing them to build consensus about the vision and direction of the product.
* **Userexperience designers** are responsible for fitting the design around the data to match the perspective of the customer. This role is critical, as the output of statistical models can be difficult to interpret by “normal” users who have no concept of the semantics of the model’s output (i.e., how can something be 75% true?).
* **Interaction designers** design interactions around data models so users find their value.
* **Web developers** create the web applications that deliver data to a web browser.
* **Engineers** build the systems that deliver data to applications.
* **Data scientists** explore and transform data in novel ways to create and publish new features and combine data from diverse sources to create new value. Data scientists make visualizations with researchers, engineers, web developers, and designers to expose raw, intermediate, and refined data early and often.
* **Applied researchers** solve the heavy problems that data scientists uncover and that stand in the way of delivering value. These problems take intense focus and time and require novel methods from statistics and machine learning.
* **Platform engineers** solve problems in the distributed infrastructure that enable Agile Big Data at scale to proceed without undue pain. Platform engineers handle work tickets for immediate blocking bugs and implement long-term plans and projects to maintain and improve usability for researchers, data scientists, and engineers.
* **Operations/DevOps professionals** ensure smooth setup and operation of production data infrastructure. They automate deployment and take pages when things go wrong.

Recognizing the Opportunity and Problem
---

The broad skillset needed to build data products presents both an opportunity and a problem. If these skills can be brought to bear by experts in each role working as a team on a rich dataset, problems can be decomposed into parts and directly attacked. Data science is then an efficient assembly line, as illustrated in Figure 1-2.


However, as team size increases to satisfy the need for expertise in these diverse areas, communication overhead quickly dominates. A researcher who is eight persons away from customers is unlikely to solve relevant problems and more likely to solve arcane problems. Likewise, team meetings of a dozen individuals are unlikely to be productive. We might split this team into multiple departments and establish contracts of delivery between them, but then we lose both agility and cohesion. Waiting on the output of research, we invent specifications and soon we find ourselves back in the waterfall method.

![](http://sungsoo.github.com/images/expert-contributor.png)

And yet we know that agility and a cohesive vision and consensus about a product are essential to our success in building products. The worst product problem is one team working on more than one vision. How are we to reconcile the increased span of expertise and the disjoint timelines of applied research, data science, software development, and design?


References
---
[1] Russell Jurney, *Agile Data Science*, Data Syndrome LLC, Published by O’Reilly Media, Inc., 2014.