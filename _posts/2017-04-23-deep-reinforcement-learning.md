---
layout: post
title:  Deep Reinforcement Learning
date: 2017-04-23
categories: [computer science]
tags: [machine learning]

---


# Deep Reinforcement Learning

## Abstract 

*Reinforcement learning* (RL) is the most general type of learning. General RL agents must discover, without the aid of a teacher, how to interact with a dynamic, initially unknown, partially observable environment in order to maximize their expected cumulative reward signals (e.g., Kaelbling et al. 1996; Sutton and Barto 1998; Wiering and van Otterlo 2012). There may be arbitrary, a priori unknown delays between actions and perceivable consequences. The RL problem is as hard as any problem of computer science, since any task with a computable description can be formulated in the general RL framework (e.g., Hutter 2005). Deep FNNs and RNNs are useful tools for various types of RL. Many references on this since the 1980s can be found in the recent survey (Schmidhuber 2015, Sect. 6).

## Deep Reinforcement Learning in Google DeepMind

Humans excel at solving a wide variety of challenging problems, from low-level motor control through to high-level cognitive tasks. Our goal at DeepMind is to create artificial agents that can achieve a similar level of performance and generality. Like a human, our agents learn for themselves to achieve successful strategies that lead to the greatest long-term rewards. This paradigm of learning by trial-and-error, solely from rewards or punishments, is known as [reinforcement learning](https://en.wikipedia.org/wiki/Reinforcement_learning) (RL).
Also like a human, our agents construct and learn their own knowledge directly from raw inputs, such as vision, without any hand-engineered features or domain heuristics. This is achieved by [deep learning](https://en.wikipedia.org/wiki/Deep_learning) of neural networks. At DeepMind we have pioneered the combination of these approaches - deep reinforcement learning - to create the first artificial agents to achieve human-level performance across many challenging domains.

Our agents must continually make value judgements so as to select good actions over bad. This knowledge is represented by a Q-network that estimates the total reward that an agent can expect to receive after taking a particular action. Two years ago we introduced the first widely successful [algorithm](http://arxiv.org/pdf/1312.5602.pdf) for deep
reinforcement learning. The key idea was to use deep neural networks to represent the Q-network, and to train this Q-network to predict total reward. Previous attempts to combine RL with neural networks had largely failed due to unstable learning. To address these instabilities, our Deep Q-Networks (DQN) algorithm stores all of the agent's experiences and then randomly samples and replays these experiences to provide diverse and decorrelated training data. We applied DQN to learn to play games on the Atari 2600 console. At each time-step the agent observes the raw pixels on the screen, a reward signal corresponding to the game score, and selects a joystick direction. In our [Nature paper](https://storage.googleapis.com/deepmind-data/assets/papers/DeepMindNature14236Paper.pdf) we trained separate DQN agents for 50 different Atari games, without any prior knowledge of the game rules.

![](https://storage.googleapis.com/deepmind-live-cms/images/Mnih_Fig3_R3%2520SM.width-400_nxiXBlA.png)

Amazingly, DQN achieved human-level performance in almost half of the 50 games to which it was applied; far beyond any previous method. The [DQNsource code](https://sites.google.com/a/deepmind.com/dqn/) and [Atari 2600 emulator](http://stella.sourceforge.net/) are freely available to anyone who wishes to experiment for themselves.

![](https://storage.googleapis.com/deepmind-live-cms/images/Breakout.width-320_vazpVjX.png)

We have subsequently improved the DQN algorithm in many ways: further stabilising the [learning](http://arxiv.org/pdf/1509.06461) [dynamics](http://arxiv.org/pdf/1512.04860); prioritising the [replayed experiences](http://arxiv.org/pdf/1511.05952.pdf); [normalising](http://arxiv.org/pdf/1511.06581), [aggregating](http://arxiv.org/pdf/1602.04621) and
[re-scaling](http://arxiv.org/pdf/1602.07714) the outputs. Combining several of these improvements together led to a 300% improvement in mean score across Atari games; human-level performance has now been achieved in almost all of the Atari games. We can even train a [single neural network](http://jmlr.org/proceedings/papers/v37/schaul15.pdf) to learn
about [multiple Atari games](http://arxiv.org/pdf/1511.06295). We have also built a massively distributed deep RL system, known as [Gorila](https://8109f4a4-a-62cb3a1a-s-sites.googlegroups.com/site/deeplearning2015/1.pdf?attachauth=ANoY7coDLGNh08PYPVtc6s86hnYKRd-u_rcqYWAlLgilFKOVYP1mDJi0MR8Wf2-5UM261X1V8kRFF-5zM9FHKcMhGc5B3A50_8IWuTGGPw6n38udZypcVwN0IspGasgBuxAO1e7oi2vJfUrq4m7s-OxqlNTZVo3R6P1myydUC6PWnkovtHTDzOAyROSFrVsvrorK2QUn7DN00z4jUZ8jZPX1-nddjMqXw%3D%3D&attredirects=2), that utilises the Google Cloud platform to speed up training time by an order of magnitude; this system has been applied to recommender systems within Google.

However, deep Q-networks are only one way to solve the deep RL problem. We recently introduced an even more practical and effective method based on asynchronous RL. This approach exploits the multithreading capabilities of standard CPUs. The idea is to execute many instances of our agent in parallel, but using a shared model. This provides a viable alternative to experience replay, since parallelisation also diversifies and decorrelates the data. Our asynchronous actor-critic algorithm, [A3C](http://arxiv.org/pdf/1602.01783), combines a deep Q-network with a deep policy network for selecting actions. It achieves state-of-the-art results, using a fraction of the training time of DQN and a fraction of the resource consumption of Gorila. By building novel approaches to [intrinsic motivation](https://arxiv.org/abs/1606.01868) and [temporally abstract planning](http://arxiv.org/pdf/1606.04695), we have also achieved breakthrough results in the most notoriously challenging Atari games, such as Montezuma’s Revenge.

While Atari games demonstrate a wide degree of diversity, they are limited to 2D sprite-based video games. We have recently introduced Labyrinth: a challenging suite of 3D navigation and puzzle-solving environments. Again, the agent only observes pixel-based inputs from its immediate field-of-view, and must figure out the map to discover and exploit rewards.

![](https://storage.googleapis.com/deepmind-live-cms/images/SpaceInvaders.width-320_q9iLF15.png)

![](https://storage.googleapis.com/deepmind-live-cms/images/Labyrinth%2520Medley_sm.width-400_YPOs7vz.jpg)

Amazingly, the A3C algorithm achieves human-level performance, out-of-the-box, on many Labyrinth tasks. An [alternative
approach](https://arxiv.org/pdf/1606.04460) based on episodic memory has also proven successful. Labyrinth will also be released open source in the coming months.

![](https://storage.googleapis.com/deepmind-live-cms/images/Labyrinth.width-320_mWAoIlK.png)

We have also developed a number of deep RL methods for continuous control problems such as robotic manipulation and locomotion. Our Deterministic Policy Gradients algorithm ([DPG](http://jmlr.org/proceedings/papers/v32/silver14.pdf)) provides a continuous analogue to DQN, exploiting the differentiability of the Q-network to solve a [wide](http://arxiv.org/pdf/1509.02971) [variety](http://arxiv.org/pdf/1510.09142) of continuous control tasks. [Asynchronous RL](http://arxiv.org/pdf/1602.01783) also performs well in these domains and, when augmented with a hierarchical control strategy, can solve challenging problems such as ant soccer and a 54-dimensional humanoid slalom, without any prior knowledge of the dynamics.

![](https://storage.googleapis.com/deepmind-live-cms/images/AntSoccer.width-320_wuJWGgT.png)

The game of Go is the most challenging of classic games. Despite decades of effort, prior methods had only achieved amateur level performance. We developed a deep RL algorithm that learns both a value network (which predicts the winner) and a policy network (which selects actions) through games of self-play. Our program AlphaGo combined these deep neural networks with a state-of-the-art tree search. In October 2015, AlphaGo became [the first program to defeat a professional human player](http://www.nature.com/nature/journal/v529/n7587/full/nature16961.html). In March 2016, AlphaGo [defeated Lee Sedol](https://deepmind.com/alpha-go) (the strongest player of the last decade with an incredible 18 world titles) by 4 games to 1, in a match that was watched by an estimated 200 million viewers.

![](https://storage.googleapis.com/deepmind-live-cms/images/A26U3069.width-400_IOlum5D.jpg)

Separately, we have also developed [game theoretic](http://jmlr.org/proceedings/papers/v37/heinrich15.pdf) approaches to [deep RL](https://arxiv.org/pdf/1603.01121), culminating in a [super-human](http://www.aaai.org/ocs/index.php/IJCAI/IJCAI15/paper/view/11230/10741) poker player for heads-up limit Texas Hold’em.

From Atari to Labyrinth, from locomotion through manipulation, to poker and even the game of Go, our deep reinforcement learning agents have demonstrated remarkable progress on a wide variety of challenging tasks. Our goal is to continue to improve the capabilities of our agents, and to use them to make a positive impact on society, in important applications such as [healthcare](https://deepmind.com/health).

## References

[1] [*Deep Reinforcement Learning*](https://deepmind.com/blog/deep-reinforcement-learning/). DeepMind, Google, 2016.

