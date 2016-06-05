---
layout: post
title: Skyline Operator
date: 2016-06-04
categories: [computer science]
tags: [data management]

---

Skyline Operator 
================

The **Skyline operator** is used in a query and performs a filtering of
results from a database so that it keeps only those objects that are not
worse than any other.

This operator is an extension to [SQL](https://en.wikipedia.org/wiki/SQL "SQL") proposed by Börzsönyi et al. 
A classic example of application of the *Skyline operator* involves selecting a
hotel for a holiday. The user wants the hotel to be both cheap and close
to the beach. However, hotels that are close to the beach may also be
expensive. In this case, the Skyline operator would only present those
hotels that are not worse than any other hotel in both price and
distance to the beach.

## Proposed syntax

To give an example in SQL: Börzsönyi et al. proposed the following
syntax for the *Skyline operator*:

```sql
    SELECT ... FROM ... WHERE ...
    GROUP BY ... HAVING ...
    SKYLINE OF [DISTINCT] d1 [MIN | MAX | DIFF],
                     ..., dm [MIN | MAX | DIFF]
    ORDER BY ...
```

where d~1~, ... d~m~ denote the dimensions of the Skyline and MIN, MAX
and DIFF specify whether the value in that dimension should be
minimised, maximised or simply be different.

## Implementation

The Skyline operator can be implemented directly in SQL using current
SQL constructs, however this has been shown to be very
slow. Other algorithms have
been proposed that make use of divide and conquer,
indices,[MapReduce](https://en.wikipedia.org/wiki/MapReduce "MapReduce") and
[general-purpose computing on graphics
cards](https://en.wikipedia.org/wiki/General-purpose_computing_on_graphics_processing_units "General-purpose computing on graphics processing units").

## References

1.  Borzsonyi, Stephan; Kossmann, Donald;
    Stocker, Konrad (2001). "The Skyline Operator". *Proceedings 17th
    International Conference on Data Engineering*: 421–430.
    [doi](https://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1109/ICDE.2001.914855](//dx.doi.org/10.1109%2FICDE.2001.914855).2.  Mullesgaard, Kasper; Pedersen, Jens Laurits;
    Lu, Hua; Zhou, Yongluan (2014). ["Efficient Skyline Computation in
    MapReduce"](http://www.openproceedings.eu/2014/conf/edbt/MullesgaardPLZ14.pdf)
    <span style="font-size:85%;">(PDF)</span>. *Proc. 17th International
    Conference on Extending Database Technology (EDBT)*: 37–48.3.  Bøgh, Kenneth S; Assent, Ira; Magnani,
    Matteo (2013). "Efficient GPU-based skyline computation".
    *Proceedings of the Ninth International Workshop on Data Management
    on New Hardware*: 5:1–5:6.
    [doi](https://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1145/2485278.2485283](//dx.doi.org/10.1145%2F2485278.2485283).