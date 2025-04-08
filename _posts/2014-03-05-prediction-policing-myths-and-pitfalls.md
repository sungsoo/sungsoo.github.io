---
layout: post
title: Predictive Policing Myths and Pitfalls
date: 2014-03-05
categories: [computer science]
tags: [big data, analytics, graph mining]

---

Summary
---
* **Article Source**: Walter L. Perry, Brian McInnis, Carter C. Price, Susan C. Smith, John S. Hollywood, *Predictive Policing; The Role of Crime Forecasting in Law Enforcement Operations*, 2013 [1].


Predictive Policing Myths and Pitfalls
---

Many types of analysis that inform predictive policing have been widely used in law enforcement and other fields, just under different names. The lessons from these prior applications can highlight many well-known pitfalls that can lead practitioners astray and can provide recommendations to enhance the effectiveness of predictive policing efforts.


Predictive Policing Myths
---

“**Predictive policing**” has received a substantial amount of attention in the media and the research literature. However, some myths about these techniques have also propagated. This is partly a problem of unrealistic expectations: Predictive policing has been so hyped that the reality cannot live up to the hyperbole. There is an underlying, erroneous assumption that advanced mathematical and computational power is both necessary and sufficient to reduce crime. Here, we dispel four of the most common myths about predictive policing:

* *Myth 1: The computer actually knows the future*. Some descriptions of predictive policing make it sound as if the computer can foretell the future. Although much news coverage promotes the meme that predictive policing is a crystal ball, these algorithms predict the risk of future events, not the events themselves. The computer, as a tool, can dramatically simplify the search for patterns, but all these techniques are extrapolations from the past in one way or another. In addition, predictions are only as good as the underlying data used to make them.  
* *Myth 2: The computer will do everything for you*. Although it is common to promote software packages as end-to-end solutions for predictive policing, humans remain—by far—the most important elements in the predictive policing process. Even with the most complete software suites, humans must find and collect relevant data, preprocess the data so they are suitable for analysis, design and conduct analyses in response to ever-changing crime conditions, review and interpret the results of these analyses and exclude erroneous findings, analyze the integrated findings and make recommendations about how to act on them, and take action to exploit the findings and assess the impact of those actions.
* *Myth 3: You need a high-powered (and expensive) model*. Most police departments do not need the most expensive software packages or computers to launch a predictive policing program. Functionalities built into standard workplace software (e.g., Microsoft Office) and geographic information systems (e.g., ArcGIS) can support many predictive methods. Although there is usually a correlation between the complexity of a model and its predictive power, increases in predictive power have tended to show diminishing returns. Simple heuristics have been found to be nearly as good as analytic software in performing some tasks. This finding is especially important for small departments, which often have insufficient data to support large, sophisticated models.
* *Myth 4: Accurate predictions automatically lead to major crime reductions*. Predictive policing analysis is frequently marketed as the path to the end of crime. The focus on the analyses and software can obscure the fact that predictions, on their own, are just that—predictions. Actual decreases in crime require taking action based on those predictions. Thus, we emphasize again that predictive policing is not about making predictions but about the end-to-end process.


Predictive Policing Pitfalls
---

To be of use to law enforcement, predictive policing methods must be applied as part of a comprehensive crime prevention strategy. And to ensure that predictive methods make a significant contribution, certain pitfalls need to be avoided:

* *Pitfall 1: Focusing on prediction accuracy instead of tactical utility*. Suppose an ana- lyst is asked to provide predictions of robberies that are as “accurate” as possible (i.e., to design an analysis in which as many future crimes as possible fall inside areas predicted to be high-risk, thus confirming that these areas are high-risk). One way to accomplish this is to designate the entire city a giant “risk area.” How- ever, such a designation has almost no tactical utility. Identifying a hot spot that is the size of a city may be accurate, but it does not provide any information that police officers do not already have. To ensure that predicted hot spots are small enough to be actionable, we must accept some limits on “accuracy” as measured by the proportion of crimes occurring in the hot spots.  
* *Pitfall 2: Relying on poor-quality data*. There are three typical deficiencies that can affect data quality: data censoring, systematic bias, and relevance. Data censoring involves omitting data for incidents of interest in particular places (and at particu- lar times). If the data are censored, it will appear that there is no crime in a given areas. Systematic bias can result from how the data are collected. For example, if especially heavy burglary activity is reported between 7:00 and 8:00 a.m., it may not be immediately clear whether a large number of burglaries actually occurred during that hour or whether that was when property owners and managers dis- covered and reported burglaries that took place overnight. Finally, relevance refers to the usefulness of the data. For some crime clusters, it can be very useful to have data going back many months or years. Conversely, if there is a spree of very simi- lar robberies likely committed by the same criminal, several months of data will not be of much use.
* *Pitfall 3: Misunderstanding the factors behind the prediction*. Observers—especially practitioners tasked with making hot spots go away—may reasonably ask, “For a given hot spot, what factors are driving risk?” “The computer said so” is far from an adequate answer. In general, predictive tools are designed in a way that makes it difficult, if not impossible, to highlight the risk factors present in specific areas. There has been some improvement, however. When applying techniques, such as regression or any of the data mining variants, using common sense to vet the fac- tors incorporated into the model will help avoid spurious relationships.
* *Pitfall 4: Underemphasizing assessment and evaluation*. During our interviews with practitioners, very few said that they had evaluated the effectiveness of the predic- tions they produced or the interventions developed in response to their predic- tions. The effectiveness of any analysis and interventions should be assessed as part of the overall effort to keep the data current. Measurements are key to identifying areas for improvement, modifying interventions, and distributing resources.
* *Pitfall 5: Overlooking civil and privacy rights*. The very act of labeling areas and people as worthy of further law enforcement attention inherently raises concerns about civil liberties and privacy rights . Labeling areas as “at-risk” appears to pose fewer problems because, in that case, individuals are not being directly targeted. The U.S. Supreme Court has ruled that standards for what constitutes reasonable suspicion are relaxed in “high-crime areas” (e.g., hot spots). However, what for- mally constitutes a “high-crime” area, and what measures may be taken in such areas under “relaxed” reasonable-suspicion rules, is an open question.


References
---
[1] Walter L. Perry, Brian McInnis, Carter C. Price, Susan C. Smith, John S. Hollywood, *Predictive Policing; The Role of Crime Forecasting in Law Enforcement Operations*, 2013.

