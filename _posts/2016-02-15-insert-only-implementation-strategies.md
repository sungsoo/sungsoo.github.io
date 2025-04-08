---
layout: post
title: Insert-Only Implementation Strategies
date: 2016-02-15
categories: [computer science]
tags: [data management, htap]

---


# Insert-Only Implementation Strategies

In principle, there are two ways to implement the *insert-only* concept at the database level: *point representation*, which stores only the *delta* of the new tuple to the old one with a single timestamp, and *interval representation*, which stores the *full* tuple including additional information that is used to determine the time span of its validity.


## Point Representation

In the case of an update, this implementation strategy only stores the *delta of the changed value* at a specific point in time. This significantly reduces the amount of data required for each insert operation. In addition, not all columns have to be touched for this operation; that is, only the changed attribute(s) and the timestamp of insertion. To modify data, not the whole row needs to be touched, because all non-changed attributes can be filled with a default value for not changed. When retrieving the tuple, however, all older versions have to be read to restore the full tuple and to determine the current valid value.

This implementation strategy is best suited for OLTP applications, since the critical operation is the insertion of new or changed data tuples. The insert operation must be performed quickly while the need for further post-processing of inserted data is eliminated. The main drawback of this method is the requirement to touch and aggregate all older versions of the data to reconstruct the valid version for a specific time. This becomes more expensive if there are a lot of changes within the data.


## Interval Representation

The second way of implementing the insert-only approach is to *store each new tuple explicitly* by using an interval-based representation with timestamps. When performing a logical update to a tuple, it has to be determined which of the tuples is the most recent. This can be achieved by storing an additional insertion timestamp or an automatically incremented identifier. Thus, the database system has to ensure that just the most recent tuple is returned at query time. In detail, the interval representation can be implemented by storing two timestamps for each row: `valid from` and `valid to`. When a new tuple is inserted only the `valid from` timestamp is set and the `valid to` timestamp is left open. As soon as an update to a tuple is received, the valid to field of the old tuple is set to the current timestamp, and the new tuple is saved like a new insertion. Although the old tuple has to be touched, the advantage is improved search performance. Since the validity interval is already stored for each tuple, it is simple to find the correct matching tuple without touching all old data. These timestamps also enable applications to *time travel* and retrieve data that was valid at a certain point in time by filtering the data based on the valid from and valid to timestamps. *Time travel* is also possible with the point representation; yet, it is more expensive. The interval representation is best suited for applications where reading is the most *dominant data access pattern*      , which is commonly found in OLAP applications. To achieve the best possible performance it is reasonable to retrieve the desired value by the read operation directly, that is, without the need for any preprocessing.
