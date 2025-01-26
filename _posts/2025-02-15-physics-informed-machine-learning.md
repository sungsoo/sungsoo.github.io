---
layout: post
title: Physics Informed Machine Learning through Symbolic Regression
date: 2025-02-15
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Physics Informed Machine Learning through Symbolic Regression](https://www.youtube.com/watch?v=ZFhclrBBhrQ)

---


# Physics Informed Machine Learning through Symbolic Regression

## Abstract


A novel framework was developed that uses symbolic regression to identify ground truth models from scarce and noisy data. The framework can successfully identify models in the form of partial differential equations (PDE) from time-variant data. Comparative analyses against similar approaches demonstrate the proposed framework’s superior ability to identify meaningful PDE models when data is scarce. The framework was further tested for robustness to noise and scarcity, showing successful model recovery with up to 50% noise. These results emphasize the potential of the proposed framework for the discovery of PDE models when data collection is expensive or otherwise difficult.

The framework was also compared with Physics-Informed Neural Networks (PINN) as implemented in NVIDIA’s Modulus software package. Modulus was used to approximate PDEs of a dynamic system and synthetic training data to build surrogate models. A similar approach, inspired by the PINN framework, that uses symbolic regression coupled with automatic differentiation (hence, eliminating the need for integration of the PDEs) was developed and benchmarked against PINN. Extensions of symbolic regression to explore such applications, and the benefits and drawbacks compared to neural networks will be discussed.

The framework developed was also applied for fault detection, through a genetic programming algorithm that augments a dynamic system model with equations that reveal the fault dependence on time. The obtained relation analytically describes the progression of the system fault in time, thus providing valuable insights for system health prognostics. The proposed fault diagnosis and prognosis technique was tested in a dynamic cross-flow plate-fin heat exchanger system, studied at various levels of fault progression, measurement noise, and uncertainty.

<iframe width="600" height="400" src="https://www.youtube.com/embed/ZFhclrBBhrQ?si=lmpEsE9T-662N0q7" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Bio
 
Dr. George Bollas is the Pratt & Whitney Endowed Chair Professor in Advanced Systems Engineering with the Chemical & Biomolecular Engineering Department at the University of Connecticut. He is also the Director of the Pratt & Whitney Institute for Advanced Systems Engineering at UConn. Prior to joining UConn, he was a postdoctoral fellow at the Massachusetts Institute of Technology and before that he received his BS and PhD in Chemical Engineering from the Aristotle University of Thessaloniki in Greece. His interdisciplinary research merges the fields of energy technology, process systems engineering and model-based systems engineering. His laboratory pursues a balanced approach to information theory for the design, optimization, control, operation, and maintenance of cyber-physical systems, with applications on energy, chemical industry, manufacturing, naval and the aerospace industry. Dr. Bollas is the recipient of the NSF CAREER and ACS PRF Doctoral New Investigator awards; the UConn Mentorship Excellence award; the UConn School of Engineering Dean’s Excellence award; AIChE Teacher of Year award; and the Chemical & Biomolecular Department Service award. He was a member of the 2016 Frontier of Engineering Education of the NAE and was elected as member of the Connecticut Academy of Science and Engineering in 2020. He has partnered with over 100 industry professionals and executives in generating and managing funding for UConn that exceeds $40M leading to joint R&D, technology, patents, and professional training programs. He manages a portfolio of over $7M in research projects, while his Institute manages active research funding that totals over $30M.

