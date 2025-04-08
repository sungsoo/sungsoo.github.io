---
layout: post
title: Spark for Data Science; A Case Study 
date: 2014-05-13
categories: [computer science]
tags: [big data, yarn]

---


## Article Source
* Title: [Spark for Data Science; A Case Study](http://hortonworks.com/blog/spark-data-science-case-study/)
* Authors: [Casey
Stella](http://hortonworks.com/blog/author/cstella/ "Posts by Casey Stella")


[![](http://sungsoo.github.com/images/spark-case-study.png)](http://sungsoo.github.com/images/spark-case-study.png)


# Spark for Data Science; A Case Study 

I’m a pretty heavy Unix user and I tend to prefer doing things the Unix
Way™, which is to say, composing many small command line oriented
utilities. With composability comes power and with specialization comes
simplicity. Although, sometimes if two utilities are used all the time,
sometimes it makes sense for either:

-   A utility that specializes in a very common use-case
-   One utility to provide basic functionality from another utility

For example, one thing that I find myself doing a lot of is searching
a directory recursively for files that contain an expression:

``` 
find /path/to/root -exec grep -l "search phrase" {} \;
```

Despite the fact that you *can* do this, specialized utilities, such as
[ack](http://beyondgrep.com) have come up to simplify this style of
querying. Turns out, there’s also power in not having to consult the man
pages all the time. Another example, is the interaction between *uniq*
and *sort*. *uniq* presumes sorted data. Of course, you need not sort
your data using the Unix utility *sort*, but often you find yourself
with a flow such as this:

``` 
sort filename.dat | uniq > uniq.dat
```

This is so common that a -u flag was added to sort to support this flow,
like so:

``` 
sort -u filename.dat > uniq.dat
```

Now, obviously, *uniq* has utilities beyond simply providing distinct
output from a stream, such as providing counts for each distinct
occurrence. Even so, it’s nice for the situation where you don’t need
the full power of *uniq* for the minimal functionality of *uniq* to be a
part of *sort*. These simple motivating examples got me thinking:

-   Are there opportunities for folding another command’s basic
    functionality into another command as a feature (or flag) as in
    *sort* and *uniq*?
-   Can we answer the above question in a principled, data-driven way?

This sounds like a great challenge and an even greater opportunity to
try out a new (to me) analytics platform, [Apache
Spark](http://spark.apache.org). So, I’m going to take you through a
little journey doing some simple analysis and illustrate the general
steps. We’re going to cover

1.  Data Gathering
2.  Data Engineering
3.  Data Analysis
4.  Presentation of Results and Conclusions

We’ll close with my impressions of using Spark as an analytics platform.
Hope you enjoy!

# Data Gathering

Of course, to be data driven, a minimal requirement is to have some
data. The good folks at [CommandLineFu](http://www.commandlinefu.com)
have a great service and an even better REST-ful API to use. For those
of you who do not know, CommandLineFu is a repository of crowd-managed
one-liners for common tasks. For instance, if you forget how to share
ssh keys and you’re on a Mac that doesn’t have *ssh-copy-id* (like me),
then you can find the appropriate one-liner. Using their REST-ful API,
we can extract a nice sample of useful sets of commands to accomplish
real tasks. Now, this data, unfortunately, leaves much to be desired for
drawing robust conclusions:

-   Not a huge amount of data (only 4744 commands when I pulled the
    data)
-   Duplicity of commands aren’t captured (we’ve essentially just
    captured a unique list of commands).
-   Not captured from real-world usages, so it might be biased

Even so, perhaps we can see some high-level patterns emerge. At the very
least, we’ll be able to try out a new analytics platform.

# The Spark of Inspiration

## Word Collocations as Inspiration

Word [collocations](http://en.wikipedia.org/wiki/Collocation) (AKA
Statistically Significant Phrases) are pairs (or tuples) of words that
appear together more likely than random chance would imply. These could
be things like proper names, multi-word colloquial phrases. Natural
Language Processing has a number of techniques to generate and rank
these collocations by “importance”:

-   [Mutual
    Information](http://en.wikipedia.org/wiki/Mutual_information)
-   [TF-IDF](http://en.wikipedia.org/wiki/Tf%E2%80%93idf)
-   [*G* Statistical Test](http://en.wikipedia.org/wiki/G-test)
-   Many more

Much has been written about this over the years from
[technical](http://alias-i.com/lingpipe/demos/tutorial/interestingPhrases/read-me.htm) [blogs](http://matpalm.com/blog/2011/10/22/collocations_1/)
to [research papers](http://acl.ldc.upenn.edu/J/J93/J93-1003.pdf) and
[textbooks](http://www.amazon.com/Foundations-Statistical-Natural-Language-Processing-ebook/dp/B007L7LUKO/ref=dp_kinw_strp_1).
I’m going to follow the approach suggested by Ted Dunning in [“Accurate
Methods for Statistics of Surprise and
Coincidence”](http://acl.ldc.upenn.edu/J/J93/J93-1003.pdf), namely using
the *G* Statistical test.

# Statistical Tests in Natural Language Processing for Fun and Profit


## ![\\chi\^2](http://s0.wp.com/latex.php?latex=%5Cchi%5E2&bg=ffffff&fg=000&s=0 "\chi^2") Statistical Test

Statistical significance tests tell us whether the probability that
something occurs is not due to just random chance. Traditionally, when
you are looking at these sorts of things, you encounter tests like the
![\\chi\^2](http://s0.wp.com/latex.php?latex=%5Cchi%5E2&bg=ffffff&fg=000&s=0 "\chi^2")
test, which can tell you give you a significance measure. In fact,
*G*-tests, and their broader class of tests called maximum likelihood
statistical tests, are a generalization of the
![\\chi\^2](http://s0.wp.com/latex.php?latex=%5Cchi%5E2&bg=ffffff&fg=000&s=0 "\chi^2")
test. In particular, the problem with the traditional
![\\chi\^2](http://s0.wp.com/latex.php?latex=%5Cchi%5E2&bg=ffffff&fg=000&s=0 "\chi^2")
test when used in the domain of natural language processing is well
known and criticized. Consider the following quote from “Foundations of
Statistical Natural Language Processing”:

> Just as the application of the \$t\$ test is problematic becuase of
> the underlying normality assumption, so is the application of
> ![\\chi\^2](http://s0.wp.com/latex.php?latex=%5Cchi%5E2&bg=ffffff&fg=000&s=0 "\chi^2")
> in cases where numbers in the \$2\$-by-\$2\$ table are small.
> Snedecore and Cochran(1989:127) advise against using
> ![\\chi\^2](http://s0.wp.com/latex.php?latex=%5Cchi%5E2&bg=ffffff&fg=000&s=0 "\chi^2")
> if the total sample size is smaller than 20 or if it is between 20 adn
> 40 and the expected value in any of the cells is 5 or less.

As you can see, there are some issues with bigrams (in our case, pairs
of commands) that are rare. Thankfully there is another approach that
deals with the low-support situation.

## *G* Statistical Test

The *G* statistical test is a maximum likelihood statistical
significance test. In fact, it turns out, the
![\\chi\^2](http://s0.wp.com/latex.php?latex=%5Cchi%5E2&bg=ffffff&fg=000&s=0 "\chi^2")
test statistic is an approximation of the log-likelihood ratio used in
the *G* statistical test. You can refer to Ted Dunning’s [“Accurate
Methods for Statistics of Surprise and
Coincidence”](http://acl.ldc.upenn.edu/J/J93/J93-1003.pdf) for a
spirited argument in favor of log-likelihood statistical tests as the
basis of bigram collocation analysis.

# Apache Spark: An Analytics Platform

As part of my career, I have specialized in Data Science on the Hadoop
stack. [Amp Labs](https://amplab.cs.berkeley.edu/) at Berkeley have
created some very interesting pieces of infrastructure with favorable
performance characteristics and a functional flavor. [Apache
Spark](http://spark.apache.org/) is their offering at the computational
layer. It’s a cache-aggressive data processing engine with first-class
Scala, Java and Python API bindings. With [Hadoop
2.x](http://hadoop.apache.org/) now supporting other communication
models than MapReduce, Spark runs as a Yarn application; so if you have
a modern Hadoop cluster, you can try this out yourself. Even if you
don’t own a Hadoop cluster, you can pull down a VM that runs the full
Hadoop stack
[here](http://hortonworks.com/products/hortonworks-sandbox/).
(Disclosure: I work for Hortonworks; this is a VM with our distribution
installed). As a fan of scala and data science, I would be lying if I
said that I haven’t been looking forward to finding a project to try it
out on, but I wanted something a bit more interesting than the canonical
examples of wordcount or
![\\pi](http://s0.wp.com/latex.php?latex=%5Cpi&bg=ffffff&fg=000&s=0 "\pi")
estimation. I think this just fits the bill!

# The Analysis Process


## Data Engineering

As part of any self-respecting data science project, a good portion of
the challenge is in data engineering. The data engineering challenge
here boil down to parsing the command line examples and extracting the
pairs of commands that collocate. The general approach is:

-   Use [Antlr](http://www.antlr.org), a parser generator which can take
    a grammar and give us back an abstract syntax tree, to parse the
    unix lines according to the grammar generously borrowed from the
    libbash project
    [here](https://github.com/neloe/libbash/tree/master/bashast).
-   Take those abstract syntax trees and extract out the pairs of
    commands.

If you’re interested, you can find the scala code to do this
[here](https://github.com/cestella/UnixCommandAnalysis/blob/master/src/main/scala/com/caseystella/util/CLIParserDriver.scala).

## Analysis: In the Weeds

The general methodology is:

-   Compute the raw frequency ranking of all of the pairs of commands
    that appear in our dataset
-   Compute the *G* test significance for all of the pairs of commands
    that appear in our dataset

Once we have these two rankings, we can eyeball the rankings and see how
they differ and see if anything pops out.

## Resilient Distributed Datasets: Our Workhorse

I want to briefly discuss a bit of technology that we will be using
heavily in the ensuing analysis, the Resilient Distributed Dataset (aka
RDD). Resilient Distributed Datasets:

-   Are Spark’s primary abstraction for a collection of items
-   Could back a HDFS file, a local Text file, or many other things.
-   Have many
    [operations](https://spark.apache.org/docs/0.9.0/scala-programming-guide.html#rdd-operations)
    available on them that should be familiar to any functional
    programmer out there.
-   Are lazily operated on. In that, all transformations from above do
    not compute their results until their results are absolutely needed
    (such as when they’re persisted).
-   Take advantage of caching and, therefore, can cache a workingset
    into memory, thereby operating on it more quickly.

Generally when you want to get something done in Spark, you’re operating
on an RDD.

## Raw Frequency: The Baseline

Raw Frequency is really simple, so we’ll start with that. It fits our
assumptions of how to rank collocations, so we’ll use it as the
base-case to evaluate against. Let’s start with some useful typedefs

``` 
type Bigram = Tuple2[String, String]
type ScoredBigram = Tuple2[Bigram, Double]
type BigramCount = Tuple2[Bigram, Int]
```

Now, let’s define our function.

``` 
/**
   * Returns a RDD with a scored bigram based on frequency of consecutive commands.
   * @param commands an RDD containing Strings of commands
   * @return An RDD of ScoredBigram sorted by score
   */
  def rawFrequency(commands:RDD[String]) :RDD[ScoredBigram] =  {
```

Using the parser that we created during the Data Engineering portion of
the project, we can extract the Bigrams excluding the automatic bookend
command called “END” into an RDD called bigramsWithoutEnds.

``` 
val parser = new CLIParserDriver
    val commandsAsBigrams= commands.map( line => parser.toCommandBigrams(
        parser.getCommandTokens(parser.getSyntaxTree(line.toString))
                                                                        )
                                      )
    val bigramsWithoutEnds = commandsAsBigrams.flatMap(
            bigrams => bigrams.filter( (bigram:Bigram) => bigram._2 != "END")
                                                      )
```

Now we can compute the collocation counts by bigram by doing something
very similar to word count using map and reduceByKey.

``` 
val bigramCounts = bigramsWithoutEnds.map( (bigram:Bigram) => (bigram, 1))
                                         .reduceByKey( (x:Int, y:Int) => x + y)
```

With those counts, we now need only the total of all bigrams and to
divide each of the bigram counts by the total to get the raw frequency.
We’ll further order by the score.

``` 
val totalNumBigrams = bigramsWithoutEnds.count()

    bigramCounts.map(
      (bigramCount:BigramCount) => ( 1.0*bigramCount._2/totalNumBigrams
                                   , bigramCount._1
                                   )
                    )
                .sortByKey(false) //sort the value (it's the first in the pair)
                .map( (x:Tuple2[Double, Bigram]) => (x._2, x._1)) //now invert the order of the pair
  }
```

Et voilà, we now have a RDD of Bigrams sorted by raw frequency.

## *G* Test: Log Likelihood for Fun and Profit

Now for the meat of the implementation. Let’s take the theory discussed
earlier and proposed in [“Accurate Methods for Statistics of Surprise
and Coincidence”](http://acl.ldc.upenn.edu/J/J93/J93-1003.pdf) and
implement it. The technique boils down to computing a contingency table
of counts for each pair of words
![w\_1](http://s0.wp.com/latex.php?latex=w_1&bg=ffffff&fg=000&s=0 "w_1") and
![w\_2](http://s0.wp.com/latex.php?latex=w_2&bg=ffffff&fg=000&s=0 "w_2") and
use
[LogLikelihood.logLikelihoodRatio](https://github.com/apache/mahout/blob/trunk/math/src/main/java/org/apache/mahout/math/stats/LogLikelihood.java)
from Mahout:

### Contigency Table
 
  k11   ![\\rightarrow](http://s0.wp.com/latex.php?latex=%5Crightarrow&bg=ffffff&fg=000&s=0 "\rightarrow")   The number of times ![w\_1](http://s0.wp.com/latex.php?latex=w_1&bg=ffffff&fg=000&s=0 "w_1") and ![w\_2](http://s0.wp.com/latex.php?latex=w_2&bg=ffffff&fg=000&s=0 "w_2") appear next to each other.  

  k12   ![\\rightarrow](http://s0.wp.com/latex.php?latex=%5Crightarrow&bg=ffffff&fg=000&s=0 "\rightarrow")   The number of times ![w\_2](http://s0.wp.com/latex.php?latex=w_2&bg=ffffff&fg=000&s=0 "w_2") appears *without* ![w\_1](http://s0.wp.com/latex.php?latex=w_1&bg=ffffff&fg=000&s=0 "w_1")  

  k21   ![\\rightarrow](http://s0.wp.com/latex.php?latex=%5Crightarrow&bg=ffffff&fg=000&s=0 "\rightarrow")   The number of times ![w\_1](http://s0.wp.com/latex.php?latex=w_1&bg=ffffff&fg=000&s=0 "w_1") appears *without* ![w\_2](http://s0.wp.com/latex.php?latex=w_2&bg=ffffff&fg=000&s=0 "w_2")  

  k22   ![\\rightarrow](http://s0.wp.com/latex.php?latex=%5Crightarrow&bg=ffffff&fg=000&s=0 "\rightarrow")   The number of times neither ![w\_1](http://s0.wp.com/latex.php?latex=w_1&bg=ffffff&fg=000&s=0 "w_1") or ![w\_2](http://s0.wp.com/latex.php?latex=w_2&bg=ffffff&fg=000&s=0 "w_2") appear together.

Just as before with raw frequency, let’s start with some useful typedefs

``` 
type Bigram = Tuple2[String, String]
type ScoredBigram = Tuple2[Bigram, Double]
type BigramCount = Tuple2[Bigram, Int]
```

Again, just as before, let’s define our function:

``` 
/**
   * Returns a RDD with a scored bigram based on the G statistical test
   *  as popularized in Dunning, Ted (1993). Accurate Methods for the
   * Statistics of Surprise and Coincidence, Computational Linguistics,
   * Volume 19, issue 1 (March, 1993).
   *
   * @param commands an RDD containing Strings of commands
   * @return An RDD of ScoredBigram sorted by score
   */
  def g_2(commands:RDD[String]) :RDD[ScoredBigram] =  {
```

For the purposes of this analysis, it’s convenient to have an inner
function which is useful for computing the *G* significance given some
of the counts mentioned in the contingency table above.

``` 
/**
     * Returns the G score given command counts
     * @param p_xy The count of commands x and y consecutively
     * @param p_x The count of command x
     * @param p_y The count of command y
     * @param numCommands The total number of commands
     * @return The G score
     */
    def calculate(p_xy:Long, p_x:Long, p_y:Long, numCommands:Long) : Double = {
      val k11= p_xy // count of x and y together
      val k12= (p_x - p_xy) //count of x without y
      val k21= (p_y - p_xy) // count of y without x
      val k22= numCommands- (p_x + p_y - p_xy) //count of neither x nor y

      LogLikelihood.logLikelihoodRatio( k11.asInstanceOf[Long]
                                      , k12.asInstanceOf[Long]
                                      , k21.asInstanceOf[Long]
                                      , k22.asInstanceOf[Long]
                                      )
    }
```

So, again, the prelude is similar to the raw frequency case. Given a
line, let’s compute the bigrams of commands.

``` 
val parser = new CLIParserDriver
    // Convert the commands to lists of command pairs
    val commandsAsBigrams= commands.map( line => parser.toCommandBigrams(
            parser.getCommandTokens(parser.getSyntaxTree(line.toString))
                                                                        )
                                       )
```

First, let’s get some statistics about individual commands. To do this,
we need to count the individual commands (which are not the bookend
“END” command that our CLIParserDriver puts in for us).

``` 
   /*
     * Count the individual commands
     */
    // Count the number of commands that are not END, a special end command
    // This is essentially command count
    val commandCounts = commandsAsBigrams.flatMap(
      (bigrams:List[Bigram] ) => bigrams.flatMap(
            (bigram:Bigram) => List(bigram._1, bigram._2)
                                                ).filter(x => x != "END")
                                                 )
                                         .map( (command:String) => (command, 1))
                                         .reduceByKey( (x:Int, y:Int) => x + y)
```

With Spark, we can pull down this RDD locally into memory into the
Driver application. Since this scales only with the unique commands, it
should be sensible to pull this data locally. We’re going to use these
counts to create a map with which we can look up counts for a given
command. Spark is going to ship that map to the cluster, so we can use
it local to the transformations applied to the RDDs. This is a super
useful bit of candy and unexpected for those of us coming from the
traditional Hadoop stack (i.e. MapReduce and Pig development).

``` 
    // Collect the array of command to count pairs locally into an array
    val commandCountsArr = commandCounts.collect()
    // Create a Map from those pairs
    val commandCountsMap = Map(commandCountsArr:_*)
    //Count the values of command map to get the total number of commands
    val numCommands = commandCountsMap.foldLeft(0)( (acc, x) => acc + x._2)
```

Now that we’ve gotten some counts for individual commands, let’s do the
same for pairs of collocated commands.

``` 
    /*
     * Count the bigrams
     */
    val bigramsWithoutEnds = commandsAsBigrams.flatMap(
        bigrams => bigrams.filter( (bigram:Bigram) => bigram._2 != "END")
                                                      )
    val bigramCounts = bigramsWithoutEnds.map( (bigram:Bigram) => (bigram, 1) )
                                         .reduceByKey( (x:Int, y:Int) => x + y)
    val totalNumBigrams = bigramsWithoutEnds.count()
```

Now that we have a RDD with the bigrams and their counts, bigramCounts,
the map with the counts by individual command, commandCountsMap, we can
compute our *G* statistical significance test for each pair of
collocated commands.

``` 
/*
 * Score the bigrams using the individual command count map and the
 * bigram count RDD
 */
bigramCounts.map( (bigramCount:BigramCount) => (
  calculate( bigramCount._2 // The count of the pair of commands
           , commandCountsMap(bigramCount._1._1) //The count of the first command
           , commandCountsMap(bigramCount._1._2) //The count of the second command
           , numCommands // the total number of commands
           )
                                               , bigramCount._1 // the pair of commands
                                               )
                )
            .sortByKey(false) //sort the value (it's the first in the pair)
            .map( (x:Tuple2[Double, Bigram]) => (x._2, x._1)) //now invert the order
  }
```

Now, we have a RDD with the bigrams ranked by the *G* statistical
significance test.

## The Results

The result of this analysis is two rankings. One based on frequency and
one based on *G* score. I’ve taken the top 10 results from each ranking
and placed them in a table here along with their scores and relative
rankings. Note that while the table is sorted by *G* score, the columns
in the following table are sortable, so go explore. Also, for each
score, the higher the score, the more important the pair of commands.

<table class="tablesorter" id="resultTable">
<thead>
<tr>
<th colspan="2">Command</th>
<th><a href="https://github.com/cestella/UnixCommandAnalysis/blob/master/results.freq">Frequency</a></th>
<th>Relative Rank</th>
<th><a href="https://github.com/cestella/UnixCommandAnalysis/blob/master/results.g_2"><i>G</i> score</a></th>
<th>Relative Rank</th>
<th>Absolute Difference in Rank</th>
</tr>
</thead>
<tbody>
<tr>
<td>find</td>
<td>xargs</td>
<td>0.022</td>
<td>2</td>
<td>336.60</td>
<td>1</td>
<td>1</td>
</tr>
<tr>
<td>sort</td>
<td>uniq</td>
<td>0.019</td>
<td>3</td>
<td>262.10</td>
<td>2</td>
<td>1</td>
</tr>
<tr>
<td>du</td>
<td>sort</td>
<td>0.011</td>
<td>8</td>
<td>233.09</td>
<td>3</td>
<td>5</td>
</tr>
<tr>
<td>sort</td>
<td>grep</td>
<td>0.00037</td>
<td>500</td>
<td>163.51</td>
<td>4</td>
<td>496</td>
</tr>
<tr>
<td>awk</td>
<td>grep</td>
<td>0.003</td>
<td>41</td>
<td>156.78</td>
<td>5</td>
<td>36</td>
</tr>
<tr>
<td>grep</td>
<td>sort</td>
<td>0.002</td>
<td>66</td>
<td>108.48</td>
<td>6</td>
<td>60</td>
</tr>
<tr>
<td>uniq</td>
<td>sort</td>
<td>0.011</td>
<td>7</td>
<td>94.37</td>
<td>7</td>
<td>0</td>
</tr>
<tr>
<td>ps</td>
<td>grep</td>
<td>0.009</td>
<td>10</td>
<td>86.39</td>
<td>8</td>
<td>1</td>
</tr>
<tr>
<td>netstat</td>
<td>grep</td>
<td>0.006</td>
<td>15</td>
<td>83.88</td>
<td>9</td>
<td>4</td>
</tr>
<tr>
<td>cut</td>
<td>grep</td>
<td>0.00092</td>
<td>192</td>
<td>82.88</td>
<td>10</td>
<td>182</td>
</tr>
<tr>
<td>sort</td>
<td>head</td>
<td>0.009</td>
<td>9</td>
<td>44.21</td>
<td>34</td>
<td>25</td>
</tr>
<tr>
<td>grep</td>
<td>awk</td>
<td>0.031</td>
<td>1</td>
<td>24.37</td>
<td>77</td>
<td>76</td>
</tr>
<tr>
<td>grep</td>
<td>cut</td>
<td>0.014</td>
<td>4</td>
<td>10.27</td>
<td>369</td>
<td>365</td>
</tr>
<tr>
<td>awk</td>
<td>xargs</td>
<td>0.013</td>
<td>5</td>
<td>4.37</td>
<td>905</td>
<td>900</td>
</tr>
<tr>
<td>awk</td>
<td>sort</td>
<td>0.013</td>
<td>6</td>
<td>4.37</td>
<td>1632</td>
<td>1626</td>
</tr>
</tbody>
</table>


Takeaways from the analysis:

* As you can see by sorting the absolute difference in rank ascending, there is much overlap between the two rankings
* sort, uniq shows up second in the list for the G ranking, so at the very least this ranking can recover some of what our intuition indicates should be true.
* The relative difference between all of the pairs of commands where grep is the second in the pair have G ranking much higher (e.g. sort, grep has a difference in ranking of 496). Intuitively, this feels right considering the situations where I use grep as a filtering utility after some processing (i.e. sort, awk, etc).
* It is not proper, of course, to draw too many conclusions from an eyeball analysis as we are subject to humanity’s tendency to rationalize and find patterns to justify preconceived notions.

# Conclusions
The secondary purpose for this project is to discuss Spark as a platform for Data science. I’ll break it down into pros and cons regarding Spark.

## Fast, Featureful and Gets Things Done
Spark, contrary to traditional big data analytics platforms like Hadoop MapReduce, does not assume that caching is of no use. That being said, despite aggressive caching, they have worked hard to have graceful degradation when you cannot fit a working set into memory. This assumption is particularly true in data science, where you are refining a large dataset into a (possibly) much smaller dataset to operate on. The dominant pattern for modern big data analytics systems has always borrowed heavily from functional languages. Spark substantially reinforces this pattern. Not only did it choose a functional language, Scala, as a first-level programming language, but it borrowed most of your favorite higher-order functional primitives for collections or streams (e.g. foldl, foldr, flatMap, reduce, etc.).

## Exists within a Popular Programming Environment
Existing within the JVM (for the Scala and Java API bindings) and Python ecosystem (for the Python bindings), comes with the ability to use libraries written for two of the most popular programming environments available today in a dead-simple way. Everything from Stanford CoreNLP to scikit-learn is available without any of the integration challenges that you see in the big data scripting languages (i.e. wrapping the calls in user defined functions).

##  Works on Hadoop
Spark did not try to bite off more than it could chew. The AmpLabs guys realized that resource allocation in distributed systems is hard and they chose, quite correctly, to separate the analytics framework from the resource allocation framework. Initially, and continuing to today, they have strong support for Apache Mesos. With the advent of Hadoop 2.0 resource management and scheduling have been abstracted into YARN. This means that Spark can now run on Hadoop, which comes with the distinct advantage that you can run Spark alongside the rest of the Hadoop ecosystem applications, such as Apache Hive, Apache Pig, etc. With Hadoop’s increased adoption into the data center as a batch analytics system for doing ETL, it substantially decreases the barrier to entry to have Spark available as it can use the same hardware. An open question, however, is just how good Spark is at multitenancy. If anyone has any examples of large Hadoop MapReduce-based workloads being run alongside Spark (as opposed to running in separate clusters), I’d love to hear impressions and challenges.

##  Oriented toward the coding data scientist
Almost all of the previous positive points tag my orientation as in the “comfortable with coding” type of data scientist. I have attempted to keep my foot in both worlds and that biases my perspective. Many people working and doing good analytics are daunted, to say the least, with a (new to them, most likely) language like Scala. That being said, I think that two points alleviate this criticism:

* The quality support for the Spark Python API
* The SparkR package, intended to expose processing on RDDs and some of the RDD transformations to R.


These are attempts by the Spark community to reach out to the comfort-zone of the existing community of Data scientists by supporting some of their favorite tooling. I do not think that this will make someone who has had a career writing SAS comfortable in the system, unfortunately, but it does help.