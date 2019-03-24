---
layout: post
title: Deep Compression
date: 2019-03-25
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Deep Compression, DSD Training and EIE](https://www.youtube.com/watch?v=vouEMwDNopQ)

---



# Deep Compression

* Deep Compression, DSD Training and EIE: Deep Neural Network Model Compression, Regularization and Hardware Acceleration

## Abstract
 
Neural networks are both computationally intensive and memory intensive, making them difficult to deploy on mobile phones and embedded systems with limited hardware resources. To address this limitation, this talk first introduces "**Deep Compression**" that can compress the deep neural networks by 10x-49x without loss of prediction accuracy[1][2][5]. Then this talk will describe DSD, the "*Dense-Sparse-Dense*" training method that regularizes CNN/RNN/LSTMs to improve the prediction accuracy of a wide range of neural networks given the same model size[3]. Finally this talk will discuss EIE, the "*Efficient Inference Engine*" that works directly on the deep-compressed DNN model and accelerates the inference, taking advantage of weight sparsity, activation sparsity and weight sharing, which is 13x faster and 3000x more energy efficient than a TitanX GPU[4].    

<iframe width="600" height="400" src="https://www.youtube.com/embed/vouEMwDNopQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## References  
1. Han et al. Learning both Weights and Connections for Efficient Neural Networks (NIPS'15) 
2. Han et al. Deep Compression: Compressing Deep Neural Networks with Pruning, Trained Quantization and Huffman Coding (ICLR'16, best paper award)  
3. Han et al. DSD: Regularizing Deep Neural Networks with Dense-Sparse-Dense Training (submitted to NIPS'16)
4. Han et al. EIE: Efficient Inference Engine on Compressed Deep Neural Network (ISCA’16)  
5. Iandola, Han et al. SqueezeNet: AlexNet-level accuracy with 50x fewer parameters and &lt;0.5MB model size (submitted to EVVC'16)
