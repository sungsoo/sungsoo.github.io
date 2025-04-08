---
layout: post
title: Five most popular similarity measures implementation in python  
date: 2015-06-29
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Five most popular similarity measures implementation in python](http://dataaspirant.com/2015/04/11/five-most-popular-similarity-measures-implementation-in-python/)
* Authors: [saimadhu](http://dataaspirant.com/author/saimadhu7/ "View all posts by saimadhu")

# Five most popular similarity measures implementation in python 

[![Cover\_post\_final](https://dataaspirant.files.wordpress.com/2015/04/cover_post_final.png?w=665&h=283)](https://dataaspirant.files.wordpress.com/2015/04/cover_post_final.png)

    The buzz term similarity distance measures has got wide variety of
definitions among the math and [data
mining](http://dataaspirant.com/category/datamining/) practitioners. As
a result those terms, concepts and their usage went way beyond the head
for beginner , who  started to understand them for the very first time.
So today I write this post to give more simplified and very intuitive
definitions for similarity and i will drive to Five most popular
similarity measures and implementation of them.

Before going to explain different similarity distance measures let me
explain the the effective key term similarity in
[datamining](http://dataaspirant.com/category/datamining/). This
similarity is the very basic building block for activities such as
[Recommendation
engines](https://dataaspirant.wordpress.com/category/recommendation_engine/),
clustering,
[classification](http://dataaspirant.com/2014/09/27/classification-and-prediction/ "Classification and Prediction")
and anomaly detection.

**Similarity:**
---------------

Similarity is the measure of how much alike two data objects are.
Similarity in a [data
mining](http://dataaspirant.com/2014/09/16/data-mining/ "DATA MINING")
context is usually described as a distance with dimensions representing
features of the objects. If this distance is small it will be high
degree of similarity where as large distance will be low degree of
similarity.Similarity is subjective and is highly dependant on the
domain and application. For example two fruits are similar because of
color or size or taste. Care should be taken when calculating distance
across dimensions/features that are unrelated. The relative values of
each feature must be normalized or one feature could end up dominating
the distance calculation. **Similarity are measure in the range 0 to 1
[0,1].**

**Two main consideration about similarity:**

-   Similarity = 1 if X = Y         (Where X, Y are two objects)
-   Similarity = 0 if X ≠ Y

That’s all about similarity let’s drive to five most popular similarity
distance measures.

**Euclidean distance:**
-----------------------

[![Euclidean](https://dataaspirant.files.wordpress.com/2015/04/euclidean.png?w=665)](https://dataaspirant.files.wordpress.com/2015/04/euclidean.png)

    [Euclidean
distance](http://en.wikipedia.org/wiki/Euclidean_distance) is the most
common use of distance. In most cases when people said about distance,
they will refer to Euclidean distance. Euclidean distance  is also know
as simply distance. When data is dense or continuous , this is the best
proximity measure. The Euclidean distance between two points is the
length of the path connecting them.This distance between two points is
given by the [Pythagorean
theorem](http://en.wikipedia.org/wiki/Pythagorean_theorem "Pythagorean_theorem").

**Euclidean distance implementation in python:**

```python

#!/usr/bin/env python

from math import*

def euclidean_distance(x,y):

  return sqrt(sum(pow(a-b,2) for a, b in zip(x, y)))

print euclidean_distance([0,3,4,5],[7,6,3,-1])
```

**Script Output:**

    9.74679434481
    [Finished in 0.0s]

 

**Manhattan distance:**
-----------------------

[![manhattan](https://dataaspirant.files.wordpress.com/2015/04/manhattan.png?w=665)](https://dataaspirant.files.wordpress.com/2015/04/manhattan.png)

Manhattan distance is an metric in which the distance between two points
is the sum of the absolute differences of their Cartesian coordinates.
In simple way of saying it is the absolute sum of difference between the
x-coordinates  and y-coordinates. Suppose we have two point A and B if
we want to find the manhattan distane between them, just we have to sum
up the absultue x-axis and y – axis variation means we have to find how
these to points A and B are varining in X-axis and Y- axis.In more
mathematical way of saying Manhattan distance between two points
measured along axes at right angles.

In a plane with p1 at (x1, y1) and p2 at (x2, y2).

Manhattan distance = |x1 – x2| + |y1 – y2|

This Manhattan distance metric is also known as Manhattan
length,rectilinear distance, L1 distance or L1 norm ,city block
distance,Minkowski’s L1 distance,taxi cab metric, or city block
distance.

**Manhattan distance implementation in python:**

```python 
#!/usr/bin/env python

from math import*

def manhattan_distance(x,y):

  return sum(abs(a-b) for a,b in zip(x,y))

print manhattan_distance([10,20,10],[10,20,20])
```

**Script Output:**

    10
    [Finished in 0.0s]

 

**Minkowski distance:**

[![minkowski](https://dataaspirant.files.wordpress.com/2015/04/minkowski.png?w=665&h=266)](https://dataaspirant.files.wordpress.com/2015/04/minkowski.png)

The Minkowski distance is a generalized metric form of Euclidean
distance and Manhattan distance.

[![equation\_minkowski-distance
(1)](https://dataaspirant.files.wordpress.com/2015/04/equation_minkowski-distance-1.gif?w=306&h=83)](https://dataaspirant.files.wordpress.com/2015/04/equation_minkowski-distance-1.gif)

In the equation d\^MKD is the Minkowski distance between the data record
i and j, k the index of a variable, n the total number of variables y
and λ the order of the Minkowski metric. Although it is defined for any
λ \> 0, it is rarely used for values other than 1, 2 and ∞.

The way distances are measured by the Minkowski metric of different
orders between two objects with three variables ( In the image
it displayed in a coordinate system with x, y ,z-axes).

**Synonyms of Minkowski:**\
 Different names for the Minkowski distance or Minkowski metric arise
form the order:

-   λ = 1 is the Manhattan distance. Synonyms are L1-Norm, Taxicab or
    City-Block distance. For two vectors of ranked ordinal variables the
    Manhattan distance is sometimes called Foot-ruler distance.
-   λ = 2 is the Euclidean distance. Synonyms are L2-Norm or Ruler
    distance. For two vectors of ranked ordinal variables the Euclidean
    distance is sometimes called Spear-man distance.
-   λ = ∞ is the Chebyshev distance. Synonym are Lmax-Norm or Chessboard
    distance.\
     reference.

** Minkowski distance implementation in python:**

```python

#!/usr/bin/env python

from math import*
from decimal import Decimal

def nth_root(value, n_root):

 root_value = 1/float(n_root)
 return round (Decimal(value) ** Decimal(root_value),3)

def minkowski_distance(x,y,p_value):

 return nth_root(sum(pow(abs(a-b),p_value) for a,b in zip(x, y)),p_value)

print minkowski_distance([0,3,4,5],[7,6,3,-1],3)
```

**Script Output:**

    8.373
    [Finished in 0.0s]

**Cosine similarity:**
----------------------

[![cosine](https://dataaspirant.files.wordpress.com/2015/04/cosine.png?w=665&h=510)](https://dataaspirant.files.wordpress.com/2015/04/cosine.png)

Cosine similarity metric finds the normalized dot product of the two
attributes. By determining the cosine similarity, we will effectively
trying to find cosine of the angle between the two objects. The cosine
of 0° is 1, and it is less than 1 for any other angle. It is thus a
judgement of orientation and not magnitude: two vectors with the same
orientation have a cosine similarity of 1, two vectors at 90° have a
similarity of 0, and two vectors diametrically opposed have a similarity
of -1, independent of their magnitude. Cosine similarity is particularly
used in positive space, where the outcome is neatly bounded in [0,1].
One of the reasons for the popularity of cosine similarity is that it is
very efficient to evaluate, especially for sparse vectors.

**Cosine similarity implementation in python:**

```python

#!/usr/bin/env python

from math import*

def square_rooted(x):

   return round(sqrt(sum([a*a for a in x])),3)

def cosine_similarity(x,y):

 numerator = sum(a*b for a,b in zip(x,y))
 denominator = square_rooted(x)*square_rooted(y)
 return round(numerator/float(denominator),3)

print cosine_similarity([3, 45, 7, 2], [2, 54, 13, 15])
```

**Script Output:**

    0.972
    [Finished in 0.1s]

**Jaccard similarity:**
-----------------------

[![jaccard\_similariyt](https://dataaspirant.files.wordpress.com/2015/04/jaccard_similariyt.png?w=665&h=266)](https://dataaspirant.files.wordpress.com/2015/04/jaccard_similariyt.png)

We so far discussed some metrics to find the similarity between objects.
where the objects are points or vectors .When we consider about jaccard
similarity this objects will be sets. So first let’s learn some very
basic about sets.

**Sets:**

A set is (unordered) collection of objects {a,b,c}. we use the notation
as elements separated by commas inside curly brackets { }. They are
unordered so {a,b} = { b,a }.

**Cardinality:**

Cardinality of A denoted by **|A|** which counts how many elements are
in A.

**Intersection:**

Intersection between two sets A and B is denoted**A ∩ B** and reveals
all items which are in both sets A,B.

**Union:**

Union between two sets A and B is denoted **A ∪ B** and reveals all
items which are in either set.

 

[![jaccaard2](https://dataaspirant.files.wordpress.com/2015/04/jaccaard2.png?w=665&h=266)](https://dataaspirant.files.wordpress.com/2015/04/jaccaard2.png)

Now going back to Jaccard similarity.The Jaccard similarity measures
similarity between finite sample sets, and is defined as the
cardinality of the intersection of sets divided by the cardinality of
the union of the sample sets. Suppose you want to find jaccard
similarity between two sets A and B it is the ration of cardinality of A
∩ B and A ∪ B

[![jaccaard3](https://dataaspirant.files.wordpress.com/2015/04/jaccaard3.png?w=665&h=225)](https://dataaspirant.files.wordpress.com/2015/04/jaccaard3.png)

**Jaccard similarity implementation:**

```python

#!/usr/bin/env python

from math import*

def jaccard_similarity(x,y):

 intersection_cardinality = len(set.intersection(*[set(x), set(y)]))
 union_cardinality = len(set.union(*[set(x), set(y)]))
 return intersection_cardinality/float(union_cardinality)

print jaccard_similarity([0,1,2,5,6],[0,2,3,5,7,9])
```

**Script Output:**

    0.375
    [Finished in 0.0s]

### **Implementaion of all 5 similarity measure into one Similarity class:**

file\_name : **similaritymeasures.py**

```python

#!/usr/bin/env python

from math import*
from decimal import Decimal

class Similarity():

  """ Five similarity measures function """

  def euclidean_distance(self,x,y):

   """ return euclidean distance between two lists """

   return sqrt(sum(pow(a-b,2) for a, b in zip(x, y)))

  def manhattan_distance(self,x,y):

   """ return manhattan distance between two lists """

   return sum(abs(a-b) for a,b in zip(x,y))

  def minkowski_distance(self,x,y,p_value):

   """ return minkowski distance between two lists """

   return self.nth_root(sum(pow(abs(a-b),p_value) for a,b in zip(x, y)),p_value)

  def nth_root(self,value, n_root):

   """ returns the n_root of an value """

   root_value = 1/float(n_root)
   return round (Decimal(value) ** Decimal(root_value),3)

  def cosine_similarity(self,x,y):

   """ return cosine similarity between two lists """

   numerator = sum(a*b for a,b in zip(x,y))
   denominator = self.square_rooted(x)*self.square_rooted(y)
   return round(numerator/float(denominator),3)

  def square_rooted(self,x):

   """ return 3 rounded square rooted value """

   return round(sqrt(sum([a*a for a in x])),3)

  def jaccard_similarity(self,x,y):

   """ returns the jaccard similarity between two lists """

   intersection_cardinality = len(set.intersection(*[set(x), set(y)]))
   union_cardinality = len(set.union(*[set(x), set(y)]))
   return intersection_cardinality/float(union_cardinality)
```

**Using Similarity class:**

```python

#!/usr/bin/env python

from similaritymeasures import Similarity

def main():

  """ main function to create Similarity class instance and get use of it """

  measures = Similarity()

  print measures.euclidean_distance([0,3,4,5],[7,6,3,-1])
  print measures.jaccard_similarity([0,1,2,5,6],[0,2,3,5,7,9])

if __name__ == "__main__":
  main()
```
 

**This post codes can be found in this  Github link :**

[ https://github.com/saimadhu-polamuri/DataAspirant\_codes/tree/master/Similarity\_measures](https://github.com/saimadhu-polamuri/DataAspirant_codes/tree/master/Similarity_measures "Similarity_measures")
 
