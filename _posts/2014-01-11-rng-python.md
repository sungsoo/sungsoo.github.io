---
layout: post
title: Generating random numbers and plots in Python
date: 2014-01-11
categories: [information technology]
tags: [developments, python]

---

By using Python's pseudo-random number generation routines, we can generate artificial data sets that help us in exploring statistical concepts such as distributions, variance, and sampling. Generating fake data is an excellent way of understanding a statistical procedure: if you know the "ground truth" in advance, you can find out whether or not your statistical method is capable of discovering it. In particular, you can set things up so that the ground truth is "no relationship" and look at how often your procedure produces a false alarm.

Note that if you only ever work with real data sets, this kind of checking is not possible, as you can never have absolute confidence that the effect you've found is real.

By using the graphical methods of the PyLab library, we can visualize the artificial data sets we create. We can also save these visualizations in a variety of formats to use when reporting on the data.

Histogram of some random variates
---
We can produce the histogram above, showing 50 real-number random variates between 0 and 1.

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

References
---
[1] Python Programming, 