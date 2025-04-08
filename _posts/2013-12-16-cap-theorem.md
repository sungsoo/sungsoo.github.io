---
layout: post
title: Understanding trade-offs with Brewer’s CAP theorem
date: 2013-12-16 
categories: [computer science]
tags: [big data]

---

In order to make the best decision about what to do when systems *fail*, you need to consider the properties of *consistency* and *availability* when working with distributed systems over unreliable networks.

Eric Brewer first introduced the ***CAP theorem*** in 2000. The CAP theorem states that any distributed database system can have at most two of the following three desirable properties:


* *Consistency*—Having a single, up-to-date, readable version of your data available to all clients. This isn’t the same as the consistency we talked about in ACID. Consistency here is concerned with multiple clients reading the same items from replicated partitions and getting consistent results.


* *High availability*—Knowing that the distributed database will always allow database clients to update items without delay. Internal communication failures between replicated data shouldn’t prevent updates.

* *Partition tolerance*—The ability of the system to keep responding to client requests even if there’s a communication failure between database partitions. This is analogous to a person still having an intelligent conversation even after a link between parts of their brain isn’t working.


Remember that the CAP theorem only applies in cases when there’s a broken connection between partitions in your cluster. The more reliable your network, the *lower* the probability you’ll need to think about CAP.


The CAP theorem helps you understand that once you partition your data, you must consider the *availability-consistency spectrum* in a network failure situation. Then the CAP theorem allows you to determine which options best match your busi- ness requirements. Figure 2.10 provides an example of the CAP application.

![http://sungsoo.github.com/images/partition-decision.png](http://sungsoo.github.com/images/partition-decision.png)

The client writes to a primary master node, which replicates the data to another backup slave node. CAP forces you to think about whether you accept a write if the communication link between the nodes is *down*. If you accept it, you must take responsibility for making sure the remote node gets the update at a later time, and you risk a client reading inconsistent values until the link is restored. If you refuse the write, you sacrifice availability and the client must retry later.

Although the CAP theorem has been around since 2000, it’s still a source of confusion. The CAP theorem limits your design options in a few rare end cases and usually only applies when there are *network failures* between data centers. In many cases, reliable message queues can quickly restore consistency after network failures.

The rules about when the CAP theorem applies are summarized in figure 2.11.

![http://sungsoo.github.com/images/cap-theorem.png](http://sungsoo.github.com/images/cap-theorem.png)

Tools like the CAP theorem can help guide database selection discussions within an organization and prioritize what *properties* (*consistency*, *availability*, and *scalability*) are most important. If high consistency and update availability are simultaneously required, then a *faster single processor* might be your best choice. If you need the scale-out benefits that distributed systems offer, then you can make decisions about
your need for *update availability* versus *read consistency* for each transaction type. 

Whichever option you choose, the CAP theorem provides you with a formal process that can help you weigh the pros and cons of each SQL or NoSQL system, and in
the end you’ll make an informed decision.


###References

[1] DAN MCCREARY ANN KELLY, Making Sense of NoSQL: A GUIDE FOR MANAGERS AND THE REST OF US, pp.4-9, MANNING Publications, 2014. 