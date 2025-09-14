---
layout: post
title: Visual CoT Reasoning for Vision-Language-Action Models
date: 2025-09-18
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# [Visual Chain-of-Thought Reasoning for Vision-Language-Action Models](https://cot-vla.github.io/)


## Abstract

Vision-language-action models (VLAs) have shown potential in leveraging pre-trained vision-language models and diverse robot demonstrations for learning generalizable sensorimotor control. While this paradigm effectively utilizes large-scale data from both robotic and non-robotic sources, current VLAs primarily focus on direct input-output mappings, lacking the intermediate reasoning steps crucial for complex manipulation tasks. As a result, existing VLAs lack temporal planning or reasoning capability. In this paper, we introduce a method that incorporates explicit visual chain-of-thought (CoT) reasoning into vision-language-action models (VLAs) by predicting future image frames auto-regressively as visual goals before generating a short action sequence to achieve these goals. We introduce CoT-VLA, a state-of-the-art 7B VLA that can understand and generate visual and action tokens. We demonstrates that CoT-VLA achieves strong performance in manipulation tasks in both the real world and simulation benchmarks.

![](https://cot-vla.github.io/media/cot_vla_pipeline.png)

<iframe width="600" height="400" src="https://www.youtube.com/embed/jScOxG1_SE0?si=n-DIT9eu79tsenbR" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>