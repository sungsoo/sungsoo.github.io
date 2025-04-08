---
layout: post
title: Google Spanner
date: 2014-05-20
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: http://en.wikipedia.org/wiki/Spanner_(database)
* Authors: Wikipedia, the free encyclopedia


[![](http://sungsoo.github.com/images/spanner.png)](http://sungsoo.github.com/images/spanner.png)

[OSDI 2012 Conference Presentation](http://new.livestream.com/accounts/1545775/osdi12/videos/4646642)

# Google's Spanner

Spanner is Google's globally distributed **NewSQL** database, the successor to **BigTable**. Google describes Spanner as not a pure relational system because each table must have a *primary-key column*.

Because the *lack* of transactions in BigTable led to frequent complaints from users, Google made *distributed transactions central* to Spanner's design. Based on their experience with BigTable, Google argues that it is better to have application programmers deal with performance problems due to overuse of transactions as bottlenecks arise, rather than always coding around the lack of transactions.

The *Google F1 SQL* database management system (**DBMS**) is built on it, and replaces Google’s custom MySQL.

Described as a NewSQL platform, it is used internally within their infrastructure as part of the [Google platform](http://en.wikipedia.org/wiki/Google_platform). It uses the [Paxos algorithm](http://en.wikipedia.org/wiki/Paxos_algorithm) as part of its operation to shard data across hundreds of datacenters. It makes heavy use of *hardware-assisted time synchronization* using *GPS clocks* and *atomic clocks* to ensure *global consistency*.

# References
[1] Corbett, James C; Dean, Jeffrey; Epstein, Michael; Fikes, Andrew; Frost, Christopher; Furman, JJ; Ghemawat, Sanjay; Gubarev, Andrey; Heiser, Christopher; Hochschild, Peter; Hsieh, Wilson; Kanthak, Sebastian; Kogan, Eugene; Li, Hongyi; Lloyd, Alexander; Melnik, Sergey; Mwaura, David; Nagle, David; Quinlan, Sean; Rao, Rajesh; Rolig, Lindsay; Saito, Yasushi; Szymaniak, Michal; Taylor, Christopher; Wang, Ruth; Woodford, Dale, "[Spanner: Google’s Globally-Distributed Database](http://static.googleusercontent.com/external_content/untrusted_dlcp/research.google.com/en//archive/spanner-osdi2012.pdf)", *Proceedings of OSDI 2012 (Google)*, retrieved 18 September 2012.  

[2] Date, Christopher ‘Chris’ J, "6. Relations, Part II. The Relational Model", An Introduction to Database Systems (8th ed.), Addison Wesley, ISBN 978-0321197849.

[3] Shute, Jeffrey ‘Jeff’; Oancea, Mircea; Ellner, Stephan; Handy, Benjamin ‘Ben’; Rollins, Eric; Samwel, Bart; Vingralek, Radek; Whipkey, Chad; Chen, Xin; Jegerlehner, Beat; Littlefield, Kyle; Tong, Phoenix (2012), "[F1 — the Fault-Tolerant Distributed RDBMS Supporting Google's Ad Business](http://research.google.com/pubs/pub38125.html)", *Research (presentation)*, Sigmod: Google.
