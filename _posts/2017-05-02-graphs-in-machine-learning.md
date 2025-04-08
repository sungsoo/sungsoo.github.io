---
layout: post
title: Graphs in Machine Learning
date: 2017-05-02
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Graphs in Machine Learning](http://researchers.lille.inria.fr/~valko/hp/mva-ml-graphs.php)
* Authors:  [Michal Valko](http://researchers.lille.inria.fr/~valko/hp/), machine learning scientist in SequeL team at [Inria](http://www.inria.fr/)

---

# Graphs in Machine Learning

Main topics
-----------

- spectral graph theory, graph Laplacians
- semi-supervised graph-based learning
- manifold learning
- graphs from flat data - graph as a non-parametric basis
- online learning with graphs
- real world graphs scalability and approximations
- random graphs models
- social networks and recommender systems applications
- large graph analysis, learning, and mining
- vision applications (e.g., face recognition)

Intro
-----

The graphs come handy whenever we deal with relations between the objects. This course, focused on learning, will present methods involving two main sources of graphs in ML: 1) graphs coming from networks, e.g., social, biological, technology, etc. and 2) graphs coming from flat (often vision) data, where a graph serves as a useful nonparametric basis and is an effective data representation for such tasks as: spectral clustering, manifold or semi-supervised learning. We will also discuss online decision-making on graphs, suitable for recommender systems or online advertising. Finally, we will always discuss the scalability of all approaches and learn how to address huge graphs in practice. The lectures will show not only how but mostly why things work. The students will learn relevant topics from spectral graph theory, learning theory, bandit theory, necessary mathematical concepts and the concrete graph-based approaches for typical machine learning problems. The practical sessions will provide hands-on experience on interesting applications (e.g., online face recognizer) and state-of-the-art graphs processing tools (e.g., GraphLab).

Organization
------------

The course will feature 11 sessions, 8 lectures and 3 recitations (TD), each of them 2 hours long. There may be a special session with guest lectures and internship proposals. There may be also an extra homework with extra credit. The evaluation will be based on reports from TD and from the projects. Several project topics will be proposed but the students will be able to come with their own and they will be able to work in groups of 2-3 people. The best reference for this course are the slides from the lecture which are made to be comprehensive and there is no recommended textbook. The material we cover is mostly based on research papers, some of which very recent. The course will be in English.

Class projects
--------------

