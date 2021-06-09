---
layout: post
title: Understanding Competencies
date: 2021-06-18
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Understanding Competencies of Machine Learning Systems and Building Human-AI Trust](https://www.aviationtoday.com/2020/07/20/understanding-competencies-machine-learning-systems-building-human-ai-trust/)


---


Understanding Competencies of Machine Learning Systems and Building Human-AI Trust
====


![](https://www.aviationtoday.com/wp-content/uploads/2020/07/mindful-bae.jpg)
BAE Systems' MindfuL technology, developed under a DARPA contract, helps build understanding of a machine learning system's capabilities by providing a user with statements such as these. (BAE Systems)

Greater incorporation of autonomy into aerospace will require more
understanding of how autonomous systems function, both for certification
and for effective partnership between these systems and their human
users.

Machine learning, commonly used for pattern analysis and recognition,
plays a major part in artificial intelligence for autonomy systems,
particularly in pairing with sensors and cameras (i.e. obstacle
avoidance, surveillance, search-and-rescue).


Improving our understanding of how ML systems work --- along with when
they are operating in unfamiliar contexts, and passing that information
on to a human in the loop --- is the subject of a DARPA project called
Competency-Aware Machine Learning (CAML).

CAML's objective is less about certification and more about providing
operators insight into the capabilities of a given machine learning
system, for example to assist in choosing the right ML assets for a
task, and offering real-time alerts when a task moves outside of a
system's competencies and user intervention is needed.

> "The goal is to increase the trust/competency understanding between the
user and the ML system by enabling the system to understand its own
competency, and have the capability to convey it to the users," DARPA
project manager Dr. Jiangying Zhou told *Avionics International*.

Since ML systems acquire their task-specific capabilities by analyzing
lots of data, the CAML program will augment the ML system during the
learning stage by enabling it to both learn how to do the task and
understand the conditions in the data under which it performs well or
poorly.

This is accomplished by keeping tack of scenarios the ML system
encounters in the data, finding a way to tie the scenario with how well
it performs the task, and keeping a memory of those experiences --- not
too different from how humans learn, according to Dr. Zhou.

> "We remember our experiences of doing a task and remember when we did
well and when we failed, and we make associations between our skills and
the conditions," Dr. Zhou said. "Then, we know when we have encountered
a scenario that we might not be able to do well. The CAML program is
trying to develop this capability, as a form of meta-learning, into the
ML system, so the ML can have a form of self-awareness of what is
learned to do.

One contracted company, BAE Systems, recently delivered to DARPA a CAML
software program it calls MindfuL, which the company describes as being
able to "audit" an ML system and provide end-users insight to build
trust in the technology, including a baseline capability to detect when
the system encounters a new environment for which it has not been
trained.

"The MindfuL system provides estimates of conditions which affect ML
performance, the underlying strategies the ML uses to perform the task,
and a predicted competency score," Julia Filiberti, a scientist at BAE
Systems' FAST Labs, told *Avionics*.

That competency score is determined by comparing past performance to a
presented scenario, identifying conditions for a proposed use of the
system through sensor data and comparing it to known experiences --- or
past situations and performance --- stored in the program's memory bank.

In the memory bank, the MindfuL system aggregates features of an
environment into "topics," such as "dark" or "rain" or "shiny," which
are then used to describe environments and compare them to new
experiences, therefore classifying sensor inputs as "familiar" or
"unfamiliar." The difference between a new environment and past
experiences is then calculated and presented to users as well as a
relative entropy score.

> "If a statistically significant relative entropy score is found, the
operator is alerted to the unfamiliar situation," Filiberti explained to
*Avionics*. "Alerting the user to untrained environments further
improves human understanding of the limitations and/or uncertainties
inherent to the underlying ML system; these alerts increase transparency
and build trust."

BAE's system communicates with the user through two interfaces. The
first, for live use during deployment, sends the user statements about
the program's capabilities compared to its current environment,
providing statements about conditions, strategies and performance
estimates as well as potentially recommending user actions, such as
manual override. The second interface allows the user to review data
from past experiences and label them to further improve the accuracy of
the system's output statements, as well as attaching
human-understandable context to machine-derived characteristics.

The MindfuL system was developed with size, weight and power (SWaP)
requirements in mind, according to Filiberti, using memory mechanisms
that reduce storage requirements for video sensory inputs by a factor of
40,000 or more, allowing experiences from 1 year of video sensor inputs
at a 55 megabyte/second data rate on less than 2 terabytes of storage.

BAE's solution also only needs to interact with the underlying ML system
during its training process; for real-time application, it just needs
access to the same sensor data ingested by the ML system.

DARPA's four-year program aims to develop general competency-aware
capabilities that can be incorporated into all ML systems, with
potential applications including autonomous navigation and obstacle
avoidance, UAV search and rescue, autonomous ground resupply vehicles,
self-driving taxis and missing planning. Targeted platforms include
unmanned air and ground system as well as robots.

> "The current focus of the program testing on image classification and
object identification," 

Filiberti said. 

>"We are pursuing application to
ground-vehicle navigation, leader-follower convoying, and satellite
imagery automated target recognition ... Within this year we will have
finished developing the capability to monitor several sensor data
streams simultaneously along with other ML systems on board, such as a
fault detection/response ML system."

One natural application of the MindfuL system, according to Filiberti,
is identifying degraded sensors, as environments will appear new when
input data is compromised and therefore bears less resemblance to a
system's training data.

BAE Systems also intends to explore route planning as an application of
the system, which could apply to ground, air or maritime autonomous
navigation.
