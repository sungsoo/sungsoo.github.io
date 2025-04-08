---
layout: post
title: Statistical Thinking in the Age of Big Data
date: 2014-03-18
categories: [computer science]
tags: [machine learning]

---

# Statistical Thinking in the Age of Big Data


> Big Data is a vague term, used loosely, if often, these days. But put simply, the catchall phrase means three things. First, it is a bundle of technologies. Second, it is a potential revolution in measurement. And third, it is a point of view, or philosophy, about how decisions will be—and perhaps should be—made in the future.  
— Steve Lohr, The New York Times

When you’re developing your skill set as a *data scientist*, certain foundational pieces need to be in place first—statistics, linear algebra, some programming. Even once you have those pieces, part of the challenge is that you will be developing several skill sets in parallel simultaneously—data preparation and munging, modeling, coding, visualization, and communication—that are interdependent. As we progress through the book, these threads will be intertwined. That said, we need to start somewhere, and will begin by getting grounded in statistical inference.


We expect the readers of this book [1] to have diverse backgrounds. For example, some of you might already be awesome software engineers who can build data pipelines and code with the best of them but don’t know much about statistics; others might be marketing analysts who don’t really know how to code at all yet; and others might be curious, smart people who want to know what this data science thing is all about.


So while we’re asking that readers already have certain prerequisites down, we can’t come to your house and look at your transcript to make sure you actually have taken a statistics course, or have read a statistics book before. And even if you have taken Introduction to Statistics—a course we know from many awkward cocktail party conversations that 99% of people dreaded and wish they’d never had to take—this likely gave you no flavor for the depth and beauty of statistical inference.


But even if it did, and maybe you’re a PhD-level statistician, it’s always helpful to go back to fundamentals and remind ourselves of what statistical inference and thinking is all about. And further still, in the age of Big Data, classical statistics methods need to be revisited and re- imagined in new contexts.


Statistical Inference
---

The world we live in is complex, random, and uncertain. At the same time, it’s one big data-generating machine.


As we commute to work on subways and in cars, as our blood moves through our bodies, as we’re shopping, emailing, procrastinating at work by browsing the Internet and watching the stock market, as we’re building things, eating things, talking to our friends and family about things, while factories are producing products, this all at least potentially produces data.


Imagine spending 24 hours looking out the window, and for every minute, counting and recording the number of people who pass by. Or gathering up everyone who lives within a mile of your house and making them tell you how many email messages they receive every day for the next year. Imagine heading over to your local hospital and rummaging around in the blood samples looking for patterns in the DNA. That all sounded creepy, but it wasn’t supposed to. The point here is that the processes in our lives are actually data-generating processes.


We’d like ways to describe, understand, and make sense of these processes, in part because as scientists we just want to understand the world better, but many times, understanding these processes is part of the solution to problems we’re trying to solve.


Data represents the traces of the real-world processes, and exactly which traces we gather are decided by our data collection or sampling method. You, the data scientist, the observer, are turning the world into data, and this is an utterly subjective, not objective, process.


After separating the process from the data collection, we can see clearly that there are two sources of randomness and uncertainty. Namely, the randomness and uncertainty underlying the process itself, and the uncertainty associated with your underlying data collection methods.


Once you have all this data, you have somehow captured the world, or certain traces of the world. But you can’t go walking around with a huge Excel spreadsheet or database of millions of transactions and look at it and, with a snap of a finger, understand the world and process that generated it.


So you need a new idea, and that’s to simplify those captured traces into something more comprehensible, to something that somehow captures it all in a much more concise way, and that something could be mathematical models or functions of the data, known as statistical estimators.


This overall process of going from the world to the data, and then from the data back to the world, is the field of *statistical inference*.


More precisely, statistical inference is the discipline that concerns itself with the development of procedures, methods, and theorems that allow us to extract meaning and information from data that has been generated by *stochastic (random) processes*.


# References
[1] Rachel Schutt and Cathy O’Neil, *Doing Data Science*, O’Reilly Media, Inc., 2014.
