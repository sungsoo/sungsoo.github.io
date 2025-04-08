---
layout: post
title: Analyzing Data in Motion A Real-World View
date: 2013-12-16 
categories: [computer science]
tags: [big data, stream computing]

---

If you want to be successful with *big data*, you need to begin by thinking about solving problems in new ways. Many of the previous limitations placed on problem-solving techniques were due to lack of data, limitations on storage or compute power, or high costs. The technology of big data is shattering some of the old concepts of what can’t be done and opening new possibilities for innovation across many industries. The new reality is that an enormous amount of data is generated every day that may have some relevance to your business, if you can only tap into it.

Most likely, you have invested lots of resources to manage and analyze the structured data that you need to understand your customers, manage your operations, and meet your financial obligations. However, today you find huge growth in a very different type of data. The type of information you get from *social media*, *news* or *stock market data feeds*, and *log files*, and *spatial data from sensors*, *medical-device data*, or *GPS data*, is constantly in motion. These newer sources of data can add new insight to some very challenging questions because of the immediacy of the knowledge. Streaming data — data in motion — provides a way to understand an event at the moment it occurs.


### Understanding Companies’ Needs for Data in Motion

To complete a credit card transaction, finalize a stock market transaction, or send an e-mail, data needs to be transported from one location to another. Data is at rest when it is stored in a ***database*** in your data center or in the cloud. In contrast, data is in motion when it is in *transit from one resting location to another*. Companies that must process large amounts of data in near real time to gain business insights are likely orchestrating data while it is in motion. You need data in motion if you must react quickly to the current state of the data.

Data in motion and large volumes of data go hand in hand. Many real-world examples of *continuous streams* of large volumes of data are in use today:

* **Sensors** are connected to highly sensitive medical equipment to monitor performance and alert technicians of any deviations from expected per- formance. The recorded data is continuously in motion to ensure that technicians receive information about potential faults with enough lead time to make a correction to the equipment and avoid potential harm to patients.

* **Telecommunications equipment** is used to monitor large volumes of communications data to ensure that service levels meet customer expectations.

* **Point-of-sale data** is analyzed as it is created to try to influence customer decision making. Data is processed and analyzed at the point of engage- ment — maybe in combination with location data or social media data.

* **Messages**, including details about *financial payments* or *stock trades*, are constantly exchanged between financial organizations. To ensure the security of these messages, standard protocols such as **Advanced Message Queuing Protocol (AMQP)** or IBM’s **MQSeries** are often used. Both of these messaging approaches embed security services within their frameworks.

* **Collecting information** from sensors in a *security-sensitive* area so that an organization can differentiate between the movement of a harmless rabbit and a car moving rapidly toward a facility.

* **Medical devices** can provide huge amounts of detailed data about different aspects of a patient’s condition and match those results against critical conditions or other abnormal indicators.

#### The value of streaming data

*Data in motion*, often in the form of *streaming data*, is becoming increasingly important to companies needing to make decisions when speed is a *critical* factor. If you need to react quickly to a situation, having the capability to ana- lyze data in real time may mean the difference between either being able to react to change an outcome or to prevent a poor result. *The challenge with streaming data is to extract useful information as it is created and transported before it comes to a resting location.* Streaming data can be of great value to your business if you can take advantage of that data when it is created or when it arrives at your business.


You need to process and analyze the streaming data in real time so that you can react to the current state of the data — while in motion and before it is stored. You need to have some knowledge of the context of this data and how it relates to historical performance. And you need to be able to integrate this information with traditional operational data. 
The key issue to remember is that you need to have a *clear understanding* of the nature of that streaming data and what results you are looking for. For example, if your company is
a manufacturer, it will be important to use the data coming from sensors to monitor the purity of chemicals being mixed in the production process. This is a concrete reason to leverage the streaming data. However, in other situa- tions, it may be possible to capture a lot of data, but no overriding business requirement exists. In other words, just because you can stream data doesn’t mean that you always should.


How can you use streaming data to change your business? We look at how organizations in several industries are finding ways to *gain value from data in motion*. In some situations, these companies are able to take data they already have and begin to use it more effectively. In other situations, they are collecting data that they were not able to collect before. Sometimes organizations can collect much more of the data that they had been only collecting snapshots of in the past. These organizations are using streaming data to improve outcomes for customers, patients, city residents, or perhaps for mankind. Businesses are using streaming data to influence customer decision making at the point of sale.


### Streaming Data with an Environmental Impact

Scientists measure and monitor various attributes of lakes, rivers, oceans, seas, wells, and other water environments to support environmental research. Important research on water conservation and sustainability depends on tracking and understanding underwater environments and knowing how they change. Why is this work done? Changes in these natural environments can have an enormous impact on the economic, physical, and cultural well-being of individuals and communities throughout the world. To improve their ability to predict environmental impacts, researchers at universities and environ- mental organizations across the globe are beginning to include the analysis of data in motion in their research.


