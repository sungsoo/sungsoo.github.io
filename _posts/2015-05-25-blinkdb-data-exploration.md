---
layout: post
title: Data Exploration Using BlinkDB
date: 2015-05-25
categories: [computer science]
tags: [big data]

---



# Data Exploration Using BlinkDB

BlinkDB is a large-scale data warehouse system like Shark that adds the
ability to create and use smaller samples of large datasets to make
queries even faster. Today you’re going to get a sneak peek at an alpha
release of BlinkDB. We’ll set up BlinkDB and use it to run some SQL
queries against the English Wikipedia, as in the Shark exercises. Don’t
worry if you haven’t seen SQL or Shark before, though - we haven’t
assumed that you have.

BlinkDB is in its alpha stage of development (the current release is
alpha-0.1.0), and you’ll probably notice some of its limitations. We’ll
mention them as they come up in the tutorial.

1.  First, launch the BlinkDB console:

    ``` 
     /root/blinkdb/bin/blinkdb
    ```

2.  Similar to Apache Hive, BlinkDB can query external tables (i.e.
    tables that are not created in BlinkDB). Before you do any querying,
    you will need to tell BlinkDB where the data is and define its
    schema.

    ``` 
    blinkdb> create external table wikistats (dt string, project_code string, page_name string, page_views int, bytes int) row format delimited fields terminated by ' ' location '/wiki/pagecounts';

    OK
    Time taken: 0.232 seconds
    ```

    **FAQ:** If you see the following errors, don’t worry. Things are
    still working under the hood.

    ``` 
    12/08/18 21:07:34 ERROR DataNucleus.Plugin: Bundle "org.eclipse.jdt.core" requires "org.eclipse.core.resources" but it cannot be resolved.
    12/08/18 21:07:34 ERROR DataNucleus.Plugin: Bundle "org.eclipse.jdt.core" requires "org.eclipse.core.runtime" but it cannot be resolved.
    12/08/18 21:07:34 ERROR DataNucleus.Plugin: Bundle "org.eclipse.jdt.core" requires "org.eclipse.text" but it cannot be resolved.
    ```

    **FAQ:** If you see errors like these, you might have copied and
    pasted a line break, and should be able to remove it to get rid of
    the errors.

        13/02/05 21:22:16 INFO parse.ParseDriver: Parsing command: CR
        FAILED: Parse Error: line 1:0 cannot recognize input near 'CR' '<EOF>' '<EOF>'

    **FAQ:** If you partially complete the exercises and then restart
    them later, *or* if you previously tried out the Shark exercises,
    your tables will stick around. You will see errors like this if you
    try to create them again:

        FAILED: Error in metadata: AlreadyExistsException(message:Table wikistats already exists)
        FAILED: Execution Error, return code 1 from org.apache.hadoop.hive.ql.exec.DDLTask

    To fix this, drop the table (`wikistats` or, introduced shortly,
    `wikistats_cached` or `wikistats_sample_cached`), then create it
    again using the same command described above. You can drop a table
    with:

        drop table wikistats;

3.  Like Shark, BlinkDB allows tables to be cached in the cluster’s
    memory for faster access. Any table having a name with the suffix
    “\_cached” is automatically cached. We’ll take advantage of caching
    to speed up queries on the `wikistats` table. Create a cached
    version of it:

    ``` 
    blinkdb> create table wikistats_cached as select * from wikistats;

    Moving data to: hdfs://ec2-107-22-9-64.compute-1.amazonaws.com:9000/user/hive/warehouse/wikistats_cached
    OK
    Time taken: 56.664 seconds
    ```

