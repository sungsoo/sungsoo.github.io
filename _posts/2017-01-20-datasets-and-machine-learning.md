---
layout: post
title: DataSets and Machine Learning 
date: 2017-01-20
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [DataSets and Machine Learning](https://deeplearning4j.org/data-sets-ml)

---

DataSets and Machine Learning
===

One of the hardests problems to solve in deep learning has nothing to do with neural nets: it’s the problem of getting the *right data* in the *right format*.

*Deep learning*, and *machine learning* more generally, needs a *good training set* to work properly. *Collecting* and *constructing* the training set – a sizable body of known data – takes *time* and *domain-specific knowledge* of where and how to gather relevant information. The training set acts as the benchmark against which deep-learning nets are trained. That is what they learn to reconstruct before they’re unleashed on data they haven’t seen before.

At this stage, knowledgeable humans need to find the *right raw data* and *transform* it into a *numerical* representation that the deep-learning algorithm can understand, a *vector*. Building a training set is, in a sense, **pre-pre-training**.

Training sets that require much time or expertise can serve as a proprietary edge in the world of data science and problem solving. The nature of the expertise is largely in telling your algorithm what matters to you by selecting what goes into the training set.

It involves telling a story – through the initial data you select – that will guide your deep-learning nets as they extrapolate the significant features, both in the training set and in the raw data they’ve been created to study.

To create a useful training set, you *have to understand the problem* you’re solving; i.e. what you want your deep-learning nets to pay attention to.

## The Two Datasets of Machine Learning

Machine learning typically works with three data sets: *training*, *dev* and *test*. All three should randomly sample a larger body of data.

The first set you use is the **training set**, the largest of the three. Running a training set through a neural network teaches the net how to weigh different features, assigning them coefficients according to their likelihood of minimizing errors in your results.

Those *coefficients*, also known as metadata, will be contained in vectors, one for each each layer of your net. They are the most important results you will obtain from training a neural network.

The second set is your **test set**. It functions as a seal of approval, and you don’t use it until the end. After you’ve trained and optimized your data, you test your neural net against this final random sampling. The results it produces should validate that your net accurately recognizes images, or recognizes them at least [x] percentage of them.

If you don’t get accurate predictions, go back to the training set, look at the hyperparameters you used to tune the network, as well as the quality of your data and look at your pre-processing techniques.

Now that you have the overview, we’ll show you how to create [custom datasets](https://deeplearning4j.org/customdatasets.html).

Various [repositories of open data sets](https://deeplearning4j.org/opendata) that may be useful in training neural networks are available through the link.

## Public Datasets for Machine Learning


1.  [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/)
    Collection of benchmark datasets for regression and classification
    tasks
2.  [UCI KDD Archive](http://kdd.ics.uci.edu/) Extended version of UCI
    datasets
3.  [DELVE
    datasets](http://www.cs.toronto.edu/~delve/data/datasets.html)
    Platform for comparative assessment of regression and classification
    tasks
4.  [Nonlinear dimensinality
    reduction](http://isomap.stanford.edu/datasets.html)
5.  [DMOZ open
    directory](http://www.dmoz.org/Computers/Artificial_Intelligence/Machine_Learning/Datasets/)
    collection of links for different datasets
6.  [Google
    directory](http://www.google.com/Top/Computers/Artificial_Intelligence/Machine_Learning/Datasets/)
    collection of links for different datasets
7.  [ChemDB](http://cdb.ics.uci.edu/cgibin/LearningDatasetsWeb.psp)
    chemical data that can be used as datasets for machine learning
8.  [Golem
    dataset](http://www.comlab.ox.ac.uk/activities/machinelearning/applications.html)
    trying to learn rules for prediction