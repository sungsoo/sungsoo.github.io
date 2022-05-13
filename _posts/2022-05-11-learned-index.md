---
layout: post
title: The Case for Learned Index Structures
date: 2022-05-11
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Stanford Seminar - The Case for Learned Index Structures](https://www.youtube.com/watch?v=NaqJO7rrXy0)


---

# The Case for Learned Index Structures

* EE380: Computer Systems Colloquium Seminar
* The Case for Learned Index Structures 
* Speaker: Alex Beutel and Ed Chi, Google

## Abstract

Indexes are models: a B-Tree-Index can be seen as a model to map a key to the position of a record within a sorted array, a Hash-Index as a model to map a key to a position of a record within an unsorted array, and a BitMap-Index as a model to indicate if a data record exists or not. In this talk, we take this premise and explain how existing database index structures can be replaced with other types of models, which we term learned indexes. The key idea is that a model can learn the sort order or structure of indexed data and use this signal to effectively predict the position or existence of records. We offer theoretical analysis under which conditions learned indexes outperform traditional index structures and we will delve into the challenges in designing learned index structures. Through addressing these challenges, our initial results show that learned indexes are able to outperform cache-optimized B-Trees by up to 70% in speed while saving an order-of-magnitude in memory over several real-world data sets. Finally, we will discuss the broader implications of learned indexes on database design and future directions for the ML for Database Systems research.


<iframe width="600" height="400" src="https://www.youtube.com/embed/NaqJO7rrXy0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## About the Speaker

Alex Beutel is a Senior Research Scientist in the Google Brain team working on neural recommendation, fairness in machine learning, and ML for Systems. He received his Ph.D. in 2016 from Carnegie Mellon University's Computer Science Department, and previously received his B.S. from Duke University in computer science and physics. His Ph.D. thesis on large-scale user behavior modeling, covering recommender systems, fraud detection, and scalable machine learning, was given the SIGKDD 2017 Doctoral Dissertation Award Runner-Up. He received the Best Paper Award at KDD 2016 and ACM GIS 2010, was a finalist for best paper in KDD 2014 and ASONAM 2012, and was awarded the Facebook Fellowship in 2013 and the NSF Graduate Research Fellowship in 2011. More details can be found at [http://alexbeutel.com](http://alexbeutel.com).

Ed H. Chi is a Principal Scientist at Google, leading machine learning research focusing on neural modeling and recommendation systems in the Google Brain team. He has launched significant improvements for YouTube, Google Play Store and Google+. With 39 patents and over 110 research articles, he is known for research on user behavior in web and social media. Prior to Google, he was the Area Manager and a Principal Scientist at Palo Alto Research Center's Augmented Social Cognition Group, where he led the team in understanding how social systems help groups of people to remember, think and reason.

Ed completed his three degrees (B.S., M.S., and Ph.D.) in 6.5 years from University of Minnesota. Recognized as an ACM Distinguished Scientist and elected into the CHI Academy, he has been featured and quoted in the press, including the Economist, Time Magazine, LA Times, and the Associated Press. Recognized recently with a 20-year Test of Time award for research in information visualization, Ed is also an avid swimmer, photographer and snowboarder in his spare time, and has a blackbelt in Taekwondo.