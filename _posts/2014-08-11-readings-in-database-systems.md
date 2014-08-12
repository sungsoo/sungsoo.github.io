---
layout: post
title: Readings in Database Systems
date: 2014-08-11
categories: [computer science]
tags: [data management]

---

## Article Source
* Title: Readings in Database Systems
* Authors: Michael Stonebraker and Joseph M. Hellerstein

Readings in Database Systems (4th Edition)
===

Understanding the history of a topic is very helpful for developing a
useful conceptualization of future evolution and a thorough knowledge of
present challenges. Database system research has long yielded valuable
insights, but many findings are primarily locatabale within complex
academic papers in obscure publications. This useful collection of
papers published by *The MIT Press* presents some old documents and some
newer ones.

Many innovations have yet to be made in teh field of database system
design, but there are many complexities associated with database
management systems, and sometimes researches waste time by working
through studies that have already been completed and throughly
documented. In order to be able to pave the way for the future of
databases, it is necessary to h ave an understanding of what has
happened to this point and what current challenges need new solutions.

The preface to the anthology describes the editors' objective:

> This book is intended to provide software technolgoists—both
> professionals and students—with a grounding in database research past
> and present, and a technical context for understanding new
> innovations. It is also designed to be a reference to anyone already
> active in database systems. This set of readings represents what we
> perceive to be the most important issues in the database area; the
> core mateiral for any DBMS [database management system] professional
> to study.
>
> (page *ix*)

These papers are present in the fourth edition:

## Data Models and DBMS Architecture

-   *What Goes Around Comes Around* by Michael Stonebraker and Joseph M.
    Hellerstein
-   *Anatomy of a Database System* by Joseph M. Hellerstein and Michael
    Stonebraker

## Query Processing

-   *Access Path Selection in a Relational Database Management System*
    by P. Griffiths Selinger, M.M. Astrahan, D.D. Chamberlin, R.A.
    Lorie, and T.G. Price
-   *Join Processing in Database Systems with Large Main Memories* by
    Leonard D. Shapiro
-   *Parallel Database Systems: The Future of High Performance Database
    Systems* by David DeWitt and Jim Gray
-   *Encapsulation of Parallelism in the Volcano Query Processing
    System* by Goetz Graefe
-   *AlphaSort: A RISC Machine Sort* by Chris Nyberg, Tom Barclay, Zarka
    Cvetanovic, Jim Gray, and Dave Lomet
-   *R\* Optimizer Validation and Performance Evaluation for Distributed
    Systems* by Lothar F. Mackert and Guy M. Lohman
-   *Mariposa: A Wide-Area Distributed Database System* by Michael
    Stonebraker, Paul M. Aoki, Witold Litwin, Avi Pfeffer, Adam Sah,
    Jeff Sidell, Carl Staelin, and Andrew Yu

## Data Storage and Access Methods

-   *The R\*-tree: An Efficient and Robust Access Method for Points and
    Rectangles* by Norbert Beckmann, Hans-Peter Kriegel, Ralf Schneider,
    and Bernhard Seeger
-   *Operating System Support for Database Management* by Michael
    Stonebraker
-   *The Five-Minute Rule Ten Years Later, and Other Computer Storage
    Rules of Thumb* by Jim Gray and Goetz Graefe
-   *A Case for Redundant Arrays of Inexpensive Disks (RAID)* by David
    A. Patterson, Garth Gibson, and Randy H. Katz

## Transaction Management

-   *Granularity of Locks and Degrees of Consistency in a Shared Data
    Base* by Jim N. Gray, Raymond A. Lorie, Gianfranco R. Putzolu, and
    Irving L. Traiger
-   *On Optimistic Methods for Concurrency Control* by H. T. Kung and
    John T. Robinson
-   *Concurrency Control Performance Modeling: Alternatives and
    Implications* by Rakesh Agrawal, Michael J. Carey, and Miron Livny
-   *Efficient Locking for Concurrent Operations on B-Trees* by Philip
    L. Lehman and S. Bing Yao
-   *ARIES: A Transaction Recovery Method Supporting Fine-Granularity
    Locking and Partial Rollbacks Using Write-Ahead Logging* by C.
    Mohan, Don Haderle, Bruce Lindsay, Hamid Pirahesh, and Peter Schwarz
