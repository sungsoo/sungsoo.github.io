---
layout: post
title: Populations and Samples
date: 2014-03-18
categories: [computer science]
tags: [data science]

---

# Populations and Samples

Let’s get some terminology and concepts in place to make sure we’re all talking about the same thing.


In classical statistical literature, a distinction is made between the population and the sample. The word population immediately makes us think of the entire US population of 300 million people, or the entire world’s population of 7 billion people. But put that image out of your head, because in statistical inference population isn’t used to simply describe only people. It could be any set of objects or units, such as tweets or photographs or stars.


If we could measure the characteristics or extract characteristics of all those objects, we’d have a complete set of *observations*, and the convention is to use *N* to represent the total number of observations in the population.


Suppose your population was all emails sent last year by employees at a huge corporation, BigCorp. Then a single observation could be a list of things: the sender’s name, the list of recipients, date sent, text of email, number of characters in the email, number of sentences in the email, number of verbs in the email, and the length of time until first reply.


When we take a *sample*, we take a subset of the units of size n in order to examine the observations to draw conclusions and make inferences about the population. There are different ways you might go about getting this subset of data, and you want to be aware of this sampling mechanism because it can introduce biases into the data, and distort it, so that the subset is not a “mini-me” shrunk-down version of the population. Once that happens, any conclusions you draw will simply be wrong and distorted.


In the BigCorp email example, you could make a list of all the employees and select 1/10th of those people at *random* and take all the email they ever sent, and that would be your sample. Alternatively, you could sample 1/10th of all email sent each day at random, and that would be your sample. Both these methods are reasonable, and both methods yield the same sample size. But if you took them and counted how many email messages each person sent, and used that to estimate the underlying *distribution* of emails sent by all indiviuals at BigCorp, you might get entirely different answers.


So if even getting a basic thing down like counting can get distorted when you’re using a reasonable-sounding sampling method, imagine what can happen to more complicated algorithms and models if you haven’t taken into account the process that got the data into your hands.


# Populations and Samples of Big Data


But, wait! In the age of Big Data, where we can record all users’ actions all the time, don’t we observe *everything*? Is there really still this notion of population and sample? If we had all the email in the first place, why would we need to take a sample?


With these questions, we’ve gotten to the heart of the matter. There are multiple aspects of this that need to be addressed.


Sampling solves some engineering challenges
---

In the current popular discussion of Big Data, the focus on enterprise solutions such as Hadoop to handle engineering and computational challenges caused by too much data overlooks sampling as a legitimate solution. At Google, for example, software engineers, data scientists, and statisticians sample all the time.


How much data you need at hand really depends on what your goal is: for analysis or inference purposes, you typically don’t need to store all the data all the time. On the other hand, for serving purposes you might: in order to render the correct information in a UI for a user, you need to have all the information for that particular user, for example.

Bias
---

Even if we have access to all of Facebook’s or Google’s or Twitter’s data corpus, any inferences we make from that data should not be extended to draw conclusions about humans beyond those sets of users, or even those users for any particular day.


Kate Crawford, a principal scientist at Microsoft Research, describes in her Strata talk, “Hidden Biases of Big Data,” how if you analyzed tweets immediately before and after Hurricane Sandy, you would think that most people were supermarket shopping pre-Sandy and partying post-Sandy. However, most of those tweets came from New Yorkers. First of all, they’re heavier Twitter users than, say, the coastal New Jerseyans, and second of all, the coastal New Jerseyans were worrying about other stuff like their house falling down and didn’t have time to tweet.


In other words, you would think that Hurricane Sandy wasn’t all that bad if you used tweet data to understand it. The only conclusion you can actually draw is that this is what Hurricane Sandy was like for the subset of Twitter users (who themselves are not representative of the general US population), whose situation was not so bad that they didn’t have time to tweet.


Note, too, that in this case, if you didn’t have context and know about Hurricane Sandy, you wouldn’t know enough to interpret this data properly.


Sampling
---
Let’s rethink what the population and the sample are in various contexts.

In statistics we often model the relationship between a population and a sample with an underlying mathematical process. So we make simplifying *assumptions* about the underlying truth, the mathematical structure, and shape of the underlying generative process that created the data. We observe only one particular realization of that generative process, which is that sample.


So if we think of all the emails at BigCorp as the population, and if we randomly sample from that population by reading some but not all emails, then that sampling process would create one particular sample. However, if we resampled we’d get a different set of observations.


The uncertainty created by such a sampling process has a name: the *sampling distribution*. But like that 2010 movie [*Inception*](http://en.wikipedia.org/wiki/Inception) with Leonardo DiCaprio, where he’s in a dream within a dream within a dream, it’s possible to instead think of the complete corpus of emails at BigCorp as not the population but as a sample.


This set of emails (and here is where we’re getting philosophical, but that’s what this is all about) could actually be only one single realization from some larger *super-population*, and if the Great Coin Tosser in the sky had spun again that day, a different set of emails would have been observed.


In this interpretation, we treat this set of emails as a sample that we are using to make inferences about the underlying generative process that is the email writing habits of all the employees at BigCorp.


New kinds of data
---

Gone are the days when data is just a bunch of numbers and categorical variables. A strong data scientist needs to be versatile and comfortable with dealing a variety of types of data, including;

* Traditional: numerical, categorical, or binary
* Text: emails, tweets, New York Times articles 
* Records: user-level data, timestamped event data, json-
formatted log files 
* Geo-based location data: NYC housing data
* Network 
* Sensor data 
* Images 


These new kinds of data require us to think more carefully about what sampling means in these contexts.

For example, with the firehose of real-time streaming data, if you analyze a Facebook user-level dataset for a week of activity that you aggregated from timestamped event logs, will any conclusions you draw from this dataset be relevant next week or next year?


How do you sample from a network and preserve the complex network structure?


Many of these questions represent open research questions for the statistical and computer science communities. This is the frontier! Given that some of these are open research problems, in practice, data scientists do the best they can, and often are inventing novel methods as part of their jobs.

# References
[1] Rachel Schutt and Cathy O’Neil, *Doing Data Science*, O’Reilly Media, Inc., 2014.