The main part the of the grade comes from the projects. The students are encouraged to come up with the topic of their interest related to the course and start working on it as soon as possible. In this case, please e-mail the lecturer with a short description of the project for the approval. Some [project proposals](https://piazza.com/ens_cachan/fall2016/mvagraphsml/resources) will be given. Additional project proposals will be presented on **7.11.2016**. Deadline for deciding on the project is **28.11.2016**, but the recommended date for picking up the projects is on 21.11.2016.

The deadline for submitting 5-10 page reports in [NIPS format](https://nips.cc/Conferences/2016/PaperInformation/StyleFiles) is **5.1.2017**. The planned time for 15+5 minutes will be on 9. 1. 2016 over Skype/Hangout. Students can work in pairs of 2 and exceptionally 3. Very detailed instructions are given on the [dedicated page for the class projects.](https://piazza.com/ens_cachan/fall2016/mvagraphsml/resources)

Prerequisites
-------------

linear algebra, basic statistics, others tools needed will be covered in the lectures

Syllabus
--------

### Session 0 - [Overview](http://researchers.lille.inria.fr/~valko/hp/serve.php?what=../projects/courses/graphsML/20162017/mlgraphs0.pdf) 

- Short presentation of the course

### Session 1 - [Lecture 1](http://researchers.lille.inria.fr/~valko/hp/serve.php?what=../projects/courses/graphsML/20162017/mlgraphs1.pdf) 

- Introduction to graphs in Machine Learning
- Motivation and overview of the successful approaches
- Applications (Recommender Systems, Semi-Supervised Learning, …)
- Submodularity for influence maximization
- Google Pagerank
- Graphs as data-dependent approach
- Online SSL for Face Recognition: from raw pixels to analysis
- Erdős number project
- Random graphs models – real-world graph models
- Social network modeling, Small world phenomena, Advertising

### Session 2 – [Lecture 2](http://researchers.lille.inria.fr/~valko/hp/serve.php?what=../projects/courses/graphsML/20162017/mlgraphs2.pdf) 

- Graph theory refresher
- Data-graph constructions
- Available public graphs datasets
- Spectral algebra
- Graph Laplacian and its properties
- Random walks and the Laplacians
- Recommendations with graph distances
- Resistance networks

### Session 3 – [Lecture 3](http://researchers.lille.inria.fr/~valko/hp/serve.php?what=../projects/courses/graphsML/20162017/mlgraphs3.pdf) 

- Geometry of the data and connectivity
- Spectral clustering
- Introduction to manifold learning
- Manifold learning with Laplacian Eigenmaps
- Semi-Supervised Learning
- SSL why and when it helps
- SSL with self-training

### Session 4 – TD 1 

- Graph construction and spectral clustering
- k-NN and epsilon graphs, comparison
- Understand connectivity vs. compactness paradigm in clustering
- Spectral clustering on simple image segmentation problem

### Session 5 - [Lecture 4](http://researchers.lille.inria.fr/~valko/hp/serve.php?what=../projects/courses/graphsML/20162017/mlgraphs4.pdf) 

- Semi-Supervised SVMs
- Graph-based semi-supervised learning
- Gaussian random fields and harmonic solution
- Regularization of harmonic solution
- Soft-harmonic solution
- Inductive and transductive semi-supervised learning
- Manifold regularization

### Session 6 - [Lecture 5](http://researchers.lille.inria.fr/~valko/hp/serve.php?what=../projects/courses/graphsML/20162017/mlgraphs5.pdf) and class project [proposals](https://piazza.com/ens_cachan/fall2016/mvagraphsml/resources) 

- Max-margin graph cuts
- Theory of Laplacian-based manifold methods
- Transductive learning stability based bounds
- Online learning with graphs
- Online clustering
- Online semi-supervised learning
- What to do when graphs grow?
- Online incremental k-centers

### Session 7 – TD 2 

- Semi Supervised Learning and Harmonic Function Solution
- Face Recognizer with HFS
- Online Semi-Supervised Learning
- Report experiments of one's own face
- Suggest improvements

### Session 8 - [Lecture 6](http://researchers.lille.inria.fr/~valko/hp/serve.php?what=../projects/courses/graphsML/20162017/mlgraphs6.pdf) 

- Examples of applications of online SSL
- Analysis of online SSL
- Analysis of quantization error
- When does graph-based SSL provably help?
- SSL Learnability
- Scalability
- Scaling harmonic functions to millions of samples
- Numerical eigenfunctions

### Session 9 - [Lecture 7](http://researchers.lille.inria.fr/~valko/hp/serve.php?what=../projects/courses/graphsML/20162017/mlgraphs7.pdf) and TD3 

- Big graph data learning and analysis
- Large-scale data processing tools: GraphLab
- Large-scale label propagation
- Large-scale graph construction
- Large-scale sparsification

### No class 
You can check out the papers the papers that your instructors are presenting at NIPS 2016 during that week: 

- [*Blazing the trails before beating the path: Sample-efficient Monte-Carlo planning*](serve.php?what=publications/grill2016blazing.pdf)
- [*Rewards and errors in multi-arm bandits for interactive education*](https://docs.google.com/a/chalearn.org/viewer?a=v&pid=sites&srcid=Y2hhbGVhcm4ub3JnfHdvcmtzaG9wfGd4OjdlYzA2Y2U0MTYwOTZhYjg)
- [*Pack only the essentials: Adaptive dictionary learning for kernel ridge regression*](https://sites.google.com/site/nips2016adaptive/10_paper.pdf?attredirects=0)

### Session 10 - [Lecture 8](http://researchers.lille.inria.fr/~valko/hp/serve.php?what=../projects/courses/graphsML/20162017/mlgraphs8.pdf) 

- Graph bandits
- Online decision-making on graphs
- Smoothness of rewards (preferences) on a given graphs
- Online movie recommendation on graphs
- Observability graphs
- Improving the learning rates using side information
- Combinatorial sparsification
- Spectral sparsification
