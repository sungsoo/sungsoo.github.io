---
layout: post
title: Deepmind AlphaZero - Mastering Games Without Human Knowledge
date: 2018-04-22
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Deepmind AlphaZero - Mastering Games Without Human Knowledge](https://www.youtube.com/watch?v=Wujy7OzvdJk)
* Speaker: David Silver

---


# Deepmind AlphaZero - Mastering Games Without Human Knowledge


2017 NIPS Keynote by DeepMind's David Silver. Dr. David Silver leads the reinforcement learning research group at DeepMind and is lead researcher on AlphaGo. He graduated from Cambridge University in 1997 with the Addison-Wesley award.


<iframe width="600" height="400" src="https://www.youtube.com/embed/Wujy7OzvdJk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>


## Mastering the game of Go without human knowledge


* Authors: David Silver, Julian Schrittwieser, Karen Simonyan, Ioannis Antonoglou, Aja Huang, Arthur Guez, Thomas Hubert, Lucas Baker, Matthew Lai, Adrian Bolton, Yutian Chen, Timothy Lillicrap, Fan Hui, Laurent Sifre, George van den Driessche, Thore Graepel & Demis Hassabis
* Publication: [*Nature* volume 550, pages 354–359 (19 October 2017)](https://www.nature.com/articles/nature24270)

## Abstract

A long-standing goal of artificial intelligence is an algorithm that learns, *tabula rasa*, superhuman proficiency in challenging domains. Recently, AlphaGo became the first program to defeat a world champion in the game of Go. The tree search in AlphaGo evaluated positions and selected moves using deep neural networks. These neural networks were trained by supervised learning from human expert moves, and by reinforcement learning from self-play. Here we introduce an algorithm based solely on reinforcement learning, without human data, guidance or domain knowledge beyond game rules. AlphaGo becomes its own teacher: a neural network is trained to predict AlphaGo’s own move selections and also the winner of AlphaGo’s games. This neural network improves the strength of the tree search, resulting in higher quality move selection and stronger self-play in the next iteration. Starting **tabula rasa**, our new program AlphaGo Zero achieved superhuman performance, winning 100–0 against the previously published, champion-defeating AlphaGo.

