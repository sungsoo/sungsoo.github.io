---
layout: post
title: Guidelines for Writing a Good NIPS Paper
date: 2017-04-01
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Guidelines for Writing a Good NIPS Paper](https://nips.cc/Conferences/2015/PaperInformation/EvaluationCriteria)
* Authors: The NIPS 2006 Program Committee

---

Guidelines for Writing a Good NIPS Paper
===

With input from Andrew Ng, Peter Dayan, Daphne Koller, Sebastian Thrun,
Bruno Olshausen, Yair Weiss, and Bernhard Schölkopf

Edited by Max Welling and Zoubin Ghahramani in 2013.

In this informal essay, we describe some of the criteria that will be
used to evaluate NIPS submissions. This document should not be construed
as an official NIPS policy statement; but through it, we also hope to
give advice for writing a good NIPS paper.

We'll take for granted that your paper will be clearly written, be
technically sound and correct, and reference previous work. Thus, we
will not further dwell on the issues of clarity and soundness, despite
their importance. We will instead focus on how one might shape a paper's
content so as to maximize its chance of being published and influencing
others.

A few notes:

-   We ask authors to submit one or more keywords for their papers. We
    use these keywords to assign area chairs and reviewers. Note that
    the keywords marked by the authors do not bind the PC in assigning
    reviewers to the paper. For example, if a paper proposes a new
    algorithm, but contains no empirical assessment, marking it as a
    learning theory paper will not necessarily lead to more
    likely acceptance.

-   NIPS is an interdisciplinary conference that covers both natural and
    synthetic neural information processing systems. It is often the
    case that strong NIPS papers appeal to both parts of the community:
    for example, by using modern analysis methods developed on the
    synthetic side to study natural systems, or by investigating
    algorithmic aspects of methods used by natural systems. While a
    broad appeal tends to strengthen a NIPS submission, there are also
    many strong NIPS papers that are more specialized, and thus only
    fall into one of the two categories described below.

Papers on Machine Learning
--------------------------

A significant fraction of NIPS papers either describe or study new
machine learning methods or theory. Examples of such papers may include:
a paper proposing a new learning algorithm; one that describes a
solution to a difficult application; or one that proves bounds on the
error of some learning method. Such papers are expected to make a
significant (i) *algorithmic*, (ii) *application*, or (iii) *theoretical*
contribution. NIPS seeks to publish papers that will have a high impact
in the world---|both within our research community, and beyond. Whenever
appropriate, papers will therefore be evaluated on the basis of the
following five criteria:

-   **1 Novelty of algorithm.** For example, a paper that gives an elegant
    new derivation for an algorithm; or one that proposes a new approach
    to an existing problem.

-   **2 Novelty of application/problem.** For example, a paper that
    addresses an important application that has heretofore been
    little-studied at NIPS. Or, one that introduces a novel machine
    learning problem (some past examples include ICA and
    structured prediction) and proposes an algorithm for it.

-   **3 Difficulty of application.** For example, an application of machine
    learning to a difficult, important, and "real" application, that
    takes into account the full complexity of getting a non-trivial
    system to work.

-   **4 Quality of results.** Whether the algorithm is rigorously
    demonstrated to give good empirical performance on the task
    considered (here, "real" data or "real" experiments may be more
    effective than "artificial" or "toy" experiments); or whether the
    theoretical results are strong and interesting; etc.

-   **5 Insight conveyed.** Whether the paper conveys *insight* into the
    nature of an algorithm; into the nature of a practical application
    or problem; into general lessons learned; and/or into theoretical or
    mathematical tools that might be used by others for future work.

Not all papers are expected to address all of these criteria, and a
paper that is extremely strong on only one of them may well be
acceptable for publication. For example, a learning theory paper that
studies an existing algorithm may be reasonably expected to address only
the last of these criteria. However, in some cases where the research
can be reasonably expected to address more than one of the criteria
above, a paper may have a better chance of acceptance if it does indeed
address them. For example, a paper that gives an elegant mathematical
derivation of a new algorithm (Criterion \#1) may fare better if it is
also demonstrated through rigorous empirical evaluation to do well
(Criterion \#4), or demonstrated on a real/non-trivial application
(Criterion \#3). This is because such experiments can help build a
significantly stronger case for the algorithm's actual utility.
Similarly, a paper describing an impressive application of machine
learning (Criterion \#2 or \#3) may fare better if beyond reporting
success, it further elucidates the structure of the problem or algorithm
that made the application work, and thereby conveys insight (Criterion
\#5).

For empirical studies, a good result can lie along many different axes,
all of which compare to the best state-of-the-art algorithm. These axes
may include: better accuracy, better ROC performance, faster, less
memory, more generally applicable, easier out-of-the-box usage, much
simpler to code. If an algorithm does not excel along any of these axes,
a reviewer may wonder why it is worth publishing at NIPS.

Although NIPS strongly encourages interdisciplinary work that spans
multiple topics, we now also describe some evaluation criteria that are
more specialized and may apply only to individual topics.

Algorithmic Papers
------------------

(e.g., clustering, dimensionality reduction, feature selection,
nonparametric Bayesian models, graphical models, kernels, boosting,
Monte Carlo methods, neural networks, semi-supervised learning, deep
learning). Authors of papers that propose new algorithms for
well-established, existing problems are encouraged to provide evidence
for the practical applicability of their methods, such as through
rigorous empirical evaluation of their methods on real data or on real
problems. For example, a paper about a new mathematical trick (or about
a beautiful new mathematical derivation) would be stronger if it is
supported by empirical evidence that the resulting algorithm really
helps on a problem. We also encourage submission of papers that describe
algorithmic or implementation principles that may have a large impact on
applications or on practitioners of machine learning.

Control and Reinforcement Learning
----------------------------------

Authors of papers that propose new algorithms for existing problems
(such as solving MDPs) are encouraged to provide rigorous empirical
evaluation of their methods on real problems, and show its relevance to
real/difficult decision making or control tasks. For example, rather
than demonstrating your idea only on a grid-world or on mountain-car,
also show if it works on a more challenging task. The other comments for
algorithmic papers also apply here. Learning Theory

Any Learning Theory paper should have a theorem about learning and a
proof. Leaving out the proof is not an option in a double blind setting!
Several styles of papers exist:

-   1 Propose a new natural model of learning and algorithm for this
    model (examples: Bayes learning, statistical learning, PAC learning,
    Online learning, MDP learning, Boosting).

-   2 Propose an algorithm with an improved analysis in some
    standard setting.

-   3 Prove that some learning task people have been attempting is hard
    or impossible.

-   4 "Other". Meta-theorems about learning theorems, etc. Technically
    difficulty or novelty is not the goal. Impact on the process and
    practice of learning is the goal. Experimental results are nice but
    not necessary in general.

Applications
------------

Application papers should describe your work on a "real" as opposed to
"hypothetical" application; specifically, it should describe work that
has direct relevance to, and addresses the full complexity of, solving a
non-trivial problem. Authors are also encouraged to convey insight about
the problem, algorithms, and/or application. For example, one might
describe the more general lessons learned, or elucidate (through an
ablative analysis/lesion analysis, which removes one component of an
algorithm at a time) which were the key components of the system needed
to get the application to work. A NIPS application paper should be
comparable in quality to paper in the corresponding application domain
conference: for example, a text paper should be acceptable to SIGIR,
EMNLP, or other appropriate conference Application papers should not
only present concrete application results, but also contain at least one
of the below elements:

-   Applications that couldn't previously be done, at all, or on this
    scale
-   Techniques shown to be uniquely fitted to specific popular
    applications, leading to improved performance or more accurate
    solutions
-   Insights that, from the perspective of machine learning, distinct
    applications X and Y, whose respective users have never talked to
    each other, are the same.
-   Careful analytic studies that may not demonstrate improved
    performance but that compare different approaches on large
    representative corpora. Such studies should provide insights e.g.
    regarding performance gains achievable by using more complex
    learning machines, and the relative importance of preprocessing and
    feature selection.

Machine Vision
--------------

Authors of vision papers are encouraged to provide rigorous empirical
evaluation of their methods to demonstrate value added not just for a
few selected images, but more broadly. Ideally, a NIPS paper proposes a
machine learning algorithm or system that can be used by a computer
vision researcher to help solve a difficult computer vision problem.
NIPS papers in this area should be comparable in quality to those
accepted in the major computer vision conferences, such as ICCV or CVPR.

Speech and Signal Processing
----------------------------

Similar to computer vision, a NIPS paper should solve a difficult audio,
speech, or other signal processing problem via machine learning; and be
useful for a signal processing practitioner. The quality bar for NIPS is
higher than those of a typical signal processing conference (such as
ICASSP or ICIP): the NIPS papers are 30% longer, the reviews are more
detailed, and the acceptance rate is about half. Therefore, a NIPS
signal processing paper should be more significant than the average
ICASSP paper.

Hardware Technology
-------------------

In addition to describing a successful implementation, a NIPS hardware
paper should also convey insight into the underlying principles behind
your implementation that serve as useful lessons learned to non-hardware
researchers, such as computer scientists or neurobiologists.

Papers on Neuroscience and Cognitive Science
--------------------------------------------

A significant fraction of NIPS papers, comprising mainly ones from the
neuroscience, biological vision, or cognitive science, either describe
or study natural systems. Examples include a paper proposing a new model
of human decision making, a paper describing evidence for a neural code,
and so on. Papers submitted in this category should make significant
contributions to the computational, psychological and/or neural
understanding of an important biological and/or behavioral system or
function. Such papers will be evaluated on the basis of some or all of
the following seven criteria:

-   1 Novelty of model. For example, a new account of a popular issue
    such as the representation of uncertainty in neural
    population codes.

-   2 Novelty of method. For example, a new analytical analysis of a
    phenomenon (say phase locking in oscillatory networks) that had
    previously only been studied using simulations.

-   3 Novelty of results. For example, a re-analysis of data on
    input-output functions of auditory cortical neurons, showing a new
    facet of their tuning to spectral contrast.

-   4 Novelty of system or function. For example, a model of a neural
    region (say a hypothalamic nucleus) that has not hitherto
    been analyzed.

-   5 Fit to data. For example, whether the suggestion evidently
    accounts for a wide range of data that have resisted
    previous approaches.

-   6 Explanatory power. For example, whether the suggestion links
    different (Marrian) levels of analysis, maybe showing the
    control-theoretic or Bayesian soundness of a well-known
    psychological learning rule.

-   7 Appropriateness of model. For example, if a proposed model or
    mechanism is supported by multiple data points or experiments.

A good neuroscience model should make testable predictions - and they
should be interesting, too. An interesting prediction is something you
may not have thought about otherwise: a prediction that is non-obvious,
or does not derive directly from the limitation assumptions made in the
model. A neuroscience model should give you a new way of looking at the
system, which inspires new experiments. NIPS neuroscience papers should
either be neuro-scientifically or computationally well-grounded, ideally
both. The paper should make a serious attempt at connecting to
state-of-the-art neurobiology, and/or provide a rigorous mathematical
treatment or comparison to a state-of-the-art engineering method.

Brain Imaging and Brain Computer Interfaces
-------------------------------------------

Papers on this topic tend to fall between the natural and artificial
systems categories. A good brain imaging paper may lead to
neurobiological insight, or it may propose an experimental method for
obtaining new kinds of measurements. A good brain computer interface
would either be useful as a computer interface, or also lead to
neurobiological insight.

These criteria were selected with the goals of encouraging good
research, and of maximizing NIPS' long-term impact. Note that this is
not as simple as accepting papers with high-expected impact. For
example, a paper that makes ambitious but poorly substantiated claims
may have high expected impact---|largely on the off-chance that the
claims turn out to be correct---|but is still likely to be rejected.
Some of these evaluation criteria exactly address this issue of
providing evidence for the utility of one's work.
