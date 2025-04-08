---
layout: post
title: Cluster Analysis 
date: 2015-04-30
categories: [computer science]
tags: [machine learning]

---

# Cluster Analysis

Unlike classification and regression, which analyze class-labeled (training) data sets, clustering analyzes data objects without consulting class labels. In many cases, class- labeled data may simply not exist at the beginning. Clustering can be used to generate class labels for a group of data. The objects are clustered or grouped based on the principle of *maximizing the intraclass similarity* and *minimizing the interclass similarity*. That is, clusters of objects are formed so that objects within a cluster have high similarity in comparison to one another, but are rather dissimilar to objects in other clusters. Each cluster so formed can be viewed as a class of objects, from which rules can be derived. Clustering can also facilitate taxonomy formation, that is, the organization of observations into a hierarchy of classes that group similar events together.

## Cluster analysis

Cluster analysis can be performed on *AllElectronics* customer data to identify homogeneous subpopulations of customers. These clusters may represent individual target groups for marketing. Figure 1.10 shows a 2-D plot of customers with respect to customer locations in a city. Three clusters of data points are evident.

[![](http://sungsoo.github.com/images/cluster-figure.png)](http://sungsoo.github.com/images/cluster-figure.png)

**Figure 1.10. A 2-D plot of customer data with respect to customer locations in a city, showing three data clusters.**