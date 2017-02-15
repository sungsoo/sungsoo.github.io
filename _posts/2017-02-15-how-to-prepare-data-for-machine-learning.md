---
layout: post
title: How to Prepare Data For Machine Learning
date: 2017-02-15
categories: [computer science]
tags: [data management, machine learning]

---

## Article Source
* Title: [How to Prepare Data For Machine Learning](http://machinelearningmastery.com/how-to-prepare-data-for-machine-learning/)
* Authors: [Jason Brownlee](http://machinelearningmastery.com/author/jasonb/)

---

How to Prepare Data For Machine Learning
===
	

*Machine learning* algorithms learn from *data*. It is critical that you feed them the right data for the problem you want to solve. Even if you have good data, you need to make sure that it is in a *useful scale*, *format* and even that *meaningful features* are included.

In this post you will learn *how to prepare data for a machine learning algorithm*. 
This is a big topic and you will cover the essentials.

![](http://3qeqpr26caki16dnhd19sv6by6v.wpengine.netdna-cdn.com/wp-content/uploads/2013/12/lots-of-data-300x199.jpg) 

Lots of Data<br>Photo attributed to <a href="http://www.flickr.com/photos/cibomahto/4099422263/sizes/l/">cibomahto</a>, some rights reserved</div>

## Data Preparation Process

The more disciplined you are in your handling of data, the more consistent and better results you are like likely to achieve. The process for getting data ready for a machine learning algorithm can be summarized in three steps:

* **Step 1**: Select Data
* **Step 2**: Preprocess Data
* **Step 3**: Transform Data

You can follow this process in a linear manner, but it is very likely to be iterative with many loops.

## Step 1: Select Data

This step is concerned with selecting the subset of all available data that you will be working with. There is always a strong desire for including all data that is available, that the maxim “*more is better*” will hold. This may or may not be true.
You need to consider what data you actually need to address the question or problem you are working on. Make some assumptions about the data you require and be careful to record those assumptions so that you can test them later if needed.
Below are some questions to help you think through this process:

What is the extent of the data you have available? For example through time, database tables, connected systems. Ensure you have a clear picture of everything that you can use.
What data is not available that you wish you had available? For example data that is not recorded or cannot be recorded. You may be able to derive or simulate this data.
What data don’t you need to address the problem? Excluding data is almost always easier than including data. Note down which data you excluded and why.

It is only in small problems, like competition or toy datasets where the data has already been selected for you.

## Step 2: Preprocess Data

After you have selected the data, you need to consider how you are going to use the data. This preprocessing step is about getting the selected data into a form that you can work.
Three common data preprocessing steps are formatting, cleaning and sampling:

### Formatting

The data you have selected may not be in a format that is suitable for you to work with. The data may be in a relational database and you would like it in a flat file, or the data may be in a proprietary file format and you would like it in a relational database or a text file.

### Cleaning

Cleaning data is the removal or fixing of missing data. There may be data instances that are incomplete and do not carry the data you believe you need to address the problem. These instances may need to be removed. Additionally, there may be sensitive information in some of the attributes and these attributes may need to be anonymized or removed from the data entirely.

### Sampling

There may be far more selected data available than you need to work with. More data can result in much longer running times for algorithms and larger computational and memory requirements. You can take a smaller representative sample of the selected data that may be much faster for exploring and prototyping solutions before considering the whole dataset.

It is very likely that the machine learning tools you use on the data will influence the preprocessing you will be required to perform. You will likely revisit this step.

![](http://3qeqpr26caki16dnhd19sv6by6v.wpengine.netdna-cdn.com/wp-content/uploads/2013/12/So-much-data-300x225.jpg)

## Step 3: Transform Data

The final step is to transform the process data. The specific algorithm you are working with and the knowledge of the problem domain will influence this step and you will very likely have to revisit different transformations of your preprocessed data as you work on your problem.
Three common data transformations are scaling, attribute decompositions and attribute aggregations. This step is also referred to as feature engineering.

### Scaling

The preprocessed data may contain attributes with a mixtures of scales for various quantities such as dollars, kilograms and sales volume. Many machine learning methods like data attributes to have the same scale such as between 0 and 1 for the smallest and largest value for a given feature. Consider any feature scaling you may need to perform.

### Decomposition

There may be features that represent a complex concept that may be more useful to a machine learning method when split into the constituent parts. An example is a date that may have day and time components that in turn could be split out further. Perhaps only the hour of day is relevant to the problem being solved. consider what feature decompositions you can perform.

### Aggregation

There may be features that can be aggregated into a single feature that would be more meaningful to the problem you are trying to solve. For example, there may be a data instances for each time a customer logged into a system that could be aggregated into a count for the number of logins allowing the additional instances to be discarded. Consider what type of feature aggregations could perform.

You can spend a lot of time engineering features from your data and it can be very beneficial to the performance of an algorithm. Start small and build on the skills you learn.

## Summary

In this post you learned the essence of data preparation for machine learning. You discovered a three step framework for data preparation and tactics in each step:

### Step 1: Data Selection 
Consider what data is available, what data is missing and what data can be removed.

### Step 2: Data Preprocessing 
Organize your selected data by formatting, cleaning and sampling from it.

### Step 3: Data Transformation 
Transform preprocessed data ready for machine learning by engineering features using scaling, attribute decomposition and attribute aggregation.

Data preparation is a large subject that can involve a lot of iterations, exploration and analysis. Getting good at data preparation will make you a master at machine learning. For now, just consider the questions raised in this post when preparing data and always be looking for clearer ways of representing the problem you are trying to solve.

