---
layout: post
title: Epistemic Uncertainty Estimation for Efficient Search of Drug Candidates 
date: 2022-06-10
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Epistemic Uncertainty Estimation for Efficient Search of Drug Candidates ](https://www.youtube.com/watch?v=XC-Bfg3dO0I)


---

# Epistemic Uncertainty Estimation for Efficient Search of Drug Candidates  

* Speaker: Moksh Jain - [https://mj10.github.io/](https://mj10.github.io/)


## Abstract
In *computational drug discovery* we often rely on **surrogate models** for molecular design and optimization. The estimates of the *epistemic uncertainty* of those surrogate models can be useful signals to enable efficient exploration in the molecular space. Traditional methods such as Bayesian optimization use Bayesian models like Gaussian Processes (GPs) as surrogates. Gaussian processes provide well calibrated uncertainty estimates, but do not scale trivially to large datasets and require hand-crafted kernels to work with structured data like strings (SMILES, peptides) and graphs. Despite their impressive performance across various domains, efficient and accurate epistemic uncertainty estimation for neural networks remains an open problem. Existing approaches rely on approximations based on Bayesian interpretations of neural networks to obtain uncertainty estimates. These estimates, however tend to be poorly calibrated and do not account for the effect of model misspecification. This is critical in interactive settings where the model predictions are used to acquire data. In this talk, I will present DEUP, a novel method for uncertainty estimation designed for interactive settings, which uses an additional network to predict the epistemic uncertainty. I will also discuss a real-world application leveraging epistemic uncertainty estimates for designing anti-microbial peptides.

<iframe width="600" height="400" src="https://www.youtube.com/embed/TIZ2FyLi_3o" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>