Scientific research includes the collection of large volumes of *time-sensitive* information about water resources and weather to help protect communities against risks and respond appropriately to disasters impacting these natural resources. **Mathematical models** are used to make *predictions* such as the severity of flooding in a particular location or the impact of an oil spill on sea life and the surrounding ecosystem. The type of data that can be used includes everything from measuring temperature, to measuring the chemi- cals in the water, to measuring the current flow. In addition, it is helpful to be able to compare this newly acquired data with historical information about the same bodies of water.

Many sophisticated research programs are in place to improve the understanding of how to protect natural water resources. Rivers and adjacent flood- plains and wetlands, for example, need protection because they are important habitats for fish and wildlife. Many communities depend on rivers for drinking water, power generation, food, transportation, and tourism. In addition, the rivers are monitored to provide knowledge about flooding and to give communities advance warnings about floods. By adding a real-time component to these research projects, scientists hope to have a major impact on people’s lives.


#### Using sensors to provide real-time information about rivers and oceans

At one research center in the United States, sensors are used to collect *physical*, *chemical*, and *biological* data from rivers. These sensors monitor *spatial changes* in *temperature*, *pressure*, *salinity*, *turbidity*, and the *chemistry of water*. Their goal is to create a real-time monitoring network for rivers and estuaries. Researchers expect that in the future, they will be able to predict changes in rivers in the same way that weather predictions are made today. Another research center based in Europe is using radio-equipped buoys containing sensors to collect data about the ocean, including measurements of wave height and wave action. This streaming data is combined with other environmental and weather data to provide real-time information on ocean conditions to fisherman and marine researchers.
In both examples, sensors are used to collect large volumes of data as events are taking place. Although infrastructure platforms vary, it is typical to include a *middleware layer* to integrate data collected by the sensor with data in
a *data warehouse*. These research organizations are also using external sources like mapping databases and sensors coming from other locations as well as geographical information. The data is analyzed and processed as it streams in from these different sources. One organization is building an *integrated network of sensors*, *robotics*, and *mobile monitoring*. It is using this information to build complicated models such as real-time, multiparameter modeling systems. The models will be used to look at the dynamic interactions within local rivers and estuary ecosystems.

#### The benefits of real-time data

By incorporating real-time analysis of data into environmental research, scientists are advancing their understanding of major ecological challenges. **Streaming technology** opens new fields of research and takes the concept of scientific data collection and analysis in a new direction. They are looking at data they may have collected in the past in a new way and are also able to collect new types of data sources. Although you can learn a lot by monitoring change variables such as water temperature and water chemistry at set inter- vals over time, you may miss out on identifying important changes or patterns.


When you have the opportunity to analyze streaming data as it happens,
it is possible to pick up on patterns you might have missed. Real-time data on river motion and weather is used to predict and manage river changes. Scientists are hoping to predict environmental impacts just like we report on and forecast weather. They are furthering research on the impact of global warming. They are asking what can be learned from watching the movements of migrating fish. How can watching how pollutants are transported help to clean up from future environmental contamination?


If data scientists are able to take data they have already collected, they can combine it with the real-time data in a much more efficient manner. They also have the capability to do more in-depth analysis and do a better job of predicting future outcomes. Because this analysis is completed, it allows other groups needing the same information to be able to use the findings in new ways to analyze the impact of different issues. This data could be stored in a data cloud environment so that researchers across the globe can have access, add new data into the mix, and solve other environmental problems.


### Streaming Data with a Public Policy Impact
Almost every area of a city has the capability to collect data, whether in the form of taxes, sensors on buildings and bridges, traffic pattern monitoring, location data, and data about criminal activity. Creating workable policies that make cities safer, more efficient, and more desirable places to live and work requires the collection and analysis of huge amounts of data from a variety of sources. Much of the data that is pertinent to research on public policy improvements is collected by various city agencies and has historically taken months or years to analyze (such as annual census data, police records, and city tax records). Even within one specific agency, such as the police department, data may be collected by separate districts and not easily shared across the city and its surrounding communities.


As a result, city leaders have an abundance of information about how policies impacted people in their city in prior years, but it has been very challenging to share and leverage fast-changing data to make real-time decisions that can improve city life. What makes leveraging this data even more complicated
is the fact that data is managed and stored in separate silos. This causes problems because a direct relationship can exist between different aspects
of city operations. Policy makers are beginning to realize that change can only happen if they can use the available data and data from best practices to transform the current state of their environment. *The more complex a city, the more a need exists to leverage data to change things for the better.*

This is changing as policy makers, scientists, and technology innovators team up to implement policies based on data in motion. For example, to design and implement a program to improve city traffic congestion, you may need to collect data on population, employment figures, road conditions, and weather. Much of this data has been collected in the past, but it is stored in various silos and represents a static view of historical information. To make suggestions based on current streaming information, you need a new approach. Researchers at a technical university in Europe are collect- ing real-time traffic data from a variety of sources such as Global Positioning System (GPS) data from traveling vehicles, radar sensors on the roads, and weather data. They integrated and analyzed the streaming data to decrease traffic congestion and improve traffic flow. By analyzing both structured and unstructured data as events are taking place, the systems can assess current travel conditions and make suggestions on alternative routes that will cut down on traffic. Ultimately, the goal is to have a major impact on traffic flow in the city. *Data in motion* is evaluated in connection with *historical data* so that the **recommendations** make sense in context with actual conditions.

