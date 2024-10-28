---
layout: post
title:  Decoding on Graphs; Empower LLMs with KGs
date: 2024-11-03
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Decoding on Graphs; Empower LLMs with KGs](https://www.youtube.com/watch?v=LOF6fvV5XUc)

---

# Decoding on Graphs; Empower LLMs with KGs


## Abstract

Decoding on Graphs (DoG) is a novel framework that integrates Large Language Models (LLMs) with Knowledge Graphs (KGs) to enhance question-answering (QA) tasks. The key innovation is the concept of a "well-formed chain", a sequence of interconnected fact triplets from the KG that starts with entities mentioned in the question and leads logically to the answer. 

To ensure that LLMs generate these chains faithfully, DoG introduces graph-aware constrained decoding, which dynamically restricts the LLM's token generation based on the KG's topology. This is achieved using a trie data structure that maintains valid token sequences corresponding to the KG's paths, ensuring that each generated reasoning step aligns with actual KG relations and entities.

Additionally, DoG employs beam search execution at the triplet level to explore multiple plausible reasoning paths simultaneously, enhancing the robustness and accuracy of the answers. By constraining the LLM's decoding process without altering its underlying parameters or requiring additional training, DoG effectively leverages the LLM's inherent reasoning capabilities while grounding its outputs in the structured knowledge of the KG. 

Experimental results demonstrate that DoG outperforms existing methods on several KGQA benchmarks, particularly in complex multi-hop reasoning scenarios, highlighting its effectiveness and adaptability across different KGs and LLMs.


all rights w/ authors:
Decoding on Graphs: Faithful and Sound Reasoning on Knowledge Graphs
through Generation of Well-Formed Chains
[https://arxiv.org/pdf/2410.18415](https://arxiv.org/pdf/2410.18415)

<iframe width="600" height="400" src="https://www.youtube.com/embed/LOF6fvV5XUc?si=kvcd-KKMSlcKfHh_" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>