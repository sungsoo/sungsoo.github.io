---
layout: post
title:  Large Bipartite Subgraph
date: 2024-11-17
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Large Bipartite Subgraph](https://www.youtube.com/watch?v=crMyNv2fdkc&list=PLUl4u3cNGP61cYB5ymvFiEbIb-wWHfaqO)

---


# Large Bipartite Subgraph

* MIT 18.226 Probabilistic Methods in Combinatorics, Fall 2024
* Instructor: Yufei Zhao


## Abstract

A simple application of the probabilistic method in combinatorics: a proof that every graph contains a large bipartite subgraph with at least half of the edges.

<iframe width="600" height="400" src="https://www.youtube.com/embed/crMyNv2fdkc?si=bgAqXtG8fvSI2aJ_" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


### 정리:
m개의 간선을 가지는 그래프 G가 주어졌을 때, G는 적어도 m/2개의 간선을 가지는 이분 그래프 부분 그래프를 가진다.

### 증명:

#### 1. 이분 그래프 부분 그래프:

적어도 m/2개의 간선을 가지는 G의 이분 그래프 부분 그래프 H를 구성한다.

* 단계 1: 정점 분할
  - G의 임의의 정점 v에서 시작한다.
  - v를 색상 1로 칠한다.
  - v의 모든 이웃을 색상 2로 칠한다.
  - 색상 2로 칠해진 각 정점에 대해, 칠해지지 않은 이웃을 색상 1로 칠한다.
  - 모든 정점이 칠해질 때까지 이 과정을 계속한다.

이 과정은 G의 정점을 두 집합 V1과 V2로 분할하며, 같은 집합 내의 두 정점이 인접하지 않다. 따라서 V1과 V2 사이의 간선으로 유도된 부분 그래프 H는 이분 그래프이다.

#### 2. H의 간선 개수 세기:

* 관찰: G의 모든 간선은 V1의 정점과 V2의 정점 사이 또는 그 반대로 연결된다.
* 주장: G의 간선 중 적어도 절반이 H에 있다.

주장을 증명하기 위해, V1의 정점 v를 고려한다. v에 인접한 모든 간선은 H의 간선 개수에 기여한다. 이제 V2의 정점 u를 고려한다. u에 인접한 모든 간선도 H의 간선 개수에 기여한다. G의 모든 간선은 정확히 두 개의 정점에 인접하고, 각 정점은 인접한 간선 중 적어도 절반을 H에 기여하므로, H의 총 간선 개수는 적어도 m/2이다.

### 결론:

따라서, 우리는 적어도 m/2개의 간선을 가지는 G의 이분 그래프 부분 그래프 H를 구성하였으며, 이는 정리를 증명한다.