Streaming data can have a significant impact on lower crime rates in cities. For example, *a police department uses predictive analytics to identify crime patterns by time and location*. If a sudden change is found in an identified pattern to a new location, the police can dispatch officers to the right loca- tion at the right time. After the fact, this data can now be used to further analyze changes in criminal behavior patterns.


### Streaming Data in the Healthcare Industry
Big data is of enormous significance to the **healthcare industry** — including its use in everything from *genetic research* to advanced *medical imaging* and research on improving *quality of care*. While conducting big data analysis
in each of these areas is significant in furthering research, a major benefit
is applying this information to clinical medicine. If enough data is captured, this data can be applied practically and quickly at the right time to help save lives. Medical clinicians and researchers are using streaming data to speed decision making in hospital settings and improve healthcare outcomes for patients.

Doctors make use of large amounts of time-sensitive data when caring for patients, including results of lab tests, pathology reports, X-rays, and digital imaging. They also use medical devices to monitor a patient’s vital signs such as blood pressure, heart rate, and temperature. While these devices provide alerts when the readings go out of normal range, in some cases, preventive action could take place if doctors were able to receive an early warning. Subtle changes in a patient’s condition are often hard to pick up with a physical exam, but could be picked up by monitoring devices if a way existed to have more immediate access to the data.

Monitoring devices used in intensive care units generate thousands of readings every second. In the past, these readings have been summarized into one reading every 30–60 minutes. These devices were monitoring very large volumes of data, but because of technology limitation, much of that data was not available for analysis.

#### Capturing the data stream
Using streaming technology, a hospital university research team is able to capture the data stream from bedside monitors and process it using algo- rithms designed to look for *early warning signs* of serious infections. The data is used in real time to provide early warnings of changes in a patient’s condition. In some situations, doctors are finding that they are able to take corrective action to help a patient almost 24–36 hours earlier than without the data-streaming technology. Another benefit is the ability of doctors to compare the analysis to a database of patient outcomes that could provide additional insight.

### Streaming Data in the Energy Industry
Reducing energy consumption, finding new sources of renewable energy, and increasing energy efficiency are all important goals for protecting the envi- ronment and sustaining economic growth. Large volumes of data in motion are increasingly being monitored and analyzed in real time to help achieve these goals.

Many large organizations are using a variety of measures to ensure that they have the energy resources they need now and in the future. Nontraditional sources of energy, such as wind turbines, solar farms, and wave energy,
are becoming more realistic options as the price and scarcity of fossil fuels continue to be of concern. These organizations are generating and storing their own energy and need good real-time information to match the supply to demand. They use streaming data to measure and monitor energy demand and supply to improve their understanding of their energy requirements and to make *real-time decisions* about energy consumption.


#### Using streaming data to increase energy efficiency
Organizations are beginning to use streaming data to increase *energy efficiency*, as highlighted by the following two examples:

* A large university monitors streaming data on its energy consumption and integrates it with weather data to make *real-time adjustments* in energy use and production.

* Members of a business community collectively share and analyze streaming energy use data. This enables the companies in this com- munity to consume energy more efficiently and reduce energy costs. Streaming data enables them to monitor supply and demand and ensure that changes in demand are anticipated and kept in balance with supply.
￼

#### Using streaming data to advance the production of alternative sources of energy
Organizations are also beginning to use streaming data to help advance research and efficient production of alternative energy sources, as demonstrated by the following two examples:

* A research institution is using streaming data to understand the viability of using wave energy as source of renewable energy. Many different parameters, such as temperature, geospatial data, and moon and tide data, need to be collected. The organization uses monitoring devices, communications technology, cloud computing, and stream analytics to monitor and analyze the noise made by wave energy technology. The group is studying the impact of the noise levels on fish and other marine life.


* *A wind-farm company uses streaming data to create hourly and daily predictions about energy production.* The company collects turbine data, temperature, barometric pressure, humidity, precipitation, wind direction, and velocity from ground level up to 300 feet. The data comes for thousands of meteorological stations around the world and from its own company’s turbines. What does the company do with the data? It creates a model of wind flow to improve the *understanding of wind patterns and turbulence* near existing turbines. The resulting analytics are used to select the best location for its wind turbines and to reduce cost per kilowatt-hour of energy produced.

### Connecting Streaming Data to Historical and Other Real-Time Data Sources
The examples in this article demonstrate how companies can gain *value from streaming data*. The most important aspect of these types of outcomes requires the ability to understand *the context of the situation*. A doctor might see analysis that points to a particular disease. However, further analysis of other patients with similar symptoms and test results shows that other pos- sible diagnoses may exist. In a complicated world, data is valuable in taking action only in the context of how it is applied to a problem.



### References

[1] Judith Hurwitz, et. al, Big Data for Dummies, John Wiley & Sons, Inc, 2013.







