---
layout: post
title: R Graphics 
date: 2015-09-26
categories: [computer science]
tags: [big data]

---


# R Graphics


R is a high-level programming language used primarily for statistical
computing and graphics. 


## Base Graphics Package

```r
library(ggplot2)

# Base Graphics package
help(graphics)
demo(graphics, package='graphics')
plot(diamonds$color) 

colors <- table(diamonds$color)
pie(colors, labels=names(colors))
dotchart(colors)

boxplot(which="plot", diamonds$carat)
plot(diamonds$color, diamonds$carat)
plot(diamonds$carat, diamonds$color)

hist(diamonds$carat)
stripchart(diamonds$carat)

spineplot(diamonds$carat, diamonds$color)
pairs(data=diamonds, carat ~ price)

# Three examples to compare with other packages
plot(x=diamonds$cut)  # bar
plot(x=diamonds$color, y=diamonds$price) # box
plot(x=diamonds$x, y=diamonds$y, cex=.3) # scatter
```

## Lattice Graphics Package

```r
library(ggplot2) # Using this for the diamonds dataset

library(lattice)
demo('lattice',package='lattice')

barchart(diamonds$color)
xyplot(price ~ carat, data = diamonds)

#Comparing ggplot2 and lattice
#http://learnr.wordpress.com/2009/06/28/ggplot2-version-of-figures-in-lattice-multivariate-data-visualization-with-r-part-1/

# Compare lattice and plot from base grapics

plot(iris$Sepal.Length, iris$Sepal.Width, cex=0.5)

# plot(x, y)
# xyplot(y ~ x, data = dataset)

# Lattice uses xyplot y ~ x
# The dataframe is split out, so only the columns need to be identified.

xyplot(Sepal.Width ~ Sepal.Length, iris)

# Lattice is better at dealing with additional variables.

# At times, analyzing 2 variables is insufficient.
# Interaction with a third variable might affect the relationship.

# This is possible but gets a bit cumbersome in base graphics.


par(mfrow=c(2,2))
s<-subset(iris, Species=='virginica')
plot(s$Sepal.Length, s$Sepal.Width, cex=0.5)
title(main = "virginica")

# skip a cell.
plot.new()

s<-subset(iris, Species=='setosa')
plot(s$Sepal.Length, s$Sepal.Width, cex=0.5)
title(main = "setosa")
s<-subset(iris, Species=='versicolor')
plot(s$Sepal.Length, s$Sepal.Width, cex=0.5)
title(main = "versicolor")

# Base graphics often requires a number of short function calls
# lattice charts can often be created with a single long call

xyplot(Sepal.Width ~ Sepal.Length | Species, iris)

# y~x | A means display the relationship between variables y and x
# separately for every combination of factor A
```

## ggplot2 Package

```r
demo(package='ggplot2') #None

# Comparing base R plots and ggplot2

# Bar Chart
plot(x=diamonds$color) 
ggplot(diamonds, aes(x=color) ) + geom_bar()

# Box Chart
plot(x=diamonds$color, y=diamonds$price)
ggplot(diamonds, aes(x=color, y=price)) + geom_boxplot()

# scatter plot
plot(x=diamonds$x, y=diamonds$y, cex=.3)
ggplot(diamonds, aes(x=x, y=y)) + geom_point()


# ggvis
library(ggvis)
library(ggplot2)
ggplot(diamonds, aes(x=x, y=y))  +  geom_point()
ggvis (diamonds,      ~x,   ~y) %>% layer_points()
ggvis (diamonds,      ~x,   ~y) %>% layer_points(size := input_slider(10, 300, value = 10))


# We start with a bar chart that indicates a count of
# the number of times each color appears in the diamonds
# data set.  You might want to make a mental note, color G has the most
# and color J the least.
ggplot(diamonds, aes(x=color) ) + geom_bar()

# The data in this example is the diamonds dataset, specifically
# a count of occurences of each value in the color field.  Data
# is one aspect of the grammar of graphics.  The count of each
# value in color is represented by the height of the bar in the 
# bar chart.  This is called an "aesthetic mapping" in ggplot2.
# We can map this data in many different ways.  For instance, in
# addition to making the size of the bar dependent upon the count
# for each value, we could indicate that - rather than dark
# grey - each bar should be its own color.  We can accomplish this
# by mapping diamond color to the fill aesthetic.

ggplot(diamonds, aes(x=color, fill=color) ) + geom_bar()

# Now each bar is its own color, and a legend is included on the side.
# One of the less obvious grammatical elements in this math is a
# coordinate system.  We are using traditional cartesian coordinate
# system where a two dimensional plain includes a horizontal axis 
# and A vertical axis.  But other coordinate systems do exist and
# are made evident when considering charts represented by the grammar
# of graphics.  So let's say we wanted to simply stack all of these
# bars into one single bar.  We can do this by assigning a single
# value to the x-axis.

ggplot(diamonds, aes(x='', fill=color) ) + geom_bar(width = 1)

# This type of chart might not seem very familiar in a cartesian
# coordinate system.  But if we represent the same graph with polar
# coordinates:
ggplot(diamonds, aes(x='', fill=color) ) + geom_bar(width = 1) + coord_polar()

# Now rather than bars, the count of each color is represented by the
# width of the ring.  By modifying the call to use polar coordinates
# to divide the circle by making the count represent the width of an
# angle emminating from the center of the circle...
ggplot(diamonds, aes(x='', fill=color) ) + geom_bar(width = 1) + coord_polar(theta="y")

# We see a familar pie chart.  
```

