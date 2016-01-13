---
layout: post
title: Database Systems Course 
date: 2016-01-25
categories: [computer science]
tags: [data management]

---

# Database Systems Course

<table class="table table-striped">
<thead>
    <tr>
        <th>Date</th>
        <th>Topic</th>
        <th>Slides</th>
        <th>Video</th>
    </tr>
</thead>
<tbody>

<tr class="" id="jan-11-2016">
        <td class="calendar-date">Jan 11, 2016</td>
        <td class="calendar-activity"><b>Course Introduction and History of Database Systems</b>
<ul>
<li class="secondary">M. Stonebraker, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/whatgoesaround-stonebraker.pdf');" href="./papers/whatgoesaround-stonebraker.pdf">What Goes Around Comes Around</a>, in <em>Readings in Database Systems, 4th Edition</em>, 2006
<em class="optional">(Optional)</em>

</li><li class="secondary">A. Pavlo, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/pavlo-newsql2015.pdf');" href="./papers/pavlo-newsql2015.pdf">What's New with NewSQL?</a>, 2015
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides"><a onclick="javascript:pageTracker._trackPageview('/downloads/./slides/01.pdf');" href="./slides/01.pdf" title="SLIDES (Lecture #01)">
<i class="fa fa-file-pdf-o fa-lg"></i></a></td>
        <td class="calendar-video"><a onclick="javascript:pageTracker._trackPageview('/outgoing/cmudb.io');" href="http://cmudb.io/15721-s16-lect01" title="VIDEO (Lecture #01)">
<i class="fa fa-file-video-o fa-lg"></i></a></td>
    </tr>
    <tr class="" id="jan-13-2016">
        <td class="calendar-date">Jan 13, 2016</td>
        <td class="calendar-activity"><b>In-Memory Databases</b>
<ul>
<li class="primary">H. Garcia-Molina, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/garciamolina-tkde1992.pdf');" href="./papers/garciamolina-tkde1992.pdf">Main Memory Database Systems: An Overview</a>, in <em>IEEE Trans. on Knowl. and Data Eng.</em>, 1992
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">S. Harizopoulos, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/hstore-lookingglass.pdf');" href="./papers/hstore-lookingglass.pdf">OLTP Through the Looking Glass, and What We Found There</a>, in <em>SIGMOD</em>, 2008
<em class="optional">(Optional)</em>

</li><li class="secondary">T.J. Lehman, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p239-lehman.pdf');" href="./papers/p239-lehman.pdf">Query Processing in Main Memory Database Management Systems</a>, in <em>SIGMOD</em>, 1987
<em class="optional">(Optional)</em>


</li></ul>
            <div class="assignments bg-info">

<span class="fa-stack" title="Assigment Released">
  <i class="fa fa-bullhorn fa-stack-1x"></i>
</span> <b>Assigment Released:</b> <a href="project1.html">Hash Join Operator</a>
            </div></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="success" id="jan-18-2016">
        <td class="calendar-date">Jan 18, 2016</td>
        <td class="calendar-activity"><em><b>Martin Luther King Day — No Class</b></em></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="jan-20-2016">
        <td class="calendar-date">Jan 20, 2016</td>
        <td class="calendar-activity"><b>Concurrency Control I</b>
<ul>
<li class="primary">X. Yu, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p209-yu.pdf');" href="./papers/p209-yu.pdf">Staring into the Abyss: An Evaluation of Concurrency Control with One Thousand Cores</a>, in <em>VLDB</em>, 2014
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">R. Johnson, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p24-johnson.pdf');" href="./papers/p24-johnson.pdf">Shore-MT: A Scalable Storage Manager for the Multicore Era</a>, in <em>EDBT</em>, 2009
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="jan-25-2016">
        <td class="calendar-date">Jan 25, 2016</td>
        <td class="calendar-activity"><b>Concurrency Control II — Multi-versioning</b>
<a href="#warning" title="Trigger Warning"><i class="trigger fa fa-exclamation-triangle fa-lg"></i></a>
<ul>
<li class="primary">P.-A. Larson, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p298-larson.pdf');" href="./papers/p298-larson.pdf">High-Performance Concurrency Control Mechanisms for Main-Memory Databases</a>, in <em>VLDB</em>, 2011
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">J. Levandoski, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/levandoski-cidr2015.pdf');" href="./papers/levandoski-cidr2015.pdf">High Performance Transactions in Deuteronomy</a>, in <em>CIDR</em>, 2015
<em class="optional">(Optional)</em>

</li><li class="secondary">T. Neumann, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p677-neumann.pdf');" href="./papers/p677-neumann.pdf">Fast Serializable Multi-Version Concurrency Control for Main-Memory Database Systems</a>, in <em>SIGMOD</em>, 2015
<em class="optional">(Optional)</em>

</li><li class="secondary">D. Schwalb, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/schwalb-imdm2014.pdf');" href="./papers/schwalb-imdm2014.pdf">Efficient Transaction Processing for Hyrise in Mixed Workload Environments</a>, in <em>IMDM</em>, 2014
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="jan-27-2016">
        <td class="calendar-date">Jan 27, 2016</td>
        <td class="calendar-activity"><b>Concurrency Control III — Optimistic</b>
<a href="#warning" title="Trigger Warning"><i class="trigger fa fa-exclamation-triangle fa-lg"></i></a>
<ul>
<li class="primary">S. Tu, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/tu-sosp2013.pdf');" href="./papers/tu-sosp2013.pdf">Speedy Transactions in Multicore In-Memory Databases</a>, in <em>SOSP</em>, 2013
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">X. Yu, et al., TicToc: Time Traveling Optimistic Concurrency Control, in <em>SIGMOD</em>, 2016
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="feb-01-2016">
        <td class="calendar-date">Feb 01, 2016</td>
        <td class="calendar-activity"><b>Indexes I — Locking &amp; Latching</b>
<ul>
<li class="primary">G. Graefe, <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/a16-graefe.pdf');" href="./papers/a16-graefe.pdf">A Survey of B-Tree Locking Techniques</a>, in <em>TODS</em>, 2010
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">S.K. Cha, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/cha-vldb2001.pdf');" href="./papers/cha-vldb2001.pdf">Cache-Conscious Concurrency Control of Main-Memory Indexes on Shared-Memory Multiprocessor Systems</a>, in <em>VLDB</em>, 2001
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="feb-03-2016">
        <td class="calendar-date">Feb 03, 2016</td>
        <td class="calendar-activity"><b>Indexes II — OLTP</b>
<ul>
<li class="primary">J. Levandoski, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/bwtree-icde2013.pdf');" href="./papers/bwtree-icde2013.pdf">The Bw-Tree: A B-tree for New Hardware</a>, in <em>ICDE</em>, 2013
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">J. Rao, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/rao-vldb97.pdf');" href="./papers/rao-vldb97.pdf">Cache Conscious Indexing for Decision-Support in Main Memory</a>, in <em>VLDB</em>, 1999
<em class="optional">(Optional)</em>

</li><li class="secondary">W. Pugh, <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/pugh-skiplists1990.pdf');" href="./papers/pugh-skiplists1990.pdf">Concurrent Maintenance of Skip Lists</a>, in <em>University of Maryland Tech Report</em>, 1990
<em class="optional">(Optional)</em>

</li><li class="secondary">V. Leis, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/leis-icde2013.pdf');" href="./papers/leis-icde2013.pdf">The Adaptive Radix Tree: ARTful Indexing for Main-Memory Databases</a>, in <em>ICDE</em>, 2013
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="feb-08-2016">
        <td class="calendar-date">Feb 08, 2016</td>
        <td class="calendar-activity"><b>Indexes III — OLAP</b>
<ul>
<li class="primary">P.-A. Larson, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p1177-larson.pdf');" href="./papers/p1177-larson.pdf">SQL Server Column Store Indexes</a>, in <em>SIGMOD</em>, 2011
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">C.Y. Chan, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p355-chan.pdf');" href="./papers/p355-chan.pdf">Bitmap Index Design and Evaluation</a>, in <em>SIGMOD</em>, 1998
<em class="optional">(Optional)</em>

</li><li class="secondary">L. Sidirourgos, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p893-sidirourgos.pdf');" href="./papers/p893-sidirourgos.pdf">Column Imprints: A Secondary Index Structure</a>, in <em>SIGMOD</em>, 2013
<em class="optional">(Optional)</em>


</li></ul>
            <div class="assignments bg-danger">

<span class="fa-stack" title="Assigment Due">
  <i class="fa fa-flag fa-stack-1x"></i>
</span> <b>Assigment Due:</b> <a href="project1.html">Hash Join Operator</a>
            </div>
            <div class="assignments bg-info">

<span class="fa-stack" title="Assigment Released">
  <i class="fa fa-bullhorn fa-stack-1x"></i>
</span> <b>Assigment Released:</b> Concurrent Index
            </div></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="feb-10-2016">
        <td class="calendar-date">Feb 10, 2016</td>
        <td class="calendar-activity"><b>Storage Models &amp; Data Layout</b>
<ul>
<li class="primary">I. Alagiannis, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/h2o.pdf');" href="./papers/h2o.pdf">H2O: A Hands-free Adaptive Store</a>, in <em>SIGMOD</em>, 2014
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">M. Grund, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p105-grund.pdf');" href="./papers/p105-grund.pdf">HYRISE: a main memory hybrid storage engine</a>, in <em>VLDB</em>, 2010
<em class="optional">(Optional)</em>

</li><li class="secondary">D. Abadi, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p967-abadi.pdf');" href="./papers/p967-abadi.pdf">Column-Stores vs. Row-Stores: How Different Are They</a>, in <em>SIGMOD</em>, 2008
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="feb-15-2016">
        <td class="calendar-date">Feb 15, 2016</td>
        <td class="calendar-activity"><b>Query Execution &amp; Scheduling</b>
<ul>
<li class="secondary">I. Psaroudakis, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p1442-psaroudakis.pdf');" href="./papers/p1442-psaroudakis.pdf">Scaling Up Concurrent Main-Memory Column-Store Scans: Towards Adaptive NUMA-aware Data and Task Placement</a>, in <em>VLDB</em>, 2015
<em class="optional">(Optional)</em>

</li><li class="secondary">V. Leis, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p743-leis.pdf');" href="./papers/p743-leis.pdf">Morsel-Driven Parallelism: A NUMA-Aware Query Evaluation Framework for the Many-Core Age</a>, in <em>SIGMOD</em>, 2014
<em class="optional">(Optional)</em>

</li><li class="secondary">D. Porobic, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p1447-porobic.pdf');" href="./papers/p1447-porobic.pdf">OLTP on Hardware Islands</a>, in <em>VLDB</em>, 2012
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="feb-17-2016">
        <td class="calendar-date">Feb 17, 2016</td>
        <td class="calendar-activity"><b>Join Alogrithms I — Hashing</b>
<ul>
<li class="primary">S. Blanas, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p37-blanas.pdf');" href="./papers/p37-blanas.pdf">Design and Evaluation of Main Memory Hash Join Algorithms for Multi-core CPUs</a>, in <em>SIGMOD</em>, 2011
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">C. Balkesen, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/balkesen-icde2013.pdf');" href="./papers/balkesen-icde2013.pdf">Main-Memory Hash Joins on Multi-Core CPUs: Tuning to the Underlying Hardware</a>, in <em>ICDE</em>, 2013
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="feb-22-2016">
        <td class="calendar-date">Feb 22, 2016</td>
        <td class="calendar-activity"><b>Join Alogrithms II — Sort-Merge</b>
<ul>
<li class="primary">C. Balkesen, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p85-balkesen.pdf');" href="./papers/p85-balkesen.pdf">Multi-Core, Main-Memory Joins: Sort vs. Hash Revisited</a>, in <em>VLDB</em>, 2013
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">C. Kim, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/kim-vldb2009.pdf');" href="./papers/kim-vldb2009.pdf">Sort vs. Hash Revisited: Fast Join Implementation on Modern Multi-Core CPUs</a>, in <em>VLDB</em>, 2009
<em class="optional">(Optional)</em>

</li><li class="secondary">M.-C. Albutiu, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p1064-albutiu.pdf');" href="./papers/p1064-albutiu.pdf">Massively Parallel Sort-Merge Joins in Main Memory Multi-Core Database Systems</a>, in <em>VLDB</em>, 2012
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="feb-24-2016">
        <td class="calendar-date">Feb 24, 2016</td>
        <td class="calendar-activity"><b>Logging &amp; Recovery I — Physiological Logging</b>
<ul>
<li class="primary">W. Zheng, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/zheng-osdi14.pdf');" href="./papers/zheng-osdi14.pdf">Fast Databases with Fast Durability and Recovery Through Multicore Parallelism</a>, in <em>OSDI</em>, 2014
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">R. Johnson, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/johnson-vldb2010.pdf');" href="./papers/johnson-vldb2010.pdf">Aether: A Scalable Approach to Logging</a>, in <em>VLDB</em>, 2010
<em class="optional">(Optional)</em>

</li><li class="secondary">T.J. Lehman, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p104-lehman.pdf');" href="./papers/p104-lehman.pdf">A Recovery Algorithm for a High-performance Memory-resident Database System</a>, in <em>SIGMOD</em>, 1987
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="feb-29-2016">
        <td class="calendar-date">Feb 29, 2016</td>
        <td class="calendar-activity"><b>Logging &amp; Recovery II — Alternative Methods</b>
<ul>
<li class="primary">N. Malviya, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/malviya-icde14.pdf');" href="./papers/malviya-icde14.pdf">Rethinking Main Memory OLTP Recovery</a>, in <em>ICDE</em>, 2014
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">J. Lee, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/lee-icde2001.pdf');" href="./papers/lee-icde2001.pdf">Differential Logging: A Commutative and Associative Logging Scheme for Highly Parallel Main Memory Database</a>, in <em>ICDE</em>, 2001
<em class="optional">(Optional)</em>

</li><li class="secondary">A. Goel, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p541-goel.pdf');" href="./papers/p541-goel.pdf">Fast Database Restarts at Facebook</a>, in <em>SIGMOD</em>, 2014
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="mar-02-2016">
        <td class="calendar-date">Mar 02, 2016</td>
        <td class="calendar-activity"><b>Database Compression</b>
<ul>
<li class="primary">C. Binnig, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p283-binnig.pdf');" href="./papers/p283-binnig.pdf">Dictionary-based Order-preserving String Compression for Main Memory Column Stores</a>, in <em>SIGMOD</em>, 2009
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">V. Raman, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p858-raman.pdf');" href="./papers/p858-raman.pdf">How to Wring a Table Dry: Entropy Compression of Relations and Querying of Compressed Relations</a>, in <em>VLDB</em>, 2006
<em class="optional">(Optional)</em>


</li></ul>
            <div class="assignments bg-danger">

<span class="fa-stack" title="Assigment Due">
  <i class="fa fa-flag fa-stack-1x"></i>
</span> <b>Assigment Due:</b> Concurrent Index
            </div></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="success" id="mar-07-2016">
        <td class="calendar-date">Mar 07, 2016</td>
        <td class="calendar-activity"><em><b>Spring Break — No Class</b></em></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="success" id="mar-09-2016">
        <td class="calendar-date">Mar 09, 2016</td>
        <td class="calendar-activity"><em><b>Spring Break — No Class</b></em></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="warning" id="mar-14-2016">
        <td class="calendar-date">Mar 14, 2016</td>
        <td class="calendar-activity"><b>Student Project Proposals</b></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="mar-16-2016">
        <td class="calendar-date">Mar 16, 2016</td>
        <td class="calendar-activity"><b>Query Planning &amp; Optimization</b>
<ul>
<li class="secondary">V. Leis, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p204-leis.pdf');" href="./papers/p204-leis.pdf">How Good are Query Optimizers, Really?</a>, in <em>VLDB</em>, 2015
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="mar-21-2016">
        <td class="calendar-date">Mar 21, 2016</td>
        <td class="calendar-activity"><b>Query Compilation</b>
<ul>
<li class="primary">T. Neumann, <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p539-neumann.pdf');" href="./papers/p539-neumann.pdf">Efficiently Compiling Efficient Query Plans for Modern Hardware</a>, in <em>VLDB</em>, 2011
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">K. Krikellas, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/krikellas-icde2010.pdf');" href="./papers/krikellas-icde2010.pdf">Generating Code for Holistic Query Evaluation</a>, in <em>ICDE</em>, 2010
<em class="optional">(Optional)</em>

</li><li class="secondary">C. Freedman, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/freedman-ieee2014.pdf');" href="./papers/freedman-ieee2014.pdf">Compilation in the Microsoft SQL Server Hekaton Engine</a>, in <em>IEEE Data Eng. Bull.</em>, 2011
<em class="optional">(Optional)</em>

</li><li class="secondary">H. Pirk, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/pirk-icde2013.pdf');" href="./papers/pirk-icde2013.pdf">CPU and Cache Efficient Management of Memory-Resident Databases</a>, in <em>ICDE</em>, 2013
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="mar-23-2016">
        <td class="calendar-date">Mar 23, 2016</td>
        <td class="calendar-activity"><b>Vectorized Execution</b>
<ul>
<li class="primary">O. Polychroniou, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p1493-polychroniou.pdf');" href="./papers/p1493-polychroniou.pdf">Rethinking SIMD Vectorization for In-Memory Databases</a>, in <em>SIGMOD</em>, 2015
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">Y. Li, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/li-sigmod2013.pdf');" href="./papers/li-sigmod2013.pdf">BitWeaving: Fast Scans for Main Memory Data Processing</a>, in <em>SIGMOD</em>, 2013
<em class="optional">(Optional)</em>

</li><li class="secondary">J. Sompolski, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p5-sompolski.pdf');" href="./papers/p5-sompolski.pdf">Vectorization vs. Compilation in Query Execution</a>, in <em>DaMoN</em>, 2011
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="mar-28-2016">
        <td class="calendar-date">Mar 28, 2016</td>
        <td class="calendar-activity"><b>Scan Sharing</b>
<ul>
<li class="primary">L. Qiao, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p610-qiao.pdf');" href="./papers/p610-qiao.pdf">Main-memory Scan Sharing for Multi-Core CPUs</a>, in <em>VLDB</em>, 2008
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">M. Zukowski, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p723-zukowski.pdf');" href="./papers/p723-zukowski.pdf">Cooperative Scans: Dynamic Bandwidth Sharing in a DBMS</a>, in <em>VLDB</em>, 2007
<em class="optional">(Optional)</em>

</li><li class="secondary">G. Giannikis, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p526-georgiosgiannikis.pdf');" href="./papers/p526-georgiosgiannikis.pdf">SharedDB: Killing One Thousand Queries with One Stone</a>, in <em>VLDB</em>, 2012
<em class="optional">(Optional)</em>

</li><li class="secondary">I. Psaroudakis, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p637-psaroudakis.pdf');" href="./papers/p637-psaroudakis.pdf">Sharing Data and Work Across Concurrent Analytical Queries</a>, in <em>VLDB</em>, 2013
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="mar-30-2016">
        <td class="calendar-date">Mar 30, 2016</td>
        <td class="calendar-activity"><b>Materialized Views</b></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="apr-04-2016">
        <td class="calendar-date">Apr 04, 2016</td>
        <td class="calendar-activity"><b>Hybrid Database Systems I</b>
<ul>
<li class="primary">V. Sikka, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p731-sikka.pdf');" href="./papers/p731-sikka.pdf">Efficient Transaction Processing in SAP HANA Database: The End of a Column Store Myth</a>, in <em>SIGMOD</em>, 2012
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>

</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="apr-06-2016">
        <td class="calendar-date">Apr 06, 2016</td>
        <td class="calendar-activity"><b>Hybrid Database Systems II</b></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="warning" id="apr-11-2016">
        <td class="calendar-date">Apr 11, 2016</td>
        <td class="calendar-activity"><b>Student Project Updates</b></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="apr-13-2016">
        <td class="calendar-date">Apr 13, 2016</td>
        <td class="calendar-activity"><b>Larger-than-Memory Databases</b>
<ul>
<li class="primary">J. DeBrabant, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/hstore-anticaching.pdf');" href="./papers/hstore-anticaching.pdf">Anti-Caching: A New Approach to Database Management System Architecture</a>, in <em>VLDB</em>, 2013
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">F. Funke, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p1424_florianfunke.pdf');" href="./papers/p1424_florianfunke.pdf">Compacting Transactional Data in Hybrid OLTP&amp;OLAP Databases</a>, in <em>VLDB</em>, 2012
<em class="optional">(Optional)</em>

</li><li class="secondary">R. Stoica, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/a7-stoica.pdf');" href="./papers/a7-stoica.pdf">Enabling Efficient OS Paging for Main-Memory OLTP Databases</a>, in <em>DaMoN</em>, 2013
<em class="optional">(Optional)</em>

</li><li class="secondary">G. Graefe, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p37-graefe.pdf');" href="./papers/p37-graefe.pdf">In-Memory Performance for Big Data</a>, in <em>VLDB</em>, 2014
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="apr-18-2016">
        <td class="calendar-date">Apr 18, 2016</td>
        <td class="calendar-activity"><b>Non-Volatile Memory Database Systems</b>
<ul>
<li class="primary">J. Arulraj, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p707-arulraj.pdf');" href="./papers/p707-arulraj.pdf">Let's Talk About Storage &amp; Recovery Methods for Non-Volatile Memory Database Systems</a>, in <em>SIGMOD</em>, 2015
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">H. Kimura, <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/p691-kimura.pdf');" href="./papers/p691-kimura.pdf">FOEDUS: OLTP Engine for a Thousand Cores and NVRAM</a>, in <em>SIGMOD</em>, 2015
<em class="optional">(Optional)</em>

</li><li class="secondary">I. Oukid, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/a8-oukid.pdf');" href="./papers/a8-oukid.pdf">SOFORT: A Hybrid SCM-DRAM Storage Engine for Fast Data Recovery</a>, in <em>DaMoN</em>, 2014
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="apr-20-2016">
        <td class="calendar-date">Apr 20, 2016</td>
        <td class="calendar-activity"><b>Transactional Memory</b>
<ul>
<li class="primary">V. Leis, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/leis-icde2014.pdf');" href="./papers/leis-icde2014.pdf">Exploiting Hardware Transactional Memory in Main-Memory Databases</a>, in <em>ICDE</em>, 2014
<span class="fa-stack" title="Primary Reading">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-star fa-stack-1x fa-inverse"></i>
</span>
</li><li class="secondary">D. Cervini, et al., <a onclick="javascript:pageTracker._trackPageview('/downloads/./papers/a7-cervini.pdf');" href="./papers/a7-cervini.pdf">Applying HTM to an OLTP System: No Free Lunch</a>, in <em>DaMoN</em>, 2015
<em class="optional">(Optional)</em>


</li></ul></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
    <tr class="" id="apr-25-2016">
        <td class="calendar-date">Apr 25, 2016</td>
        <td class="calendar-activity"><b>Final Review + Guest Speaker</b></td>
        <td class="calendar-slides">—</td>
        <td class="calendar-video">—</td>
    </tr>
