---
layout: post
title: Traffic Prediction with Advanced Graph Neural Networks
date: 2020-11-10
categories: [computer science]
tags: [machine learning, data management]

---

### Article Source
* [Traffic prediction with advanced Graph Neural Networks](https://deepmind.com/blog/article/traffic-prediction-with-advanced-graph-neural-networks)

----

# Traffic Prediction with Advanced Graph Neural Networks

 
*By partnering with Google, DeepMind is able to bring the benefits of
AI to billions of people all over the world.  From reuniting a
speech-impaired user with his [original voice](https://deepmind.com/blog/article/Using-WaveNet-technology-to-reunite-speech-impaired-users-with-their-original-voices), to helping users discover [personalized apps](https://deepmind.com/blog/article/Advanced-machine-learning-helps-Play-Store-users-discover-personalised-apps),
we can apply breakthrough research to immediate real-world problems at a Google scale. Today we're delighted to share the results of our latest partnership, delivering a truly global impact for the more than one billion people that use Google Maps.*

## Our collaboration with Google Maps

People rely on Google Maps for accurate traffic predictions and
*estimated times of arrival* (ETAs). These are critical tools that are
especially useful when you need to be routed around a traffic jam, if
you need to notify friends and family that you're running late, or if
you need to leave in time to attend an important meeting. 
These features are also useful for businesses such as rideshare companies, which use Google Maps Platform to power their services with information about pickup and dropoff times, along with estimated prices based on trip duration.

[Researchers at DeepMind](https://deepmind.com/about/deepmind-for-google) have partnered with the Google Maps team to improve the accuracy of real time ETAs by up to 50% in places like **Berlin, Jakarta, São Paulo, Sydney, Tokyo, and Washington D.C.** by using advanced machine learning techniques including *Graph Neural Networks*, as the graphic below shows:

![](https://kstatic.googleusercontent.com/files/f30cd622ddda3307ea4e487e99ef05d9bd542f5cfc64bd0068d539e494125fb70e787f30bb6366d3c9f731fd37fd4ddec5961ef1183825128b679e5fddbb55ce)

## How Google Maps Predicts ETAs

To calculate ETAs, Google Maps analyzes live traffic data for road
segments around the world. While this data gives Google Maps an accurate picture of *current traffic*, it doesn't account for the
traffic a driver can expect to see 10, 20, or even 50 minutes into their drive. To accurately predict *future traffic*, Google Maps uses machine learning to combine live traffic conditions with historical traffic patterns for roads worldwide. This process is complex for a number of reasons. For example - even though *rush-hour* inevitably happens every morning and evening, the exact time of rush hour can vary significantly from day to day and month to month. Additional factors like road quality, speed limits, accidents, and closures can also add to the complexity of the prediction model.


DeepMind partnered with Google Maps to help improve the accuracy of
their ETAs around the world. While Google Maps' predictive ETAs have
been consistently accurate for over 97% of trips, we worked with the
team to minimise the remaining inaccuracies even further - sometimes by more than 50% in cities like Taichung. To do this at a global scale, we used a generalized machine learning architecture called **Graph Neural Networks** that allows us to conduct *spatiotemporal reasoning* by incorporating relational learning biases to model the *connectivity* structure of real-world road networks. 

Here's how it works: 

## Dividing the world's roads into Supersegments

We divided road networks into "**Supersegments**" consisting of multiple adjacent segments of road that share significant traffic volume.
Currently, the Google Maps traffic prediction system consists of the
following components: (1) a *route analyzer* that processes terabytes of traffic information to construct *Supersegments* and (2) a novel *Graph Neural Network* model, which is optimized with multiple objectives and predicts the travel time for each Supersegment.

![The model architecture for determining optimal routes and their travel
time.](https://lh3.googleusercontent.com/hRtL9HSoj2dthO5BLoS_7GsyDwrc_eGyvL19ZnabdvcKP4Q9F8oNRyby5kKiB4A7xh4GEhIS4tqtqymZApZV3LCwzCSn5E0lT4674Q=w1440)


## On the road to novel machine learning architectures for traffic prediction

The biggest challenge to solve when creating a machine learning system
to estimate travel times using Supersegments is an **architectural one**.

>How do we represent *dynamically* sized examples of connected segments with arbitrary accuracy in such a way that a single model can achieve success?

Our initial proof of concept began with a *straight-forward approach*
that used the existing traffic system as much as possible, specifically the existing segmentation of road-networks and the associated real-time data pipeline. This meant that a Supersegment covered a set of road segments, where each segment has a specific length and corresponding speed features. 

At first we trained a single *fully connected neural network* model for every Supersegment. These initial results were promising, and demonstrated the potential in using neural networks for predicting travel time. However, given the *dynamic sizes* of the Supersegments, we required a *separately* trained neural network model for each one. To deploy this at scale, we would have to train millions of these models, which would have posed a considerable infrastructure challenge. This led us to look into models that could handle variable length sequences, such as *Recurrent Neural Networks* (RNNs). 
However, incorporating further structure from the road network proved difficult.
Instead, we decided to use *Graph Neural Networks*. In modeling traffic, we're interested in how cars flow through a network of roads, and Graph Neural Networks can model *network dynamics* and *information propagation*.

Our model treats the local road network as a *graph*, where each route
segment corresponds to a node and edges exist between segments that are consecutive on the same road or connected through an intersection. In a **Graph Neural Network**, a *message passing algorithm* is executed where the messages and their effect on edge and node states are learned by neural networks. 
From this viewpoint, our **Supersegments** are *road subgraphs*, which were *sampled at random* in proportion to *traffic density*. A single model can therefore be trained using these *sampled* subgraphs, and can be deployed at scale.

![](https://lh3.googleusercontent.com/Mp7qb3DYkkd5Lq1JMO5o4GMvK9pIYnamU0AkSDylVKHwd04LLwoxObFztEa1eqyOgNJicvtlonlFv01w9sqq0v0_LJ1Jm6WyE-zceQ=w1440)

**Graph Neural Networks** extend the learning bias imposed by *Convolutional Neural Networks* and *Recurrent Neural Networks* by generalizing the concept of "*proximity*", allowing us to have arbitrarily complex connections to handle not only traffic ahead or behind us, but also along *adjacent* and *intersecting* roads. 
In a Graph Neural Network, adjacent nodes pass messages to each other. By keeping this structure, we impose a *locality bias* where nodes will find it easier to rely on adjacent nodes (this only requires one message passing step). 
These mechanisms allow Graph Neural Networks to capitalize on the connectivity structure of the road network more effectively. 
Our experiments have demonstrated gains in *predictive power* from expanding to include adjacent roads that are not part of the main road. For example, think of how a jam on a side street can spill over to affect traffic on a larger road. By spanning multiple intersections, the model gains the ability to natively predict delays at turns, delays due to merging, and the overall traversal time in stop-and-go traffic. This ability of Graph Neural Networks to generalize over *combinatorial spaces* is what grants our modeling technique its power. 
Each Supersegment, which can be of *varying length* and of *varying complexity* - from simple two-segment routes to longer routes containing hundreds of nodes - can nonetheless be processed by the **same** *Graph Neural Network* model.


## From basic research to production-ready machine learning models

A big challenge for a *production machine learning system* that is often overlooked in the academic setting involves the *large variability* that can exist across multiple training runs of the same model. While small differences in quality can simply be discarded as *poor initializations* in more academic settings, these small inconsistencies can have a large impact when added together across millions of users. As such, making our Graph Neural Network robust to this variability in training took center stage as we pushed the model into production. 

We discovered that Graph Neural Networks are particularly *sensitive* to changes in the training curriculum - the primary cause of this *instability* being the *large variability* in graph structures used during training. A single batch of graphs could contain anywhere from small two-node graphs to *large 100+ nodes graphs*.

After much trial and error, however, we developed an approach to solve
this problem by adapting a *novel reinforcement learning technique* for use in a supervised setting.

In training a machine learning system, the learning rate of a system
specifies how '*plastic*' -- or **changeable to new information** -- it is.
Researchers *often reduce the learning rate* of their models over time, as there is a tradeoff between *learning new things*, and *forgetting* important features already learned--not unlike the progression from childhood to adulthood. 
We initially made use of an *exponentially decaying learning rate* schedule to stabilize our parameters after a pre-defined period of training. We also explored and analyzed *model ensembling techniques* which have proven effective in previous work to see if we could reduce model variance between *training runs*.

In the end, the most successful approach to this problem was using [**MetaGradients**](https://arxiv.org/abs/1805.09801) to dynamically *adapt the learning rate* during training - effectively letting the system learn its own *optimal learning rate schedule*. 
By automatically adapting the learning rate while training, our model not only achieved *higher quality* than before, it also learned to decrease the learning rate *automatically*. This led to more stable results, enabling us to use our novel architecture in production.


## Making models generalize through customized loss functions

While the ultimate goal of our modeling system is to *reduce errors* in travel estimates, we found that making use of a *linear combination* of multiple loss functions (*weighted* appropriately) greatly increased the ability of the model to generalise. Specifically, we formulated a multi-loss objective making use of a regularising factor on the model weights, $L_2$ and $L_1$ losses on the global traversal times, as well as individual **Huber** and *negative-log likelihood* (NLL) losses for each node in the graph. 
By combining these losses we were able to guide our model
and *avoid overfitting* on the training dataset. 
While our measurements of quality in training did not change, improvements seen during training translated more directly to held-out tests sets and to our end-to-end experiments.

Currently we are exploring whether the **MetaGradient technique** can also be used to vary the composition of the *multi-component loss-function* during training, using the reduction in travel estimate errors as a guiding metric. This work is inspired by the MetaGradient efforts that have found success in reinforcement learning, and early experiments show promising results.

## Collaboration

Thanks to our close and fruitful collaboration with the Google Maps
team, we were able to apply these novel and newly developed techniques
at scale. Together, we were able to overcome both *research* challenges as well as *production* and *scalability* problems. In the end, the final model and techniques led to a successful launch, improving the accuracy of ETAs on Google Maps and Google Maps Platform APIs around the world.

Working at Google scale with cutting-edge research represents a unique
set of challenges. If you're interested in applying cutting edge
techniques such as Graph Neural Networks to address real-world problems, learn more about the team working on these problems [here](https://deepmind.com/about/deepmind-for-google).


































































