---
layout: post
title: PredictionIO
date: 2014-02-20 
categories: [computer science]
tags: [machine learning, big data]

---


BASICS OF PREDICTIONIO
---

PredictionIO acts as a server that collects data and serve prediction results through REST APIs/SDKs. Conceptually, the 3 main building blocks are: *App*, *Engine* and *Algorithm*.

![](http://sungsoo.github.com/images/concepts-app-engine-algo.png)

App
---

App in PredictionIO Server is like a database or collection in a database server. It usually corresponds to the application you are building. Relevant data, such as user behavior, is collected by an app. An app contains one or more prediction engines. App data is shared among these engines.

Engine
---

An engine must belong to a prediction type (or engine type), such as Item Recommendation or Item Similarity. Each Engines process data and construct predictive model independently. Therefore, every engine serves its own set of prediction results. In an app, for example, you may create two engines: one for recommending news to users and another one for suggesting new friends to users. An algorithm must be deployed in each engine.

Algorithm
---

A number of built-in algorithms are available for use in each type of engine. An algorithm, and the setting of its parameters, determines how predictive model is constructed. In another word, prediction accuracy or performance can be improved by tuning a suitable algorithm. PredictionIO comes with tools and metrics for algorithm evaluation.


DATA COLLECTION
---

To make prediction, PredictionIO app collects mainly 3 types of data: User Data, Item Data and Behavioral Data.

User Data
---

Each user record corresponds to a unique user or customer of your application. The only required data attribute is a user ID string, which normally matches with the one in your database. You may also provide any extra data attributes, such as age, gender, location and income.

Item Data
---

An item record corresponds to an object of your application. An object can be anything, e.g., a book, a restaurant, a document, a product, a video or any other content. Each item record requires 2 data attributes: an Item ID string and an array of item types. You may also provide any extra data attributes to each item record. Similar to an user ID, an item ID normally matches with the ID of the corresponding object in your database. An item type is a string that categorizes an item.

### Item Type

There may be one or more type of items in your application. They can be categorized with item type strings. Each item can also belong to more than one item type. Let say you are building a software marketplace service that categorizes software as Freeware or Shareware. Each software is further categorized as Developer Tool, Database Server and System Utility etc. In this case, the item type array of an item record may look like this: ['Software', Freeware', 'Developer Tool'].

Behavioral Data
---

User-to-item actions and user-to-user actions are collected as behavioral data. They are used for constructing predictive models. A behavior record looks like this: User A likes Item X, where like is a user-to-item action type.

### Built-in Action Type

PredictionIO comes with some user-to-item action types:

<tt class="literal">like</tt>  
A user explicitly likes an item.

<tt class="literal">dislike</tt>  
A user explicitly dislikes an item.

<tt class="literal">rate</tt>  
A user gives rating to an item. It is a 1-5 scale score. 1 is the worst and 5 is the best. (so 3 is neutral) Please convert the score manually if your application follows a different rating scale.

<tt class="literal">view</tt>  
A user browses an item. It may be regarded as a soft implicit preference.

<tt class="literal">conversion</tt>  
A user performs an action that implies the strongest preference, e.g. when a user purchases a product, when a user download the content or when a user signs up a service.

You may also add your own custom action type.

concepts-app-engine-algo.png

concepts-systemdesign.png

References
---
[1] PredictionIO Guide, [*PredictionIO Concepts*](http://docs.prediction.io/current/concepts/index.html), 2013.