---
layout: post
title: Potential Novel Applications of Open SDN
date: 2015-07-16
categories: [computer science]
tags: [big data]

---

## Potential Novel Applications of Open SDN

There is considerable active research related to SDN as well as many novel use cases being proposed that illustrate potential new areas where SDN can be applied or improved. In this section we present a sampling of some of the areas that promise to increase the scope of applications of Open SDN and thus broaden the foundation of its future.

A full survey of SDN-related research is beyond the scope of this work. A number of recent conferences have focused on SDN research. The proceedings of these conferences provide a good review of current research trends in this area. 

Here we have selected a number of areas of potential application of Open SDN with the intent of giving the reader a flavor of the areas of application that radically depart from those that we have
described during the bulk of this work. It is our hope that this discussion will underscore that this new network programming paradigm opens the doors to many possibilities, only a few of which have already been explored.

## Managing Nontraditional Physical Layer Links

There is growing interest in using OpenFlow to control devices that have flows but are not traditional packet switches. The two most promising areas involve flows over optical and wireless links. In Section 8.7.1 we presented a use case in which SDN was used for offloading elephant flows onto optical devices. This represents one example of the general area of using OpenFlow to manage flows over physical layers that are outside the domain of classical LANs and WANs. 

The researchers formalize the study of how to map big data applications to an OpenFlow network. An elephant flow is an example of a big data application. The authors propose mechanisms to build on the existing Hadoop2 job-scheduling method to optimize how and when to schedule jobs over the optical links. They point out that unlike the more classical SDN use cases of cloud network provisioning and WAN traffic engineering such big-data jobs require more rapid and frequent updates of the flow tables on the switches. They conclude that current OpenFlow switches are capable of handling their predicted number and frequency of flow table changes. They believe that there may be challenges in keeping the various flow tables across the network switches synchronized with this rate of flow table changes. This is important because one of the problems in traditional networks was the relatively slow convergence time in the face of routing changes. At the fine granularity of flow table changes being made to route these big-data flows, slow convergence times may be an issue for optical offload.

Because of the ease of installing wireless backhaul links to bring mobile traffic back to the core from *radio access network* (RAN) cells, wireless backhaul is becoming increasingly popular. One of the challenges in doing this is that the effective bandwidth of a wireless link is not constant, as in its wired counterpart. OpenFlow is proposed as a mechanism to segregrate traffic from different providers and different types into separate flows that are then transmitted over a single shared wireless backhaul medium. In the example, the wireless backhaul technology is 802.16. Although the segregation of different traffic types for differential QoS treatment is well established, in the example the wireless backhaul link is potentially shared by a number of different colocated RAN technologies (e.g., LTE, 3G, WiFi) that may be offered by several different operators. The wireless backhaul provider may have different SLAs with each of those operators and for each operator different levels of service, depending on the terminating RAN technology, traffic type, or business agreement. Since the wireless backhaul bandwidth capability itself may vary due to environmental conditions, the process of satisfying all of the various SLA commitments becomes far more complex and can benefit from OpenFlow’s ability to segregate the traffic into different flows and route or police those flows dynamically with the changing wireless conditions.