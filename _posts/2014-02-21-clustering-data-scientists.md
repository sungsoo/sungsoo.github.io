---
layout: post
title: Clustering Data Scientists
date: 2014-02-21
categories: [computer science]
tags: [analytics, big data, data science]

---

Two sets of survey questions lent themselves to a clustering analysis. We asked respondents to rank a diverse set of data science-related skills, and we also asked the extent to which they self-identified with a variety of professional categories.

Self-Identification
---

How do you think about yourself and your career? How might you talk about yourself to friends, colleagues, or potential employers? To gain insight, we asked people to state the extent to which they agreed with 11 “I think of myself as a/an X” statements (Figure 3-1) using a standard five-level Completely Agree to Completely Disagree scale.


![](http://sungsoo.github.com/images/self-identification.png)

We identified four clusters (latent factors) in our responses. Each cluster is a set of self-ID categories that people tended to respond to consistently. For example, it was unlikely that an individual data scientist would both agree strongly that they are a Statistician but dis‐ agree strongly that they are a Scientist. We named the four clusters to be evocative of the range of self-ID categories most associated with that cluster. These named clusters we define as Self-ID Groups. Note that each self-ID category was most strongly associated with a single Self-ID Group, with the exception of Jack of All Trades, which is only narrowly most associated with the Data Creative group. We will describe each of these Self-ID Groups in more detail below, but first we want to introduce Skills Groups.

Skills
---

What skills do you bring to your work? What are your primary areas of expertise? It can be tricky to get good answers to these questions. On a scale of 1 to 10, how good are you at Math? Rather than try to get comprehensible answers to this nearly incomprehensible question, we elected to ask respondents to rank their skills. This is a lot easier. As applied to your work, are you more skilled at Visualization or at Bayesian/Monte Carlo Statistics?

We developed a set of *22 generic skills* that we thought spanned the range of useful things that data scientists might do in their work (Figure 3-2). A few concrete examples were provided with each skill to clarify and to aid ordering. Respondents dragged-and-dropped those skills into an ordered list, with their introspectively determined top skill on top.

![](http://sungsoo.github.com/images/skills-group.png)

As with the Self-ID Groups, we clustered the Skills, providing names for each cluster to summarize those skills concisely. For example, respondents tended to rank Spatial Statistics and Surveys and Marketing together, either ranking both relatively high or both relatively low. As before, most Skills categories were most strongly associated with a single Skills Group, with two exceptions. Structured Data, which ended up in the ML/Big Data Skills group, was also strongly associated with the Programming skills group. And Machine Learning, which also ended up with the ML/Big Data group, was also commonly ranked highly by respondents who ranked Math/OR or Statistics skills highly.
It’s worth noting that because we used rankings instead of an absolute scale, we are not suggesting that two data scientists who rank ML/Big Data skills highly are equivalently skilled or effective. One may be a recent university graduate, having only completed coursework in Machine Learning, while another may have decades of experience apply‐ ing these techniques to a wide range of problems.

Skills List
---
Here are the list of skills we provided (in random order) and asked respondents to sort:

* *Algorithms* (ex: computational complexity, CS theory) 
* *Back-End Programming* (ex: JAVA/Rails/Objective C)
* *Bayesian/Monte-Carlo Statistics* (ex: MCMC, BUGS)
* *Big and Distributed Data* (ex: Hadoop, Map/Reduce)
* *Business* (ex: management, business development, budgeting)
* *Classical Statistics* (ex: general linear model, ANOVA)
* *Data Manipulation* (ex: regexes, R, SAS, web scraping)
* *Front-End Programming* (ex: JavaScript, HTML, CSS)
* *Graphical Models* (ex: social networks, Bayes networks)
* *Machine Learning* (ex: decision trees, neural nets, SVM, clustering)
* *Math* (ex: linear algebra, real analysis, calculus)
* *Optimization* (ex: linear, integer, convex, global)
* *Product Development* (ex: design, project management)
* *Science* (ex: experimental design, technical writing/publishing)
* *Simulation* (ex: discrete, agent-based, continuous)
* *Spatial Statistics* (ex: geographic covariates, GIS)
* *Structured Data* (ex: SQL, JSON, XML)
* *Surveys and Marketing* (ex: multinomial modeling)
* *Systems Administration* (ex: *nix, DBA, cloud tech.)
* *Temporal Statistics* (ex: forecasting, time-series analysis)
* *Unstructured Data* (ex: noSQL, text mining)
* *Visualization* (ex: statistical graphics, mapping, web-based data‐ viz)


Combining Skills and Self-ID
---

Figure 3-3 shows how our respondents fell into our four Self-ID Groups and five Skills Groups. Each respondent’s responses can be “compressed” by replacing their eleven Self-ID ratings with their four Self-ID Group loadings, and similarly for Skills. The respondent can then be labeled by their most strongly loaded Self-ID and Skills groups. For example, someone who rated the Data Businessperson Self-ID questions highest, and ranked the Statistics Skills highest, would fall into the lower-left rectangle.

![](http://sungsoo.github.com/images/skills-self-id-top-factors.png)

Several reasonable observations fall out of this initial categorization. First of all, Data Businesspeople are most likely to have primarily Business-related skills. This is certainly a reassuring result. Also of note is that half of Data Businesspeople have strongest skill rankings in other areas, such as Statistics and ML/Big Data. Second, our largest group of respondents, Data Researchers, were also those most likely to have expertise in Statistics or, perhaps, Math.1 Third, both Data Businesspeople and Data Researchers were quite unlikely to rate Pro‐ gramming skills as their highest skills. And fourth, Data Creatives and Data Developers demonstrated greater variability in how they ranked their skills than others. Data Creatives and Data Developers are also the two Self-ID groups most likely to excel in ML/ Big Data and Programming skills, but as we’ll see next, there are substantial differences between the experiences of these types of data scientists.

When trying to describe subtypes of data scientist, we found that the Self-ID Groups were more evocative and a better primary label for practitioners, with the Skill Groups a correlated but secondary label. We may find it valuable to describe someone as a “Data Researcher with depth in Machine Learning/Big Data,” or as a “Data Business‐person with depth in Statistics.” (We urge readers to find their own data scientist type by doing the skills ranking and self-ID rating tasks at [survey.datacommunitydc.org](survey.datacommunitydc.org).)

References
---
[1] Harlan D. Harris, Sean Patrick Murphy, and Marck Vaisman, *Analyzing the Analyzers*, O’Reilly Media, Inc., 2013.
