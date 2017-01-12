---
layout: post
title: Transfer Learning and Fine-tuning Deep Convolutional Neural Networks
date: 2017-01-13
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Deep Learning Part 2: Transfer Learning and Fine-tuning Deep Convolutional Neural Networks](http://blog.revolutionanalytics.com/2016/08/deep-learning-part-2.html)
* Authors: Anusua Trivedi, Microsoft Data Scientist

---

Transfer Learning and Fine-tuning Deep Convolutional Neural Networks 
===


This is a blog series in several parts — where I describe my experiences
and go deep into the reasons behind my choices. In [Part
1](http://blog.revolutionanalytics.com/2016/08/deep-learning-part-1.html),
I discussed the pros and cons of different symbolic frameworks, and my
reasons for choosing Theano (with Lasagne) as my platform of choice.

Part 2 of this blog series is based on my upcoming talk at [The Data
Science Conference,
2016](http://www.thedatascienceconference.com/). Here in Part 2, I
describe Deep Convolutional Neural Networks (DCNNs) and how Transfer
learning and Fine-tuning helps better the training process for domain
specific images.

Please feel free to email me at *trivedianusua23@gmail.com* if you have
questions.

## Introduction

The eye disease Diabetic Retinopathy (DR) is a common cause of vision
loss. Screening diabetic patients using fluorescein angiography images
can potentially reduce the risk of blindness. Current trends in the
research have demonstrated that DCNNs are very effective in
automatically analyzing large collections of images and identifying
features that can categorize images with minimum error. DCNNs are rarely
trained from scratch, as it is relatively uncommon to have a
domain-specific dataset of sufficient size. Since modern DCNNs take 2-3
weeks to train across GPUs, Berkley Vision and Learning Center (BVLC)
have released some final DCNN checkpoints. In this blog, we use such a
pre-trained network: GoogLeNet. This GoogLeNet network is pre-trained on
a large collection of natural ImageNet images. We transfer the learned
ImageNet weights as initial weights for the network, and fine-tune these
pre-trained generic network to recognize fluorescein angiography images
of eyes and improve DR prediction.

## Using explicit feature extraction to predict Diabetic Retinopathy

Much work has been done in developing algorithms and morphological image
processing techniques that explicitly extract features prevalent in
patients with DR. The generic workflow used in a standard image
classification technique is as follows:

-   Image preprocessing techniques for noise removal and contrast
    enhancement
-   Feature extraction technique
-   Classification
-   Prediction

[Faust et
al.](http://link.springer.com/article/10.1007/s10916-010-9454-7) provide
a very comprehensive analysis of models that use explicit feature
extraction for DR screening. [Vujosevic et
al.](http://www.ncbi.nlm.nih.gov/pubmed/19406376) build a binary
classifier on a dataset of 55 patients by explicitly forming single
lesion features.
[These authors](http://www.ncbi.nlm.nih.gov/pubmed/19623908) use
morphological image processing techniques to extract blood vessel, and
hemorrhage features and then train an SVM on a data set of 331 images.
[These authors](http://www.ncbi.nlm.nih.gov/pubmed/18461814) report
accuracy of 90% and sensitivity of 90% on binary classification task
with a dataset of 140 images.

However, all these processes are very time and effort consuming. Further
improvements in prediction accuracy require large quantities of labeled
data. Image processing and feature extraction of image datasets is very
complex and time-consuming. Thus, we choose to automate the image
processing and feature extraction step by using DCNNs.

## Deep convolutional neural network (DCNN)

Image data requires subject-matter expertise to extract key features.
DCNNs extract features automatically from domain-specific images,
without any feature engineering techniques. This process makes DCNNs
suitable for image analysis:

-   DCNNs train networks with many layers
-   Multiple layers work to build an improved feature space
-   Initial layers learn 1st order features (e.g. color, edges etc.)
-   Later layers learn higher order features (specific to input dataset)
-   Lastly, final layer features are fed into classification layer(s)

 



![Figure
1](http://a4.typepad.com/6a0105360ba1c6970c01b7c88b2a04970b-800wi "Figure 1") 
**C layers are convolutions, S layers are pool/sample**



**Convolution**: Convolution layers consist of a rectangular grid of
neurons. The weights for this are the same for each neuron in the
convolution layer. The convolution layer weights specify the convolution
filter.

 


![2](http://a1.typepad.com/6a0105360ba1c6970c01bb092e86d9970d-800wi "2")

**Convolution**

 

**Pooling**: The pooling layer takes small rectangular blocks from the
convolutional layer and subsamples it to produce a single output from
that block.

 

![3](http://a6.typepad.com/6a0105360ba1c6970c01bb092e8716970d-800wi "3")

**Pooling**
 

In this post, we are using GoogLeNet DCNN, which was developed at
Google. GoogLeNet won the ImageNet challenge in 2014, setting the record
for the best contemporaneous results. Motivations for this model were a
simultaneously deeper as well as computationally inexpensive
architecture.


![4](http://a1.typepad.com/6a0105360ba1c6970c01b8d214dbc1970c-800wi "4")

**GoogLeNet**

## Transfer Learning and Fine-tuning DCNNs

In practice, we don’t usually train an entire DCNN from scratch with
random initialization. This is because it is relatively rare to have a
dataset of sufficient size that is required for the depth of network
required. Instead, it is common to pre-train a DCNN on a very large
dataset and then use the trained DCNN weights either as an
initialization or a fixed feature extractor for the task of interest.

**Fine-Tuning**: Transfer learning strategies depend on various factors,
but the two most important ones are the size of the new dataset, and its
similarity to the original dataset. Keeping in mind that DCNN features
are more generic in early layers and more dataset-specific in later
layers, there are four major scenarios:

1.  New dataset is smaller in size and similar in content compared to
    original dataset: If the data is small, it is not a good idea to
    fine-tune the DCNN due to overfitting concerns. Since the data is
    similar to the original data, we expect higher-level features in the
    DCNN to be relevant to this dataset as well. Hence, the best idea
    might be to train a linear classifier on the CNN-features.
    
2.  New dataset is relatively large in size and similar in content
    compared to the original dataset: Since we have more data, we can
    have more confidence that we would not over fit if we were to try to
    fine-tune through the full network.
    
3.  New dataset is smaller in size but very different in content
    compared to the original dataset: Since the data is small, it is
    likely best to only train a linear classifier. Since the dataset is
    very different, it might not be best to train the classifier from
    the top of the network, which contains more
    dataset-specific features. Instead, it might work better to train a
    classifier from activations somewhere earlier in the network.
    
4.  New dataset is relatively large in size and very different in
    content compared to the original dataset: Since the dataset is very
    large, we may expect that we can afford to train a DCNN
    from scratch. However, in practice it is very often still beneficial
    to initialize with weights from a pre-trained model. In this case,
    we would have enough data and confidence to fine-tune through the
    entire network.

**Fine-tuning DCNNs**: For this DR prediction problem, we fall under
scenario iv. We fine-tune the weights of the pre-trained DCNN by
continuing the backpropagation. It is possible to fine-tune all the
layers of the DCNN, or it’s possible to keep some of the earlier layers
fixed (due to overfitting concerns) and only fine-tune some higher-level
portion of the network. This is motivated by the observation that the
earlier features of a DCNN contain more generic features (e.g. edge
detectors or color blob detectors) that should be useful to many tasks,
but later layers of the DCNN becomes progressively more specific to the
details of the classes contained in the DR dataset.

**Transfer learning constraints**: As we use a pre-trained network, we
are slightly constrained in terms of the model architecture. For
example, we can’t arbitrarily take out convolutional layers from the
pre-trained network. However, due to parameter sharing, we can easily
run a pre-trained network on images of different spatial size. This is
clearly evident in the case of Convolutional and Pool layers because
their forward function is independent of the input volume spatial size.
In case of Fully Connected (FC) layers, this still holds true because FC
layers can be converted to a Convolutional Layer.

**Learning rates**: We use a smaller learning rate for DCNN weights that
are being fine-tuned under the assumption that the pre-trained DCNN
weights are relatively good. We don’t wish to distort them too quickly
or too much, so we keep both our learning rate and learning rate decay
really small.

**Data Augmentation**: One of the drawbacks of non-regularized neural
networks is that they are extremely flexible: they learn both features
and noise equally well, increasing the potential for overfitting. In our
model, we apply L2 regularization to avoid overfitting. But even after
that, we observed a large gap in model performance on the training and
validation DR images, indicating that the fine tuning process is
overfitting to the training set. To combat this overfitting, we leverage
data augmentation for the DR image dataset.

There are many ways to do data augmentation, such as the popular
horizontally flipping, random crops and color jittering. As the color
information in these images is very important, we only rotate the images
at different angles – at 0, 90, 180, and 270 degrees.

![Figure
5](http://a4.typepad.com/6a0105360ba1c6970c01bb092e8a94970d-800wi "Figure 5")

**Replacing the input layer of the pre-trained GoogLeNet network with DR
images. We fine-tune all layers except for the top 2 pre-trained layers
which contains more generic data-independent weights.**


**Fine-tuning GoogLeNet**: The GoogLeNet network we use here for DR
screening was initially trained on ImageNet. The ImageNet dataset
contains about 1 million natural images and 1000 labels/categories. In
contrast, our labeled DR dataset has only about 30,000 domain-specific
images and 4 labels/ categories. Thus, the DR dataset is insufficient to
train a network as complex as GoogLeNet and so we use weights from the
ImageNet-trained GoogLeNet network. We fine-tune all layers, except for
the top 2 pre-trained layers which contains more generic
data-independent weights. The original classification layer
"loss3/classifier" outputs predictions for 1000 classes. We replace it
with a new binary layer.


![Figure
6](http://a0.typepad.com/6a0105360ba1c6970c01bb092e8ab0970d-800wi "Figure 6")

**Fine-tuning GoogLeNet**

## Conclusion

Fine-tuning allows us to bring the power of state-of-the-art DCNN models
to new domains where insufficient data and time/cost constraints might
otherwise prevent their use. This approach achieves a significant
improvement of average accuracy and improves the state-of-the-art of
image-based medical classification.

In my Part 3 of this blog series (coming soon), I will explain
re-usability of these trained DCNN models.
