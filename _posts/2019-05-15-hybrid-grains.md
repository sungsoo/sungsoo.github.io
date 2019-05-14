---
layout: post
title: Hybrid Grains
date: 2019-05-15
categories: [computer science]
tags: [computer graphics]

---

## Article Source
* Title: [Hybrid Grains: Adaptive Coupling of Discrete and Continuum Simulations of Granular Media](http://www.cs.columbia.edu/~smith/hybrid_grains/)

---



Hybrid Grains: Adaptive Coupling of Discrete and Continuum Simulations of Granular Media
=====

[[Yonghao Yue](http://mns.k.u-tokyo.ac.jp/~yonghao/)^1,2,*^]
[[Breannan Smith](https://breannansmith.com)^2,*^] [[Peter
Yichen Chen](http://www.cs.columbia.edu/cg/)^2,*^]
[[Maytee
Chantharayukhonthorn](http://web.mit.edu/kkamrin/www/people.html)^3,*^]
[[Ken Kamrin](http://web.mit.edu/kkamrin/www/index.html)^3,+^]
[[Eitan Grinspun](http://www.cs.columbia.edu/~eitan/)^2,+^]

[^1^[The University of Tokyo](https://www.u-tokyo.ac.jp)]
[^2^[Columbia University](https://www.columbia.edu)]
[^3^[Massachusetts Institute of
Technology](http://www.mit.edu)]
[^*^Co-first authors: authors contributed equally]
[^+^Corresponding authors]

![](http://www.cs.columbia.edu/~smith/hybrid_grains/files/teaser.png)



## Abstract 

We propose a technique to simulate granular materials that exploits the
dual strengths of discrete and continuum treatments. *Discrete element
simulations* provide unmatched levels of detail and generality, but prove
excessively costly when applied to large scale systems. *Continuum
approaches* are computationally tractable, but limited in applicability
due to built-in modeling assumptions; e.g., models suitable for granular
flows typically fail to capture clogging, bouncing and ballistic motion.
In our hybrid approach, an oracle dynamically partitions the domain into
continuum regions where safe, and discrete regions where necessary. The
domains overlap along transition zones, where a Lagrangian dynamics
mass-splitting coupling principle enforces agreement between the two
simulation states. Enrichment and homogenization operations allow the
partitions to evolve over time. This approach accurately and efficiently
simulates scenarios that previously required an entirely discrete
treatment.

<iframe width="600" height="400" src="https://www.youtube.com/embed/e_9f5Z0sMYE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## Files 

Paper: 
:   [[[PDF](http://www.cs.columbia.edu/~smith/hybrid_grains/files/paper.pdf)]]{.file}

Video: 
:   [[[MP4](http://www.cs.columbia.edu/~smith/hybrid_grains/files/video.mp4)]
    [[YouTube](https://youtu.be/Z86Udk2JXeU)]]{.file}

Supplemental material:
:   [[[Speedup Supplement PDF](http://www.cs.columbia.edu/~smith/hybrid_grains/files/speedup_supplement.pdf)] [[MPM
    Supplement PDF](http://www.cs.columbia.edu/~smith/hybrid_grains/files/mpm_supplement.pdf)]]{.file}



## BibTeX 

	@article{HG:2018,
        author = {Yue, Yonghao and Smith, Breannan and Chen, Peter Yichen and Chantharayukhonthorn, Maytee and Kamrin, Ken and Grinspun, Eitan},
        title = {Hybrid Grains: Adaptive Coupling of Discrete and Continuum Simulations of Granular Media},
        journal = {ACM Trans. Graph.},
        volume = {37},
        number = {6},
        month = nov,
        year = {2018},
        pages = {283:1--283:19},
        articleno = {283},
        numpages = {19},
    }


