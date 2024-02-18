---
layout: post
title: Approximate Nearest Neighbor and Product Quantizer 
date: 2024-02-21
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Approximate Nearest Neighbor and Product Quantizer for k-Nearest Neighbor | Embeddings Search](https://www.youtube.com/watch?v=50PNumB7s3U)

---

# Approximate Nearest Neighbor and Product Quantizer for k-Nearest Neighbor | Embeddings Search


## Abstract


Collaborative filtering uses algorithms that make personalized recommendations for a user learning from the preferences of similar users. But doing that is a daunting task because firstly, finding similar users across the pool of millions of billions of users is compute intensive and secondly, repeating the activity for all the users may not be feasible at all. This is where the concept of Approximate Nearest Neighbor Search comes in and greatly simplifies the problem. For a set of points in some space (possibly many dimensions), ANN finds the closest k neighbors quickly in an approximate way. In this video, we will also cover the concept of Product Quantiser which forms the building block of Google’s ScaNN, Facebook’s Faiss, and many other popular Ann libraries. Unlike tree-based indexes used for ANN, a k-NN search with a product quantizer still performs an “exhaustive search”, meaning that a product quantizer still requires comparing the query vector to every vector in the database.  The key is that it approximates and greatly simplifies the distance calculations by compressing the dataset. A PQ in a broader sense is a compressor that reduces the number of possible values that a variable has. It compresses a vector subspace into possible cluster centroids which are referred to as a 'codebook'. Each centroid is called a 'code'.

<iframe width="600" height="400" src="https://www.youtube.com/embed/50PNumB7s3U?si=XYuXdlIEawX9LI9F" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>