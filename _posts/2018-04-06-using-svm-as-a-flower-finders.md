---
layout: post
title: Using Support Vector Machines as Flower Finders
date: 2018-04-06
categories: [computer science]
tags: [machine learning]

---


* Article Source: [Using Support Vector Machines as Flower Finders: Name that Iris!](https://joelcadwell.blogspot.com/2016/05/using-support-vector-machines-as-flower.html)
* Authors: [Joel Cadwell](https://www.r-bloggers.com/author/joel-cadwell/)

---

Using Support Vector Machines as Flower Finders: Name that Iris!
========

Nature field guides are filled with pictures of plants and animals that teach us what to look for and how to name what we see. For example, a flower finder might display pictures of different iris species, such as the illustrations in the plot below. You have in hand your own specimen from your garden, and you carefully compare it to each of the pictures until you find a good-enough match. [The pictures come from Wikipedia](https://en.wikipedia.org/wiki/Iris_flower_data_set), but the data used to create the plot are from [the R dataset iris](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/iris.html): sepal and petal length and width measured on 150 flowers equally divided across three species.

I have lifted the code directly from [the svm function in the R package e1071](http://www.inside-r.org/node/57517).

~~~r
library(e1071)
data(iris)
attach(iris)
 
## classification mode
# default with factor response:
model <- svm(Species ~ ., data = iris)
 
# alternatively the traditional interface:
x <- subset(iris, select = -Species)
y <- Species
model <- svm(x, y) 
 
print(model)
summary(model)
 
# test with train data
pred <- predict(model, x)
# (same as:)
pred <- fitted(model)
 
# Check accuracy:
table(pred, y)
 
# compute decision values and probabilities:
pred <- predict(model, x, decision.values = TRUE)
attr(pred, "decision.values")[1:4,]
 
# visualize (classes by color, SV by crosses):
plot(cmdscale(dist(iris[,-5])),
     col = as.integer(iris[,5]),
     pch = c("o","+")[1:150 %in% model$index + 1])
~~~



We will focus on the last block of R code that generates the *metric multidimensional scaling* (MDS) of the distances separating the 150 flowers calculated from sepal and petal length and width (i.e., the dist function applied to the first four columns of the iris data). Species plays no role in the MDS with the flowers positioned in a two-dimensional space in order to reproduce the *pairwise Euclidean distances*. However, species is projected onto the plot using color, and the observations acting as support vectors are indicated with plus signs (+).

The *setosa* flowers are represented by black circles and black plus signs. These points are separated along the first dimension from the *versicolor* species in red and *virginica* in green. The second dimension, on the other hand, seems to reflect some within-species sources of differences that do not differentiate among the three iris types.

We should recall that the dist function calculates pairwise distances in the original space without any kernel transformation. The support vectors, on the other hand, were identified from the svm function using a radial kernel and then projected back onto the original observation space. Of course, we can change the kernel, which defaults to "*radial*" as in this example from the R package. A linear kernel may do just as well with the iris data, as you can see by adding **kernel=**"*linear*" to the svm function in the above code.

![](https://i2.wp.com/1.bp.blogspot.com/-_p05w09FNec/V0R3nVsTeYI/AAAAAAAAAZ4/3hM61FuoUhoUDt0Gtz0HnAOl5z8date4wCKgB/s640/iris%2Bmds%2Bplot.jpg?resize=450%2C360&ssl=1)

It appears that we do not need all 150 flowers in order to identify the iris species. We know this because the svm function correctly classifies over 97% of the flowers with 51 support vectors (also called "*landmarks*" as noted in my last post Seeing Similarity in More Intricate Dimensions). The majority of the +’s are located between the two species with the greatest overlap. I have included the pictures so that the similarity of the red and green categories is obvious. This is where there will be confusion, and this is where the only misclassifications occur. If your iris is a setosa, your identification task is relatively easy and over quickly. But suppose that your iris resembles those in the cluster of red and green pluses between versicolor and virginica. This is where the finer distinctions are being made.

By design, this analysis was kept brief to draw an analogy between support vector machines and finder guides that we have all used to identify unknown plants and animals in the wild. Hopefully, it was a useful comparison that will help you understand how we classify new observations by measuring their distances in a kernel metric from a more limited set of support vectors (a type of global positioning with a minimal number of landmarks or exemplars as satellites).

When you are ready with your own data, you can view the videos from Chapter 9 of [An Introduction to Statistical Learning with Applications in R](https://www.r-bloggers.com/in-depth-introduction-to-machine-learning-in-15-hours-of-expert-videos/) to get a more complete outline of all the steps involved. My intent was simply to disrupt the feature mindset that relies on the cumulative contributions of separate attributes (e.g., the relative impact of each independent variable in a prediction equation). As objects become more complex, we stop seeing individual aspects and begin to bundle features into types or categories. We immediately recognize the object by its feature configuration, and these exemplars or landmarks become the new basis for our support vector representation.

