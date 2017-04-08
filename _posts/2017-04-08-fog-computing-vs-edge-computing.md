---
layout: post
title: Fog Computing vs. Edge Computing
date: 2017-04-08
categories: [computer science]
tags: [big data]

---

## Article Source

* Title: [Fog Computing vs. Edge Computing: What’s the Difference?](https://www.automationworld.com/fog-computing-vs-edge-computing-whats-difference)
* Authors: David Greenfield

---

Fog Computing vs. Edge Computing: What’s the Difference?
===


As companies explore the Internet of Things, *fog computing* and *edge computing* take center stage as strategic ways of dealing with the plethora of data to be analyzed and acted upon. But just how different are they?

The rise in interest around the *Industrial Internet of Things* (**IIoT**) has
introduced a variety of new technologies and strategies to deal with all
the production-related data at the core of IIoT. While many of these
technologies are not necessarily new, they are often unfamiliar to
industry and require a bit of explanation. This is definitely the case
with the terms edge computing and fog computing.

Over the past year I have heard both terms used frequently and often
interchangeably. I wanted to find out just how different they are, so I
spoke with David King, CEO of [FogHorn Systems](http://foghorn-systems.com) (a developer of edge intelligence software for industrial and commercial IoT — more about them later) and
Matt Newton, director of technical marketing at [Opto
22](http://opto22.com) (a manufacturer of controllers, I/O, relays and
software for linking devices to networks).

Newton explained that “both fog computing and edge computing involve
pushing intelligence and processing capabilities down closer to where
the data originates” from pumps, motors, sensors, relays, etc.

“The key difference between the two architectures is exactly where that
intelligence and computing power is placed,” he said. According to
Newton:

-   Fog computing pushes intelligence down to the local area network
    level of network architecture, processing data in a fog node or IoT
    gateway.
-   Edge computing pushes the intelligence, processing power and
    communication capabilities of an edge gateway or appliance directly
    into devices like programmable automation controllers (PACs).

“Many in industry indeed use the terms fog computing and edge computing
(or edge processing) interchangeably,” said King. “Edge computing is
actually an older expression that predates the fog computing term. By
way of background, Cisco created the term fog computing years ago to
describe a layer of computing at the edge ofthe network that could allow
pre-processed data to be quickly and securely transported to the cloud.
While Cisco certainly mastered the secure transport aspects of fog
computing from the earliest days of IoT, very little has been done until
recently to effectuate the data processing aspects of fog computing in
real world IIoT use cases.”

<iframe width="600" height="400" src="https://www.youtube.com/embed/pdmyYbdLnkI" frameborder="0" allowfullscreen></iframe>

Getting into a bit more detail to differentiate the two terms, Newton
explained the process for transporting data in fog computing. “The data
from the control system program is sent to an OPC server or protocol
gateway, which converts the data into a protocol Internet systems
understand, such as MQTT or HTTP ([read *Automation World* coverage explaining MQTT’s use in IIoT](http://www.automationworld.com/will-messaging-eliminate-proprietary-protocols)).
Then the data is sent to another system, such as a fog node or IoT
gateway on the LAN, which collects the data and performs higher-level
processing and analysis. This system filters, analyzes, processes, and
may even store the data for transmission to the cloud or WAN at a later
date. Fog computing’s architecture relies on many links in a
communication chain to move data from the physical world of our assets
into the digital world of information technology. Each of these links is
a potential point of failure.”

<iframe width="600" height="400" src="https://www.youtube.com/embed/7AmpvtAtBaE" frameborder="0" allowfullscreen></iframe>

According to Newton, edge computing 

> "simplifies this communication chain and reduces potential points of failure by wiring physical assets like pumps and motors into an intelligent PAC to collect, analyze and process data from the physical assets while also running the control system program. PACs then use edge computing capabilities to determine what data should be stored locally or sent to the cloud for further analysis. In edge computing, intelligence is literally pushed to the network edge, where our physical assets are first connected together and where IoT data originates.”

<iframe width="600" height="400" src="https://www.youtube.com/embed/RjMS15V_7nQ" frameborder="0" allowfullscreen></iframe>

As it’s name suggests, FogHorn Systems is an advocate of fog computing,
but with what they say is a new twist on the process. King says they are
focusing on improving the fog computing concept because “edge computing
is not scalable and you can't see across multiple machines or processes
with it. Our approach is to move as close to the source as possible
without being trapped at the individual machine level.”

King was limited in the amount of detail he was able to share when we
spoke, as the company will be making its initial product announcement
within the next couple of months. However, he pointed out that FogHorn’s
technology has already been deployed in numerous IIoT applications with
GE (a lead investor in FogHorn's funding) as well as with non-GE
partners and end customers. Other industrial companies investing in
FogHorn include Bosch and Yokogawa.

Expaining that FogHorn's technology is different from other fog or edge
computing offerings in themarket, King said it “goes beyond simple data
filtering and data normalization and does not use basic rules engine
logic as an on-premise front-end connector for cloud-based analytics.
We’re applying a new intelligent layer at or near the source of the data
in a fog gateway to filter and normalize the data before passing it to
the cloud.”

I hope this information makes it easier for you to determine the difference between edge computing and fog computing—as you’re sure to be hearing a lot more about both in the years ahead. It’s especially important to have this base of understanding since there will soon be more companies and products out there that seek to evolve existing technologies for application in an industrial setting, as FogHorn Systems is doing with its forthcoming product and Opto 22 recently did by incorporating a [RESTful API and server into its PACs](http://www.automationworld.com/controllers-adapt-changing-industry).


