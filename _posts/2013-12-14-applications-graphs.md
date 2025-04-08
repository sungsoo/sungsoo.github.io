---
layout: post
title: Applications using graph representation
date: 2013-12-14
categories: [computer science]
tags: [big data]

---

<script type="text/javascript"  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

Informally, a graph is set of nodes, pairs of which might be connected by edges. The graph representation is simple, yet powerful, encompassing a large number of applications:

• *social networks*,like Facebook and LinkedIn,which have brought on a revolution in this decade. All contact networks fall under the same class: who-calls-whom in a phone network, who- texts-whom, or who collaborates with whom.


• *cyber-security*, for computer networks, where machines send IP packets to each other. The goals are to spot strange behaviors, like botnets, port-scanners, exfiltrators (e.g., industrial espionage).


• *web and ranking*: the web consists of pages pointing to each other, and successful ranking algorithms must analyze this graph intelligently.


• *influence propagation*: how do new concepts, terms, “memes,” propagate? What can we do to accelerate a word-of-mouth campaign for our new product? Conversely, what can we do to stop the propagation of an undesirable element (like the flu, or a computer virus).


• *e-commerce*: In several cases, especially in Web 2.0, users declare what products they have bought or liked. Amazon, Netflix, and the Apple and Android app stores are just a few of the many cases where this information can be used to increase user satisfaction, as well as profits. Similarly, Ebay allows buyers to give ratings to sellers; the shape of the resulting sub-graph could help spot fraud.


• *everything else*: in biology, protein-protein interaction networks can be modeled as graphs. In population ecology, we have food-webs of species in prey-predator relationships. In text retrieval, we have bi-partite graphs of documents linked to the terms they contain, in the “vector space” model (also know as the “bag of words” model).


One may wonder what the practical use is of such patterns, such as the famous “six degrees
of separation,” which claims that social contact networks have a short diameter of about 6. 

There are several reasons to study patterns and laws in real graphs:

• **Understanding** human(machine, protein) behavior: Discovering patterns of connectivity may help domain experts (sociologists, biologists) develop even better theories, explaining how and when humans (machines, proteins) come into contact with others.

• **Anomaly detection**:if we know we should expect a specific pattern(like,say,the “six degrees”), then a graph with an extremely short diameter (say, a “star”), or extremely long diameter (say, a “chain”), would be suspicious. In fact, there is no perfect, formal definition of anomaly, and similarly, there is no perfect definition of “normal:” An anomaly is an event (node, subgraph), whose properties are rare, and thus deviate from the majority of the population. Informally, “normal” behavior is the pattern that the majority follows, and “abnormal” behavior is the deviation. Thus, anomalies and patterns go hand-in-hand. We also want to spot local anoma- lies, that is, strange subgraphs/edges/nodes. All such abnormalities should deviate from the “normal” patterns, so understanding the patterns that appear in natural graphs is a prerequisite for detection of such outliers.


• **Extrapolations**: What will the web look like next year? If a growing network had a diameter of 6 for all past years, should we expect a slight growth in the diameter for next year? In fact, the diameter exhibits particularly strange trends.


• **Generator design**: We list almost a dozen graph generators – which one(s) are the most realistic? Knowing the behavior of “normal” graphs can help us avoid un-realistic generators. An important need for generators is for simulations: Real graphs often have privacy issues and/or high monetary value, and cannot be released; in that case researchers can try their algorithms on synthetic, but realistic-looking graphs. For example, in order to test the next- generation Internet protocol, we would like to simulate it on a graph that is “similar” to what the Internet will look like a few years into the future.


• **Graph compression**: Graph patterns represent regularities in the data. Such regularities can be used to better compress the data. For Internet-size graphs, like web-crawls with billions of pages, or Facebook with “more than 950 million active users”1 at the time of writing, keeping (and compressing) historical data is important.

Thus, we need to detect patterns in graphs, and then generate synthetic graphs matching such patterns automatically. 


### References

[1] Deepayan Chakrabarti, Christos Faloutsos, Graph Mining: Laws, Tools, and Case Studies, Sythesis Lectures on Data Mining and Knowlege Discovery, 2012.




