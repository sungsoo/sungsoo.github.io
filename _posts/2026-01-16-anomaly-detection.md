---
layout: post
title: Applying Foundational Models for Time Series Anomaly Detection
date: 2026-01-16
categories: [artificial intelligence]
tags: [artificial general intelligence]

---


# [Abhishek Murthy-Applying Foundational Models for Time Series Anomaly Detection-PyData Boston 2025](https://www.youtube.com/watch?v=ZrNUppuQDhM)

## Abstract

The time series machine learning community has begun adopting foundational models for forecasting and anomaly detection. These models, such as TimeGPT, MOMENT, Morai, and Chronos, offer zero-shot learning and promise to accelerate the development of AI use cases.

In this talk, we'll explore two popular foundational models, TimeGPT and MOMENT, for Time Series Anomaly Detection (TSAD). We'll specifically focus on the Novelty Detection flavor of TSAD, where we only have access to nominal (normal) data and the goal is to detect deviations from this norm.

TimeGPT and MOMENT take fundamentally different approaches to novelty detection.

* TimeGPT uses a forecasting-based method, tracking observed data against its forecasted confidence intervals. An anomaly is flagged when an observation falls sufficiently outside these intervals.
* MOMENT, an open-source model, uses a reconstruction-based approach. The model first encodes nominal data, then characterizes the reconstruction errors. During inference, it compares the test data's reconstruction error to these characterized values to identify anomalies.

We'll detail these approaches using the UCR anomaly detection dataset. The talk will highlight potential pitfalls when using these models and compare them with traditional TSAD algorithms.

This talk is geared toward data scientists interested in the nuances of applying foundational models for TSAD. No prior knowledge of time series anomaly detection or foundational models is required.

<iframe width="600" height="400" src="https://www.youtube.com/embed/ZrNUppuQDhM?si=R-yAeS8V7dQv1nfu" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>