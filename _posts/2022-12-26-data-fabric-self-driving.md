---
layout: post
title: Data Fabric for Self-Driving Cars
date: 2022-12-26
categories: [computer science]
tags: [big data]

---

### Article Source

* [Data Fabric for Self-Driving Cars](https://medium.com/@bhbenam/data-fabric-for-self-driving-cars-d9bd16077ed4)


---

# Data Fabric for Self-Driving Cars

> How important is data for AI applications in the automotive industry

![](https://miro.medium.com/max/1400/1*gTKpW04SfIdZp-I_rmGzag.webp)

Photo by [NASA](https://unsplash.com/@nasa?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/data-center?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

The amount of data is growing exponentially, and with each passing day, data management becomes more significant to making the right decisions in the AI application. **Data is the future engine of the vehicle.** Expert heads deal with questions about the efficient storage and use of data or the required access rate and how they can be made climate-friendly for large amounts of data.

Embedded or edge devices have limited memory, communication rate, energy, and processing power resources. Still, they must be able to access all collected data that help to make an accurate decision. **Data Fabric is a data architecture that optimizes access to distributed data.**

Different applications require data management in different usage levels, mobile edge devices, IoT devices, sensors, and the cloud. There are functional and non-functional requirements for data storage. This article discusses a couple of essential needs and partially available solutions in the automotive industry, focusing on autonomous driving applications.

## Data Availability and performance guarantee
The data should be available at a certain speed for different applications that use the data fabric. This requirement leads to another requirement: **the data must be in the right place when it is needed to meet the speed requirements.** Autonomous vehicles have cellular and WiFi access, and some of the data that is not produced or collected in the vehicle has specific performance and availability requirements that need to be met depending on the functionality.

**In automotive applications and especially in autonomous driving, decision-making by the vehicle is only possible if the infrastructure sensor data is available in the car at the right time, considering the data transmission and processing time in the application.** At the same time, the same infrastructure sensor data could be less critical for other autonomous vehicles. Still, it could become relevant later depending on the vehicle's location and activated functionalities.

## Highly scalable
Data volume and bandwidth scaling are essential as the number of infrastructure sensors and vehicles communicating via V2V increases over time. **Autonomous cars generate a large amount of data as many sensors are connected to such vehicles to provide environmental information that is very important for safe driving.**

**Extending the data fabric towards the supply chain helps avoid additional effort for interfaces between the manufacturer and suppliers and also within suppliers.**

The scaling of data from vehicle design and manufacturing to component-level design and manufacturing on the supplier side allows the manufacturer to have the same data management strategy. **The data will continue to be scaled after production while the vehicle is on the road, collecting further data for optimization and training of AI applications. A scalable data fabric reduces data management and maintenance costs.**

## Safe data storage
Data loss as a failure mode of data storage should be addressed by storage technology. Data loss has a runtime aspect that the application data needs additional metadata to recover the original data in case of data corruption. Another aspect of safe data is to keep data safe for a long time while the project is running, e.g., training, test, or validation data used to deploy an AI application.

**Self-driving cars are highly dependent on traffic data and must be regularly updated and used by all autonomous vehicles to make real-time decisions.** Considering a holistic strategy, data should be collected from all moving vehicles, static objects, and infrastructure sensors in a data fabric, making it safe, consistent, and accessible to all stakeholders.

## Data integrity

Unauthorized persons should not have access to your data. The data flow from the edge device to the data center should be secured end-to-end. Hardware-level data encryption and decryption improve storage access. In general, hardware and software security solutions help become flexible against ransomware attacks. **Metadata in a data fabric facilitates privacy, security, and governance.**

## Power consumption and sustainability
Based on [Intel's analysis](https://newsroom.intel.com/editorials/krzanich-the-future-of-automated-driving/#gs.vamjgi), an autonomous vehicle collects four terabytes (4000 GB) of sensor data per day. Collecting massive data on edge devices like vehicle ECUs consumes high electric power to store and access the data. The data owner needs fast data access with minimal power consumption, especially on resource-constrained devices.

Another aspect is the heat generated by the memory components. **Optimizing power consumption in a data fabric is as important as the performance requirements like data access when processing a large amount of data, and this requirement can be fulfilled through uniform access to all memory cells.**

**Such systems should anticipate the heat generated and distribute memory storage and access to disperse the heat.** This feature provides a sustainable data storage solution, increases system availability, and makes the system fault-tolerant due to seamless utilization of all memory cells.

## Summary

Data Fabric is the next transformation to distribute data where it is needed with the fastest and most efficient access. **AI applications need to take full advantage of the edge, private cloud, and public cloud to achieve data efficiency and reliability as a fundamental element of an AI application.** For automotive AI applications, this is more important due to the large amount of sensor data collected and the real-time nature of the data.