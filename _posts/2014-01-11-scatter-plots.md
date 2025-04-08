---
layout: post
title: Scatter plots in Python
date: 2014-01-11
categories: [information technology]
tags: [design patterns]

---

Scatter plots
--

Scatter plots are an excellent way of looking at the relationship between pairs of variables. We will look at two fictional data sets here. In the first one, there's no relationship between the two variables; they are both *independent random variates* drawn from the *normal distribution*.

![](http://sungsoo.github.com/images/scatter1.png)

In this second data set, the two variables have been created in such a way that high values on variable 1 are associated with high values on variable 2.

![](http://sungsoo.github.com/images/scatter2.png)

```python
import pylab
import random

sampleSize = 500

## To get data suitable for displaying on a scatterplot,
## generate normal random variates on both x and y dimensions.
## Note that there's no relationship between the two variables.

x = []
y = []

for i in range(sampleSize):
    x.append(random.normalvariate(100,10))
    y.append(random.normalvariate(100,10))

pylab.scatter(x,y,c="green")
pylab.xlabel("Variable 1")
pylab.ylabel("Variable 2")
pylab.savefig("scatter1.png")
pylab.show()

## Now let's generate another scatterplot where there actually
## is a relationship between the two variables.

x = []
y = []

for i in range(sampleSize):
    newVal = random.normalvariate(100,10)
    x.append(newVal)
    y.append(newVal / 2.0 + random.normalvariate(50,5))

pylab.scatter(x,y,c="red",marker="s")
pylab.xlabel("Variable 1")
pylab.ylabel("Variable 2")
pylab.savefig("scatter2.png")
pylab.show()
```

Writing data to a file
---

What if we wanted to take one of these fictional data sets we've created, and ship it over to R in order to get access to some more advanced statistical functions that we don't have in Python? We would need to write the data to a file, in a format that is easy for R to read in.

```python
import random

## We'll generate a simple data set that has no connections
## between the three variables sex, IQ, and income.

sampleSize = 100

sex = []
IQ = []
income = []

for i in range(sampleSize):
    sex.append(random.choice(['male','female']))
    IQ.append(round(random.normalvariate(100,10)))
    income.append(round(5000 + random.expovariate(0.00004),2))

## Now we open a file and write the data to it

fileHandle = open('outputData.txt', 'w')
fileHandle.write("sex IQ income\n")
for i in range(sampleSize):
    outString = str(sex[i]) + " " + str(IQ[i]) + " " + str(income[i]) + "\n"
    fileHandle.write(outString)
fileHandle.close()
```

References
--
[1] Ken Lambert, *Fundamentals of Python: First Programs*, 2012.