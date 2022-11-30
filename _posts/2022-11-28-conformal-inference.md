---
layout: post
title: Conformal Prediction Tutorial
date: 2022-11-28
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Conformal Prediction Tutorial](https://www.youtube.com/watch?v=0MsGri8nmJQ)


---

# Conformal Prediction Tutorial


## Abstract

In decision-making, Artificial Intelligence (AI) systems need to not only make predictions but also quantify their predictions' certainty (uncertainty). For example, consider a stock automatic trading system where an AI system predicts the stock price. A point prediction from the AI system might be dramatically different from the real value because of the high stochasticity of the stock market. But, on the other hand, if the AI system could estimate the range which guarantees to cover the true value with high probability, the trading system could compute the best and worst rewards and make more sensible decisions.

Conformal prediction is a technique for quantifying such uncertainties for AI systems. In particular, given an input, conformal prediction estimates a prediction interval in regression problems and a set of classes in classification problems. Both the prediction interval and sets are guaranteed to cover the true value with high probability.

In A Tutorial on Conformal Prediction, Glenn Shafer and Vladimir Vovk provide the following definition:

> Conformal prediciton uses past experience to determine precise levels of confidence in new predictions.

<iframe width="600" height="400" src="https://www.youtube.com/embed/0MsGri8nmJQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>