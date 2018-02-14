---
layout: post
title: Google's Text Reader AI
date: 2018-02-16
categories: [computer science]
tags: [machine learning]

---


# Google's Text Reader AI: Almost Perfect


The paper "Natural TTS Synthesis by Conditioning WaveNet on Mel Spectrogram Predictions" is available here:

* [Audio Samples](https://google.github.io/tacotron/publications/tacotron2/index.html)

* [Natural TTS Synthesis by Conditioning WaveNet on Mel Spectrogram Predictions](https://arxiv.org/abs/1712.05884)
   - Authors: Jonathan Shen, Ruoming Pang, Ron J. Weiss, Mike Schuster, Navdeep Jaitly, Zongheng Yang, Zhifeng Chen, Yu Zhang, Yuxuan Wang, RJ Skerry-Ryan, Rif A. Saurous, Yannis Agiomyrgiannakis, Yonghui Wu

   
## Abstract

This paper describes Tacotron 2, a neural network architecture for *speech synthesis* directly from text. The system is composed of a *recurrent sequence-to-sequence feature prediction network* that maps character embeddings to mel-scale spectrograms, followed by a modified WaveNet model acting as a vocoder to synthesize timedomain waveforms from those spectrograms. Our model achieves a **mean opinion score** (MOS) of 4.53 comparable to a MOS of 4.58 for professionally recorded speech. To validate our design choices, we present ablation studies of key components of our system and evaluate the impact of using mel spectrograms as the input to WaveNet instead of linguistic, duration, and F0 features. We further demonstrate that using a compact acoustic intermediate representation enables significant simplification of the WaveNet architecture. 

<iframe width="600" height="400" src="https://www.youtube.com/embed/bdM9c2OFYuw" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>