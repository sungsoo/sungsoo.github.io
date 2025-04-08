---
layout: post
title: Generating random numbers and plots in Python
date: 2014-01-11
categories: [information technology]
tags: [design patterns]

---

By using Python's pseudo-random number generation routines, we can generate artificial data sets that help us in exploring statistical concepts such as distributions, variance, and sampling. Generating fake data is an excellent way of understanding a statistical procedure: if you know the "ground truth" in advance, you can find out whether or not your statistical method is capable of discovering it. In particular, you can set things up so that the ground truth is "no relationship" and look at how often your procedure produces a false alarm.

Note that if you only ever work with real data sets, this kind of checking is not possible, as you can never have absolute confidence that the effect you've found is real.

By using the graphical methods of the PyLab library, we can visualize the artificial data sets we create. We can also save these visualizations in a variety of formats to use when reporting on the data.

Histogram of some random variates
---
We can produce the histogram above, showing 50 real-number random variates between 0 and 1.

![](http://sungsoo.github.com/images/real-random.png)

```python
import pylab
import random

sampleSize = 50  ## Try making this value bigger

## Initialize the random seed using the system clock
## (although this is done by default anyway)

random.seed()


## Let's start with the simplest thing and collect a sample
## of real-number random variates between 0 and 1

realRandomVariates = []
for i in range(sampleSize):
    newValue = random.random()
    realRandomVariates.append(newValue)

print "Here are", sampleSize, "real-numbered random variates between 0 and 1."
print realRandomVariates


## To get a better look at these numbers, let's use a histogram
## We can view the histogram interactively, but it's also trivial
## to save it in PDF and PNG formats for use in reports

pylab.hist(realRandomVariates,10)
pylab.xlabel('Number range')
pylab.ylabel('Count')
pylab.savefig('realRandomVariates.pdf')
pylab.savefig('realRandomVariates.png')
pylab.show()
```
Histograms for dice throwing
---

We can now try building a very simple simulation. We'll first simulate throwing a six-sided die 200 times. Then we'll simulate throwing two six-sided dice, 200 times, and on each throw adding up the total and recording it.

Here's the histogram for the single-die case:

![](http://sungsoo.github.com/images/single-die.png)

And now for the two-dice case:

![](http://sungsoo.github.com/images/two-dice.png)

```python
import pylab
import random

sampleSize = 200


## Let's simulate the repeated throwing of a single six-sided die
singleDie = []
for i in range(sampleSize):
    newValue = random.randint(1,6)
    singleDie.append(newValue)

print "Results for throwing a single die", sampleSize, "times."
print "Mean of the sample =", pylab.mean(singleDie)
print "Median of the sample =", pylab.median(singleDie)
print "Standard deviation of the sample =", pylab.std(singleDie)
print
print

pylab.hist(singleDie, bins=[0.5,1.5,2.5,3.5,4.5,5.5,6.5] )
pylab.xlabel('Value')
pylab.ylabel('Count')
pylab.savefig('singleDie.png')
pylab.show()




## What about repeatedly throwing two dice and summing them?
twoDice = []
for i in range(sampleSize):
    newValue = random.randint(1,6) + random.randint(1,6)
    twoDice.append(newValue)



print "Results for throwing a single die", sampleSize, "times."
print "Mean of the sample =", pylab.mean(twoDice)
print "Median of the sample =", pylab.median(twoDice)
print "Standard deviation of the sample =", pylab.std(twoDice)

pylab.hist(twoDice, bins= pylab.arange(1.5,12.6,1.0))
pylab.xlabel('Value')
pylab.ylabel('Count')
pylab.savefig('twoDice.png')
pylab.show()
```

Pydev Eclipse Plugin Installation
--
* URL: http://pydev.org/updates


References
---
[1] Python Programming, 