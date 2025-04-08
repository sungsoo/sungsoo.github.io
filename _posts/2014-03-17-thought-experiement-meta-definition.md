---
layout: post
title: Thought Experiment - Meta-Definition
date: 2014-03-17
categories: [computer science]
tags: [data science]

---

# Thought Experiment: Meta-Definition

Every class had at least one thought experiment that the students discussed in groups. Most of the thought experiments were very open- ended, and the intention was to provoke discussion about a wide variety of topics related to data science. For the first class, the initial thought experiment was: *can we use data science to define data science?*


The class broke into small groups to think about and discuss this question. Here are a few interesting things that emerged from those conversations:


Start with a text-mining model.
---

We could do a Google search for “data science” and perform a text- mining model. But that would depend on us being a usagist rather than a *prescriptionist* with respect to language. A usagist would let the masses define data science (where “the masses” refers to whatever Google’s search engine finds). Would it be better to be a prescriptionist and refer to an authority such as the *Oxford English Dictionary*? Unfortunately, the *OED* probably doesn’t have an entry yet, and we don’t have time to wait for it. Let’s agree that there’s a spectrum, that one authority doesn’t feel right, and that “the masses” doesn’t either.

	
So what about a clustering algorithm?
---

How about we look at practitioners of data science and see how they describe what *they* do (maybe in a word cloud for starters)? Then we can look at how people who claim to be other things like statisticians or physicists or economists describe what they do. From there, we can try to use a clustering algorithm or some other model and see if, when it gets as input “the stuff someone does,” it gives a good prediction on what field that person is in.

Just for comparison, check out what Harlan Harris recently did related to the field of data science: he [took a survey and used clustering to define subfields of data science](http://datacommunitydc.org/blog/2012/08/data-scientists-survey-results-teaser/), which gave rise to Figure 1-4.

![subfields-of-data-science.png](http://sungsoo.github.com/images/subfields-of-data-science.png)


# OK, So What Is a Data Scientist, Really?

Perhaps the most concrete approach is to define data science is by its usage—e.g., what data scientists get paid to do. With that as motivation, we’ll describe what data scientists do. And we’ll cheat a bit by talking first about data scientists in academia.


In Academia
---

The reality is that currently, no one calls themselves a data scientist in academia, except to take on a secondary title for the sake of being a part of a “data science institute” at a university, or for applying for a grant that supplies money for data science research.


Instead, let’s ask a related question: who in academia plans to become a data scientist? There were 60 students in the Intro to Data Science class at Columbia. When Rachel proposed the course, she assumed the makeup of the students would mainly be statisticians, applied mathematicians, and computer scientists. Actually, though, it ended up being those people plus sociologists, journalists, political scientists, biomedical informatics students, students from NYC government agencies and nonprofits related to social welfare, someone from the architecture school, others from environmental engineering, pure mathematicians, business marketing students, and students who already worked as data scientists. They were all interested in figuring out ways to solve important problems, often of social value, with data.


For the term “**data science**” to catch on in academia at the level of the faculty, and as a primary title, the research area needs to be more formally defined. Note there is already a rich set of problems that could translate into many PhD theses.


Here’s a stab at what this could look like: an academic data scientist is a scientist, trained in anything from social science to biology, who works with large amounts of data, and must grapple with computational problems posed by the structure, size, messiness, and the complexity and nature of the data, while simultaneously solving a real- world problem.


The case for articulating it like this is as follows: across academic disciplines, the computational and deep data problems have major commonalities. If researchers across departments join forces, they can solve multiple real-world problems from different domains.


In Industry
---

What do data scientists look like in industry? It depends on the level of seniority and whether you’re talking about the Internet/online industry in particular. The role of data scientist need not be exclusive to the tech world, but that’s where the term originated; so for the purposes of the conversation, let us say what it means there.


A chief data scientist should be setting the data strategy of the company, which involves a variety of things: setting everything up from the engineering and infrastructure for collecting data and logging, to privacy concerns, to deciding what data will be user-facing, how data is going to be used to make decisions, and how it’s going to be built back into the product. She should manage a team of engineers,
scientists, and analysts and should communicate with leadership across the company, including the CEO, CTO, and product leadership. She’ll also be concerned with patenting innovative solutions and setting research goals.


More generally, a data scientist is someone who knows how to extract meaning from and interpret data, which requires both tools and methods from statistics and machine learning, as well as being human. She spends a lot of time in the process of collecting, cleaning, and munging data, because data is never clean. This process requires persistence, statistics, and software engineering skills—skills that are also necessary for understanding biases in the data, and for debugging logging output from code.


Once she gets the data into shape, a crucial part is exploratory data analysis, which combines visualization and data sense. She’ll find patterns, build models, and algorithms—some with the intention of understanding product usage and the overall health of the product, and others to serve as prototypes that ultimately get baked back into the product. She may design experiments, and she is a critical part of data- driven decision making. She’ll communicate with team members, engineers, and leadership in clear language and with data visualizations so that even if her colleagues are not immersed in the data themselves, they will understand the implications.


# References
[1] Rachel Schutt and Cathy O’Neil, *Doing Data Science*, O’Reilly Media, Inc., 2014.
