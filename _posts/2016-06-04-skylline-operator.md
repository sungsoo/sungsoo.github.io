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
    [doi](https://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1109/ICDE.2001.914855](//dx.doi.org/10.1109%2FICDE.2001.914855).<span
    class="Z3988"
    title="ctx_ver=Z39.88-2004&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3ASkyline+operator&amp;rft.atitle=The+Skyline+Operator&amp;rft.aufirst=Stephan&amp;rft.au=Kossmann%2C+Donald&amp;rft.aulast=Borzsonyi&amp;rft.au=Stocker%2C+Konrad&amp;rft.date=2001&amp;rft.genre=article&amp;rft_id=info%3Adoi%2F10.1109%2FICDE.2001.914855&amp;rft.jtitle=Proceedings+17th+International+Conference+on+Data+Engineering&amp;rft.pages=421-430&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal"><span
    style="display:none;"> </span></span></span>
2.  Mullesgaard, Kasper; Pedersen, Jens Laurits;
    Lu, Hua; Zhou, Yongluan (2014). ["Efficient Skyline Computation in
    MapReduce"](http://www.openproceedings.eu/2014/conf/edbt/MullesgaardPLZ14.pdf)
    <span style="font-size:85%;">(PDF)</span>. *Proc. 17th International
    Conference on Extending Database Technology (EDBT)*: 37–48.<span
    class="Z3988"
    title="ctx_ver=Z39.88-2004&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3ASkyline+operator&amp;rft.atitle=Efficient+Skyline+Computation+in+MapReduce&amp;rft.aufirst=Kasper&amp;rft.aulast=Mullesgaard&amp;rft.au=Lu%2C+Hua&amp;rft.au=Pedersen%2C+Jens+Laurits&amp;rft.au=Zhou%2C+Yongluan&amp;rft.date=2014&amp;rft.genre=article&amp;rft_id=http%3A%2F%2Fwww.openproceedings.eu%2F2014%2Fconf%2Fedbt%2FMullesgaardPLZ14.pdf&amp;rft.jtitle=Proc.+17th+International+Conference+on+Extending+Database+Technology+%28EDBT%29&amp;rft.pages=37-48&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal"><span
    style="display:none;"> </span></span></span>
3.  Bøgh, Kenneth S; Assent, Ira; Magnani,
    Matteo (2013). "Efficient GPU-based skyline computation".
    *Proceedings of the Ninth International Workshop on Data Management
    on New Hardware*: 5:1–5:6.
    [doi](https://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1145/2485278.2485283](//dx.doi.org/10.1145%2F2485278.2485283).<span
    class="Z3988"
    title="ctx_ver=Z39.88-2004&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3ASkyline+operator&amp;rft.atitle=Efficient+GPU-based+skyline+computation&amp;rft.au=Assent%2C+Ira&amp;rft.aufirst=Kenneth+S&amp;rft.aulast=B%C3%B8gh&amp;rft.au=Magnani%2C+Matteo&amp;rft.date=2013&amp;rft.genre=article&amp;rft_id=info%3Adoi%2F10.1145%2F2485278.2485283&amp;rft.jtitle=Proceedings+of+the+Ninth+International+Workshop+on+Data+Management+on+New+Hardware&amp;rft.pages=5%3A1-5%3A6&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal"><span
    style="display:none;"> </span></span></span>
