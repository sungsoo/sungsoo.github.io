---
layout: post
title: How Intelligent Machines Learn to Make Sense of the World
date: 2017-01-31
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [How Intelligent Machines Learn to Make Sense of the World](https://www.datanami.com/2017/01/31/intelligent-machines-learn-make-sense-world/?_scpsug=crawled_170454_73bd1e40-e7f0-11e6-b467-00221934899c#_scpsug=crawled_170454_73bd1e40-e7f0-11e6-b467-00221934899c)
* Authors: Hui Li and Fiona McNeill

---

How Intelligent Machines Learn to Make Sense of the World
===

![](https://2s7gjr373w3x22jf92z99mgm5w-wpengine.netdna-ssl.com/wp-content/uploads/2017/01/shutterstock_AI_machine-learning-200x113.jpg)
<p class="caption">(John Williams RUS/Shutterstock)
    
Home Depot uses it to show which bathtubs in its huge inventory will fit someone’s oddly shaped bathroom. Apple uses it to present customers with relevant apps from the app store. Intuit uses it to display the right help page when a user is filling out a particular tax form. “It” is machine learning. And organizations are turning to it in droves to differentiate and innovate their offerings. In a recent interview, Gartner Fellow and Vice President Tom Austin noted that about half of large enterprises are experimenting with “smart computing” projects.

With the burgeoning interest in machine learning, it should come as no surprise that many vendors have jumped on the bandwagon. Vendors often categorize their solutions as machine learning, whether they meet the definition or not. Adding to the confusion, some approaches, like cognitive computing, come in many flavors – machine learning, natural language processing and deep learning. Even neural networks, first introduced in the late 1950s, have come back into vogue under the banner of deep learning – a method attributed to both the fields of machine learning as well as artificial intelligence (AI).
With all the hoopla, many wonder whether, and what type of, machine learning is right for their application. This article clarifies how machines learn, different types of machine learning methods, and how these advanced analytics relate to each other.

## How Machines Learn

Unlike standard algorithms that are designed to perform a particular task, machine learning methods are designed to learn <em>how to perform</em> a task – learning as they are exposed to data. Given that these models learn from data, assessing key relationships and identifying patterns between factors, they are highly influenced by the data itself. Validation of the models on naïve data, not used to train, is important for these models to adequately generalize for business application. These models not only learn both from the initial building and validation, they also continue to learn dynamically – from ongoing feedback as the model is applied over time.

![](https://2s7gjr373w3x22jf92z99mgm5w-wpengine.netdna-ssl.com/wp-content/uploads/2017/01/robot_arm_shutterstock_-Zapp2Photo.jpg)

<p class="wp-caption-text"><em>Machines can learn through supervised, unsupervised, or semi-supervised training techniques (Zapp2Photo/Shutterstock)</em>

Just as humans have different learning styles, machines can learn in different ways. These learning methods include supervised learning, semi-supervised learning and unsupervised learning, and in one or more of the above can adjust learning through reinforcement techniques.
<ul>
<li><strong>Supervised learning. </strong>Supervised learning is like a student who learns by mimicking a teacher’s behavior as he or she goes through their lectures. With supervised learning, you have an input variable that consists of labeled training data and a desired output variable – that represents the teacher’s behavior in a specific context. You use an algorithm to analyze the training data to learn the function that maps the input to the output. This “inferred” function maps new, unknown examples by generalizing from the training data to unseen situations.</li>
<li><strong>Semi-supervised learning.</strong> The challenge with supervised learning is that labels can be expensive. If labels are limited, you can use unlabeled examples to enhance supervised learning. Because the machine is not fully supervised in this case, we say the machine is semi-supervised. With semi-supervised learning, you use unlabeled examples with a small amount of labeled data to improve learning accuracy.</li>
<li><strong>Unsupervised learning</strong>. With unsupervised learning the machine is presented with totally unlabeled data. It is asked to discover underlying patterns, such as a clustering structure, a low-dimensional manifold, or sparse trees and graphs.</li>
<li><strong>Reinforcement learning. </strong>This approach is used toanalyze behavior based on feedback from the environment. Machines try different scenarios to discover which actions yield the greatest reward, rather than being told which actions to take. Trial-and-error, search and delayed reward distinguish reinforcement learning from other techniques.</li>
</ul>

## Types of Machine Learning

Machine learning lies at the heart of many advanced intelligence solutions, from AI to deep learning neural networks to natural language processing (NLP) and cognitive computing.

![](https://2s7gjr373w3x22jf92z99mgm5w-wpengine.netdna-ssl.com/wp-content/uploads/2017/01/AI_brain_abstract_shutterstock_-Carlos-Amarillo.jpg)
<p class="wp-caption-text"><em>Machine learning lies at the heart of many modern enterprise solutions (Carlos Amarillo/Shutterstock)</em>

### Artificial Intelligence

One of the currently most popular forms of machine learning, AI is a science and an engineering discipline designed to enable machines to solve problems and achieve goals on par with humans. Although it was founded in the 1950s, recent advances have led many to view AI as a premiere technology for shaping the world over the next several decades.
AI uses machine learning to enable expert humans or machines themselves to teach machines. Not only can machines emulate human intelligence by learning from experts, they can even surpass human intelligence. For example, AlphaGO, a computer program developed by Google DeepMind to play the board game GO, learned to beat professional human players by competing against its historical self.

### Neural Networks and Deep Learning

Neural networks flourished in the mid-1980s due to advances in parallel, distributed compute processing. But research in this field was impeded by the ineffectiveness of training neural networks with the widely used back-propagation training method. Support vector machines and other simpler models, which can be easily trained to solve complex optimization problems, gradually replaced neural networks in machine learning.
Now, new and improved training techniques such as unsupervised pre-training and layer-wise training have caused a resurgence in neural networks. Increasingly powerful computation capabilities, such as graphical processing unit GPU and massively parallel processing MPP processing have also spurred adoption. With revived interest in neural networks has come to the invention of models with thousands of layers. In other words, shallow neural networks have evolved into deep learning neural networks.
Deep learning neural networks are very successful for supervised learning. When used for speech and image recognition, deep learning performs as well as, or even better than, humans. Applied to unsupervised learning tasks, such as feature extraction, deep learning also extracts features from raw images or speech with much less human intervention.
But despite recent success, many challenges remain for neural networks, particularly deep learning neural nets. The massive data required to train models as well as the computational processing time are two major issues. In addition, the deep compositional structure of neural networks gives them powerful modeling capabilities, but makes it easy to overfit to data, particularly when data is limited. When overfitting occurs, the trained model cannot generalize to unseen contexts and is of little practical use. Regularization can mitigate overfitting, but little research exists on how best to use it to optimize training.

### Natural Language Processing and Cognitive Computing

A machine can learn to perform sophisticated human tasks only if the input is provided in a machine-understandable manner and if humans can interpret outcomes. The cognitive computing community uses NLP to build interfaces that allow machines to understand human language and humans to interpret machine output.

![](https://2s7gjr373w3x22jf92z99mgm5w-wpengine.netdna-ssl.com/wp-content/uploads/2017/01/NLP_shutterstock_raindrop74.jpg)
<p class="wp-caption-text"><em>(raindrop74/Shutterstock)</em>

Many different approaches to NLP are available. One approach is traditional, manually defined rule systems (or those refined from machine-driven suggestions). These rule systems are based on linguistic definitions that provide rich contextual delineation to address the nuances of language, such as negations, co-reference resolution and the like. Another approach is cognitive computing, which uses decades-long research in NLP to enable communication and contextual understanding by machines that are adaptable and use machine learning methods.
As with supervised training, machines can learn from linguistic experts. They can also learn by example through unlabeled text as semi-supervised learning. The deep learning technique, long short-time memories, performs various NLP-rated tasks based on neural networks, introducing unsupervised learning to unstructured data for uses such as image captioning, text generation and machine translation.

### Why now?
Today’s market is seeing an explosion in machine learning – from AI to deep learning to cognitive computing. Why now? We owe these breakthroughs to advances in inexpensive commodity hardware that can be chained together to form massively parallel computational environments. Machine learning software can now execute across hardware clusters, running learning processing in tandem- whether in-memory, in-database or both. These environments can hold all the big data necessary to feed greedy methods like deep learning. By centralizing input data, these systems give algorithms unprecedented maneuverability to cycle through neural layer iterations, test reinforcement rewards and fuse different types of data – while delivering answers at human-like speed.