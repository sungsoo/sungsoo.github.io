---
layout: post
title: Applying Machine Learning-based Database Tuning in Production
date: 2021-11-22
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Applying Machine Learning-based Database Tuning in Production](https://www.youtube.com/watch?v=gt5J23gyQ2I)


---


# Applying Machine Learning-based Database Tuning in Production

OtterTune Co-Founder Dana Van Aken presents her VLDB 2021 research paper on tuning database workloads in production environments.

## Abstract

Modern database management systems (DBMS) expose dozens of configurable knobs that control their runtime behavior. Setting these knobs correctly for an application’s workload can improve the performance and efficiency of the DBMS. But because of their complexity, tuning a DBMS often requires considerable effort from experienced database administrators (DBAs). Recent work on automated tuning methods using machine learning (ML) have shown to achieve better performance compared with expert DBAs. These ML-based methods, however, were evaluated on synthetic workloads with limited tuning opportunities, and thus it is unknown whether they provide the same benefit in a production environment.

To better understand ML-based tuning, we conducted a thorough evaluation of ML-based DBMS knob tuning methods on an enter- prise database application. We use the OtterTune tuning service to compare three state-of-the-art ML algorithms on an Oracle instal- lation with a real workload trace. Our results with OtterTune show that these algorithms generate knob configurations that improve performance by 45% over enterprise-grade configurations. We also identify deployment and measurement issues that were overlooked by previous research in automated DBMS tuning services.


<iframe width="600" height="400" src="https://www.youtube.com/embed/gt5J23gyQ2I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>