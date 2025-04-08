---
layout: post
title: Theoretical Foundations of Data Mining and Predictive Analytics
date: 2014-03-07
categories: [computer science]
tags: [big data]

---

Theoretical Foundations of Data Mining and Predictive Analytics
---

The fundamental notion underlying the *theory* and *practice* of predictive policing is that we can make *probabilistic inferences* about future criminal activity based on existing data. In short, we can use data from a wide variety of sources to compute estimates about phenomena such as where gun violence is likely to occur, where a serial burglar is likely to commit his next crime, and which individuals a suspect is likely to contact for help. Past data from both conventional and unconventional sources combine to yield estimates, with a specified degree of certainty, about what will happen in the future. Police organizations can then make decisions accordingly.

The theory that the past can be used to predict the future relies on the assumption that crime, like any phenomenon that can be discussed in probabilistic terms, has both a systematic and non-systematic component.


* **The systematic component** of crime is that which can be predicted using *logical* determinants. We can estimate the probability that a car will be stolen, for example, if we know the location of the car, characteristics of the car, and time of day. The systematic component of criminal activity allows analysts to estimate the probability of a particular event transpiring in the future and the non-systematic component requires researchers to couch this estimate within a range of uncertainty.  
* **The non-systematic component** of a crime, in contrast, is that which cannot be predicted . Owing to an outburst of rage, a man might steal a car that we would not normally expect to be stolen.

Another way to frame the systematic and nonsystematic components is in terms of *rational choice theory*. All criminal decision-making is based on some amount of *rationality*. Offenders seek to achieve a purpose, and the decision to act is “influenced by situational and environmental features that provide desirable—or undesirable—offending opportunities [2]. These features factor into an offender’s decision calculus about whether or not a criminal act will result in a positive outcome. By collecting and analyzing data on these features, police can mimic an *offender’s target selection* and thwart a crime prior to its occurrence.

The *systematic*, or *predictable*, component of crime can be discovered through either a top-down or bottom-up analytical approach.

* **The top-down approach** refers to methods in which the user specifies *predictors* of criminal activity. The analyst theorizes that certain factors, such as environmental characteristics, time of day, weather, and past incidence of crime influence the likelihood of future criminal activity. These factors are incorporated into a *statistical model* that generates predictions for particular geographical units.  
* **The bottom-up approach** does not require a predetermined theory about the determinants of crime. Instead, an algorithm is used to *search* across *a large amount of data* to identify *patterns* . These patterns frequently take the form of *geographical clusters* of criminal incidents (“**hot spots**”) and diagrams of *social networks*. The chief benefit of a bottom-up approach is that analysts are able to *uncover patterns* they did not even realize existed.


References
---
[1] Jennifer Bachner, *Predictive Policing; Preventing Crime with Data and Analytics*, Improving Performance Series, [IBM Center for The Business of Government](http://www.businessofgovernment.org), 2013.  
[2] Elizabeth R. Groff and Nancy G. La Vigne, “*Forecasting the Future of Predictive Crime Mapping*,” Crime Prevention Studies 13 (2002)