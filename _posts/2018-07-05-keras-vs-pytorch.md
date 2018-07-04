---
layout: post
title: Keras vs. PyTorch
date: 2018-07-05
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Keras vs. PyTorch](https://deepsense.ai/keras-or-pytorch/)

---


Keras or PyTorch as your first deep learning framework
=====

**So, you want to learn deep learning? Whether you want to start
applying it to your business, base your next side project on it, or
simply gain marketable skills – picking the right deep learning
framework to learn is the essential first step towards reaching your
goal.**

We strongly recommend that you pick either Keras or PyTorch. These are
powerful tools that are enjoyable to learn and experiment with. We know
them both from the teacher’s and the student’s perspective. Piotr has
delivered corporate workshops on both, while Rafał is currently learning
them.

*(See the discussion on [Hacker
News](https://news.ycombinator.com/item?id=17415321) and
[Reddit](https://www.reddit.com/r/MachineLearning/comments/8uhqol/d_keras_vs_pytorch_in_depth_comparison_of/)).*

Introduction
------------

Keras and PyTorch are open-source frameworks for deep learning gaining
much popularity among data scientists.

-   [Keras](https://keras.io/) is a high-level API capable of
    running on top of TensorFlow, CNTK, Theano, or MXNet (or as
    tf.contrib within TensorFlow). Since its initial release in March
    2015, it has gained favor for its ease of use and syntactic
    simplicity, facilitating fast development. It’s supported by Google.
-   [PyTorch](https://pytorch.org/), released in October 2016, is
    a lower-level API focused on direct work with array expressions. It
    has gained immense interest in the last year, becoming a preferred
    solution for academic research, and applications of deep learning
    requiring optimizing custom expressions. It’s supported by Facebook.

Before we discuss the nitty-gritty details of both frameworks ([well
described in this Reddit
thread](https://www.reddit.com/r/MachineLearning/comments/6bicfo/d_keras_vs_PyTorch/)),
we want to preemptively disappoint you – there’s no straight answer to
the ‘which one is better?’. The choice ultimately comes down to your
technical background, needs, and expectations. This article aims to give
you a better idea of where each of the two frameworks you should be pick
as the first.


Keras may be easier to get into and experiment with standard layers, in
a plug & play spirit.

PyTorch offers a lower-level approach and more flexibility for the more
mathematically-inclined users.

Ok, but why not any other framework?
------------------------------------

This article will not discuss the merits and drawbacks of picking pure
TensorFlow as your first deep learning framework, as we think it’s less
beginner-friendly compared to Keras (the official high-level library of
TF) and PyTorch. While you may find some Theano tutorials, it is no
longer in active development. Caffe lacks flexibility, while Torch uses
Lua (though its rewrite is awesome :)). MXNet, Chainer, and CNTK are
currently not widely popular.

Keras vs. PyTorch: Ease of use and flexibility
----------------------------------------------

Keras and PyTorch differ in terms of the level of abstraction they
operate on.

Keras is a higher-level framework wrapping commonly used deep learning
layers and operations into neat, lego-sized building blocks, abstracting
the deep learning complexities away from the precious eyes of a data
scientist.

PyTorch offers a comparatively lower-level environment for
experimentation, giving the user more freedom to write custom layers and
look under the hood of numerical optimization tasks. Development of more
complex architectures is more straightforward when you can use the full
power of Python and access the guts of all functions used. This,
naturally, comes at the price of verbosity.

Consider this head-to-head comparison of how a simple convolutional
network is defined in Keras and PyTorch:

### Keras

```python
model = Sequential()
model.add(Conv2D(32, (3, 3), activation='relu', input_shape=(32, 32, 3)))
model.add(MaxPool2D())
model.add(Conv2D(16, (3, 3), activation='relu'))
model.add(MaxPool2D())
model.add(Flatten())
model.add(Dense(10, activation='softmax'))
```



### PyTorch

```python
class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
    
        self.conv1 = nn.Conv2d(3, 32, 3)
        self.conv2 = nn.Conv2d(32, 16, 3)
        self.fc1 = nn.Linear(16 * 6 * 6, 10) 
        self.pool = nn.MaxPool2d(2, 2)
        
    def forward(self, x):
        x = self.pool(F.relu(self.conv1(x)))
        x = self.pool(F.relu(self.conv2(x)))
        x = x.view(-1, 16 * 6 * 6)
        x = F.log_softmax(self.fc1(x), dim=-1)
 
        return x
 
model = Net()
```

The code snippets above give a little taste of the differences between
the two frameworks. As for the model training itself – it requires
around 20 lines of code in PyTorch, compared to a single line in Keras.
Enabling GPU acceleration is handled implicitly in Keras, while PyTorch
requires us to specify when to transfer data between the CPU and GPU.

If you’re a beginner, the high-levelness of Keras may seem like a clear
advantage. Keras is indeed more readable and concise, allowing you to
build your first end-to-end deep learning models faster, while skipping
the implementational details. Glossing over these details, however,
limits the opportunities for exploration of the inner workings of each
computational block in your deep learning pipeline. Working with PyTorch
may offer you more food for thought regarding the core deep learning
concepts, like backpropagation, and the rest of the training process.

That said, Keras, being much simpler than PyTorch, is by no means a toy
– it’s a serious deep learning tool used by beginners, and seasoned data
scientists alike.
For instance, in the Dstl Satellite Imagery Feature Detection Kaggle
competition, the 3 best teams used Keras in their solutions, while our
[deepsense.ai
team](https://blog.deepsense.ai/deep-learning-for-satellite-imagery-via-image-segmentation/)
(4th place) used a combination of PyTorch and (to a lesser extend)
Keras.

Whether your applications of deep learning will require flexibility
beyond what pure Keras has to offer is worth considering. Depending on
your needs, Keras might just be that sweet spot following [the rule of
least power](https://en.wikipedia.org/wiki/Rule_of_least_power).

### SUMMARY

-   Keras – more concise, simpler API
-   PyTorch – more flexible, encouraging deeper understanding of deep
    learning concepts

Keras vs. PyTorch: Popularity and access to learning resources 
----

A framework’s popularity is not only a proxy of its usability. It is
also important for community support – tutorials, repositories with
working code, and discussions groups. As of June 2018, Keras and PyTorch
are both enjoying growing popularity, both on GitHub and arXiv papers
(note that most papers mentioning Keras mention also its TensorFlow
backend). According to a KDnuggets survey, Keras and PyTorch are [the
fastest growing data science
tools](https://www.kdnuggets.com/2018/05/poll-tools-analytics-data-science-machine-learning-results.html).
![Keras or PyTorch -
arvix_graph_cut](https://deepsense.ai/wp-content/uploads/2018/06/arvix_graph_cut.png)

> Unique mentions of deep learning frameworks in arxiv papers (full
> text) over time, based on 43K ML papers over last 6 years. So far TF
> mentioned in 14.3% of all papers, PyTorch 4.7%, Keras 4.0%, Caffe
> 3.8%, Theano 2.3%, Torch 1.5%, mxnet/chainer/cntk &lt;1%. (cc
> [@fchollet](https://twitter.com/fchollet?ref_src=twsrc%5Etfw))
> [pic.twitter.com/YOYAvc33iN](https://t.co/YOYAvc33iN)
>
> — Andrej Karpathy (@karpathy) [10 marca
> 2018](https://twitter.com/karpathy/status/972295865187512320?ref_src=twsrc%5Etfw)

While both frameworks have satisfactory documentation, PyTorch enjoys
stronger community support – their discussion board is a great place to
visit to if you get stuck (you will get stuck) and the documentation or
StackOverflow don’t provide you with the answers you need.

Anecdotally, we found well-annotated beginner level deep learning
courses on a given network architecture easier to come across for Keras
than for PyTorch, making the former somewhat more accessible for
beginners. The readability of code and the unparalleled ease of
experimentation Keras offers may make it the more widely covered by deep
learning enthusiasts, tutors and hardcore Kaggle winners.

For examples of great Keras resources and deep learning courses, see
[“Starting deep learning hands-on: image classification on
CIFAR-10“](https://blog.deepsense.ai/deep-learning-hands-on-image-classification/)
by Piotr Migdał and [“Deep Learning with
Python”](https://www.manning.com/books/deep-learning-with-python)
– a book written by François Chollet, the creator of Keras himself. For
PyTorch resources, we recommend the official tutorials, which offer a
slightly more challenging, comprehensive approach to learning the
inner-workings of neural networks. For a concise overview of PyTorch
API, see [this
article](http://www.goldsborough.me/ml/ai/python/2018/02/04/20-17-20-a_promenade_of_pytorch/).

### SUMMARY

-   Keras – Great access to tutorials and reusable code
-   PyTorch – Excellent community support and active development

Keras vs. PyTorch: Debugging and introspection 
----------------------------------------------

Keras, which wraps a lot of computational chunks in abstractions, makes
it harder to pin down the exact line that causes you trouble.
PyTorch, being the more verbose framework, allows us to follow the
execution of our script, line by line. It’s like debugging NumPy – we
have easy access to all objects in our code and are able to use print
statements (or any standard Pythonic debugging) to see where our recipe
failed.
A Keras user creating a standard network has an order of magnitude fewer
opportunities to go wrong than does a PyTorch user. But once something
goes wrong, it hurts a lot and often it’s difficult to locate the actual
line of code that breaks. PyTorch offers a more direct, unconvoluted
debugging experience regardless of model complexity. Moreover, when in
doubt, you can readily lookup PyTorch repo to see its readable code.

### SUMMARY

-   PyTorch – way better debugging capabilities
-   Keras – (potentially) less frequent need to debug simple networks

Keras vs. PyTorch: Exporting models and cross-platform portability 
---------------------------------------------------

What are the options for exporting and deploying your trained models in
production?

PyTorch saves models in Pickles, which are Python-based and not
portable, whereas Keras takes advantages of a safer approach with JSON +
H5 files (though saving with custom layers in Keras is generally more
difficult). There is also [Keras in
R](https://keras.rstudio.com), in case you need to collaborate
with a data analyst team using R.

Running on Tensorflow, Keras enjoys a wider selection of solid options
for deployment to mobile platforms through [TensorFlow for
Mobile](https://www.tensorflow.org/mobile/mobile_intro) and
[TensorFlow
Lite](https://www.tensorflow.org/mobile/tflite/index). Your cool
web apps can be deployed with
[TensorFlow.js](https://js.tensorflow.org/) or
[keras.js](https://github.com/transcranial/keras-js). As an
example, see this deep learning-powered [browser plugin detecting
trypophobia triggers](https://github.com/cytadela8/trypophobia),
developed by Piotr and his students.

Exporting PyTorch models is more taxing due to its Python code, and
currently the widely recommended approach is to start by translating
your PyTorch model to Caffe2 using
[ONNX](https://pytorch.org/docs/master/onnx.html).

### SUMMARY

-   Keras – more deployment options (directly and through the TensorFlow
    backend), easier model export.

Keras vs. PyTorch: Performance 
-------

Donald Knuth famously said:

> Premature optimization is the root of all evil (or at least most of
> it) in programming.

In most instances, differences in speed benchmarks should not be the
main criterion for choosing a framework, especially when it is being
learned. GPU time is much cheaper than a data scientist’s time.
Moreover, while learning, performance bottlenecks will be caused by
failed experiments, unoptimized networks, and data loading; not by the
raw framework speed. Yet, for completeness, we feel compelled to touch
on this subject. We recommend these two comparisons:

-   [TensorFlow, Keras and PyTorch
    comparison](https://wrosinski.github.io/deep-learning-frameworks/)
    by Wojtek Rosiński
-   [Comparing Deep Learning Frameworks: A Rosetta Stone
    Approach](https://github.com/ilkarman/DeepLearningFrameworks/)
    by Microsoft (make sure to check notebooks to get the taste of
    different frameworks). For a detailed explanation of the multi-GPU
    framework comparisons, see [this
    article](https://medium.com/@iliakarmanov/multi-gpu-rosetta-stone-d4fa96162986).

PyTorch is as fast as TensorFlow, and potentially faster for Recurrent
Neural Networks. Keras is consistently slower. As the author of the
first comparison points out, gains in computational efficiency of
higher-performing frameworks (ie. PyTorch & TensorFlow) will in most
cases be outweighed by the fast development environment, and the ease of
experimentation Keras offers.

![](https://deepsense.ai/wp-content/uploads/2018/06/plot11.png)

![](https://deepsense.ai/wp-content/uploads/2018/06/plot22.png)

### SUMMARY:

-   As far as training speed is concerned, PyTorch outperforms Keras

Keras vs. PyTorch: Conclusion 
-----

Keras and PyTorch are both excellent choices for your first deep
learning framework to learn.
If you’re a mathematician, researcher, or otherwise inclined to
understand what your model is really doing, consider choosing PyTorch.
It really shines, where more advanced customization (and debugging
thereof) is required (e.g. [object detection with
YOLOv3](https://blog.paperspace.com/how-to-implement-a-yolo-object-detector-in-pytorch/)
or [LSTMs with
attention](https://medium.com/huggingface/understanding-emotions-from-keras-to-pytorch-3ccb61d5a983))
or when we need to optimize array expressions other than neural networks
(e.g. [matrix
decompositions](http://blog.ethanrosenthal.com/2017/06/20/matrix-factorization-in-pytorch/)
or [word2vec
algorithms](https://adoni.github.io/2017/11/08/word2vec-pytorch/)).

Keras is without a doubt the easier option if you want a plug & play
framework: to quickly build, train, and evaluate a model, without
spending much time on mathematical implementation details.

Knowledge of the core concepts of deep learning is transferable. Once
you master the basics in one environment, you can apply them elsewhere
and hit the ground running as you transition to new deep learning
libraries.

We encourage you to try out simple deep learning recipes in both Keras
and PyTorch. What are your favourite and least favourite aspects of
each? Which framework experience appeals to you more? Let us know in the
comment section below!

Would you and your team like to learn more about deep learning in Keras,
TensorFlow and PyTorch? See our [tailored
training](https://deepsense.ai/tailored-team-training-tracks/)
offers.

