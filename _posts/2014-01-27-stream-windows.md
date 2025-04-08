---
layout: post
title: Stream Windows
date: 2014-01-27
categories: [computer science]
tags: [big data]

---

Stream Windows
---
From the system’s point of view, it is *infeasible* to store an entire stream. From the user’s point of view, *recently arrived* data may be more useful. This motivates the use of *windows* to restrict the scope of continuous queries. **Windows** may be classified according the following criteria.

1. *Direction of movement*: Fixed starting and ending points define a *fixed window*. Moving starting and ending points (either forward or backward) creates a *sliding window*. The starting and ending points typically slide in the same direction, although it is possible for both to slide outwards, starting from a common position (creating an *expanding window*), or for both to slide inwards, starting from fixed, positions (creating a *contracting window*). One fixed point and one moving point define a *landmark window*. Usually, the starting point is fixed, and the ending point moves forward in time. There are a total of *nine* possibilities as the beginning and ending points may independently be fixed, moving forward or moving backward.  
2. *Definition of contents*: Logical or *time-based* windows are defined in terms of a time interval, e.g., a time-based sliding window may maintain the last ten minutes of data. Physical (also known as *count-based* or *tuple-based* ) windows are defined in terms of the number of tuples, e.g., a count-based sliding window may store the last 1000 tuples. When using count-based windows in queries with a <tt class="literal">GROUP BY</tt> condition,it may be useful to maintain separate windows of equal size for each group, say, 1000 tuples each, rather than a single window of 1000 tuples; these are referred to as *partitioned windows*. The most general type is a *predicate window*, in which an arbitrary logical predicate (or SQL query) specifies the contents. **Predicate windows** are analogous to materialized views. For example, consider an on-line auction that produces three types of tuples for each item being sold: a “*begin*” tuple, zero or more “*bid*” tuples, followed by an “*end*” tuple that is generated when the item has been sold, presumably to the highest bidder. Assume that each tuple contains a timestamp, an item id, a type (being, bid or end), and other information such as the bid amount. A possible predicate window over this auction stream keeps track of all items that have not yet been sold. New items enter the window when their “begin” tuples appear; sold items “*fall out*” of the window when their “end” tuples appear.  
3. *Frequency of movement*: By default, a **time-based window** is updated at every time tick, and a count-based window is updated when a new tuple arrives. A *jumping window* is updated every *k* ticks or after every *k*th arrival. Note that a **count-based window** may be updated *periodically*, and a time-based window may be updated after some number of new tuples have arrived; these are referred to as *mixed jumping windows*. If *k* is equal to the window size, then the result is a series of non-overlapping *tumbling windows*.

In practice, **tumbling windows**, such as the one-minute windows in query Q1, are popular due to the simplicity of their implementation—at the end of each window, the query resets its state and starts over. *Forward-sliding windows* (time-based and count-based) are also appealing due to their intuitive semantics, especially with *joins* and *aggregation*. However, *sliding windows* are more difficult to implement than tumbling windows; over time, a *continuous query* must insert new tuples into a window and remove *expired* tuples that have fallen out of the window range.


References
---
[1] Lukasz Golab and M. Tamer Özsu, *Data Stream Management*, Synthesis Lectures on Data Management, 2010.
