---
layout: post
title: Leveraging Privacy-Enhancing Technologies with LLMs
date: 2023-09-12
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source

* [Leveraging Privacy-Enhancing Technologies with Large Foundation Models](https://www.youtube.com/watch?v=xELksWfqqGw)

---

# Leveraging Privacy-Enhancing Technologies with Large Foundation Models

## Abstract


"We can talk a little about the third privacy principle, which is data anonymization. This is
about making sure that the released output of any computation, especially when we train these
foundation models, does not reveal anything unique to an individual. So we care about aggregate
statistics, including the model parameters, and we want to be able to release them to engineers and
scientists or beyond, but we want to make sure that they do not vary significantly based whether or not any particular user data was included during training in the aggregation process. That's the principle. And in this round, differential privacy is the gold standard. It says that if you compute a query on a dataset to get a model output, this is the whole training algorithm that we use in order to train a certain machine learning model, if you do it on an adjacent dataset D-prime, where these two data sets defer by one unit X that I'm going to get to in a bit, these two outputs, the models that were computed on datasets, D and D-prime, should in theory look a lot alike, statistically. If they don't look a lot alike, if they are actually very different from one another, then the presence or absence of that unit X is going to allow us to distinguish between them, but we want them to be very close so that if we change one unit X, we don't lead to drastic differences in the model that's being trained. -- Peter Kairouz, Research Scientist, Google


<iframe width="600" height="400" src="https://www.youtube.com/embed/xELksWfqqGw?si=vXxxwGFW1SyIVxSy" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>