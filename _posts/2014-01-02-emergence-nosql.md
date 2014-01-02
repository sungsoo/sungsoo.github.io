---
layout: post
title: “ The Emergence of NoSQL”
date: 2014-01-02
categories: [computer science]
tags:[NoSQL, big data]

---


“It’s a wonderful irony that the term “NoSQL” first made its appearance in the late 90s as the name of an open-source relational database [Strozzi NoSQL]. Led by Carlo Strozzi, this database stores its tables as ASCII files, each tuple represented by a line with fields separated by tabs. The name comes from the fact that the database doesn’t use SQL as a query language. Instead, the database is manipulated through shell scripts that can be combined into the usual UNIX pipelines. Other than the terminological coincidence, Strozzi’s NoSQL had no influence on the databases we describe in this book.
The usage of “NoSQL” that we recognize today traces back to a meetup on June 11, 2009 in San Francisco organized by Johan Oskarsson, a software developer based in London. The example of BigTable and Dynamo had inspired a bunch of projects experimenting with alternative data storage, and discussions of these had become a feature of the better software conferences around that time. Johan was interested in finding out more about some of these new databases while he was in San Francisco for a Hadoop summit. Since he had little time there, he felt that it wouldn’t be “feasible to visit them all, so he decided to host a meetup where they could all come together and present their work to whoever was interested.
Johan wanted a name for the meetup—something that would make a good Twitter hashtag: short, memorable, and without too many Google hits so that a search on the name would quickly find the meetup. He asked for suggestions on the #cassandra IRC channel and got a few, selecting the suggestion of “NoSQL” from Eric Evans (a developer at Rackspace, no connection to the DDD Eric Evans). While it had the disadvantage of being negative and not really describing these systems, it did fit the hashtag criteria. At the time they were thinking of only naming a single meeting and were not expecting it to catch on to name this entire technology trend [Oskarsson].
The term “NoSQL” caught on like wildfire, but it’s never been a term that’s had much in the way of a strong definition. The original call [NoSQL Meetup] for the meetup asked for “open-source, distributed, nonrelational databases.” The talks there [NoSQL Debrief] were from Voldemort, Cassandra, Dynomite, HBase, Hypertable, CouchDB, and MongoDB—but the term has never been “confined to that original septet. There’s no generally accepted definition, nor an authority to provide one, so all we can do is discuss some common characteristics of the databases that tend to be called “NoSQL.”
To begin with, there is the obvious point that NoSQL databases don’t use SQL. Some of them do have query languages, and it makes sense for them to be similar to SQL in order to make them easier to learn. Cassandra’s CQL is like this—exactly like “SQL (except where it’s not)” [CQL]. But so far none have implemented anything that would fit even the rather flexible notion of standard SQL. It will be interesting to see what happens if an established NoSQL database decides to implement a reasonably standard SQL; the only predictable outcome for such an eventuality is plenty of argument.”




### References
[1] Martin Fowler. “NoSQL Distilled: A Brief Guide to the Emerging World of Polyglot Persistence.”, Addison-Wesley, 2013.