---
layout: post
title: Predicting Car Prices using Neural Networks
date: 2018-04-12
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Predicting Car Prices Part 2: Using Neural Networks](http://dataillumination.blogspot.kr/2015/03/predicting-car-prices-part-2-using.html)
* Instructor(s):  [Peter Chen](http://www.blogger.com/profile/10706525566073861147)

---

# Predicting Car Prices using Neural Networks

![](http://sungsoo.github.com/images/neuralnetwork.jpg)

## 1 Introductions:

This is part two of the series. In part one, we used linear regression model to predict the prices of used Toyota Corollas. There are some overlap in the materials for those just reading this post for the first time. For those who read part 1 of the series using linear regression, then you can safely skip to the section where I applied neural networks to the same data set.

You can download this dataset: [https://github.com/datailluminations/PredictingToyotaPricesBlog](https://github.com/datailluminations/PredictingToyotaPricesBlog)

In this post, we will use neural networks! 

Let's load in the Toyota Corolla file and check out the first 5 lines to see what the data set looks like:

```r
##   Price Age    KM FuelType HP MetColor Automatic   CC Doors Weight
## 1 13500  23 46986   Diesel 90        1         0 2000     3   1165
## 2 13750  23 72937   Diesel 90        1         0 2000     3   1165
## 3 13950  24 41711   Diesel 90        1         0 2000     3   1165
## 4 14950  26 48000   Diesel 90        0         0 2000     3   1165
## 5 13750  30 38500   Diesel 90        0         0 2000     3   1170
```

Price, Age, KM(kilometers driven), Fuel Type, HP(horsepower), Automatic or Manual, Number of Doors, and Weight in pounds are the data collected in this file for Toyota Corollas.
In predictive models, there is a response variable(also called dependent variable), which is the variable that we are interested in predicting.

The independent variables(the predictors) are one or more numeric variables we are using to predict the response variable. Given we are using a linear regression model, we are assuming the relationship between the independent and dependent variables follow a straight line. Here. with neural network, we DO NOT assume a linear relationship. In fact, that's part of the power and flexibility of a neural network is that it can model nonlinearities in data very well.

But before we start our modeling exercise, it's good to take a visual look at what we are trying to predict to see what it looks like. Since we are trying to predict Toyota Corolla prices with historical data, let's do a simple histogram plot to see the distribution of Corolla prices:

![](http://sungsoo.github.com/images/nn01.png)


We see that most Corollas are around $10K and there are some at the tail end that over $25K. These might be newer cars with a lot of options. And there are fewer of them anyhow.

## 2 Data Transformation:

One of the main steps in the predictive analytics is data transformation. Data is never in the way you want them. One might have to do some kinds of transformations to get it to the way we need them either because the data is dirty, not of the type we want, out of bounds, and a host of other reasons.

In this case, we need to convert the categorical variables to numeric variables to feed into our linear regression model, because linear regression models only take numeric variables.
The categorical variable we want to do the transformation on is Fuel Types. We that there are 3 Fuel Types: 1) CNG 2) Diesel 3) Petrol

```r
summary(corolla$FuelType)
##    CNG Diesel Petrol 
##     17    155   1264
```

So, we can convert the categorical variable Fuel Type to two numeric variables: FuelType1 and FuelType2. We assign CNG to a new variable FuelType1 in which a 1 represents it's a CNG vehicle and 0 it's not. Likewise, we assign Diesel to a new variable FuelType2 in which a 1 represents it's a Diesel vehicle and 0 it's not.

So, what do we do with PETROL vehicles? This is represented by the case when BOTH FuelType1 and FuelType2 are zero.

```r
##   Price Age    KM HP MetColor Automatic   CC Doors Weight FuelType1
## 1 13500  23 46986 90        1         0 2000     3   1165         0
## 2 13750  23 72937 90        1         0 2000     3   1165         0
## 3 13950  24 41711 90        1         0 2000     3   1165         0
##   FuelType2
## 1         1
## 2         1
## 3         1
```

## 3 Exploratory Data Analysis (EDA):

The next step in predictive analytics is to explore our underlying. Let's do a few plots of our explantory variables to see how they look against Price.

![](http://sungsoo.github.com/images/nn02.png)


This plot is telling and fits out intuition. The newer the car the more expensive it is.

![](http://sungsoo.github.com/images/nn03.png)

The more miles a car has the cheaper it is.

![](http://sungsoo.github.com/images/nn04.png)

This one is not as direct as the other. Yes, the more horsepower the more expensive. But not always the case. Let's see how this variable will behave in our model.

![](http://sungsoo.github.com/images/nn05.png)

The fact that a color has a Metallic Color or not doesn't seem to be that useful. But let's see what the model says.

![](http://sungsoo.github.com/images/nn06.png)

What does this tell us about automatic vs manual cars?

![](http://sungsoo.github.com/images/nn07.png)

![](http://sungsoo.github.com/images/nn08.png) 

The number of cyclinders(CC) plots against Price seems to show the more cyclinder the more expensive though not always the case.

![](http://sungsoo.github.com/images/nn09.png)

What does this tell us about the number of doors as it relates to price of cars? Not much.

![](http://sungsoo.github.com/images/nn10.png)

 This shows the heavier(i.e. bigger) cars cost more though there are some outliers that doesn't fit nicely.

## 4 Model Building: Neural Network

Now, it's generally NOT a good idea to use your ENTIRE data sample to fit the model. What we want to do is to train the model on a sample of the data. Then we'll see how it perform outside of our training sample. This breaking up of our data set to training and test set is to evaluate the performance of our models with unseen data. Using the entire data set to build a model then using the entire data set to evaluate how good a model does is a bit of cheating or careless analytics.

## 5 Results with Training Data:

We use the first 1000 rows of data as training sample.
We have to normalized the data, which in this case means fitting into the range from 0 to 1. This is for theoretical reasons that will be explained in detail in a follow-up blog. Let's take a quick peek at the normalized data.

```r
##          Price       Age        KM         HP MetColor Automatic        CC
## 382  0.1275797 0.6708861 0.7166202 0.02439024        1         0 1.0000000
## 534  0.2831144 0.6455696 0.1962477 0.33333333        0         0 0.4285714
## 822  0.1538462 0.7974684 0.2885403 0.33333333        1         0 0.4285714
## 1302 0.0956848 1.0000000 0.2919271 0.33333333        1         1 0.4285714
## 289  0.2831144 0.5443038 0.1819637 0.22764228        1         0 0.1428571
##          Doors     Weight FuelType1 FuelType2
## 382  0.6666667 0.16260163         0         1
## 534  1.0000000 0.12195122         0         0
## 822  0.6666667 0.05691057         0         0
## 1302 1.0000000 0.16260163         0         0
## 289  1.0000000 0.09756098         0         0
```

Now, let's feed the normalized data into our neural network

```r
## hidden: 10, 10, 10    thresh: 0.01    rep: 1/1    steps:    1000 min thresh: 0.01444780388
##                                                             1914 error: 0.68337  aic: 683.36673  bic: 2356.91128 time: 4.84 secs
```

Let's see what it looks like(looks like a complex brain with all its neural connections):

![](http://sungsoo.github.com/images/nn11.png)

We are using neural network with 3 hidden layers(denoted by Hs) and each hidden layer has 10 neurons. The Bs are biases introduced.

In a follow-up blog, I'll explore the theory behind neural networks and it will make it clear how the math works.
Of course, we see all of our independent variables as inputs(Is) and one output layer which is the Price of used Toyota Corollas.

## 6 Model Evaluation: Neural Network

The real test of a good model is to test the model with data that it has not fitted. Here's where the rubber meets the road. We apply our model to unseen data to see how it performs.

### 6.1 Prediction using out-of-sample data.

Let's feed the test data(unseen) to our neural network.
But first we also have to normalized the test data set as well. Here are the first 5 rows:

```r
##             Age            KM           HP MetColor Automatic           CC
## 3  0.2820512821 0.20138764829 0.1707317073        1         0 1.0000000000
## 11 0.2948717949 0.15189775630 1.0000000000        0         0 0.7142857143
## 14 0.3717948718 0.11104566106 1.0000000000        1         0 0.7142857143
## 15 0.3846153846 0.16478926963 1.0000000000        1         0 0.7142857143
## 16 0.3333333333 0.09047235084 1.0000000000        0         0 0.7142857143
##    Doors       Weight FuelType1 FuelType2
## 3      0 0.3437500000         0         1
## 11     0 0.3854166667         0         0
## 14     0 0.3854166667         0         0
## 15     0 0.3854166667         0         0
## 16     0 0.3854166667         0         0
```

Once we normalized the test data, let's feed it into the neural network and see what the predictions are. Here are the first 5 rows of the normalized predictions:

```r
##            [,1]
## 3  0.4509980742
## 11 0.5642686175
## 14 0.5539187028
## 15 0.5105490069
## 16 0.5683168430
```

Once we have the predictions, we have to denormalized it to get it back to the car Prices!
Here are the first 5 rows of the Actual Prices vs. the Predictioned Prices:

```r
##    actual       Price
## 3   13950 16369.09868
## 11  20950 19387.75866
## 14  21500 19111.93343
## 15  22500 17956.13103
## 16  22000 19495.64387
```

Here are some common metrics to see how well the model predicts using various error metrics. The main takeway is we want our forecast errors to be small as possible. The smaller the forecast error the better the model is at predicting unseen data.

```r
me   # mean error
## [1] -425.1604158
```

ME is the mean error. The ideal ME is zero, which means on average the predicted value perfectly matches the actual value. This is rarely if ever the case. As in all things, we must determine what is an acceptable level of errors for our predictive analytics model and accept it. No such thing as a perfect model with zero forecast error.

```r
rmse # root mean square error
## [1] 1646.459233
```

RMSE is root mean squared error. A mean squared error(MSE) is the average of the sauared differences between the predicted value and the actual value. The reason we square is to not account for sign differences(negative differences and positive differences are the same thing when squared). RMSE brings it back to our normal unit by taking the square root of MSE>

```r
mape # mean absolute percent error 
## [1] 11.02359326
```

MAPE stands for mean absoute percent error and express the forecast errors in percentages.
On average, our model had a forecast error of only 11%. Not bad for a first pass at this data set using neural network. With neural network, we usually need more features engineering than the linear regression. Here, we did no features engineering to see how it would perform. And it performs very similar to the linear regresion. Are there ways to improve the model performances? Yes, to both linear regression and neural networks. We will cover those topics in future blog posts.

