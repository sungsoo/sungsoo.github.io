---
layout: post
title: How Do You Generate Synthetic Data?
date: 2021-07-10
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [How do you generate synthetic data?](https://www.statice.ai/post/how-generate-synthetic-data)


---



# How do you generate synthetic data?

In this article, we talk about **how to generate synthetic data**. We
present the logic behind synthetic tabular data generation and the role
of deep learning in the process. We present two models to generate
tabular synthetic data and explain which approach we decided to follow
at Statice.


## Key takeaways

-   **Generating synthetic data comes down to learning the joint
    probability distribution in an original dataset to generate a new
    dataset with the same distribution. **
-   **The more complex the dataset, the more difficult it is to map
    dependencies correctly.**
-   **Deep learning models such as generative adversarial networks (GAN)
    and variational autoencoders (VAE) are well suited for synthetic
    data generation.**
-   **They each have pros and cons, and the choice of model depends on
    your data's type and nature.**
-   **The Statice software follows a hybrid approach. It breaks down
    data into groups and handles each one with the model best suited to
    its characteristics.**


There are different synthetic data types: structured and unstructured. 
In this post, we'll focus on our field of expertise, the generation of
**synthetic tabular data**. Although, the techniques we mentioned have
been studied and used for unstructured data generation as well.

‍

# How to generate synthetic data

## The logic behind synthetic data generation



The end goal with synthetic tabular data generation is to take an
original data source and create a **synthetic one with similar
statistical properties** out of it. 



Having similar statistical properties means that we need to **reproduce
the distribution** to the extent that we should ultimately be able to
infer the same conclusion from both versions of the data. We also need
to maintain the structure of the original data. 



To do so, we need to **learn an approximated distribution** or process
compatible with the original data (i.e., a generative model) that can
later be used to **sample structurally and statistically comparable
synthetic data**.

‍

![](https://assets.website-files.com/5d6060eb18edbee0be7240e8/6024f88a1b78b64542810470_simple_distribution.png)

‍



## A simple approach to learning the joint probabilities 



The simple approach would be to count the occurrence of each value in
each column independently. The results are **discrete distributions**
that become our model. We could sample from it to create new synthetic
data "employee" profiles. 



![](https://assets.website-files.com/5d6060eb18edbee0be7240e8/6024efe0ceaa4a6eeb484810_simple_model.png)




However, this approach would miss possible connections between the
columns. To include these patterns, one solution could be to count the
occurring combinations. As a result, instead of several marginal
distributions, you obtain a **joint distribution** that you can use to
create the synthetic table. 



![](https://assets.website-files.com/5d6060eb18edbee0be7240e8/6024f03562807ad29673cfea_joint_distribution.png)




Theoretically, it is a valid approach, but it would not scale if we
increase the dataset's complexity. The more columns you add, the more
combinations appear. At some point, you might just **lack data points**
to learn the distribution properly. It is why we need a more robust
model to tackle the complexity of the data.



You can use such a simple approach when your data is basic and doesn't
contain too **complicated dependencies**. With a simple table and very
few columns, and none or few dependencies, a very simplistic model can
be a fast and easy way to get synthetic data. 



As your data grows in complexity, you need to upgrade the type of model
used. **Neural Networks (NNs) are well-fitted** to simplify
transformation problems because they are good at finding patterns in
data. Their transformation functions generate an easier distribution to
learn from without sacrificing information.



## Beyond the simple approach: Neural Networks



Neural Networks are constructs of interconnected neurons, forming layers
that can display complicated behaviors. These networks are trainable
functions that, when shown examples, can **learn to generate pattern**. 



Through prediction and correction, the Neural Network learns to
**reproduce the data and generalize beyond it to produce a
representation** that could have originated the data, making them
particularly well-suited for synthetic data generation.



Remember that our revised problem is to find a transformation function
that translates between the space where the original data lives and some
*latent* space in which the data takes an easy to learn shape. We can
train a neural network to become such a transformation function. That
is, train it to translate data between its original and the desired
latent representation. For this aim, **two very prominent neural network
architectures** are generative adversarial networks (GAN) and
variational autoencoders (VAE).



## Using deep learning models to **generate synthetic data**



In the last few years, advancements in machine learning have put in our
hands a variety of deep generative models that can learn a wide range of
data types. **VAEs and GANs** are two commonly-used architectures in the
field of synthetic data generation. They follow different approaches in
the training of models, and both have pros and cons depending on your
data types.



## Generating synthetic data with VAEs 



This first type of NNs comes from the field of unsupervised training and
the **autoencoder family**. As generative models, they are designed to
learn the underlying distribution of original data and are very
efficient at generating complex models. 



VAEs function in two steps. At first, an encoder network transforms an
original complex distribution into a latent distribution. A decoder
network then transforms the distribution back to the original space.
This **double transformation, encoded-decoded,** appears cumbersome at
first glance but is necessary to formulate a quantifiable reconstruction
error. Minimizing this error is the objective of the VAE training and
what turns it into the desired transformation function, while an
additional regularization objective controls the shape of the latent
distribution.

![*Process of generating synthetic data with
VAEs*](https://assets.website-files.com/5d6060eb18edbee0be7240e8/6024f041134a0e79314459eb_VAE_HIW.png)



VAEs are a straightforward approach to solve the transformation problem.
They are relatively **easy to implement and to train**. Their weak
point, however, lies in their training objective. As your original data
becomes more heterogeneous (e.g., mix of categorical, binary,
continuous), it also becomes more **difficult to formulate a
reconstruction error that works well on all data components**. If, for
example, the reconstruction error puts too much emphasis on getting the
continuous parts of the data right, the quality of the categorical parts
might suffer.


When it becomes too difficult to formulate a good reconstruction error,
it might be preferable to use a different approach, such as GANs.



## Generating synthetic data with GANs



GANs come from the field of **unsupervised training** and the generative
family. In terms of architecture, they simultaneously **train two neural
networks in an adversarial fashion**: a generator and a discriminator,
both trying to outperform each other.



The generator digests random input from some latent distribution and
transforms these data points into some other shape without ever
*directly* looking at the original data. The discriminator digests input
from the original data and the generator's output, aiming to predict
where the input comes from. Both networks are connected in training so
that the generator has access to the discriminator's decision making.


When both networks are trained together, the discriminator needs to
learn from patterns in the data whether they look realistic enough,
while the generator learns to outsmart the discriminator by producing
more realistic samples from its random input.



![](https://assets.website-files.com/5d6060eb18edbee0be7240e8/6024f04bceaa4a4705484b3a_GAN_HIW.png)




The advantage of GANs is that you don't need to provide a reconstruction
error. The discriminator learns the characteristics of the "real" data.
This approach is particularly **interesting for synthetic image
generation**, as it's not clear how to translate into a function the
characteristics of realisticness. In general, GANs are good with
unstructured data.



However, GANs are also **more challenging to train** than VAEs and
require more expertise. It is, for starters, not easy to see *when to
stop training*. GANs are also prone to the **mode collapse phenomenon**,
where the generator starts to produce only a small subset of the
original data (think of a single image) instead of the full
distribution.



At Statice, we tried a variety of different architectures, as well as
methods outside of deep learning. We've realized that it is **difficult
to find a silver bullet solution** that would work for many different
cases.



## Divide and conquer: the hybrid approach to synthetic data generation



Because we serve different use-cases, with multiple data types and needs
every time, we found out the **most effective approach was a hybrid
one**. 



We take a synthesis problem and partition it. We split up the data into
groups and tackle each group with the most effective model. We then
iterate over all the parts while explicitly keeping the conditional
dependence on the other parts, which eventually allows us to reassemble
the groups on the synthetic data side.



![](https://assets.website-files.com/5d6060eb18edbee0be7240e8/6024f05590d2a1027797be9a_Statice_approach_generation.png)





This approach offers **robust performances with structured data**. As a
result, our software maintain to a high similarity degree statistics
properties such as:


-   Marginal distributions
-   Conditional distributions
-   Aggregated statistics
-   Dates and times distributions
-   Pairwise dependencies, e.g., correlations and mutual information



![](https://assets.website-files.com/5d6060eb18edbee0be7240e8/6024f05fea0f01678f4d6689_preserving_statistical_properties.PNG)



In addition to producing synthetic data with a good utility, the
partitioning into subproblems allows addressing them in parallel. This
helps to scale up to large datasets and make **better use of
computational infrastructure**.




## Conclusion: context is key



To generate synthetic data, you **learn the joint probability
distribution** from an original dataset **by means of a generative
model** from which you sample new data. While you can theoretically do
it by counting the unique rows in a table, the task gets more
problematic with wider datasets and cases where you need to capture more
complex dependencies.



Deep learning models such as **generative adversarial networks (GAN) and
variational autoencoders (VAE)** proved to be efficient at such tasks.
Depending on the type of data, the skills of the user, or the desired
outcome, you might want to pick one or the other.



In the end, when generating synthetic data, the most important lesson
we've learned is that **context is key**. It's why at Statice, we opted
for a hybrid approach that handles each type of data with the model best
suited for its characteristics.  

‍


# How do you generate synthetic data?

In this article, we talk about **how to generate synthetic data**. We
present the logic behind synthetic tabular data generation and the role
of deep learning in the process. We present two models to generate
tabular synthetic data and explain which approach we decided to follow
at Statice.


## Key takeaways

-   **Generating synthetic data comes down to learning the joint
    probability distribution in an original dataset to generate a new
    dataset with the same distribution. **
-   **The more complex the dataset, the more difficult it is to map
    dependencies correctly.**
-   **Deep learning models such as generative adversarial networks (GAN)
    and variational autoencoders (VAE) are well suited for synthetic
    data generation.**
-   **They each have pros and cons, and the choice of model depends on
    your data's type and nature.**
-   **The Statice software follows a hybrid approach. It breaks down
    data into groups and handles each one with the model best suited to
    its characteristics.**


As previously explained in [Types of synthetic data and real-life
examples](/post/types-synthetic-data-examples-real-life-examples), there
are different synthetic data types: structured and unstructured. In this
post, we'll focus on our field of expertise, the generation of
**synthetic tabular data**. Although, the techniques we mentioned have
been studied and used for unstructured data generation as well.

‍

# How to generate synthetic data

## The logic behind synthetic data generation



The end goal with synthetic tabular data generation is to take an
original data source and create a **synthetic one with similar
statistical properties** out of it. 



Having similar statistical properties means that we need to **reproduce
the distribution** to the extent that we should ultimately be able to
infer the same conclusion from both versions of the data. We also need
to maintain the structure of the original data. 



To do so, we need to **learn an approximated distribution** or process
compatible with the original data (i.e., a generative model) that can
later be used to **sample structurally and statistically comparable
synthetic data**.

‍

![](https://assets.website-files.com/5d6060eb18edbee0be7240e8/6024f88a1b78b64542810470_simple_distribution.png)

‍



## A simple approach to learning the joint probabilities 



The simple approach would be to count the occurrence of each value in
each column independently. The results are **discrete distributions**
that become our model. We could sample from it to create new synthetic
data "employee" profiles. 



![](https://assets.website-files.com/5d6060eb18edbee0be7240e8/6024efe0ceaa4a6eeb484810_simple_model.png)




However, this approach would miss possible connections between the
columns. To include these patterns, one solution could be to count the
occurring combinations. As a result, instead of several marginal
distributions, you obtain a **joint distribution** that you can use to
create the synthetic table. 



![](https://assets.website-files.com/5d6060eb18edbee0be7240e8/6024f03562807ad29673cfea_joint_distribution.png)




Theoretically, it is a valid approach, but it would not scale if we
increase the dataset's complexity. The more columns you add, the more
combinations appear. At some point, you might just **lack data points**
to learn the distribution properly. It is why we need a more robust
model to tackle the complexity of the data.



You can use such a simple approach when your data is basic and doesn't
contain too **complicated dependencies**. With a simple table and very
few columns, and none or few dependencies, a very simplistic model can
be a fast and easy way to get synthetic data. 



As your data grows in complexity, you need to upgrade the type of model
used. **Neural Networks (NNs) are well-fitted** to simplify
transformation problems because they are good at finding patterns in
data. Their transformation functions generate an easier distribution to
learn from without sacrificing information.



## Beyond the simple approach: Neural Networks



Neural Networks are constructs of interconnected neurons, forming layers
that can display complicated behaviors. These networks are trainable
functions that, when shown examples, can **learn to generate pattern**. 



Through prediction and correction, the Neural Network learns to
**reproduce the data and generalize beyond it to produce a
representation** that could have originated the data, making them
particularly well-suited for synthetic data generation.



Remember that our revised problem is to find a transformation function
that translates between the space where the original data lives and some
*latent* space in which the data takes an easy to learn shape. We can
train a neural network to become such a transformation function. That
is, train it to translate data between its original and the desired
latent representation. For this aim, **two very prominent neural network
architectures** are generative adversarial networks (GAN) and
variational autoencoders (VAE).



## Using deep learning models to **generate synthetic data**



In the last few years, advancements in machine learning have put in our
hands a variety of deep generative models that can learn a wide range of
data types. **VAEs and GANs** are two commonly-used architectures in the
field of synthetic data generation. They follow different approaches in
the training of models, and both have pros and cons depending on your
data types.



## Generating synthetic data with VAEs 



This first type of NNs comes from the field of unsupervised training and
the **autoencoder family**. As generative models, they are designed to
learn the underlying distribution of original data and are very
efficient at generating complex models. 



VAEs function in two steps. At first, an encoder network transforms an
original complex distribution into a latent distribution. A decoder
network then transforms the distribution back to the original space.
This **double transformation, encoded-decoded,** appears cumbersome at
first glance but is necessary to formulate a quantifiable reconstruction
error. Minimizing this error is the objective of the VAE training and
what turns it into the desired transformation function, while an
additional regularization objective controls the shape of the latent
distribution.

![*Process of generating synthetic data with
VAEs*](https://assets.website-files.com/5d6060eb18edbee0be7240e8/6024f041134a0e79314459eb_VAE_HIW.png)



VAEs are a straightforward approach to solve the transformation problem.
They are relatively **easy to implement and to train**. Their weak
point, however, lies in their training objective. As your original data
becomes more heterogeneous (e.g., mix of categorical, binary,
continuous), it also becomes more **difficult to formulate a
reconstruction error that works well on all data components**. If, for
example, the reconstruction error puts too much emphasis on getting the
continuous parts of the data right, the quality of the categorical parts
might suffer.


When it becomes too difficult to formulate a good reconstruction error,
it might be preferable to use a different approach, such as GANs.



## Generating synthetic data with GANs



GANs come from the field of **unsupervised training** and the generative
family. In terms of architecture, they simultaneously **train two neural
networks in an adversarial fashion**: a generator and a discriminator,
both trying to outperform each other.



The generator digests random input from some latent distribution and
transforms these data points into some other shape without ever
*directly* looking at the original data. The discriminator digests input
from the original data and the generator's output, aiming to predict
where the input comes from. Both networks are connected in training so
that the generator has access to the discriminator's decision making.


When both networks are trained together, the discriminator needs to
learn from patterns in the data whether they look realistic enough,
while the generator learns to outsmart the discriminator by producing
more realistic samples from its random input.



![](https://assets.website-files.com/5d6060eb18edbee0be7240e8/6024f04bceaa4a4705484b3a_GAN_HIW.png)




The advantage of GANs is that you don't need to provide a reconstruction
error. The discriminator learns the characteristics of the "real" data.
This approach is particularly **interesting for synthetic image
generation**, as it's not clear how to translate into a function the
characteristics of realisticness. In general, GANs are good with
unstructured data.



However, GANs are also **more challenging to train** than VAEs and
require more expertise. It is, for starters, not easy to see *when to
stop training*. GANs are also prone to the **mode collapse phenomenon**,
where the generator starts to produce only a small subset of the
original data (think of a single image) instead of the full
distribution.



At Statice, we tried a variety of different architectures, as well as
methods outside of deep learning. We've realized that it is **difficult
to find a silver bullet solution** that would work for many different
cases.



## Divide and conquer: the hybrid approach to synthetic data generation



Because we serve different use-cases, with multiple data types and needs
every time, we found out the **most effective approach was a hybrid
one**. 



We take a synthesis problem and partition it. We split up the data into
groups and tackle each group with the most effective model. We then
iterate over all the parts while explicitly keeping the conditional
dependence on the other parts, which eventually allows us to reassemble
the groups on the synthetic data side.



![](https://assets.website-files.com/5d6060eb18edbee0be7240e8/6024f05590d2a1027797be9a_Statice_approach_generation.png)





This approach offers **robust performances with structured data**. As a
result, our software maintain to a high similarity degree statistics
properties such as:


-   Marginal distributions
-   Conditional distributions
-   Aggregated statistics
-   Dates and times distributions
-   Pairwise dependencies, e.g., correlations and mutual information



![](https://assets.website-files.com/5d6060eb18edbee0be7240e8/6024f05fea0f01678f4d6689_preserving_statistical_properties.PNG)



In addition to producing synthetic data with a good utility, the
partitioning into subproblems allows addressing them in parallel. This
helps to scale up to large datasets and make **better use of
computational infrastructure**.




## Conclusion: context is key



To generate synthetic data, you **learn the joint probability
distribution** from an original dataset **by means of a generative
model** from which you sample new data. While you can theoretically do
it by counting the unique rows in a table, the task gets more
problematic with wider datasets and cases where you need to capture more
complex dependencies.



Deep learning models such as **generative adversarial networks (GAN) and
variational autoencoders (VAE)** proved to be efficient at such tasks.
Depending on the type of data, the skills of the user, or the desired
outcome, you might want to pick one or the other.



In the end, when generating synthetic data, the most important lesson
we've learned is that **context is key**. It's why at Statice, we opted
for a hybrid approach that handles each type of data with the model best
suited for its characteristics.  



