---
layout: post
title: Choosing distribution models
date: 2014-06-07
categories: [computer science]
tags: [data management]

---

[![](http://sungsoo.github.com/images/distribution-models.png)](http://sungsoo.github.com/images/distribution-models.png)

---

# Choosing distribution models: master-slave versus peer-to-peer


From a distribution perspective, there are two main models: *master-slave* and *peer-to-peer*. Distribution models determine the responsibility for processing data when a request is made.

Understanding the pros and cons of each distribution model is important when you’re looking at a potential big data solution. Peer-to-peer models may be more *resilient to failure* than master-slave models. Some master-slave distribution models have *single points of failure* that might impact your system availability, so you might need to take special care when configuring these systems.


Distribution models get to the heart of the question *who’s in charge here?* There are two ways to answer this question: **one node** or **all nodes**. In the master-slave model, one node is in charge (*master*). When there’s no single node with a special role in taking charge, you have a peer-to-peer distribution model.

Figure 6.7 shows how these models each work.

![](http://sungsoo.github.com/images/master-slave-vs-peer-to-peer.png)

Let’s look at the trade-offs. With a master-slave distribution model, the role of managing the cluster is done on a single master node. This node can run on *specialized hardware* such as RAID drives to lower the probability that it crashes. The cluster can also be configured with a standby master that’s continually updated from the master node. The challenge with this option is that it’s difficult to test the standby master without jeopardizing the health of the cluster. Failure of the standby master to take over from the master node is a real concern for high-availability operations.


Peer-to-peer systems distribute the responsibility of the master to each node in the cluster. In this situation, testing is much easier since you can remove any node in the cluster and the other nodes will continue to function. The disadvantage of peer-to-peer networks is that there’s an increased *complexity* and *communication overhead* that must occur for all nodes to be kept up to date with the cluster status.


The initial versions of Hadoop (frequently referred to as the 1.x versions) were designed to use a master-slave architecture with the NameNode of a cluster being responsible for managing the status of the cluster. NameNodes usually don’t deal with any MapReduce data themselves. Their job is to manage and distribute queries to the correct nodes on the cluster. Hadoop 2.x versions are designed to remove *single points of failure* from a Hadoop cluster.


Using the right distribution model will depend on your business requirements: if high availability is a concern, a peer-to-peer network might be the best solution. If you can manage your big data using batch jobs that run in off hours, then the simpler master-slave model might be best. As we move to the next section, you’ll see how MapReduce systems can be used in multiprocessor configurations to process your big data.

# References
[1] DAN MCCREARY ANN KELLY, *Making Sense of NoSQL: A GUIDE FOR MANAGERS AND THE REST OF US*, pp.137-138, MANNING Publications, 2014.