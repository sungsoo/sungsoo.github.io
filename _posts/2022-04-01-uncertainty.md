---
layout: post
title: Uncertainty and Out-of-Distribution Robustness in Deep Learning
date: 2022-04-01
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Uncertainty and Out-of-Distribution Robustness in Deep Learning](https://www.youtube.com/watch?v=Usr2JJkMeP0)


---

# Uncertainty and Out-of-Distribution Robustness in Deep Learning

* Featuring Balaji Lakshminarayanan, Dustin Tran,  and Jasper Snoek from Google Brain.
* More about this lecture: [https://dl4sci-school.lbl.gov/uncertainty-and-out-of-distribution-robustness-in-deep-learning](https://dl4sci-school.lbl.gov/uncertainty-and-out-of-distribution-robustness-in-deep-learning)
* Deep Learning for Science School: [https://dl4sci-school.lbl.gov/agenda](https://dl4sci-school.lbl.gov/agenda)


## Abstract

Deep learning models are bad at signalling failure: They tend to make predictions with high confidence, and this is problematic in real-world applications such as healthcare, self-driving cars, and recommender systems, where there are considerable safety implications, or where there are discrepancies between the training data and data that the model makes predictions on. There is a pressing need both for understanding when models should not make predictions and in improving model robustness to natural changes in the data.  In this lecture, we will give an overview of the landscape of uncertainty and robustness in deep learning. Namely, we examine calibration and out-of-distribution generalization as key tasks. Then we will go into a deep dive into promising avenues. This includes methods which average predictions over neural networks such as Bayesian neural nets, deep ensembles, and Gaussian processes.  We will describe methods from fundamentals to state-of-the-art approaches, and will close by highlighting open challenges in the field.


<iframe width="600" height="400" src="https://www.youtube.com/embed/ssD7jNDIL2c" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## Bios

Balaji Lakshminarayanan is currently a Staff Research Scientist at Google Brain. His recent research has focused on probabilistic deep learning, specifically, uncertainty estimation, out-of-distribution robustness and deep generative models. Notable contributions relevant to the tutorial include developing state-of-the-art methods for calibration under dataset shift (such as Deep Ensembles and AugMix) and showing that deep generative models do not always know what they don't know (gScholar). He has co-organized several workshops on "Uncertainty and Robustness in deep learning" (2018, 2019, 2020) and served as Area Chair for NeurIPS, ICML, ICLR and AISTATS. He received his PhD from the Gatsby Unit, University College London where he worked with Yee Whye Teh. 

Dustin Tran is a research scientist at Google Brain. He has made numerous advances in probabilistic deep learning, particularly in probabilistic programming with systems such as Edward (http://edwardlib.org), variational inference, and Bayesian neural networks. He completed his Ph.D. at Columbia under David Blei and Andrew Gelman. He’s received awards such as the John M. Chambers Statistical Software award and the Google Ph.D. Fellowship in Machine Learning. He’s served as Area Chair at NeurIPS, ICML, ICLR, IJCAI, and AISTATS.

Jasper Snoek is currently a research scientist at Google Brain.  His research has touched a variety of topics at the intersection of Bayesian methods and deep learning (gScholar).  He completed his PhD in machine learning at the University of Toronto.  He subsequently held postdoctoral fellowships at the University of Toronto, under Geoffrey Hinton and Ruslan Salakhutdinov, and at the Harvard Center for Research on Computation and Society, under Ryan Adams.  Jasper co-founded the machine learning startup Whetlab, which was acquired by Twitter.  He has served as an Area Chair for NeurIPS, ICML and ICLR, and organized a variety of workshops at ICML and NeurIPS.