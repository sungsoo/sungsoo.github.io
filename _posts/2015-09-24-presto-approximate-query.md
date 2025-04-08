---
layout: post
title: Approximate Aggregation Queries in Presto
date: 2015-09-24
categories: [computer science]
tags: [big data]

---

# Approximate Aggregation Queries in Presto

<p>We have added experimental support for aggregate queries that return
approximate results with error bounds. This feature is designed to be
used with sampled tables generated using the <tt class="docutils literal"><span class="pre">TABLESAMPLE</span> <span class="pre">POISSONIZED</span> <span class="pre">RESCALED</span></tt>.
For example, the following query will create a 1% sample:</p>
<div class="highlight-sql"><div class="highlight"><pre><span class="k">CREATE</span> <span class="k">TABLE</span> <span class="n">lineitems_sample</span> <span class="k">AS</span>
<span class="k">SELECT</span> <span class="o">*</span>
<span class="k">FROM</span> <span class="n">tpch</span><span class="p">.</span><span class="n">sf10</span><span class="p">.</span><span class="n">lineitems</span> <span class="n">TABLESAMPLE</span> <span class="n">POISSONIZED</span> <span class="p">(</span><span class="mi">1</span><span class="p">)</span> <span class="n">RESCALED</span>
</pre></div>
</div>
<p>Then, to run an approximate query:</p>
<div class="highlight-sql"><div class="highlight"><pre><span class="k">SELECT</span> <span class="k">COUNT</span><span class="p">(</span><span class="o">*</span><span class="p">)</span>
<span class="k">FROM</span> <span class="n">lineitems_sample</span>
<span class="n">APPROXIMATE</span> <span class="k">AT</span> <span class="mi">95</span><span class="p">.</span><span class="mi">0</span> <span class="n">CONFIDENCE</span>
</pre></div>
</div>

<div class="highlight-none"><div class="highlight"><pre>           _col0
----------------------------
 5.991790345E7 +/- 14835.75
(1 row)
</pre></div>
</div>
<p>To enable this feature you must add <tt class="docutils literal"><span class="pre">analyzer.experimental-syntax-enabled=true</span></tt> to your config.</p>
<div class="admonition note">
<p class="first admonition-title">Note</p>
<p class="last">The syntax and functionality for approximate queries is experimental and will likely
change in future versions.</p>