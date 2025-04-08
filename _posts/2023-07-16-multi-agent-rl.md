---
layout: post
title: Distributed and Multiagent Reinforcement Learning  
date: 2023-07-16
categories: [computer science]
tags: [big data]

---

### Article Source

* [Distributed and Multiagent Reinforcement Learning](https://www.youtube.com/watch?v=nTPuL6iVuwU)


---

# Distributed and Multiagent Reinforcement Learning


* Intersections between Control, Learning and Optimization 2020
* "Distributed and Multiagent Reinforcement Learning"
* Dimitri Bertsekas - Massachusetts Institute of Technology & Arizona State University
* Institute for Pure and Applied Mathematics, UCLA
* February 24, 2020

## Abstract
We discuss issues of parallelization and distributed asynchronous computation for large scale dynamic programming problems. We first focus on asynchronous policy iteration with multiprocessor systems using state-partitioned architectures. Exact convergence results are given for the case of lookup table representations, and error bounds are given for their compact representation counterparts. A computational study is presented with POMDP problems with more than 10^15 states.

In a related context, we introduce multiagent on-line schemes, whereby at each stage, each agent's decision is made by executing a local rollout algorithm that uses a base policy, together with some coordinating information from the other agents. The amount of local computation required at every stage by each agent is independent of the number of agents, while the amount of global computation (over all agents) grows linearly with the number of agents. By contrast, with the standard rollout algorithm, the amount of global computation grows exponentially with the number of agents. Despite the drastic reduction in required computation, we show that our algorithm has the fundamental cost improvement property of rollout: an improved performance relative to the base policy.

<iframe width="600" height="400" src="https://www.youtube.com/embed/nTPuL6iVuwU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Coding for Distributed Multi-Agent Reinforcement Learning

<iframe width="600" height="400" src="https://www.youtube.com/embed/B8WMjzRHoh0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>