---
layout: post
title: Lifelong and Continual Learning
date: 2020-04-02
categories: [computer science]
tags: [machine learning]

---

### Article Source
* [Lifelong and Continual Learning](https://www.cs.uic.edu/~liub/lifelong-learning.html)

----


# Lifelong and Continual Learning

*Learn as "Humans" do for Artificial General Intelligence (AGI)*

**[Second Edition: "[Lifelong Machine
Learning](https://www.cs.uic.edu/~liub/lifelong-machine-learning.html)."
by Z. Chen and B. Liu, Morgan & Claypool, August 2018 (1st edition,
2016). ]**

Added three new chapters: (4) [Continual Learning and Catastrophic
Forgetting](http://www.cs.uic.edu/~liub/lifelong-learning/continual-learning.pdf),
(5) [Open-world
Learning](http://www.cs.uic.edu/~liub/lifelong-learning/open-world-learning.pdf),
(8) [Continuous Knowledge Learning in
Chatbots](http://www.cs.uic.edu/~liub/lifelong-learning/lifelong-learning-in-dialogues.pdf)

Introduced the concept of *learning on the job* or *learning while
working*.

Updated and/or reorganized the other chapters.

Download the first edition, [Lifelong Machine
Learning](https://www.cs.uic.edu/~liub/2016-Lifelong-Machine-Learning-final.pdf),
Nov 2016.


**[[Lifelong Machine Learning
Tutorial](http://www.cs.uic.edu/~liub/Lifelong-Machine-Learning-Tutorial-KDD-2016.pdf).
Title: lifelong machine learning and computer reading the Web, KDD-2016,
August 13-17, 2016, San Francisco, USA. ]**

**[[Lifelong Machine Learning
Tutorial](http://www.cs.uic.edu/~liub/IJCAI15-tutorial.html),
IJCAI-2015, July 25-31, 2015, Buenos Aires,
Argentina.]**

**[A Podcast: "[Machines that Learn Like
Humans](http://worldofpiggy.com/podcast/2017/03/28/lifelong-machine-learning/)"
by my former student Zhiyuan Chen and Francesco Gadaleta
(host).]**



  **[[A Resource Site](http://lifelongml.org/) maintained by Eric Eaton's group]**   **[DARPA program: [Lifelong Learning Machines (L2M)](http://www.darpa.mil/news-events/2017-03-16), 3/16/2017]**
  
The classic machine learning paradigm learns in isolation. Given a
dataset, a learning algorithm is applied to a dataset to produce a model
without considering any previously learned knowledge. This paradigm
needs a large number of training examples and is only suitable for
well-defined and narrow tasks in closed environments. Looking ahead, to
deal with these limitations and to learn more like humans, I believe
that it is necessary to do ***lifelong machine learning*** or simply
***lifelong learning*** (also called ***continual learning*** or even
***continuous learning***), which tries to mimic "human learning" to
build a *lifelong learning machine*. The key characteristic of "human
learning" is the *continual learning and adaptation to new environments*
- we accumulate the knowledge gained in the past and use the knowledge
to help future learning and problem solving with possible adaptations.
Ideally, it should also be able to discover new tasks and learn on the
job in open environments in a self-supervised manner. Without the
lifelong learning capability, AI systems will probably never be truly
intelligent. learning machine or agent to *continually learn and
accumulate knowledge*, and to become more and more knowledgeable and
better and better at learning.

**Human learning is very different**: I believe that no human being has
ever been given 1000 positive and 1000 negative documents (or images)
and asked to learn a text classifier. As we have accumulated so much
knowledge in the past and understand it, we can usually learn with
little effort and few examples. If we don't have the accumulated
knowledge, even if we are given 2000 training examples, it is very hard
to learn manually. For example, I don't understand Arabic. If you give
me 2000 Arabic documents and ask me to build a classifier, I cannot do
it. But that is exactly what current machine learning is doing. That is
not how humans learn.

### Our Work

Some of my work uses [sentiment
analysis](https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html) (SA)
tasks and data because it is the problems that I encountered in a SA
startup that motivated me to work on lifelong learning or continual
learning. SA is very hard to scale-up without lifelong learning.

-   **Continual Learning
    ([ICLR-2019](https://openreview.net/forum?id=ryGvcoA5YX))**.
    Overcoming catastrophic forgetting for continual learning via model
    adaptation.
-   **Lifelong Unsupervised Learning**:
    -   ***Lifelong topic modeling***
        ([ICML-2014](http://www.cs.uic.edu/~zchen/papers/ICML2014-Zhiyuan(Brett)Chen.pdf),
        [KDD-2014](http://www.cs.uic.edu/~zchen/papers/KDD2014-Zhiyuan(Brett)Chen.pdf),
        [WWW-2016](http://www2016.net/proceedings/proceedings/p167.pdf)):
        retain the topics learned from previous domains and uses the
        knowledge for future modeling in other domains.
    -   ***Lifelong belief propagation***
        ([EMNLP-2016](http://www.cs.uic.edu/~liub/publications/emnlp2016.pdf)):
        use the knowledge learned previously to expand the graph and to
        obtain more accurate prior probabilty distributions.
    -   ***Lifelong information extraction***
        ([AAAI-2016](http://www.aaai.org/ocs/index.php/AAAI/AAAI16/paper/download/11973/12051)):
        make use of previously learned knowledge for better extraction.
-   **Lifelong Supervised Learning**
    ([ACL-2015](http://www.cs.uic.edu/~zchen/papers/ACL2015-Short-Zhiyuan(Brett)Chen.pdf),
    [ACL-2017](http://www.cs.uic.edu/~liub/publications/acl17_LifelongCRF.pdf)):
    -   **Using a generative model**
        ([ACL-2015](http://www.cs.uic.edu/~zchen/%0Apapers/ACL2015-Short-Zhiyuan(Brett)Chen.pdf)):
        The ACL-2015 work is about lifelong learning using a generative
        model. It is used for sentiment classification.
-   **Learning on the Job**
    ([ACL-2017](https://www.cs.uic.edu/~liub/publications/acl17_LifelongCRF.pdf)
    and [SIGDIAL-2019](https://arxiv.org/abs/1907.13295)): This work is
    about learning after a model has been deployed in an application,
    i.e., learning while working.
-   **[Open world
    Learning](http://www.cs.uic.edu/~liub/open-classification.html)
    (a.k.a. open world classification or open classification)**
    ([KDD-2016](), EMNLP-2017): this learning paradigm is becoming very
    important as AI agents (e.g., self-driving cars and chatbots) are
    increasingly facing the real-world open and dynamic environments,
    where there are always new or unexpected objects. But traditional
    learning makes the close-world assumption: test instances must be
    from only the training/seen classes, which is not true in the open
    world. Ideally, an open-world learner should be able to do the
    following:
    -   detecting instances of unseen classes - not seen in training
        (the **DOC algorithm**
        ([EMNLP-2017](https://www.cs.uic.edu/~liub/publications/emnlp17-camera-ready.pdf))
        is quite powerful for this task for both text and images),
    -   autmatically identifying unseen classes from the detected
        instances in a *self-supervised* manner, and
    -   incrementally learning the new/unseen classes.

    In this process, the system becomes more and more knowledgeable and
    better at learning. It also knows what it does and does not know.
-   **[Continuous Learning in
    Dialogues](http://www.cs.uic.edu/~liub/continuous-learning-chatbot.html)
    ([SIGDIAL-2019](https://arxiv.org/abs/1907.13295))**: Dialogue
    systems or Chatbots have been very popular in recent years, but they
    cannot learn new knowledge during conversation, i.e., their
    knowledge is fixed beforehand and cannot be expanded during
    chatting. In this work, we aim to build a *lifelong and interactive*
    knowledge learning engine for chatbots.

### Related Learning Paradigms: Transfer learning, multitask learning, and lifelong learning

-   **Characterisitcs of lifelong learning**: (1) learning continuously
    (ideally in the open world), (2) accumulating the previously learned
    knowledge to become more and more knowledgeable, (3) using the
    knowledge to learn more knowledge and adapting it for problem
    solving, (4) discovering new problems/tasks to be learned and
    learning them incrementally, and (5) learning on the job or learning
    while working, improving model during testing or model applications.
-   **Transfer learning vs. lifelong learning**: Transfer learning uses
    the source domain labeled data to help target domain learning.
    Unlike lifelong learning, transfer learning is not continual and has
    no knowledge retention (as it uses source labeled data, not learned
    knowledge). The source must be similar to the target (which are
    normally selected by the user). It is also only one-directional:
    source helps target, but not the other way around because the target
    has no or little labeled data.
-   **Multitask learning vs. lifelong learning**: Multitask learning
    jointly optimizes learning of multiple tasks. Although it is
    possible to make it continual, multitask learning does not retain
    any explicit knowledge except data, and when the number of task is
    really large, it is hard to re-learn everything when faced with a
    new task.

### Publications

         **TextBook**: Zhiyuan Chen and Bing Liu. [Lifelong Machine
Learning](https://www.cs.uic.edu/~liub/lifelong-machine-learning.html).
Morgan & Claypool, 2018 (2nd edition), 2016 (1st edition).

-   Sahisnu Mazumder, Bing Liu, Shuai Wang, Nianzu Ma. [Lifelong and
    Interactive Learning of Factual Knowledge in
    Dialogues](https://arxiv.org/abs/1907.13295). to appear in
    *Proceedings of Annual Meeting of the Special Interest Group on
    Discourse and Dialogue (SIGDIAL-2019)*, 11-13 September 2019,
    Stockholm, Sweden.
-   Hu Xu, Bing Liu, Lei Shu and P. Yu. [Open-world Learning and
    Application to Product
    Classification](https://arxiv.org/abs/1809.06004). *Proceedings of
    the Web Conference* (formerly known as the WWW conference), San
    Francisco, May 13-17, 2019.
-   Wenpeng Hu, Zhou Lin, Bing Liu, Chongyang Tao, Zhengwei Tao, Jinwen
    Ma, Dongyan Zhao, Rui Yan. [Overcoming Catastrophic Forgetting for
    Continual Learning via Model
    Adaptation](https://openreview.net/pdf?id=ryGvcoA5YX). *Proceedings
    of the Seventh International Conference on Learning Representations
    (ICLR-2019)*, New Orleans, Louisiana, May 6 – 9, 2019.
-   Guangyi Lv, Shuai Wang, Bing Liu, Enhong Chen, and Kun Zhang.
    Sentiment Classification by Leveraging the Shared Knowledge from a
    Sequence of Domains. *Proceedings of the 24th International
    Conference on Database Systems for Advanced Applications
    (DASFAA-2019)*, April 22-25, 2019.
-   Shuai Wang, Guangyi Lv, Sahisnu Mazumder, Geli Fei, and Bing Liu.
    Lifelong Learning Memory Networks for Aspect Sentiment
    Classification. *Proceedings of 2018 IEEE International Conference
    on Big Data (IEEE BigData 2018)*, Seattle, December 10-13, 2018.
-   Lei Shu, Hu Xu, and Bing Liu. [Unseen Class Discovery in Open-world
    Classification](https://arxiv.org/abs/1801.05609). arXiv:1801.05609
    [cs.LG], 18 Jan. 2018.
-   Sahisnu Mazumder, Nianzu Ma, and Bing Liu. [Towards a Continuous
    Knowledge Learning Engine for
    Chatbots](https://arxiv.org/abs/1802.06024). arXiv:1802.06024
    [cs.CL], 16 Feb. 2018. **Previous title**: "[Towards an Engine for
    Lifelong Interactive Knowledge Learning in Human-Machine
    Conversations](https://arxiv.org/abs/1802.06024)".
-   Hu Xu, Bing Liu, Lei Shu and Philip S. Yu. Lifelong Domain Word
    Embedding via Meta-Learning. *Proceedings of International
    Conference on Artificial Intelligence (IJCAI-ECAI-2018)*. July 13-19
    2018, Stockholm, Sweden.
-   Bing Liu. [Lifelong Machine Learning: a Paradigm for Continuous
    Learning](http://www.cs.uic.edu/~liub/publications/continuous-learning.pdf).
    *Frontier Computer Science*, 2017, 11(3): 359–361.
-   Lei Shu, Hu Xu, Bing Liu. [DOC: Deep Open Classification of Text
    Documents](http://www.cs.uic.edu/~liub/publications/emnlp17-camera-ready.pdf).
    *Proceedings of 2017 Conference on Empirical Methods in Natural
    Language Processing (EMNLP-2017, oral presentation short paper)*,
    September 7–11, 2017, Copenhagen, Denmark.
-   Lei Shu, Hu Xu, and Bing Liu. [Lifelong Learning CRF for Supervised
    Aspect
    Extraction](http://www.cs.uic.edu/~liub/publications/acl17_LifelongCRF.pdf).
    *Proceedings of Annual Meeting of the Association for Computational
    Linguistics (ACL-2017, oral presentation short paper)*, July
    30-August 4, 2017, Vancouver, Canada.
-   Lei Shu, Bing Liu, Hu Xu, and Annice Kim. [Lifelong-RL: Lifelong
    Relaxation Labeling for Separating Entities and Aspects in Opinion
    Targets](http://www.cs.uic.edu/~liub/publications/emnlp2016.pdf).
    *Proceedings of 2016 Conference on Empirical Methods in Natural
    Language Processing (EMNLP-2016)*, November 1–5, 2016, Austin,
    Texas, USA.
-   Geli Fei, Shuai Wang, and Bing Liu. 2016. [Learning Cumulatively to
    Become More
    Knowledgeable](http://www.kdd.org/kdd2016/papers/files/rpp0426-feiA.pdf).
    *Proceedings of SIGKDD International Conference on Knowledge
    Discovery and Data Mining (KDD-2016)*, August 13-17, San Francisco,
    USA.
-   Geli Fei, and Bing Liu. 2016. [Breaking the Closed World Assumption
    in Text
    Classification](https://pdfs.semanticscholar.org/c5b5/56807c19548384886a060216672c11121a72.pdf?_ga=1.25126456.34606428.1491067408).
    *Proceedings of NAACL-HLT 2016* , June 12-17, San Diego, USA.
-   Shuai Wang, Zhiyuan Chen, and Bing Liu. [Mining Aspect-Speciﬁc
    Opinion using a Holistic Lifelong Topic
    Model](http://www2016.net/proceedings/proceedings/p167.pdf).
    *Proceedings of the International World Wide Web Conference
    (WWW-2016)*, April 11-15, 2016, Montreal, Canada.
-   Qian Liu, Bing Liu, Yuanlin Zhang, Doo Soon Kim and Zhiqiang Gao.
    [Improving Opinion Aspect Extraction using Semantic Similarity and
    Aspect
    Associations](http://www.aaai.org/ocs/index.php/AAAI/AAAI16/paper/download/11973/12051).
    *Proceedings of Thirtieth AAAI Conference on Artificial Intelligence
    (AAAI-2016)*, February 12–17, 2016, Phoenix, Arizona, USA.
-   Zhiyuan Chen, Nianzu Ma and Bing Liu. [Lifelong Learning for
    Sentiment
    Classification](http://www.cs.uic.edu/~zchen/papers/ACL2015-Short-Zhiyuan(Brett)Chen.pdf).
    *Proceedings of the 53st Annual Meeting of the Association for
    Computational Linguistics (ACL-2015, short paper)*, 26-31, July
    2015, Beijing, China.
-   Zhiyuan Chen and Bing Liu. [Mining Topics in Documents: Standing on
    the Shoulders of Big
    Data.](http://www.cs.uic.edu/~zchen/papers/KDD2014-Zhiyuan(Brett)Chen.pdf).
    *Proceedings of the 20th ACM SIGKDD Conference on Knowledge
    Discovery and Data Mining (KDD 2014)*, August 24-27, New York, USA.
    [[**Code**](https://github.com/czyuan/AMC.git)]
    [[**Dataset**](http://www.cs.uic.edu/~zchen/downloads/KDD2014-Chen-Dataset.zip)]
-   Zhiyuan Chen and Bing Liu. [Topic Modeling using Topics from Many
    Domains, Lifelong Learning and Big
    Data](http://www.cs.uic.edu/~zchen/papers/ICML2014-Zhiyuan(Brett)Chen.pdf).
    *Proceedings of the 31st International Conference on Machine
    Learning (ICML 2014)*, June 21-26, Beijing, China.
-   Zhiyuan Chen, Arjun Mukherjee, and Bing Liu. [Aspect Extraction with
    Automated Prior Knowledge
    Learning](https://www.cs.uic.edu/~zchen/papers/ACL2014-Zhiyuan(Brett)Chen-Latest.pdf).
    *Proceedings of the 52nd Annual Meeting of the Association for
    Computational Linguistics (ACL 2014)*, June 22-27, 2014, Baltimore,
    USA.

