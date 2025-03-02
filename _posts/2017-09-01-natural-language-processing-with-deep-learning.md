---
layout: post
title: Natural Language Processing with Deep Learning
date: 2017-09-01
categories: [computer science]
tags: [machine learning]

---


## Article Source
* Title: [CS224n: Natural Language Processing with Deep Learning](http://web.stanford.edu/class/cs224n/syllabus.html)

---

Natural Language Processing with Deep Learning
======================================================

Schedule and Syllabus
---------------------


<div class="container sec">
<table class="table">
  <tbody><tr class="active">
    <th>Event</th><th>Date</th><th>Description</th><th>Course Materials</th>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Jan 10</td>
    <td>Introduction to NLP and Deep Learning</td>
    <td>
      Suggested Readings:
      <ol>
         <li>[<a href="http://cs229.stanford.edu/section/cs229-linalg.pdf">Linear Algebra Review</a>]</li>
         <li>[<a href="http://cs229.stanford.edu/section/cs229-prob.pdf">Probability Review</a>]</li>
         <li>[<a href="http://cs229.stanford.edu/section/cs229-cvxopt.pdf">Convex Optimization Review</a>]</li>
         <li>[<a href="http://cs231n.github.io/optimization-1/">More Optimization (SGD) Review</a>]</li>
      </ol>
      [<a href="http://cs231n.github.io/python-numpy-tutorial/">python tutorial</a>]<br>
      [<a href="lectures/cs224n-2017-lecture1.pdf">slides</a>]<br>
      [<a href="lecture_notes/cs224n-2017-notes1.pdf">Lecture Notes 1</a>]
    </td>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Jan 12</td>
    <td>Word Vector Representations: word2vec</td>
    <td>
      Suggested Readings:
      <ol>
        <li>[<a href="http://mccormickml.com/2016/04/19/word2vec-tutorial-the-skip-gram-model/">Word2Vec Tutorial - The Skip-Gram Model</a>]</li>
        <li>[<a href="http://papers.nips.cc/paper/5021-distributed-representations-of-words-and-phrases-and-their-compositionality.pdf">Distributed Representations of Words and Phrases and their Compositionality</a>]</li>
        <li>[<a href="http://arxiv.org/pdf/1301.3781.pdf">Efficient Estimation of Word Representations in Vector Space</a>]</li>
      </ol>
      [<a href="lectures/cs224n-2017-lecture2.pdf">slides</a>] <br>
      Spotlight: [<a href="lectures/cs224n-2017-lecture2-highlight.pdf">slides</a>]
                  [<a href="https://openreview.net/pdf?id=SyK00v5xx">paper</a>]
    </td>
  </tr>

  
   <tr class="warning">
    <td>A1 released</td>
    <td>Jan 12</td>
    <td><b>Assignment #1 released</b></td>
    <td>[<a href="assignment1/index.html">Assignment 1</a>][<a href="assignment1/assignment1_soln.pdf">Written solution</a>]</td>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Jan 17</td>
    <td>Advanced Word Vector Representations</td>
    <td>
      Suggested Readings:
      <ol>
            <li>[<a href="http://nlp.stanford.edu/pubs/glove.pdf">GloVe: Global Vectors for Word Representation</a>]</li>
            <li>[<a href="http://www.aclweb.org/anthology/Q15-1016">Improving Distributional Similarity with Lessons Learned fromWord Embeddings</a>]</li>
            <li>[<a href="http://www.aclweb.org/anthology/D15-1036">Evaluation methods for unsupervised word embeddings</a>]</li>
      </ol>
      [<a href="lectures/cs224n-2017-lecture3.pdf">slides</a>] <br>
      [<a href="lecture_notes/cs224n-2017-notes2.pdf">Lecture Notes 2</a>] <br>
      Spotlight: [<a href="lectures/cs224n-2017-lecture3-highlight.pdf">slides</a>]
                  [<a href="https://arxiv.org/pdf/1601.03764v2.pdf">paper</a>]
    </td>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Jan 19</td>
    <td>Word Window Classification and Neural Networks</td>
    <td>
      Suggested Readings:
      <ol>
        <li>cs231n notes on [<a href="http://cs231n.github.io/optimization-2/">backprop</a>] and [<a href="http://cs231n.github.io/neural-networks-1/">network architectures</a>]</li>
        <li>[<a href="lecture_notes/cs224n-2017-review-differential-calculus.pdf">Review of differential calculus</a>]</li>
        <li>[<a href="https://arxiv.org/pdf/1103.0398v1.pdf">Natural Language Processing (almost) from Scratch</a>]</li>
        <li>[<a href="http://www.iro.umontreal.ca/~vincentp/ift3395/lectures/backprop_old.pdf">Learning Representations by Backpropogating Errors</a>]</li>
      </ol>
      [<a href="lectures/cs224n-2017-lecture4.pdf">slides</a>] <br>
      [<a href="lecture_notes/cs224n-2017-notes3.pdf">Lecture Notes 3</a>] <br>
    </td>
  </tr>


  <tr>
    <td>Lecture</td>
    <td>Jan 24</td>
    <td>Backpropagation and Project Advice</td>
    <td>
      Suggested Readings:
      <ol>
        <li>[<a href="http://cs231n.github.io/optimization-2/">Vector, Matrix, and Tensor Derivatives</a>]</li>
        <li>Section 4 of [<a href="http://u.cs.biu.ac.il/~yogo/nnlp.pdf">A Primer on Neural Network Models for Natural Language Processing</a>]</li>
      </ol>
      [<a href="lectures/cs224n-2017-lecture5.pdf">slides</a>] <br>
      Spotlight: [<a href="lectures/cs224n-2017-lecture5-highlight.pdf">slides</a>]
                  [<a href="https://arxiv.org/pdf/1607.01759.pdf">paper</a>]
    </td>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Jan 26</td>
    <td>Dependency Parsing</td>
    <td>
      Suggested Readings:
      <ol>
        <li>Joakim Nivre. 2004. <a href="https://www.aclweb.org/anthology/W/W04/W04-0308.pdf">Incrementality in Deterministic Dependency Parsing</a>. Workshop on Incremental Parsing.</li>
        <li>Danqi Chen and Christopher D. Manning. 2014. <a href="http://cs.stanford.edu/people/danqi/papers/emnlp2014.pdf">A Fast and Accurate Dependency Parser using Neural Networks</a>. EMNLP 2014.
	</li><li>Sandra Kübler, Ryan McDonald, Joakim Nivre. 2009. <a href="http://www.morganclaypool.com/doi/abs/10.2200/S00169ED1V01Y200901HLT002">Dependency Parsing</a>. Morgan and Claypool. [Free access from Stanford campus, only!]
	</li><li>Daniel Andor, Chris Alberti, David Weiss, Aliaksei Severyn, Alessandro Presta, Kuzman Ganchev, Slav Petrov, and Michael Collins. 2016.
            <a href="https://arxiv.org/pdf/1603.06042.pdf">Globally Normalized Transition-Based Neural Networks</a>. ACL 2016.
        </li><li>Marie-Catherine de Marneffe, Timothy Dozat, Natalia Silveira, Katri Haverinen, Filip Ginter, Joakim Nivre, and Christopher D. Manning. 2014. <a href="http://nlp.stanford.edu/~manning/papers/USD_LREC14_UD_revision.pdf">Universal Stanford Dependencies: A cross-linguistic typology. Proceedings of the Ninth International Conference on Language Resources and Evaluation (LREC-2014). Revised version for UD v1.
        </a></li><li><a href="http://universaldependencies.org/">Universal Dependencies website</a>
      </li></ol>
      [<a href="lectures/cs224n-2017-lecture6.pdf">slides</a>] <br>
      [<a href="lecture_notes/cs224n-2017-notes4.pdf">Lecture Notes 4</a>] <br>
      Spotlight: [<a href="lectures/cs224n-2017-lecture6-highlight.pdf">slides</a>]
                  [<a href="https://levyomer.files.wordpress.com/2015/03/improving-distributional-similarity-tacl-2015.pdf">paper</a>]
    </td>
  </tr>

  
   <tr class="warning">
    <td>A1 Due</td>
    <td>Jan 26</td>
    <td><b>Assignment #1 due</b></td>
    <td></td>
  </tr>

  
   <tr class="warning">
    <td>A2 Released</td>
    <td>Jan 26</td>
    <td><b>Assignment #2 released</b></td>
    <td>[<a href="assignment2/index.html">Assignment 2</a>][<a href="assignment2/assignment2-soln.pdf">Written solution</a>]</td>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Jan 31</td>
    <td>Introduction to TensorFlow</td>
    <td>
      Suggested Readings:
      <ol>
        <li>[<a href="https://www.tensorflow.org/get_started/basic_usage">TensorFlow Basic Usage</a>]</li>
      </ol>
      [<a href="lectures/cs224n-2017-tensorflow.pdf">slides</a>] <br>
      [<a href="lecture_notes/cs224n-2017-tensorflow.pdf">Lecture Notes Tensorflow</a>] <br>
      Spotlight: [<a href="lectures/cs224n-2017-lecture7-highlight.pdf">slides</a>]
                 [<a href="https://arxiv.org/pdf/1611.08669v2.pdf">paper</a>]
    </td>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Feb 2</td>
    <td>Recurrent Neural Networks and Language Models</td>
    <td>
      [<a href="lectures/cs224n-2017-lecture8.pdf">slides</a>] <br>
      [<a href="lectures/vanishing_grad_example.html">vanishing grad example</a>]
      [<a href="lectures/vanishing_grad_example.ipynb">vanishing grad notebook</a>] <br>
      Spotlight: [<a href="lectures/cs224n-2017-lecture8-highlight.pdf">slides</a>]
                 [<a href="http://www.petrovi.de/data/acl15.pdf">paper</a>]
    </td>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Feb 7</td>
    <td>Machine translation and advanced recurrent LSTMs and GRUs</td>
    <td>
    [<a href="lectures/cs224n-2017-lecture9.pdf">slides</a>] <br>
    [<a href="lecture_notes/cs224n-2017-notes5.pdf">Lecture Notes 5</a>] <br>
    Spotlight: [<a href="lectures/cs224n-2017-lecture9-highlight.pdf">slides</a>]
               [<a href="http://www.fit.vutbr.cz/~imikolov/rnnlm/char.pdf">paper 1</a>]
               [<a href="https://openreview.net/pdf?id=H1VyHY9gg">paper 2</a>]
               [<a href="https://arxiv.org/abs/1602.02410">paper 3</a>] <br>
    </td>
  </tr>

  <tr>
    <td>Review</td>
    <td>Feb 9</td>
    <td>Midterm Review</td>
    <td> [<a href="lectures/cs224n-midterm-review.pdf">slides</a>]</td>
  </tr>

  
   <tr class="warning">
    <td>Project Proposal Due</td>
    <td>Feb 9</td>
    <td><b>Final project proposal due</b></td>
    <td>[<a href="project.html">Project page</a>]</td>
  </tr>

  
   <tr class="warning">
    <td>A2 Due</td>
    <td>Feb 9</td>
    <td><b>Assignment #2 due</b></td>
    <td></td>
  </tr>

  
   <tr class="warning">
    <td>A3 Released</td>
    <td>Feb 13</td>
    <td><b>Assignment #3 released</b></td>
    <td>[<a href="assignment3/index.html">Assignment 3</a>][<a href="assignment3/assignment3-soln.pdf">Written solution</a>]</td>
    <td></td>
  </tr>

  <tr class="danger">
    <td>Midterm</td>
    <td>Feb 14</td>
    <td><b>In-class midterm</b></td>
    <td>
      [<a href="lecture_notes/cs224n-2017-gradient-notes.pdf">Gradient Computation Notes</a>]<br>
      Practice midterms: [<a href="lectures/cs224n-practice-midterm-1.pdf">Midterm 1</a>] [<a href="lectures/cs224n-practice-midterm-2.pdf">Midterm 2</a>] [<a href="restricted/cs224n-practice-midterm-1-sol.pdf">Midterm 1 Solutions</a>]
                         [<a href="restricted/cs224n-practice-midterm-2-sol.pdf">Midterm 2 Solutions</a>]
    </td>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Feb 16</td>
    <td>Neural Machine Translation and Models with Attention</td>
    <td>
    Suggested Readings:
      <ol>
        <li>[<a href="https://arxiv.org/pdf/1409.3215.pdf">Sequence to Sequence Learning with Neural Networks</a>]</li>
        <li>[<a href="https://arxiv.org/pdf/1409.0473.pdf">Neural Machine Translation by Jointly Learning to Align and Translate</a>]</li>
        <li>[<a href="http://nlp.stanford.edu/pubs/emnlp15_attn.pdf">Effective Approaches to Attention-based Neural Machine Translation</a>]</li>
      </ol>
    [<a href="lectures/cs224n-2017-lecture10.pdf">slides</a>] <br>
    Spotlight: [<a href="lectures/cs224n-2017-lecture10-highlight.pdf">slides</a>]
               [<a href="https://arxiv.org/abs/1611.04558">paper</a>]
    </td>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Feb 21</td>
    <td>Gated recurrent units and further topics in NMT</td>
    <td>
      Suggested Readings:
      <ol>
        <li>[<a href="https://arxiv.org/pdf/1412.2007.pdf">On Using Very Large Target Vocabulary for Neural Machine Translation</a>]</li>
        <li>[<a href="https://arxiv.org/pdf/1603.08148.pdf">Pointing the Unknown Words</a>]</li>
        <li>[<a href="https://arxiv.org/pdf/1508.07909.pdf">Neural Machine Translation of Rare Words with Subword Units</a>]</li>
        <li>[<a href="https://arxiv.org/pdf/1604.00788.pdf">Achieving Open Vocabulary Neural Machine Translation with Hybrid Word-Character Models</a>]</li>
      </ol>
      [<a href="lectures/cs224n-2017-lecture11.pdf">slides</a>] <br>
      [<a href="lecture_notes/cs224n-2017-notes6.pdf">Lecture Notes 6</a>] <br>
      Spotlight: [<a href="lectures/cs224n-2017-lecture11-highlight.pdf">slides</a>]
                 [<a href="https://arxiv.org/pdf/1611.05358.pdf">paper</a>]
    </td>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Feb 23</td>
    <td>End-to-end models for Speech Processing</td>
    <td>
      [<a href="lectures/cs224n-2017-lecture12.pdf">slides</a>] <br>
    </td>
  </tr>

   <tr class="warning">
    <td>A3 Due</td>
    <td>Feb 25</td>
    <td><b>Assignment #3 due</b></td>
    <td></td>
  </tr>

  <tr class="warning">
    <td>A4 Released</td>
    <td>Feb 25</td>
    <td><b>Assignment #4 released</b></td>
    <td>Default final project [<a href="assignment4/index.html">Assignment 4</a>]</td>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Feb 28</td>
    <td>Convolutional Neural Networks</td>
    <td>
      Suggested Readings:
      <ol>
        <li>[<a href="http://www.aclweb.org/anthology/P14-1062">A Convolutional Neural Network for Modelling Sentences</a>]</li>
        <li>[<a href="http://www.aclweb.org/anthology/D14-1181">Convolutional Neural Networks for Sentence Classification</a>]</li>
      </ol>
      [<a href="lectures/cs224n-2017-lecture13-CNNs.pdf">slides</a>] <br>
      Spotlight: [<a href="lectures/cs224n-2017-lecture13-highlight.pdf">slides</a>]
                 [<a href="https://arxiv.org/pdf/1508.06615.pdf">paper</a>]
    </td>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Mar 2</td>
    <td>Tree Recursive Neural Networks and Constituency Parsing</td>
    <td>
      Suggested Readings:
      <ol>
        <li>[<a href="http://nlp.stanford.edu/pubs/SocherBauerManningNg_ACL2013.pdf">Parsing with Compositional Vector Grammars</a>]</li>
        <li>[<a href="http://nlp.stanford.edu/~socherr/EMNLP2013_RNTN.pdf">Recursive Deep Models for Semantic Compositionality Over a Sentiment Treebank</a>]</li>
        <li>[<a href="https://arxiv.org/pdf/1503.00075.pdf">Improved Semantic Representations From Tree-Structured Long Short-Term Memory Networks</a>]</li>
      </ol>
      [<a href="lectures/cs224n-2017-lecture14-TreeRNNs.pdf">slides</a>]<br>
      [<a href="lecture_notes/cs224n-2017-notes7.pdf">Lecture Notes 7</a>] <br>
      Spotlight: [<a href="lectures/cs224n-2017-lecture14-highlight.pdf">slides</a>]
                 [<a href="https://arxiv.org/pdf/1606.01541.pdf">paper</a>]
    </td>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Mar 7</td>
    <td>Coreference Resolution</td>
    <td>
      Suggested Readings:
      <ol>
        <li>[<a href="http://www.aclweb.org/anthology/D13-1203">Easy Victories and Uphill Battles in Coreference Resolution</a>]</li>
        <li>[<a href="http://cs.stanford.edu/people/kevclark/resources/clark-manning-emnlp2016-deep.pdf">Deep Reinforcement Learning for Mention-Ranking Coreference Models</a>]</li>
      </ol>
      [<a href="lectures/cs224n-2017-lecture15.pdf">slides</a>]<br>
    </td>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Mar 9</td>
    <td>Dynamic Neural Networks for Question Answering</td>
    <td>
      [<a href="lectures/cs224n-2017-lecture16-DMN-QA.pdf">slides</a>] <br>
      [<a href="lecture_notes/cs224n-2017-notes8.pdf">Lecture Notes 8</a>] <br>
      Spotlight: [<a href="lectures/cs224n-2017-lecture16-highlight.pdf">slides</a>]
                 [<a href="http://www.jmlr.org/proceedings/papers/v37/piech15.pdf">paper</a>]
    </td>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Mar 14</td>
    <td>Issues in NLP and Possible Architectures for NLP</td>
    <td>
      [<a href="lectures/cs224n-2017-lecture17.pdf">slides</a>] <br>
      Spotlight: [<a href="lectures/cs224n-2017-lecture17-highlight.pdf">slides</a>]
                 [<a href="http://www.aclweb.org/anthology/N16-1181">paper</a>]
    </td>
  </tr>

  <tr>
    <td>Lecture</td>
    <td>Mar 16</td>
    <td>Tackling the Limits of Deep Learning for NLP</td>
    <td>
      [<a href="lectures/cs224n-2017-lecture18.pdf">slides</a>] <br>
      Spotlight: [<a href="lectures/cs224n-2017-lecture18-highlight.pdf">slides</a>]
                 [<a href="https://arxiv.org/pdf/1410.5401.pdf">paper 1</a>]
                 [<a href="http://www.nature.com/nature/journal/v538/n7626/pdf/nature20101.pdf">paper 2</a>]
    </td>
  </tr>

  <tr class="warning">
    <td>Final Project Due</td>
    <td>Mar 17</td>
    <td><b>Final course project / Assignment #4 due</b></td>
    <td></td>
  </tr>

  <tr class="danger">
    <td>Poster Presentation</td>
    <td>Mar 21</td>
    <td><b>Final project poster presentations</b></td>
    <td>12:15-3:15, Lathrop Library Second Floor<br>
        [<a href="https://piazza.com/class/iw9g8b9yxp46s8?cid=2527">Piazza Post on Logistics</a>]
        [<a href="https://www.facebook.com/events/277533656001374/?notif_t=plan_admin_added&amp;notif_id=1489444386772633">Facebook Event</a>]
    </td>