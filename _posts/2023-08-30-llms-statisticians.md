---
layout: post
title: Language Models as Statisticians, and as Adapted Organisms
date: 2023-08-30
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source

* [Language Models as Statisticians, and as Adapted Organisms](https://www.youtube.com/watch?v=_oHvhJhjkx0)

---

# Language Models as Statisticians, and as Adapted Organisms

* Jacob Steinhardt (UC Berkeley)
* Large Language Models and Transformers

## Abstract
Given their complex behavior, diverse skills, and wide range of deployment scenarios, understanding large language models---and especially their  failure modes---is important. Given that new models are released every few months, often with brand new capabilities, how can we achieve understanding that keeps pace with modern practice?

In this talk, I will present two approaches to this that leverages the structure and skills of language models themselves, and so scale up as models get better. The first approach leverages the skill of language models *as statisticians*. At inference time, language models can read and process significant amounts of information due to their large context windows, and use this to generate useful statistical hypotheses. We will showcase several systems built on this principle, which allow us to audit other models for failures, identify spurious cues in datasets, and factorize corpora into human-interpetable concepts.

Next, we will leverage the *internal structure* of language models. Language models are adapted to complex data that induces rich internal structure in their activations. If we can understand this structure, we can steer language models towards more desired behaviors, similar to how understanding DNA let us engineer useful proteins in biology. As case studies, we'll first reverse-engineer how a learned transformer solves a simple reasoning task, then show how leveraging internal activations can make language models more honest.

This is joint work with many collaborators and students, including Ruiqi Zhong, Erik Jones, and Collin Burns.

<iframe width="600" height="400" src="https://www.youtube.com/embed/_oHvhJhjkx0?si=_wMMVDlBEdrcRsu8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>