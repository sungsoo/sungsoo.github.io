---
layout: post
title: The Data Science Process
date: 2014-03-19
categories: [computer science]
tags: [machine learning]

---

# The Data Science Process

Let’s put it all together into what we define as the data science process. The more examples you see of people doing data science, the more you’ll find that they fit into the general framework shown in Figure 2-2. As we go through the book, we’ll revisit stages of this process and examples of it in different ways.

![data-science-process.png](http://sungsoo.github.com/images/data-science-process.png)


First we have the Real World. Inside the Real World are lots of people busy at various activities. Some people are using Google+, others are competing in the Olympics; there are spammers sending spam, and there are people getting their blood drawn. Say we have data on one of these things.


Specifically, we’ll start with raw data—logs, Olympics records, Enron employee emails, or recorded genetic material (note there are lots of aspects to these activities already lost even when we have that raw data). We want to process this to make it clean for analysis. So we build and use pipelines of data munging: joining, scraping, wrangling, or whatever you want to call it. To do this we use tools such as Python, shell scripts, R, or SQL, or all of the above.

Eventually we get the data down to a nice format, like something with columns:


	name | event | year | gender | event time

	This is where you typically start in a standard statistics class, with a clean, orderly dataset. But it’s not where you typically start in the real world.

Once we have this clean dataset, we should be doing some kind of EDA. In the course of doing EDA, we may realize that it isn’t actually clean because of duplicates, missing values, absurd outliers, and data that wasn’t actually logged or incorrectly logged. If that’s the case, we may have to go back to collect more data, or spend more time cleaning the dataset.

Next, we design our model to use some algorithm like k-nearest neighbor (k-NN), linear regression, Naive Bayes, or something else. The model we choose depends on the type of problem we’re trying to solve, of course, which could be a classification problem, a prediction problem, or a basic description problem.

We then can interpret, visualize, report, or communicate our results. This could take the form of reporting the results up to our boss or coworkers, or publishing a paper in a journal and going out and giving academic talks about it.

Alternatively, our goal may be to build or prototype a “data product”; e.g., a spam classifier, or a search ranking algorithm, or a recommendation system. Now the key here that makes data science special and distinct from statistics is that this data product then *gets incorporated back* into the real world, and users interact with that product, and that generates more data, which creates a feedback loop.

This is very different from predicting the weather, say, where your model doesn’t influence the outcome at all. For example, you might predict it will rain next week, and unless you have some powers we don’t know about, you’re not going to cause it to rain. But if you instead build a recommendation system that generates evidence that “lots of people love this book,” say, then you will know that you caused that feedback loop.


Take this loop into account in any analysis you do by adjusting for any biases your model caused. Your models are not just predicting the future, but *causing* it!

A data product that is productionized and that users interact with is at one extreme and the weather is at the other, but regardless of the type of data you work with and the “data product” that gets built on top of it—be it public policy determined by a statistical model, health insurance, or election polls that get widely reported and perhaps influence viewer opinions—you should consider the extent to which your model is influencing the very phenomenon that you are trying to observe and understand.


A Data Scientist’s Role in This Process
---

This model so far seems to suggest this will all magically happen without human intervention. By “human” here, we mean “data scientist.” Someone has to make the decisions about what data to collect, and why. That person needs to be formulating questions and hypotheses and making a plan for how the problem will be attacked. And that someone is the data scientist or our beloved data science team.

Let’s revise or at least add an overlay to make clear that the data scientist needs to be involved in this process throughout, meaning they are involved in the actual coding as well as in the higher-level process, as shown in Figure 2-3.

![data-scientist.png](http://sungsoo.github.com/images/data-scientist.png)


Connection to the Scientific Method
---

We can think of the data science process as an extension of or variation of the scientific method:

* Ask a question.
* Do background research.
* Construct a hypothesis.
* Test your hypothesis by doing an experiment.
* Analyze your data and draw a conclusion.
* Communicate your results.

In both the data science process and the scientific method, not every problem requires one to go through all the steps, but almost all problems can be solved with some combination of the stages. For example, if your end goal is a data visualization (which itself could be thought of as a data product), it’s possible you might not do any machine learning or statistical modeling, but you’d want to get all the way to a clean dataset, do some exploratory analysis, and then create the visualization.

# References
[1] Rachel Schutt and Cathy O’Neil, *Doing Data Science*, O’Reilly Media, Inc., 2014.
