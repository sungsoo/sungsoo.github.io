---
layout: post
title: Graph Embedding
date: 2020-12-14
categories: [computer science]
tags: [machine learning]

---

### Article Source
* [GraphEmbedding](https://github.com/shenweichen/GraphEmbedding)

----

# Graph Embedding

# Method


|   Model   | Paper                                                                                                                      
| :-------: | :------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------ |
| DeepWalk  | [KDD 2014] [DeepWalk: Online Learning of Social Representations](http://www.perozzi.net/publications/14_kdd_deepwalk.pdf)   |
|   LINE    | [WWW 2015] [LINE: Large-scale Information Network Embedding](https://arxiv.org/pdf/1503.03578.pdf)  |                        
| Node2Vec  | [KDD 2016] [node2vec: Scalable Feature Learning for Networks](https://www.kdd.org/kdd2016/papers/files/rfp0218-groverA.pdf) 
|   SDNE    | [KDD 2016] [Structural Deep Network Embedding](https://www.kdd.org/kdd2016/papers/files/rfp0191-wangAemb.pdf)               |
| Struc2Vec | [KDD 2017] [struc2vec: Learning Node Representations from Structural Identity](https://arxiv.org/pdf/1704.03165.pdf)        |


# How to run examples
1. clone the repo and make sure you have installed `tensorflow` or `tensorflow-gpu` on your local machine. 
2. run following commands
```bash
python setup.py install
cd examples
python deepwalk_wiki.py
```

# Usage
The design and implementation follows simple principles(**graph in,embedding out**) as much as possible.
## Input format
we use `networkx`to create graphs.The input of networkx graph is as follows:
`node1 node2 <edge_weight>`

![](./pics/edge_list.png)
## DeepWalk

```python
G = nx.read_edgelist('../data/wiki/Wiki_edgelist.txt',create_using=nx.DiGraph(),nodetype=None,data=[('weight',int)])# Read graph

model = DeepWalk(G,walk_length=10,num_walks=80,workers=1)#init model
model.train(window_size=5,iter=3)# train model
embeddings = model.get_embeddings()# get embedding vectors
```

## LINE

```python
G = nx.read_edgelist('../data/wiki/Wiki_edgelist.txt',create_using=nx.DiGraph(),nodetype=None,data=[('weight',int)])#read graph

model = LINE(G,embedding_size=128,order='second') #init model,order can be ['first','second','all']
model.train(batch_size=1024,epochs=50,verbose=2)# train model
embeddings = model.get_embeddings()# get embedding vectors
```
## Node2Vec
```python
G=nx.read_edgelist('../data/wiki/Wiki_edgelist.txt',
                        create_using = nx.DiGraph(), nodetype = None, data = [('weight', int)])#read graph

model = Node2Vec(G, walk_length = 10, num_walks = 80,p = 0.25, q = 4, workers = 1)#init model
model.train(window_size = 5, iter = 3)# train model
embeddings = model.get_embeddings()# get embedding vectors
```
## SDNE

```python
G = nx.read_edgelist('../data/wiki/Wiki_edgelist.txt',create_using=nx.DiGraph(),nodetype=None,data=[('weight',int)])#read graph

model = SDNE(G,hidden_size=[256,128]) #init model
model.train(batch_size=3000,epochs=40,verbose=2)# train model
embeddings = model.get_embeddings()# get embedding vectors
```

## Struc2Vec


```python
G = nx.read_edgelist('../data/flight/brazil-airports.edgelist',create_using=nx.DiGraph(),nodetype=None,data=[('weight',int)])#read graph

model = model = Struc2Vec(G, 10, 80, workers=4, verbose=40, ) #init model
model.train(window_size = 5, iter = 3)# train model
embeddings = model.get_embeddings()# get embedding vectors
```