-   *Transaction Management in the R\* Distributed Database Management
    System* by C. Mohan, Bruce Lindsay, and R. Obermack
-   *The Dangers of Replication and a Solution* by Jim Gray, Pat
    Helland, Patrick O'Neil, and Dennis Shasha

## Extensibility

-   *Inclusion of New Types in Relational Data Base Systems* by Michael
    Stonebraker
-   *Generalized Search Trees for Database Systems* by Joseph M.
    Hellerstein, Jeffrey F. Naughton, and Avi Pfeffer
-   *Grammar-like Functional Rules for Representing Query Optimization
    Alternatives* by Guy M. Lohman

## Database Evolution

-   *AutoAdmin "What-if" Index Analysis Utility* by Surajit Chaudhuri
    and Vivek Narasayya
-   *Applying Model Management to Classical Meta Data Problems* by
    Philip A. Bernstein
-   *Algorithms for Creating Indexes for Very Large Tables Without
    Quiescing Updates* by C. Mohan and Inderpal Narang

## Data Warehousing

-   *An Overview of Data Warehousing and OLAP Technology* by Surajit
    Chaudhuri and Umeshwar Dayal
-   *Improved Query Performance with Variant Indexes* by Patrick O'Neil
    and Dallan Quass
-   *DataCube: A Relational Aggregation Operator Generalizing Group-By,
    Cross-Tab, and Sub-Totals* by Jim Gray, Surajit Chaudhuri, Adam
    Bosworth, Andrew Layman, Don Reichart, and Murali Venkatrao
-   *An Array-Based Algorithm for Simultaneous Multidimensional
    Aggregates* by Yihong Zhao, Prasad M. Despande, and Jeffrey F.
    Naughton
-   *Deriving Production Rules for Incremental View Maintenance* by
    Stefano Ceri and Jennifer Widom
-   *Informix under CONTROL: Online Query Processing* by Joseph M.
    Hellerstein, Ron Avnur, and Vijayshankar Raman
-   *DynaMat: A Dynamic View Management System for Data Warehouses* by
    Yannis Kotidis and Nick Roussopoulos

## Data Mining

-   *BIRCH: An Efficient Data Clustering Method for Very Large
    Databases* by Tian Zhang, Raghu Ramakrishnan, and Miron Livny
-   *SPRINT: A Scalable Parallel Classifier for Data Mining* by John
    Shafer, Rakesh Agrawal, and Manish Mehta
-   *Fast Algorithms for Mining Association Rules* by Rakesh Agrawal and
    Ramakrishnan Srikant
-   *Efficient Evaluation of Queries with Mining Predicates* by Surajit
    Chaudhuri, Vivek Narasayya, and Sunita Sarawagi

## Web Services and Data Bases

-   *Combining Systems and Databases: A Search Engine Retrospective* by
    Eric A. Brewer
-   *The Anatomy of a Large-Scale Hypertextual Web Search Engine* by
    Sergey Brin and Lawrence Page
-   *The BINGO! System for Information Portal Generation and Expert Web
    Search* by Sergej Sizov, Michael Biwer, Jens Graupmann, Stefan
    Siersdorfer, Martin Theobald, Gerhard Weikum, and Patrick Zimmer
-   *Data Management in Application Servers* by Dean Jacobs
-   *Querying Semi-Structured Data* by Serge Abiteboul
-   *DataGuides: Enabling Query Formulation and Optimization in
    Semistructured Databases* by Roy GOldman and Jennifer Widom
-   *NiagaraCQ: A Scalable Continuous Query System for the Internet
    Databases* by Jianjun Chen, David J. DeWitt, Feng Tian, and Yuan
    Wang

## Stream-Based Data Management

-   *Scalable Trigger Processing* by Eric N. Hanson, Chris Carnes, Lan
    Huang, Mohan Konyala, Lloyd Noronha, Sashi Parthasarathy, J. B.
    Park, and Albert Vernon
-   *The Design and Implementation of a Sequence Database System* by
    Praveen Seshadri, Miron Livny, and Raghu Ramakrishnan
-   *Eddies: Continuously Adaptive Query Processing* by Ron Avnur and
    Joseph M. Hellerstein
