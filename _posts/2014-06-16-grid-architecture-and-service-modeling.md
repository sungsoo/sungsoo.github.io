---
layout: post
title: Grid Architecture and Service Modeling
date: 2014-06-16
categories: [computer science]
tags: [parallel computing]

---

[![](http://sungsoo.github.com/images/grid-computing.png)](http://sungsoo.github.com/images/grid-computing.png)


---

# Grid Architecture and Service Modeling


The grid is a *metacomputing* infrastructure that brings together computers (PCs, workstations, server clusters, supercomputers, laptops, notebooks, mobile computers, PDAs, etc.) to form a large collection of compute, storage, and network resources to solve large-scale computation problems or to enable fast information retrieval by registered users or user groups. The coupling between hardware and software with special user applications is achieved by leasing the hardware, software, middleware, databases, instruments, and networks as computing utilities. Good examples include the renting of expensive special-purpose application software on demand and transparent access to human genome databases.

The goal of grid computing is to explore fast solutions for large-scale computing problems. This objective is shared by computer clusters and *massively parallel processor* (MPP) systems we have learned about in Chapter 2 [1]. However, grid computing takes advantage of the existing computing resources scattered in a nation or internationally around the globe. In grids, resources owned by different organizations are aggregated together and shared by many users in collective applications. Grids rely heavy use of LAN/WAN resources across enterprises, organizations, and governments. The *virtual organizations* or *virtual supercomputers* are new concept derived from grid or cloud computing. These are virtual resources dynamically configured and are not under the full control of any single user or local administrator.





## Grid History and Service Families


Network-based distributed computing becomes more and more popular among the Internet users. Recall that the Internet was developed in the 1980s to provide computer-to-computer connections using the *telnet://* protocol. The web service was developed in the 1990s to establish direct linkage between web pages using the *http://* protocol. Ever since the 1990s, grids became gradually available to establish large pools of shared resources. The approach is to link many Internet applications across machine platforms directly in order to eliminate isolated resource islands. We may invent upgraded protocols in the future like “*grid://*” and “*cloud://*” to realize this dream of a socialized cyberspace with greater resource sharing.

The idea of the grid was pioneered by Ian Foster, Carl Kesselman and Steve Tuecke in a 2001 paper. With is ground work, they are often recognized as the fathers of the grids. The Globus Project supported by DARPA has promoted the maturity of grid technology with a rich collection of software and middleware tools for grid computing. In 2007, the concept of cloud computing was thrown out, which in many ways was extending grid computing through virtualized data centers. In this beginning section, we introduce major grid families and review the grid service evolution over the past 15 years.

Grids differ from conventional HPC clusters. Cluster nodes are more homogeneous machines that are better coordinated to work collectively and cooperatively. The grid nodes are heterogeneous computers that are more loosely coupled together over geographically dispersed sites. In 2001, *Forbes Magazine* advocated the emergence of the *great global grid* (GGG) as a new global infrastructure. This GGG evolved from the *World Wide Web* (WWW) technology we have enjoyed for many years. Four major families of grid computing systems were suggested by the *Forbes* GGG categorization as summarized in Table 7.1. We will study some of the listed grids in subsequent sections.

![](http://sungsoo.github.com/images/four-grid.png)


## Four Grid Service Families

Most of today’s grid systems are called *computational grids* or *data grids*. Good examples are the NSF TeraGrid installed in the United States and the DataGrid built in the European Union. *Information* or *knowledge grids* post another grid class dedicated to knowledge management and distributed ontology processing. The Semantic web, also known as *semantic grids*, belongs to this faimly. Ontology platform falls into information or knowledge grids. Other information/knowledge grids include the Berkeley BOINC and NASA’s Information Power Grid.

In the business world, we see a family, called *business grids*, built for business data/information processing. These are represented by the HP eSpeak, IBM WebSphere, Microsoft .NET, and Sun One systems. Some business grids are being transformed into *Internet clouds*. The last grid class includes several grid extensions such as *P2P grids* and parasitic grids. This chapter will concentrate mainly in computational or data grids. Business grids are only briefly introduced. We will further compare grids with P2P networks and P2P grids in Chapter 8 [1].


## Grid Service Protocol Stack

To put together the resources needed in a grid platform, a layered grid architecture is shown in Figure 7.1. The top layer corresponds to user applications to run on the grid system. The user applications demand collective services including collective computing and communications. The next layer is formed by the hardware and software resources aggregated to run the user applications under the collective operations. The connectivity layer provides the interconnection among drafted resources. This connectivity could be established directly on physical networks or it could be built with virtual networking technology.


![](http://sungsoo.github.com/images/layered-grid.png)


The connectivity must support the grid fabric, including the network links and virtual private channels. The fabric layer includes all computational resources, storage systems, catalogs, network resources, sensors, and their network connections. The connectivity layer enables the exchange of data between fabric layer resources. The five-layer grid architecture is closely related to the layered Internet protocol stack shown on the right-hand side of Figure 7.1. The fabric layer corresponds to the link layer in the Internet stack. The connectivity layer is supported by the network and transport layers of the Internet stack. The Internet application layer supports the top three layers.




## Grid Resources


Table 7.2 summarizes typical resources that are required to perform grid computing. Many existing protocols (IP, TCP, HTTP, FTP, and DNS) or some new communication protocols can be used to route and transfer data. The resource layer is responsible for sharing single resources. An interface is needed to claim the static structure and dynamic status of local resources. The grid should be able to accept resource requests, negotiate the *Quality of Service* (QoS), and perform the operations specified in user applications.

![](http://sungsoo.github.com/images/control-operations.png)

The collective layer handles the interactions among a collection of resources. This layer implements functions such as resource discovery, co-allocation, scheduling, brokering, monitoring, and diagnostics. Other desired features include replication, grid-enabled programming, workload management, collaboration, software discovery, access authorization, and community accounting and payment. The application layer comprises mainly user applications. The applications interact with components in other layers by using well-defined APIs (*application programming interfaces*) and SDKs (*software development kits*).



# References
[1] Kai Hwang, Geoffrey C. Fox and Jack J. Dongarra, *Distributed and Cloud Computing; From Parallel Processing to Internet of Things*, Morgan Kaufmann Publishers, 2012.