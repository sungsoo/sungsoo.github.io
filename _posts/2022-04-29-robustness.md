---
layout: post
title: Robustness/Interpretability in Vision & Language Models 
date: 2022-04-29
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Robustness/Interpretability in Vision & Language Models](https://www.youtube.com/watch?v=zKKSXQvdCyE)


---

# Robustness/Interpretability in Vision & Language Models


* Speaker: Arjun Akula

## Abstract
Deep neural networks have enabled significant progress on many multi-modal grounding problems such as visual question answering (VQA), referring expression recognition (REF) which has several important applications such as in navigation, medical imaging, robotics and accessibility. In the last few years we have seen a huge improvement in how these models perform, some of them reaching human-level performance on several datasets. However, we find that these models could be exploiting strong biases in these datasets casting doubts on the actual progress. For example, as a human, do you focus on the same visual object when you hear the sentences “the bus in the middle of the crowd” and “the crowd that the bus is in the middle of”? Neural networks do so. The exciting progress on understanding language in the context of an image is not due to the cleverness of the neural networks, but rather because of the shortcuts present in the evaluation datasets. In this talk, we show that state-of-the-art neural network approaches are easily fooled due to their failure in overcoming biases in the training datasets. We also show that the recent self-supervised BERT based multi-modal architectures (e.g. ViLBERT) are relatively more robust compared to other neural architectures. We propose methods to improve robustness (and generalization) of the current models. We show that while data augmentation is one way to increase robustness, multi-task learning is probably a less tedious route. Finally, we describe a mechanism for producing scalable and nonstationary benchmarks (and out-of-distribution hard splits) for testing the generalization capabilities of existing grounding models.

<iframe width="600" height="400" src="https://www.youtube.com/embed/zKKSXQvdCyE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## Bio
Arjun Akula is a Research Scientist at Google AI in Mountain View. He got his PhD from UCLA, jointly advised by Prof. Song-Chun Zhu (UCLA) and Prof. Joyce Chai (UMich). His research interests are in computer vision, natural language processing, and deep learning, with the focuses on multi-modal grounding. Specifically, he works on identifying biases in state-of-the-art datasets and models, improving robustness of vision and language grounding models to out-of-distribution and adversarial inputs. He also works on making the underlying reasoning process of deep learning models more transparent and interpretable to human users. During his PhD, he interned at Amazon Alexa AI (Sunnyvale, CA), Google Research (Los Angeles, CA), Amazon AI (Palo Alto, CA) and Mila (Montreal). Prior to his PhD, he worked as a research software engineer at IBM Research AI (India) for 2.5 years. He did his Bachelors and Masters in Computer Science and Engineering from IIIT Hyderabad, India. He is an active member of the academic community serving as a reviewer/program committee member of ACL, CVPR, ARR, EMNLP, ICCV, AAAI, ECCV, NeurIPS and NAACL. Outside of work, he enjoys hiking, traveling, and playing Table Tennis. Here is a link to his personal website: [https://www.arjunakula.com/](https://www.arjunakula.com/)