-   *Retrospective on Aurora* by Hari Balakrishnan, Magdalena
    Balazinska, Don Carney, Ugur Çetintemel, Mitch Cherniack, Chrstian
    Convey, Eddie Galvez, Jon Salz, Michael Stonebraker, Nesime Tatbul,
    Richard Tibbetts, and Stan Zdonik

Readings in Database Systems, Third Edition
===============================


## CHAPTER 1 The Roots

A Relational Model of Data for Large Shared Data Banks, CACM 13(6) 1970 
:   [Edgar F.
    Codd](http://www.acm.org/sigmod/dblp/db/indices/a-tree/c/Codd:E=_F=.html)

System R: Relational Approach to Database Management, TODS 1(2) 1976 
:   [Morton M.
    Astrahan](http://www.acm.org/sigmod/dblp/db/indices/a-tree/a/Astrahan:Morton_M=.html),
    [Mike W.
    Blasgen](http://www.acm.org/sigmod/dblp/db/indices/a-tree/b/Blasgen:Mike_W=.html),
    [Donald D.
    Chamberlin](http://www.acm.org/sigmod/dblp/db/indices/a-tree/c/Chamberlin:Donald_D=.html),
    [Kapali P.
    Eswaran](http://www.acm.org/sigmod/dblp/db/indices/a-tree/e/Eswaran:Kapali_P=.html),
    [Jim
    Gray](http://www.acm.org/sigmod/dblp/db/indices/a-tree/g/Gray:Jim.html),
    [Patricia P.
    Griffiths](http://www.acm.org/sigmod/dblp/db/indices/a-tree/g/Griffiths:Patricia_P=.html),
    [W. Frank King
    III](http://www.acm.org/sigmod/dblp/db/indices/a-tree/k/King_III:W=_Frank.html),
    [Raymond A.
    Lorie](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Lorie:Raymond_A=.html),
    [Paul R.
    McJones](http://www.acm.org/sigmod/dblp/db/indices/a-tree/m/McJones:Paul_R=.html),
    [James W.
    Mehl](http://www.acm.org/sigmod/dblp/db/indices/a-tree/m/Mehl:James_W=.html),
    [Gianfranco R.
    Putzolu](http://www.acm.org/sigmod/dblp/db/indices/a-tree/p/Putzolu:Gianfranco_R=.html),
    [Irving L.
    Traiger](http://www.acm.org/sigmod/dblp/db/indices/a-tree/t/Traiger:Irving_L=.html),
    [Bradford W.
    Wade](http://www.acm.org/sigmod/dblp/db/indices/a-tree/w/Wade:Bradford_W=.html),
    and [Vera
    Watson](http://www.acm.org/sigmod/dblp/db/indices/a-tree/w/Watson:Vera.html)

The Design and Implementation of INGRES, TODS 1(3) 1976 
:   [Michael
    Stonebraker](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Stonebraker:Michael.html),
    [Eugene
    Wong](http://www.acm.org/sigmod/dblp/db/indices/a-tree/w/Wong:Eugene.html),
    [Peter
    Kreps](http://www.acm.org/sigmod/dblp/db/indices/a-tree/k/Kreps:Peter.html),
    and [Gerald
    Held](http://www.acm.org/sigmod/dblp/db/indices/a-tree/h/Held:Gerald.html)

A History and Evaluation of System R, CACM 24(10) 1981 
:   [Donald D.
    Chamberlin](http://www.acm.org/sigmod/dblp/db/indices/a-tree/c/Chamberlin:Donald_D=.html),
    [Morton M.
    Astrahan](http://www.acm.org/sigmod/dblp/db/indices/a-tree/a/Astrahan:Morton_M=.html),
    [Mike W.
    Blasgen](http://www.acm.org/sigmod/dblp/db/indices/a-tree/b/Blasgen:Mike_W=.html),
    [Jim
    Gray](http://www.acm.org/sigmod/dblp/db/indices/a-tree/g/Gray:Jim.html),
    [W. Frank King
    III](http://www.acm.org/sigmod/dblp/db/indices/a-tree/k/King_III:W=_Frank.html),
     [Bruce G.
    Lindsay](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Lindsay:Bruce_G=.html),
    [Raymond A.
    Lorie](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Lorie:Raymond_A=.html),
    [James W.
    Mehl](http://www.acm.org/sigmod/dblp/db/indices/a-tree/m/Mehl:James_W=.html),
    [Thomas G.
    Price](http://www.acm.org/sigmod/dblp/db/indices/a-tree/p/Price:Thomas_G=.html),
    [Gianfranco R.
    Putzolu](http://www.acm.org/sigmod/dblp/db/indices/a-tree/p/Putzolu:Gianfranco_R=.html),
     [Patricia G.
    Selinger](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Selinger:Patricia_G=.html),
    [Mario
    Schkolnick](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Schkolnick:Mario.html),
    [Donald R.
    Slutz](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Slutz:Donald_R=.html),
    [Irving L.
    Traiger](http://www.acm.org/sigmod/dblp/db/indices/a-tree/t/Traiger:Irving_L=.html),
    [Bradford W.
    Wade](http://www.acm.org/sigmod/dblp/db/indices/a-tree/w/Wade:Bradford_W=.html),
     and [Robert A.
    Yost](http://www.acm.org/sigmod/dblp/db/indices/a-tree/y/Yost:Robert_A=.html)

Retrospection on a Database System, TODS 5(2) 1980 
:   [Michael
    Stonebraker](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Stonebraker:Michael.html)

## CHAPTER 2 Relational Implementation Techniques

Operating System Support for Database Management, Database Engineering Bulletin 9(3) 1986 
:   [Michael
    Stonebraker](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Stonebraker:Michael.html)

R-Trees: A Dynamic Index Structure for Spacial Searching, SIGMOD 1984 
:   [Antonin
    Guttman](http://www.acm.org/sigmod/dblp/db/indices/a-tree/g/Guttman:Antonin.html)

Generalized Search Trees for Database Systems, VLDB 1995 
:   [Joseph M.
    Hellerstein](http://www.acm.org/sigmod/dblp/db/indices/a-tree/h/Hellerstein:Joseph_M=.html),
    [Jeffrey F.
    Naughton](http://www.acm.org/sigmod/dblp/db/indices/a-tree/n/Naughton:Jeffrey_F=.html),
    and [Avi
    Pfeffer](http://www.acm.org/sigmod/dblp/db/indices/a-tree/p/Pfeffer:Avi.html)

An Evaluation of Buffer Management Strategies for Relational Database Systems, [Algorithmica 1(3) 1986](http://www.acm.org/sigmod/dblp/db/journals/algorithmica/algorithmica1.html#ChouD86) 
:   [Hong-Tai
    Chou](http://www.acm.org/sigmod/dblp/db/indices/a-tree/c/Chou:Hong=Tai.html)
    and [David J.
    DeWitt](http://www.acm.org/sigmod/dblp/db/indices/a-tree/d/DeWitt:David_J=.html)

Join Processing in Database Systems with Large Main Memories, TODS 11(3) 1986 
:   [Leonard D.
    Shapiro](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Shapiro:Leonard_D=.html)

Access Path Selection in a Relational Database Management System, SIGMOD 1979 
:   [Patricia G.
    Selinger](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Selinger:Patricia_G=.html),
    [Morton M.
    Astrahan](http://www.acm.org/sigmod/dblp/db/indices/a-tree/a/Astrahan:Morton_M=.html),
    [Donald D.
    Chamberlin](http://www.acm.org/sigmod/dblp/db/indices/a-tree/c/Chamberlin:Donald_D=.html),
    [Raymond A.
    Lorie](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Lorie:Raymond_A=.html),
    and [Thomas G.
    Price](http://www.acm.org/sigmod/dblp/db/indices/a-tree/p/Price:Thomas_G=.html)

Query Rewrite Optimization Rules in IBM DB2 Universal Database 
:   T. Y. C. Leung, H. Pirahesh, P. Seshadri, and J. Hellerstein

## CHAPTER 3 Transaction Management

Granularity of Locks and Degrees of Consistency in a Shared Data Base, [IFIP Working Conference on Modelling in Data Base Management Systems 1976](http://www.acm.org/sigmod/dblp/db/conf/ds/modelling76.html#GrayLPT76) 
:   [Jim
    Gray](http://www.acm.org/sigmod/dblp/db/indices/a-tree/g/Gray:Jim.html),
    [Raymond A.
    Lorie](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Lorie:Raymond_A=.html),
    [Gianfranco R.
    Putzolu](http://www.acm.org/sigmod/dblp/db/indices/a-tree/p/Putzolu:Gianfranco_R=.html),
    and [Irving L.
    Traiger](http://www.acm.org/sigmod/dblp/db/indices/a-tree/t/Traiger:Irving_L=.html)

On Optimistic Methods for Concurrency Control, TODS 6(2) 1981 
:   [H. T.
    Kung](http://www.acm.org/sigmod/dblp/db/indices/a-tree/k/Kung:H=_T=.html)
    and [John T.
    Robinson](http://www.acm.org/sigmod/dblp/db/indices/a-tree/r/Robinson:John_T=.html)

Concurrency Control Performance Modeling: Alternatives and Implications, TODS 12(4) 1987 
:   [Rakesh
    Agrawal](http://www.acm.org/sigmod/dblp/db/indices/a-tree/a/Agrawal:Rakesh.html),
    [Michael J.
    Carey](http://www.acm.org/sigmod/dblp/db/indices/a-tree/c/Carey:Michael_J=.html),
    and [Miron
    Livny](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Livny:Miron.html)

Efficient Locking for Concurrent Operations on B-Trees, TODS 6(4) 1981 
:   [Philip L.
    Lehman](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Lehman:Philip_L=.html)
    and [S. Bing
    Yao](http://www.acm.org/sigmod/dblp/db/indices/a-tree/y/Yao:S=_Bing.html)

Principles of Transaction-Oriented Database Recovery, ACM Computing Surveys 15(4) 1983 
:   [Theo
    Härder](http://www.acm.org/sigmod/dblp/db/indices/a-tree/h/H=auml=rder:Theo.html),
    [Andreas
    Reuter](http://www.acm.org/sigmod/dblp/db/indices/a-tree/r/Reuter:Andreas.html)

ARIES: A Transaction Recovery Method Supporting Fine-Granularity Locking and Partial Rollbacks Using Write-Ahead Logging, TODS 17(1) 1992 
:   [C.
    Mohan](http://www.acm.org/sigmod/dblp/db/indices/a-tree/m/Mohan:C=.html),
    [Donald J.
    Haderle](http://www.acm.org/sigmod/dblp/db/indices/a-tree/h/Haderle:Donald_J=.html),
    [Bruce G.
    Lindsay](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Lindsay:Bruce_G=.html),
    [Hamid
    Pirahesh](http://www.acm.org/sigmod/dblp/db/indices/a-tree/p/Pirahesh:Hamid.html),
    and [Peter M.
    Schwarz](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Schwarz:Peter_M=.html)
The Design of a POSTGRES Storage System, VLDB 1987 
:   [Michael
    Stonebraker](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Stonebraker:Michael.html)

The ConTract Model, [Database Transaction Models for Advanced Applications 1992](http://www.acm.org/sigmod/dblp/db/books/collections/transaction92.html#WachterR92) 
:   [Helmut
    Wachter](http://www.acm.org/sigmod/dblp/db/indices/a-tree/w/W=auml=chter:Helmut.html)
    and [Andreas
    Reuter](http://www.acm.org/sigmod/dblp/db/indices/a-tree/r/Reuter:Andreas.html)

## CHAPTER 4 Distributed Database System

R*: An Overview of the Archtecture, [JCDKB 1982](http://www.acm.org/sigmod/dblp/db/conf/jcdkb/jcdkb82.html#WilliamsDHLLNOSWWY82) 
:   [R.
    Williams](http://www.acm.org/sigmod/dblp/db/indices/a-tree/w/Williams:R=.html),
    [Dean
    Daniels](http://www.acm.org/sigmod/dblp/db/indices/a-tree/d/Daniels:Dean.html),
    [Laura M.
    Haas](http://www.acm.org/sigmod/dblp/db/indices/a-tree/h/Haas:Laura_M=.html),
    [George
    Lapis](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Lapis:George.html),
    [Bruce G.
    Lindsay](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Lindsay:Bruce_G=.html),
    [Pui
    Ng](http://www.acm.org/sigmod/dblp/db/indices/a-tree/n/Ng:Pui.html),
    [Ron
    Obermarck](http://www.acm.org/sigmod/dblp/db/indices/a-tree/o/Obermarck:Ron.html),
    [Patricia G.
    Selinger](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Selinger:Patricia_G=.html),
    [Adrian
    Walker](http://www.acm.org/sigmod/dblp/db/indices/a-tree/w/Walker:Adrian.html),
    [Paul F.
    Wilms](http://www.acm.org/sigmod/dblp/db/indices/a-tree/w/Wilms:Paul_F=.html),
     and [Robert A.
    Yost](http://www.acm.org/sigmod/dblp/db/indices/a-tree/y/Yost:Robert_A=.html)

R* Optimizer Validation and Performance Evaluation for Distributed Queries, VLDB 1986 
:   [Lothar F.
    Mackert](http://www.acm.org/sigmod/dblp/db/indices/a-tree/m/Mackert:Lothar_F=.html)
    and [Guy M.
    Lohman](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Lohman:Guy_M=.html)

Transaction Management in the R* Distributed Database Management System, TODS 11(4) 1986 
:   [C.
    Mohan](http://www.acm.org/sigmod/dblp/db/indices/a-tree/m/Mohan:C=.html),
    [Bruce G.
    Lindsay](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Lindsay:Bruce_G=.html),
    and [Ron
    Obermarck](http://www.acm.org/sigmod/dblp/db/indices/a-tree/o/Obermarck:Ron.html)

The Dangers of Replication and a Solution, SIGMOD 1996 
:   [Jim
    Gray](http://www.acm.org/sigmod/dblp/db/indices/a-tree/g/Gray:Jim.html),
    [Pat
    Helland](http://www.acm.org/sigmod/dblp/db/indices/a-tree/h/Helland:Pat.html),
    [Patrick E.
    O'Neil](http://www.acm.org/sigmod/dblp/db/indices/a-tree/o/O=Neil:Patrick_E=.html),
    and [Dennis
    Shasha](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Shasha:Dennis.html)

Mariposa: A Wide-Area Distributed Database System, VLDB Journal 5(1) 1996 
:   [Michael
    Stonebraker](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Stonebraker:Michael.html),
    [Paul M.
    Aoki](http://www.acm.org/sigmod/dblp/db/indices/a-tree/a/Aoki:Paul_M=.html),
    [Witold
    Litwin](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Litwin:Witold.html),
    [Avi
    Pfeffer](http://www.acm.org/sigmod/dblp/db/indices/a-tree/p/Pfeffer:Avi.html),
    [Adam
    Sah](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Sah:Adam.html),
     [Jeff
    Sidell](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Sidell:Jeff.html),
    [Carl
    Staelin](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Staelin:Carl.html),
    and [Andrew
    Yu](http://www.acm.org/sigmod/dblp/db/indices/a-tree/y/Yu:Andrew.html)

## CHAPTER 5 Parallel Database System

Parallel Database Systems: The Future of High Performance Database Systems, CACM 35(6) 1992 
:   [David J.
    DeWitt](http://www.acm.org/sigmod/dblp/db/indices/a-tree/d/DeWitt:David_J=.html)
    and [Jim
    Gray](http://www.acm.org/sigmod/dblp/db/indices/a-tree/g/Gray:Jim.html)

The Gamma Database Machine Project, TKDE 2(1) 1990 
:   [David J.
    DeWitt](http://www.acm.org/sigmod/dblp/db/indices/a-tree/d/DeWitt:David_J=.html),
    [Shahram
    Ghandeharizadeh](http://www.acm.org/sigmod/dblp/db/indices/a-tree/g/Ghandeharizadeh:Shahram.html),
    [Donovan A.
    Schneider](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Schneider:Donovan_A=.html),
    [Allan
    Bricker](http://www.acm.org/sigmod/dblp/db/indices/a-tree/b/Bricker:Allan.html),
    [Hui-I
    Hsiao](http://www.acm.org/sigmod/dblp/db/indices/a-tree/h/Hsiao:Hui=I.html),
     and [Rick
    Rasmussen](http://www.acm.org/sigmod/dblp/db/indices/a-tree/r/Rasmussen:Rick.html)

AlphaSort: A Cache-Sensitive Parallel External Sort, VLDB Journal 4(4) 1995 
:   [Chris
    Nyberg](http://www.acm.org/sigmod/dblp/db/indices/a-tree/n/Nyberg:Chris.html),
    [Tom
    Barclay](http://www.acm.org/sigmod/dblp/db/indices/a-tree/b/Barclay:Tom.html),
    [Zarka
    Cvetanovic](http://www.acm.org/sigmod/dblp/db/indices/a-tree/c/Cvetanovic:Zarka.html),
    [Jim
    Gray](http://www.acm.org/sigmod/dblp/db/indices/a-tree/g/Gray:Jim.html),
    and [David B.
    Lomet](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Lomet:David_B=.html)

Coloring Away Communication in Parallel Query Optimization, VLDB 1995 
:   [Waqar
    Hasan](http://www.acm.org/sigmod/dblp/db/indices/a-tree/h/Hasan:Waqar.html)
    and [Rajeev
    Motwani](http://www.acm.org/sigmod/dblp/db/indices/a-tree/m/Motwani:Rajeev.html)

## CHAPTER 6 Objects in Databases

The ObjectStore Database System, CACM 34(10) 1991 
:   [Charles
    Lamb](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Lamb:Charles.html),
    [Gordon
    Landis](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Landis:Gordon.html),
    [Jack A.
    Orenstein](http://www.acm.org/sigmod/dblp/db/indices/a-tree/o/Orenstein:Jack_A=.html),
    and [Danel
    Weinreb](http://www.acm.org/sigmod/dblp/db/indices/a-tree/w/Weinreb:Danel.html)

QuickStore: A High Performance Mapped Object Store, SIGMOD 1994 
:   [Seth J.
    White](http://www.acm.org/sigmod/dblp/db/indices/a-tree/w/White:Seth_J=.html)
    and [David J.
    DeWitt](http://www.acm.org/sigmod/dblp/db/indices/a-tree/d/DeWitt:David_J=.html)

Client-Server Caching Revisited, [IWDOM 1992 (SIGMOD 1991)](http://www.acm.org/sigmod/dblp/db/conf/oodbs/oodbs92.html#FranklinC92) 
:   [Michael J.
    Franklin](http://www.acm.org/sigmod/dblp/db/indices/a-tree/f/Franklin:Michael_J=.html)
    and [Michael J.
    Carey](http://www.acm.org/sigmod/dblp/db/indices/a-tree/c/Carey:Michael_J=.html)

The Database Language GEM, SIGMOD 1983 
:   [Carlo
    Zaniolo](http://www.acm.org/sigmod/dblp/db/indices/a-tree/z/Zaniolo:Carlo.html)

Inclusion of New Types in Relational Data Base System, ICDE 1986 
:   [Michael
    Stonebraker](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Stonebraker:Michael.html)

The POSTGRES Next-Generation Database Management System, CACM 34(10) 1991 
:   [Michael
    Stonebraker](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Stonebraker:Michael.html)
    and [Greg
    Kemnitz](http://www.acm.org/sigmod/dblp/db/indices/a-tree/k/Kemnitz:Greg.html)

## CHAPTER 7 Data Analysis and Decision Support

Improved Query Performance with Variant Indexes, SIGMOD 1997  
:   [Patrick E.
    O'Neil](http://www.acm.org/sigmod/dblp/db/indices/a-tree/o/O=Neil:Patrick_E=.html)
    and [Dallan
    Quass](http://www.acm.org/sigmod/dblp/db/indices/a-tree/q/Quass:Dallan.html)

Data Cube: A Relational Aggregation Operator Generalizing Group-By, Cross-Tab, and Sub-Totals, [Data Mining and Knowledge Discovery 1(1) 1997 (ICDE 1996)](http://www.acm.org/sigmod/dblp/db/journals/datamine/datamine1.html#GrayCBLRVPP97) 
:   [Jim
    Gray](http://www.acm.org/sigmod/dblp/db/indices/a-tree/g/Gray:Jim.html),
    [Surajit
    Chaudhuri](http://www.acm.org/sigmod/dblp/db/indices/a-tree/c/Chaudhuri:Surajit.html),
    [Adam
    Bosworth](http://www.acm.org/sigmod/dblp/db/indices/a-tree/b/Bosworth:Adam.html),
    [Andrew
    Layman](http://www.acm.org/sigmod/dblp/db/indices/a-tree/l/Layman:Andrew.html),
    [Don
    Reichart](http://www.acm.org/sigmod/dblp/db/indices/a-tree/r/Reichart:Don.html),
     [Murali
    Venkatrao](http://www.acm.org/sigmod/dblp/db/indices/a-tree/v/Venkatrao:Murali.html),
    [Frank
    Pellow](http://www.acm.org/sigmod/dblp/db/indices/a-tree/p/Pellow:Frank.html),
    and [Hamid
    Pirahesh](http://www.acm.org/sigmod/dblp/db/indices/a-tree/p/Pirahesh:Hamid.html)

An Array-Based Algorithm for Simultaneous Multidimensional Aggregates, SIGMOD 1997 
:   [Yihong
    Zhao](http://www.acm.org/sigmod/dblp/db/indices/a-tree/z/Zhao:Yihong.html),
    [Prasad
    Deshpande](http://www.acm.org/sigmod/dblp/db/indices/a-tree/d/Deshpande:Prasad.html),
    and [Jeffrey F.
    Naughton](http://www.acm.org/sigmod/dblp/db/indices/a-tree/n/Naughton:Jeffrey_F=.html)

Fast Algorithms for Mining Association Rules in Large Databases, VLDB 1994 
:   [Rakesh
    Agrawal](http://www.acm.org/sigmod/dblp/db/indices/a-tree/a/Agrawal:Rakesh.html)
    and [Ramakrishnan
    Srikant](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Srikant:Ramakrishnan.html)

Online Aggregation, SIGMOD 1997 
:   [Joseph M.
    Hellerstein](http://www.acm.org/sigmod/dblp/db/indices/a-tree/h/Hellerstein:Joseph_M=.html),
    [Peter J.
    Haas](http://www.acm.org/sigmod/dblp/db/indices/a-tree/h/Haas:Peter_J=.html),
    and [Helen J.
    Wang](http://www.acm.org/sigmod/dblp/db/indices/a-tree/w/Wang:Helen_J=.html)

## CHAPTER 8 Benchmarking Database Systems

A Measure of Transaction Processing Power 
:   Anon et al.
The OO7 Benchmark, SIGMOD 1993 
:   [Michael J.
    Carey](http://www.acm.org/sigmod/dblp/db/indices/a-tree/c/Carey:Michael_J=.html),
    [David J.
    DeWitt](http://www.acm.org/sigmod/dblp/db/indices/a-tree/d/DeWitt:David_J=.html),
    and [Jeffrey F.
    Naughton](http://www.acm.org/sigmod/dblp/db/indices/a-tree/n/Naughton:Jeffrey_F=.html)

The Sequoia 2000 Storage Benchmark, SIGMOD 1993 
:   [Michael
    Stonebraker](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Stonebraker:Michael.html),
    [James
    Frew](http://www.acm.org/sigmod/dblp/db/indices/a-tree/f/Frew:James.html),
    [Kenn
    Gardels](http://www.acm.org/sigmod/dblp/db/indices/a-tree/g/Gardels:Kenn.html),
    and [Jeff
    Meredith](http://www.acm.org/sigmod/dblp/db/indices/a-tree/m/Meredith:Jeff.html)

## CHAPTER 9 Vision Statements

Database Metatheory: Asking and Big Queries, PODS 1995 
:   [Christos H.
    Papadimitriou](http://www.acm.org/sigmod/dblp/db/indices/a-tree/p/Papadimitriou:Christos_H=.html)

Database Systems: Achievements and Opportunities, CACM 34(10) 1991 
:   [Abraham
    Silberschatz](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Silberschatz:Abraham.html),
    [Michael
    Stonebraker](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Stonebraker:Michael.html),
    and [Jeffrey D.
    Ullman](http://www.acm.org/sigmod/dblp/db/indices/a-tree/u/Ullman:Jeffrey_D=.html)

Strategic Directions in Database Systems - Breaking Out of the Box, ACM Computing Surveys 28(4) 1996 
:   [Abraham
    Silberschatz](http://www.acm.org/sigmod/dblp/db/indices/a-tree/s/Silberschatz:Abraham.html)
    and [Stanley B.
    Zdonik](http://www.acm.org/sigmod/dblp/db/indices/a-tree/z/Zdonik:Stanley_B=.html)
