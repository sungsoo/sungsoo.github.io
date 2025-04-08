---
layout: post
title: Understanding the Differences between SDN and Server Virtualization 
date: 2015-07-02
categories: [computer science]
tags: [big data]

---


## Article Source
* Title: [Understanding the Differences between SDN and Server Virtualization](http://www.ingrammicroadvisor.com/big-data/understanding-the-differences-between-sdn-and-server-virtualization)

---

# Understanding the Differences between SDN and Server Virtualization 

As big data demands stretch established network infrastructures, IT
architects have been adopting new strategies to expand the capabilities
of enterprise networks. Big data requires rapid access to vast pools of
data and the computing power to analyze that data, but conventional
network design just doesn’t offer the bandwidth or the capacity. That’s
why more big data infrastructures are increasingly relying on both
server virtualization and [software-defined
networking](/big-data/big-data-consulting-tip-choosing-the-best-sdn-application)(SDN).
Although these two strategies have similarities, understanding the
differences between them is important when designing an efficient big
data infrastructure.

The value of SDN and virtualization has been documented. According
to[Infonetics
Research](http://www.rcrwireless.com/20141105/software-defined-networking-sdn/sdn-nfv-market-to-hit-11b-in-sales-by-2018-tag2),
the global service provider market for SDN and network function
virtualization (NFV) will grow from less than $500 million in sales to
$11 billion by 2018, with NFV making up the majority of the market.[IDC
analysts also
note](http://searchitchannel.techtarget.com/feature/SDN-market-Opportunity-or-disruption-for-channel-partners)
that the growing adoption of SDN and virtualized servers will mean VARs
need to rethink their sales strategies. Hardware will have a longer
useful lifespan and become less mission-critical as the emphasis moves
to software management. Those VARs specializing in selling services
rather than boxes will be prepared for the coming boom.

Virtualization and SDN 
----------------------

So what are the[differences between SDN and
NFV,](/big-data/5-differences-between-sdn-and-network-functions-virtualization)
and what do those differences mean for big data deployment? Though both
strategies impose software controls over the physical network, the
differences are important.

Network virtualization enables network administrators to keep up with
network changes by automating responses. Network virtualization provides
an overlay that tunnels the connection between logical network segments.
Rather than having to maintain a physical connection, software manages
the flow service between virtual machines (VMs). That makes it easier
for network managers to implement changes on top of the infrastructure
without having to reconfigure specific servers or routers.

Once you have the capacity to connect virtual machines, you can use
[NFV](/big-data/what-is-network-functions-virtualization-and-is-it-better-than-sdn)
to add functions such as firewalls and load balancing on top of the
virtual connection. Just as administrators can create VMs in software,
they also can create virtual functions such as firewalls or intrusion
protection as part of the connection. Virtualization leverages x86
servers, which saves hardware costs and allows you to build an
abstraction on top of the network. The result is fast, efficient service
provisioning without manual configuration.

[Software-defined
networking](/big-data/7-advantages-of-software-defined-networking) goes
further. While virtualized servers abstract services in the data center,
SDN decouples the network control and forwarding functions from the
underlying infrastructure, including applications and network services.
SDN separates the control plane (which controls where the data goes)
from the data plane (which forwards packets to their destination) to
make it easier to dynamically provision an entire network using
software. Data traffic relies on switches that are controlled using
standard control protocol such as OpenFlow.

While virtualizations add functions to the physical network, SDN
actually changes the physical network by providing a new way to
provision and manage the infrastructure. Whereas virtualization can take
place using existing server hardware and data traffic, SDN uses switches
and requires a new network construct where the control and data planes
are separate. 

How Virtual Servers and SDN Contribute to Big Data 
--------------------------------------------------

Both virtualized servers and SDN play distinct roles in big data
systems.

Server virtualization makes it possible to scale services as needed to
handle large volumes and various types of data for analysis.
Virtualization has three specific characteristics that support
scalability and efficiency:

1.  **Partitioning** – Multiple applications and operating systems can
    be supported in a single physical system by partitioning available
    resources.
2.  **Isolation** – Each VM is isolated from the physical system and
    other VMs, so if one VM crashes, the rest of the system isn’t
    affected.
3.  **Encapsulation** – A VM can be identified as a single file so it’s
    easy to identify based on the services it provides. 

In the context of big data, what this all means is that the virtual
system can scale to handle big data analysis, even if it’s unclear if
there will be demand for extremely large data sets.

Whereas server virtualization makes it easier to handle big data
analytics, SDN makes it possible to deliver data and computing resources
from anywhere in the enterprise or in the cloud. SDN can be used to
program the switches to deliver optimal data flow, thus ensuring better
QoS between servers and cloud resources.

SDN makes it possible to manage traffic for large volumes of data.  
[SDN is](https://www.opennetworking.org/sdn-resources/sdn-definition): 

1.  **Programmable** – Network control can be programmed as a standalone
    function because it is decoupled from forwarding.
2.  **Dynamic** – By abstracting control and forwarding, adjusting for
    traffic flow across the network is easier for accommodating changing
    needs.
3.  **Centrally managed** – Network intelligence is localized in the SDN
    controllers, which maintain a global view of the network.
    Controllers appear to applications and policy engines as a single,
    logical switch.
4.  **Open**– Network managers can configure, manage, and optimize
    network resources quickly using automated SDN program. Because SDN
    is based on open standards such as OpenFlow, IT managers can write
    the programs themselves because they are not hardware-dependent.

 So server virtualization and SDN both play a role in optimizing big
data systems. Virtualized servers create more efficiency for data
handling and analytics at the data center level, while SDN makes it
possible to integrate an extensive set of computing and storage
resources, including cloud systems, almost on demand. Taken together,
virtualized servers and SDN deliver the agility and speed that big data
systems need to be effective and deliver ROI.