4.  First, check the number of records in the table. (If you have some
    familiarity with databases, note that we use the “`count(1)`” syntax
    here since in earlier versions of Hive, the more popular
    “`count(*)`” operation was not supported. BlinkDB supports most of
    Hive’s flavor of SQL. Hive SQL syntax is described in detail in the
    [Hive Getting Started
    Guide](https://cwiki.apache.org/confluence/display/Hive/GettingStarted).)

    ``` 
    blinkdb> select count(1) from wikistats_cached;

    OK
    329641466
    Time taken: 27.889 seconds
    ```

5.  Now let’s create a random sample of this table using BlinkDB’s
    `samplewith` operator and cache it in the cluster’s memory. We’ll
    use a sample that’s about 1% of the original Wikipedia dataset in
    size. This sample will be used to compute *approximations* to
    various queries on `wikistats_cached`.

    ``` 
    blinkdb> create table wikistats_sample_cached as select * from wikistats_cached samplewith 0.01;

    Moving data to: hdfs://ec2-107-22-9-64.compute-1.amazonaws.com:9000/user/hive/warehouse/wikistats_sample_cached
    OK
    Time taken: 22.703 seconds
    ```

    In alpha-0.1.0, we need to tell BlinkDB the size of the sample and
    of the original table. First, check the sample’s size. The sample
    table is just like any other table; you can run any SQL query you
    want on it, including `count`:

    ``` 
    blinkdb> select count(1) from wikistats_sample_cached;

    OK
    3294551
    Time taken: 3.011 seconds
    ```

    Since the sample size is random, you may get a slightly different
    answer than the one listed here. It should be close to 1% of the
    original table’s size.

    Now declare the sample size. Replace the number here with the result
    of the `count` query you just ran.

    ``` 
    set blinkdb.sample.size=3294551; -- (Replace this with the result of your query.)
    ```

    Finally, declare the original table’s size.

    ``` 
    set blinkdb.dataset.size=329641466;
    ```

6.  Our first real task is to compute a simple count of the number of
    English records (i.e., those with “`project_code="en"`”). We’re not
    using our sample yet.

    ``` 
    blinkdb> select count(1) from wikistats_cached where project_code = "en";

    OK
    122352588
    Time taken: 21.632 seconds
    ```

7.  Now approximate the same count using the sampled table. In
    alpha-0.1.0, you need to tell BlinkDB to compute an approximation by
    prepending “`approx_`” to your aggregation function. (Also, only
    queries that compute `count`, `sum`, or `average` can be
    approximated. In the future many more functions, including UDFs,
    will be approximable.)

    ``` 
    blinkdb> select approx_count(1) from wikistats_sample_cached where project_code = "en";

    OK
    122340466 +/- 225926.0 (99% Confidence)
    Time taken: 2.993 seconds
    ```

    Notice that our sampled query produces a slightly incorrect answer,
    but it runs faster. (The answer you see will be slightly different
    from our example output, but it should be close.) Also, the query
    result now includes some additional text, which tells us how close
    BlinkDB thinks it is to the true answer. In this case, BlinkDB
    reports that the interval [122114540, 122566392] (this is just
    subtracting or adding 225926.0 to 122340466) probably contains the
    true count.

    Technically, this interval is a 99% confidence interval. Confidence
    intervals come with the guarantee that, if you were to repeatedly
    create new samples using the `samplewith` operator and then perform
    this query on each sample, the confidence interval reported by
    BlinkDB would contain the true answer (122352588) at least 99% of
    the time. A simpler (though not entirely correct) interpretation is
    that there is a 99% chance that the true count is inside the
    confidence interval.

8.  Now we would like to find out the average number of hits on pages
    with “San Francisco” in the title throughout the entire period:

    ``` 
    blinkdb> select approx_avg(page_views) from wikistats_sample_cached where lcase(page_name) like "%san_francisco%";

    OK
    3.053745928338762 +/- 0.9373634631550505 (99% Confidence)
    Time taken: 12.09 seconds
    ```

    You can also compute an exact answer by running the same query on
    the table `wikistats_cached`, replacing “`approx_avg`” with “`avg`”:

    ``` 
    blinkdb> select avg(page_views) from wikistats_cached where lcase(page_name) like "%san_francisco%";

    OK
    3.0695254665165628
    Time taken: 56.802 seconds
    ```

9.  BlinkDB is targeted at interactive-speed analysis, so let’s dive a
    little further into traffic patterns on Wikipedia. First, check
    which time intervals had the most traffic:

    ``` 
    blinkdb> select dt, approx_sum(page_views) as views from wikistats_sample_cached group by dt order by views;

    OK
    20090505-060000 1.0786954974766022E7 +/- 146937.0 (99% Confidence)
    20090507-040000 1.0887732096864136E7 +/- 147621.0 (99% Confidence)
    . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
    . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
    20090506-120000 1.6188188397563733E7 +/- 183528.0 (99% Confidence)
    . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
    . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
    20090506-180000 2.1917472869256794E7 +/- 270395.0 (99% Confidence)
    20090505-200001 5.331630157237396E7 +/- 1256778.0 (99% Confidence)
    Time taken: 1.195 seconds
    ```

    **NOTE:** alpha-0.1.0 only supports lexographic ordering using the
    `orderby` operator. We will introduce numerical ordering in
    alpha-0.2.0.

10. The hour “`20090506-120000`” seems to be a fairly typical interval.
    Now let’s see which project codes (roughly, which languages)
    contributed to this:

    ``` 
    blinkdb> select project_code, approx_sum(page_views) as views from wikistats_sample_cached where dt="20090506-120000" group by project_code;

    OK
    vi.d    10197.941673238138 +/- 2724.0 (99% Confidence)
    sr  10297.921493564003 +/- 2984.0 (99% Confidence)
    . . . . . . . . . . . . . . . . . . . . . . . . . .
    . . . . . . . . . . . . . . . . . . . . . . . . . .
    io.d    999.798203258641 +/- 859.0 (99% Confidence)
    nds 999.798203258641 +/- 974.0 (99% Confidence)
    Time taken: 1.407 seconds
    ```

    Since our sample is randomly generated, your results will probably
    look a little different. Notice that the rarer project codes are not
    well represented and have wide confidence intervals, but we can see
    roughly how many views the most popular project codes got.

11. We might also be interested in whether the amount of traffic on a
    project matches its page count:

    ``` 
    blinkdb> select project_code, approx_count(1) as num_pages, approx_sum(page_views) as views from
    wikistats_sample_cached where dt="20090506-160000" group by project_code;

    OK
    fr  315836 +/- 14463.0 (99% Confidence) 1003897.3758920014 +/- 45994.0 (99% Confidence)
    de.b    5798 +/- 1961.0 (99% Confidence)    10397.901313889866 +/- 3516.0 (99% Confidence)
    . . . . . . . . . . . . . . . . . . . . . . . . . .. . . . . . . . . . . . . . . . . . . .
    . . . . . . . . . . . . . . . . . . . . . . . . . .. . . . . . . . . . . . . . . . . . . .
    vi.b    699 +/- 682.0 (99% Confidence)  999.798203258641 +/- 974.0 (99% Confidence)
    kk  699 +/- 682.0 (99% Confidence)  999.798203258641 +/- 974.0 (99% Confidence)
    Time taken: 0.907 seconds
    ```

12. However, the random sampling used by BlinkDB doesn’t always work
    well. For instance, try computing the average number of hits on all
    pages:

    ``` 
    blinkdb> select approx_avg(page_views) from wikistats_sample_cached;

    OK
    3.6420454545454546 +/- 1.7610655103860877 (99% Confidence)
    Time taken: 3.407 seconds
    ```

    Also try computing the true average on the original table. You’ll
    probably notice that the 99% confidence interval provided by BlinkDB
    doesn’t cover the true answer.

13. Let’s investigate this a bit further. The kind of sampling supported
    in alpha-0.1.0 (simple random sampling) typically works poorly on
    data that contains large, important outliers. Let’s check what the
    raw distribution of `page_views` looks like. (You can also try this
    on `wikistats_sample_cached`; percentiles on samples are not
    officially supported yet, but unofficially they work quite well!)

    ``` 
    blinkdb> select percentile_approx(page_views, array(0.01, 0.1, 0.3, 0.5, 0.7, 0.9, 0.99, 0.999)) as page_views_percentiles from wikistats_cached;

    OK
    [1.0,1.0,1.0,1.0,1.9999999999999998,4.867578875914043,35.00000000000001,151.9735162220546]
    Time taken: 31.241 seconds
    ```

    Note that `percentile_approx` is not one of the BlinkDB
    approximation operators (which are *prefixed* by “`approx_`”). It is
    a normal Hive SQL operator that computes approximate percentiles on
    a given column.

    Most pages have only a few views, but there are some pages with a
    very large number of views. If a sample misses one of these
    outliers, it will look very different from the original table, and
    accuracy of both approximations and confidence intervals will
    suffer.

14. If you like, continue to explore the Wikipedia dataset. BlinkDB
    alpha-0.1.0 supports the following approximate aggregation
    functions: `approx_sum`, `approx_count`, and `approx_avg`, with more
    to come soon.

15. To exit BlinkDB, type the following at the BlinkDB command line (and
    don’t forget the semicolon!).

    ``` 
    blinkdb> exit;
    ```

