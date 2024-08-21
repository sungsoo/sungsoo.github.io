---
layout: post
title: Generating Synthetic Tabular Data That’s Differentially Private
date: 2024-08-21
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Generating Synthetic Tabular Data That’s Differentially Private](https://www.youtube.com/watch?v=DDZsfraageM)

---



# Generating Synthetic Tabular Data That’s Differentially Private

## Abstract

While generative models are able to produce synthetic datasets that preserve the statistical qualities of the training dataset without identifying any particular record in the training dataset, most generative models to date do not offer mathematical guarantees of privacy that can be used to facilitate information sharing or publishing. Without those mathematical guarantees, a lot of work is needed to ensure that adversarial attacks on the models and the synthetic data they generate are thwarted. 

We can never be sure of what attacks might become feasible in the future. Further, it is ineffective to defend against privacy attacks reactively once they have already occurred. This is exactly the problem that  differential privacy (DP) solves by bounding the probability that a bad event occurs. By introducing calibrated noise into an algorithm, DP provides the defense against all future privacy attacks with a high probability. 

In this session, we’ll explore approaches to applying differential privacy, including one that relies on measuring low dimensional distributions in a dataset combined with learning a graphical model representation. We'll end with a preview of Gretel's new generative model that applies this method to create high-quality synthetic tabular data that is differentially private. 


<iframe width="600" height="400" src="https://www.youtube.com/embed/DDZsfraageM?si=UlDrWhNrKS3JHz91" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>