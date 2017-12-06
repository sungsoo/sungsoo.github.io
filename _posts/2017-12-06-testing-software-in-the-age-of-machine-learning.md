---
layout: post
title: Testing Software in the Age of Machine Learning
date: 2017-12-06
categories: [computer science]
tags: [machine learning]

---


## Article Source
* Title: [Moving targets: Testing software in the age of machine learning](https://techbeacon.com/moving-targets-testing-software-age-machine-learning)

---

## Testing Software in the Age of Machine Learning

Testing systems that don't always return the same answers require new
approaches. This is especially true when testing systems whose responses
adapt to what they have learned from previous transactions.

[Software testing](http://techbeacon.com/5-key-software-testing-steps-every-engineer-should-perform), in
theory, is a fairly straightforward activity. For every input, there
should be a defined and known output. We enter values, make selections,
or navigate an application and compare the actual result with the
expected one. If they match, we nod and move on. If they don't, we
possibly have a bug.

The point is, we already know what the output is supposed to be.
Granted, sometimes an output is not well defined, there is some
ambiguity, and you get disagreements on whether or not a particular
result represents a bug.

But there is a type of software where having a defined output is no
longer the case. Actually, two types. One is *machine learning systems*;
the second is [*predictive
analytics*](http://techbeacon.com/predictive-analytics-disrupt-software-development).


Difference between machine learning and predictive analytics
------------------------------------------------------------

There is a difference between the two. Most [machine learning
systems](http://techbeacon.com/finding-supernovas-how-machine-learning-can-lift-security-operations-game)
are based on neural networks. A neural network is a set of layered
algorithms whose variables can be adjusted via a learning process. The
learning process involves using known data inputs to create outputs that
are then compared with known results. When the algorithms reflect the
known results with the desired degree of accuracy, the algebraic
coefficients are frozen and production code is generated.

Today, this comprises much of what we understand as artificial
intelligence.

By contrast, predictive analytics makes adjustments to the algorithms in
production, based on results fed back into the software. In other words,
the application better understands how to apply its rules based on how
those rules have worked in the past.

Both of these types of systems have things in common. For one thing,
neither produces an "*exact*" result. In fact, sometimes they can produce
an obviously incorrect result. But they are extremely useful in a number
of situations when data already exists on the relationship
between *recorded* inputs and *intended* results.

Let me give you an example, based on my own experiences.

Developing a few guidelines
---------------------------

Years ago, I devised a neural network that worked as a part of an
electronic wind sensor. This worked though the wind cooling the
electronic sensor based on its decrease in temperature at specific
speeds and directions. My neural network had three layers of algebraic
equations, each with four to five separate equations in individual
nodes, computing in parallel. They would use starting coefficients, then
adjust those coefficients based on a comparison.

> A neural network is a set of layered algorithms whose variables can be
> adjusted via a learning process. 

I then trained it. I had over 500 data points regarding known wind speed
and direction and the extent to which the sensor cooled. The network I
created passed each input into its equations, through the multiple
layers, and produced an answer. At first, the answer from the network
wasn't that close to the known correct answer. But after multiple
iterations with the training data, the coefficients homed in on accurate
and consistent results.

How do you test this? The product is actually tested during the training
process, which takes time. Training either brings convergence to
accurate results or it diverges. The question is, How do you evaluate
the quality of the network?

> Predictive analytics systems continue to adapt after deployment, using
> a feedback loop to adjust variables and coefficients within the
> algorithm.

Here are the guidelines I used.

1.  Have *objective acceptance criteria*. Know the amount of error you and
    your users are willing to accept.
2.  Test with new data. Once you've trained the network and frozen the
    architecture and coefficients, use fresh inputs and outputs to
    verify its accuracy.
3.  Don't count on all results being accurate. That's just the nature of
    the beast. And you may have to recommend throwing out the entire
    network architecture and starting over.
4.  Understand the architecture of the network as a part of the testing
    process. Few if any will be able to actually follow a set of inputs
    through the network of algorithms, but understanding how the network
    is constructed will help testers determine if another architecture
    might produce better results.
5.  Communicate the level of confidence you have in the results to
    management and users. Machine learning systems offer you a unique
    opportunity to describe confidence in statistical terms, so use
    them.

One important thing to note is that the training data itself could well
contain inaccuracies. In this case, because of measurement error, the
recorded wind speed and direction could be off or ambiguous. In other
cases, the cooling of the filament likely has some error in its
measurement.

What about predictive analytics?
--------------------------------

Another type of network might be used for predictive analytics. These
systems continue to adapt after deployment, using a feedback loop to
adjust variables and coefficients within the algorithm.

One example is a system under development in the UK to implement
demand-based pricing for train service. Its goal is to encourage riders
to use the train during nonpeak times, so it dynamically adjusts pricing
to make it financially attractive for riders to consider riding when the
trains aren't as crowded.

This type of application experiments with different pricing strategies
and tries to optimize two different things: a balance of the ridership
throughout the day, and acceptable revenue from the ridership. A true
mathematical optimization isn't possible, but the goal is to reach a
state of spread-out ridership and revenue that at least covers costs.

How would you test this type of application? Once again, you need
objective acceptance criteria before even starting the development
effort. In this case, those acceptance criteria should involve some
acceptable level of both ridership averages and revenue.

What testers need to know
-------------------------

Here are some other important considerations.

1.  You need test scenarios. By that I mean ridership, when people are
    willing to ride, and what they are willing to pay. Because people
    don't know until they are actually placed in the position of
    deciding, you are going to have to build data models. Three may be
    sufficient, to represent expected best case, average case, and worst
    case.
2.  You will not reach mathematical optimization of either ridership or
    revenue. We are, after all, working with algorithms that produce
    approximations, not exact results. Determine what level of outcomes
    is acceptable for each scenario.
3.  Defects will be reflected in the inability of the model to achieve
    the goals of ridership and revenue.

Note that in both the machine learning and analytics application
examples, the acceptance criteria aren't expressed in terms of defect
number, type, or severity. In fact, in most cases they are expressed in
terms of the statistical likelihood of coming within a certain range. 

Best practices for testing nondeterministic applications
--------------------------------------------------------

That evaluation of quality and risk isn't a staple with most development
and testing projects, and it is one that testers may be ill equipped to
consider. How can testers provide better feedback on their efforts on
such applications? First, evaluate the application according to the
acceptance criteria. Second, be prepared to support those assertions in
statistical terms; for example, be 95 percent confident that the
application will produce an answer within a given range. Last, have a
high-level understanding of the underpinnings of the application, so
that any deficiencies might be able to be ascribed to a particular
application component.

Both testing practices and results have to change to accommodate
applications that don't behave the same as traditional software. If you
find yourself working on machine learning and predictive applications,
these suggestions represent a good start in that direction.
