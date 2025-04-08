---
layout: post
title: The evolution of analytics
date: 2013-12-09 
categories: [computer science]
tags: [big data]

---

Just as the business landscape and information environments are evolving, the approaches to effective analysis are at the dawn of a major evolution. While we might be thinking that the wealth of information swarming around us sometimes seems more like a pestilence than prosperity, the fact is that we now have the capability to glean value from the chaos. Advanced software analytic tools and sophisticated mathematical models can help us identify patterns, correlations of events, and outliers. With these new tools, we can begin to anticipate, forecast, predict, and make changes in our systems with more clarity and confidence than ever before. We stand on the brink of the next generation of intelligence: analysis of insightful and relevant information in real time. This is the real value of a Smarter Planet.

![http://sungsoo.github.io/images/bi-gen.png](http://sungsoo.github.io/images/bi-gen.png)

*Hierarchical databases* were invented in the 1960s and still serve as the foundation for **Online Transaction Processing (OLTP)** systems for all forms of business and government driving trillions of transactions. Consider the example of a bank. In many banks, the information is entered into an OLTP system by employees or by a web application that captures and stores that data in hierarchical databases. This information then appears in daily reports and graphical dashboards to demonstrate the current state of the business and to enable and support appropriate actions. Analytical processing here is limited to capturing and understanding what has happened.


*Relational databases* brought with them the concept of *data warehousing*, which extended the use of databases from OLTP to **Online Analytic Processing (OLAP)**. Using an apparel manufacturer as an example, the order information that is captured by the OLTP system is stored over time and made available to the various business analysts in the organization. With OLAP, the analysts could now use the stored data to determine trends in fulfillment rates, patterns of inventory control issues, causes of order delays, and so on. By combining and enriching the data with the results of their analyses, they could do even more complex analyses to forecast future manufacturing levels or make recommendations to accelerate shipping methods. Additionally, they could mine the data and look for patterns to help them be more proactive in predicting potential future problems in areas such as order fulfillment. They could then analyze the recommendations to decide if they should take action. Thus, the core value of OLAP is understanding why things happen, which allows you to make more informed recommendations.


A key component of both OLTP and OLAP is that the data is stored. Some new applications require faster analytics than is possible, and you have to wait until the data is retrieved from storage. To meet the needs of these new dynamic applications, you must take advantage of the increase in the availability of data prior to storage, that is, streaming data. This need is driving the next evolution in analytic processing, Real-time Analytic Processing (RTAP). RTAP focuses on taking the proven analytics established in OLAP to the next level. Data in motion and unstructured data might be able to provide actual data where OLAP had to settle for assumptions and hunches. The speed of RTAP allows for taking immediate action instead of simply making recommendations.

So, what type of analysis makes sense to do in real time? Key types of RTAP include, but are not limited to:

* **Alerting**  
The RTAP application notifies the user(s) that the analysis has identified that a situation (based on a set of rules or process models) has occurred and provides options and recommendations for appropriate actions.  
Alerts are useful in situations where the application should not be automatically modifying the process or automatically taking action. They are also effective in situations where the action to be taken is outside the scope of influence of the RTAP application.

* **Examples:**  
A market surveillance application that is monitoring a local exchange for suspect activity would notify someone when such a situation occurs.  
A patient monitoring application would alert a nurse to take a particular action, such as administering additional medicine.

* **Feedback**  
The RTAP application identifies that a situation (based on a set of rules or process models) has occurred and makes the appropriate modifications to the processes to prevent further problems or to correct the problems that have already occurred.  
Feedback analysis is useful in, for example, manufacturing scenarios where the application has determined that defective items have been produced and takes action to modify components to prevent further defects.

* **Example:** A manufacturer of plastic containers might run an application that uses the data from sensors on the production line to check the quality of the items through the manufacturing cycle. If defective items are sensed, the application generates instructions to the blending devices to adjust the ingredients to prevent further defects from occurring.

* **Detecting failures**  
The RTAP application is designed to notice when a data source does not
respond or generate data in a prescribed period of time.  
Failure detection is useful in determining system failure in remote locations or problems in communication networks.

* **Examples:**  
An administrator for a critical communications network deploys an application to continuously test that the network is delivering an adequate response time. When the application determines that the speed drops below a certain level or is not responding at all, it alerts the administrator.  
An in-home health monitoring application determines that the motion sensors for a particular subscriber have not been activated today and sends an alert to a caregiver to check on the patient to determine why they are not moving around.

When you look at the big picture, you can see that if you consider the improvements that have been made in chip capacity, network protocols, and input / output caching along with the advances in instrumentation and interconnectivity and the potential of stream computing, we stand poised and ready to be able to present appropriate information to the decision makers in time for proactive action to be taken. The days of solely basing our decisions on static data is yielding to being able to also use streaming data or data in motion.


###References

[1] IBM InfoSphere Streams: Harnessing Data in Motion, IBM Redbooks, Sep. 2010.