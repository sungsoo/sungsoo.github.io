---
layout: post
title: Building a Neural Network Using the Iris Data Set
date: 2018-04-05
categories: [computer science]
tags: [machine learning]

---


* Article Source: [Building a Neural Network Using the Iris Data Set: Exercises](https://www.r-exercises.com/2017/11/17/iris-neural-network-exercises/)
* Authors: [Thomas Pinder](https://www.r-exercises.com/author/tompinder/)

---

Building a Neural Network Using the Iris Data Set
========

*Neural Networks* is one of the most common machine learning algorithms and with good reason. Neural networks are particularly good when applied to problems, such as *image recognition* and *natural language processing*, where there is a large amount of input data.

Through an *input layer*, one or more *hidden layers*, and an *output layer*, a neural network works by connecting up a series of *neurons* with *weights* assigned to each connection. As each connection is activated, a calculation is performed on the connection before passing through an *activation function* at each level of the hidden layers. Commonly, these activation functions are either the **RELU**, **sigmoid** or **tanh**. Their purpose is usually to determine whether the next layer should be *activated*.

Within this tutorial, we're going to develop a very simple classification neural network on the commonly used iris dataset. Before starting, you should install the neuralnet, ggplot2, dplyr, and reshape2 libraries. 

## Exercise 1

Load the neuralnet, ggplot2, and dplyr libraries, along with the iris dataset. Set the seed to 123.

```r
install.packages("neuralnet")
## Error in contrib.url(https://www.r-exercises.com/2017/11/17/iris-neural-network-solutions/repos, type): trying to use CRAN without setting a mirror
library(neuralnet)
library(ggplot2)
library(nnet)
library(dplyr)
library(reshape2)

data("iris")

set.seed(123)
```

## Exercise 2

Explore the distributions of each feature present in the iris dataset. Feel free to get creative here. I myself opted for a violin plot.

```r
exploratory_iris <- melt(iris)
exploratory_iris %>%
  ggplot(aes(x = factor(variable), y = value)) +
  geom_violin() +
  geom_jitter(height = 0, width = 0.1, aes(colour = Species), alpha = 0.7) +
  theme_minimal()
```
![](https://r-exercises.com/wp-content/uploads/2017/10/neuralnet-1.png)

## Exercise 3

Convert your observation class and Species into one hot vector.

```r
labels <- class.ind(as.factor(iris$Species))
```

## Exercise 4

Write a generic function to standardize a column of data.

```r
standardiser <- function(x){
  (x-min(x))/(max(x)-min(x))
}
```

## Exercise 5

Now standardize the predictors. Hint: lapply will be useful here.

```r
iris[, 1:4] <- lapply(iris[, 1:4], standardiser)
```

## Exercise 6

Combine your one hot labels and standardized predictors.

```r
pre_process_iris <- cbind(iris[,1:4], labels)
```

## Exercise 7

Define your formula that your neuralnet will be run on. You'll need to use the as.formula function here.

```r
f <- as.formula("setosa + versicolor + virginica ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width")
```


## Exercise 8

Create a neural network object, now using the tanh function and two hidden layers of size 16 and 12. You will also need to tell the neural network that you're performing a classification algorithm here, not regression. You'll want to refer to the neuralnet documentation as to how to define this.


```r
iris_net <- neuralnet(f, data = pre_process_iris, hidden = c(16, 12), act.fct = "tanh", linear.output = FALSE)
```
## Exercise 9

Plot your neural network.

```r
plot(iris_net)
```

## Exercise 10

Using the compute function and your neural network object's net.result attribute, calculate the overall accuracy of your neural network.

```r
iris_preds <- compute(iris_net, pre_process_iris[, 1:4])
origi_vals <- max.col(pre_process_iris[, 5:7])
pr.nn_2 <- max.col(iris_preds$net.result)
print(paste("Model Accuracy: ", round(mean(pr.nn_2==origi_vals)*100, 2), "%.", sep = ""))
"Model Accuracy: 100%."
```

Learn more about neural networks in the online course [Machine Learning A-Z™: Hands-On Python & R In Data Science](http://www.r-exercises.com/product/machine-learning-a-z-hands-on-python-r-in-data-science/). In this course you will learn how to:

* Work with Deep Learning networks and related packages in R
* Create Natural Language Processing models
* And much more

