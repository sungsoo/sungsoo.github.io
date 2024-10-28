---
layout: post
title:  How Could Machines Reach Human-Level Intelligence?
date: 2024-11-04
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Lecture Series in AI; “How Could Machines Reach Human-Level Intelligence?” by Yann LeCun](https://www.youtube.com/watch?v=xL6Y0dpXEwc)

---

# How Could Machines Reach Human-Level Intelligence?


## Abstract

Animals and humans understand the physical world, have common sense, possess a persistent memory, can reason, and can plan complex sequences of subgoals and actions. These essential characteristics of intelligent behavior are still beyond the capabilities of today's most powerful AI architectures, such as Auto-Regressive LLMs.

I will present a cognitive architecture that may constitute a path towards human-level AI. The centerpiece of the architecture is a predictive world model that allows the system to predict the consequences of its actions. and to plan sequences of actions that that fulfill a set of objectives. The objectives may include guardrails that guarantee the system's controllability and safety. The world model employs a Joint Embedding Predictive Architecture (JEPA) trained with self-supervised learning, largely by observation.

The JEPA simultaneously learns an encoder, that extracts maximally-informative representations of the percepts, and a predictor that predicts the representation of the next percept from the representation of the current percept and an optional action variable.

We show that JEPAs trained on images and videos produce good representations for image and video understanding. We show that they can detect unphysical events in videos. Finally, we show that planning can be performed by searching for action sequences that produce predicted end state that match a given target state.


<iframe width="600" height="400" src="https://www.youtube.com/embed/xL6Y0dpXEwc?si=REXJmmr91Lr_WT8C" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


## ABOUT THE SPEAKER
Yann LeCun, VP & Chief AI Scientist, Meta; Professor, NYU; ACM Turing Award Laureate

Yann LeCun is VP & Chief AI Scientist at Meta and a Professor at NYU. He was the founding Director of Meta-FAIR and of the NYU Center for Data Science. After a PhD from Sorbonne Université and research positions at AT&T and NEC, he joined NYU in 2003 and Meta in 2013. He received the 2018 ACM Turing Award for his work on AI. He is a member of the US National Academies and the French Académie des Sciences.

## ABOUT THE COLUMBIA ENGINEERING LECTURE SERIES IN AI
Columbia Engineering's Lecture Series in AI explores the most cutting-edge topics in artificial intelligence and brings to campus thinkers and leaders who are shaping tomorrow’s technology landscape in a wide variety of fields. Join us to unravel the complexities and possibilities of AI in today's rapidly evolving world.


## Human-Level AI

There are four essential characteristics of human intelligence that current AI systems don’t possess: reasoning, planning, persistent memory, and understanding the physical world. Once we have systems with such capabilities, it will still take a while before we bring them up to human level.

<iframe width="600" height="400" src="https://www.youtube.com/embed/4DsCtgtQlZU?si=Ga9BEnvXNkSX3P-5" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>