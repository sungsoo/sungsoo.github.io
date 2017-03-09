---
layout: post
title: Ten Data Acquisition Strategies for Startups
date: 2017-03-10
categories: [computer science]
tags: [machine learning]

---


## Article Source

* Title: [10 Data Acquisition Strategies for Startups](https://medium.com/@muellerfreitag/10-data-acquisition-strategies-for-startups-47166580ee48#.opvkltxag)
* Authors: Moritz Mueller-Freitag


-----


Ten Data Acquisition Strategies for Startups 
===========================================

The “unreasonable effectiveness” of data for machine-learning
applications has been widely debated over the years (see
[here](http://research.google.com/pubs/archive/35179.pdf)
,
[here](http://ucrel.lancs.ac.uk/acl/P/P01/P01-1005.pdf)
 and
[here](http://link.springer.com/chapter/10.1007%2F3-540-36456-0_37)
). It has also been suggested that many major
breakthroughs in the field of Artificial Intelligence have not been
constrained by algorithmic advances but by the availability of
high-quality datasets (see
[here](https://www.edge.org/response-detail/26587)
). The common thread running through these discussions
is that data is a vital component in doing state-of-the-art machine
learning.


![](https://cdn-images-1.medium.com/max/800/1*7NEw_Q5BiovJr1I1h_XfqA.png)

Access to high-quality training data is critical for startups that use
machine learning as the core technology of their business. While many
algorithms and software tools are open sourced and shared across the
research community, good datasets are usually proprietary and hard to
build. Owning a large, domain-specific dataset can therefore become a
significant source of competitive advantage, especially if startups can
jumpstart [data network
effects](http://mattturck.com/2016/01/04/the-power-of-data-network-effects/)
 ** (a situation where more users → more data →
smarter algorithms → better product → more users).


![](https://cdn-images-1.medium.com/max/800/1*GY_sWM8SfZdp023IPJ1LXQ.png)


Consequently, one of the key strategic decisions that machine learning
startups have to make is how to build high-quality datasets to train
their learning algorithms. Unfortunately, startups often have limited or
no labeled data in the beginning, a situation that precludes founders
from making significant progress on building a data-driven product. It
is therefore worth exploring data acquisition strategies from the
outset, before hiring the data science team or building up a costly core
infrastructure.

Startups can overcome the [cold start
problem](https://en.wikipedia.org/wiki/Cold_start)
 of data acquisition in numerous ways. The choice of
data strategy/source usually goes hand-in-hand with the choice of
business model, a startup’s focus (consumer or enterprise, horizontal or
vertical, etc.) and the funding situation. The following list of
strategies, while neither exhaustive nor mutually exclusive, gives a
sense for the broad range of approaches available.







------------------------------------------------------------------------




## Strategy #1: Manual work 

Building a good proprietary dataset from scratch almost always means
putting a lot of up-front, human effort into data acquisition and
performing manual tasks that don’t scale. Examples of startups that have
used brute force in the beginning are plentiful. For instance, many
chatbot startups employ human “[AI
trainers](http://www.bloomberg.com/news/articles/2016-04-18/the-humans-hiding-behind-the-chatbots)
” who manually create or verify the predictions their
virtual agents make (with varying degrees of success and a high employee
turnover rate). Even the tech giants resort to this strategy: all
responses by [*Facebook
M*](http://www.wired.com/2015/08/facebook-launches-m-new-kind-virtual-assistant/) are reviewed and edited by a team of contractors.


![](https://cdn-images-1.medium.com/max/800/1*8b-tGn_QnpBORLI7RLNEjw.png)


Using brute force to manually label data points can be a successful
strategy as long as data network effects kick in at some point so that
humans no longer scale at an equal pace with the customer base. As soon
as the AI system is improving fast enough, unspecified outliers become
less frequent and the number of humans who perform manual labeling can
be decreased or held constant.

> **Interesting for**: *More or less every machine learning startup*

> **Examples**:
> 
> * Many chatbot startups (including [Magic](https://getmagicnow.com/), 
> [GoButler](http://www.gobutler.com/), [x.ai](https://x.ai/) and 
> [Clara](https://claralabs.com/)
> 
> * [MetaMind](https://www.metamind.io/food) (manually collected and labeled dataset
>  for food classification)
> 
> * [Building Radar](https://buildingradar.com/) (employees/interns manually label
> pictures of buildings)


------------------------------------------------------------------------



## Strategy #2: Narrow the domain 

Most startups will try to collect data directly from users. The
challenge is to convince early adopters to use the product *before* the
benefits of machine learning fully kick in (because data is needed in
the first place to train and fine-tune the algorithms). One way around
this catch-22 is to drastically narrow the problem domain (and expand
the scope later if needed). As Chris Dixon says: “The amount of data you
need is relative to the breadth of the problem you are trying to solve.”

![](https://cdn-images-1.medium.com/max/800/1*yzROwjw-zTqVEAS-AfbQZw.jpeg)

Source: x.ai

Good examples of the benefits of a narrow domain are again chatbots.
Startups in this segment can choose between two go-to-market strategies:
They can build *horizontal assistants — *bots that can help with a very
large number of questions and immediate requests (examples are
[*Viv*](http://viv.ai/) ,
[*Magic*](https://getmagicnow.com/) ,
[*Awesome*](http://textawesome.co.uk/)
, [*Maluuba*](http://www.maluuba.com/)
 and [*Jam*](https://hellojam.fr/)
). Or they can create *vertical assistants — *bots
that try to perform one specific, well-defined job extremely well
(examples are [*x.ai*](https://x.ai) ,
[*Clara*](http://www.claralabs.com/) ,
[*DigitalGenius*](http://digitalgenius.com)
, [*Kasisto*](http://www.kasisto.com)
, [*Meekan*](http://www.meekan.com)
* — *and more recently
[*GoButler*](http://www.gobutler.com)
/[*Angel.ai*](http://www.angel.ai/)
). While both approaches are valid, data collection is
dramatically easier for startups that tackle closed-domain problems.

> **Interesting for**: *Vertically integrated businesses*

> **Examples**: 
> 
> * Highly-specialized vertical chatbots (such as [x.ai](https://x.ai), [Clara](http://www.claralabs.com/) or [GoButler](http://www.gobutler.com))
> 
> * [Deep Genomics](http://www.deepgenomics.com/) (uses deep learning to classify/interpret
> genetic variants) 
> 
> * [Quantified Skin](http://www.quantifiedskin.com/) (uses customer selfies to analyze a person’s skin)



------------------------------------------------------------------------


## Strategy #3: Crowdsourcing / Outsourcing 

Instead of using qualified employees (or interns) to manually collect or
label data, startups can also crowdsource the process. Platforms like
[*Amazon Mechanical
Turk*](https://www.mturk.com/mturk/welcome)
 or
[*CrowdFlower*](https://www.crowdflower.com/)
 ** offer a way to clean up messy and incomplete data
using an online workforce of millions of people. For example,
[*VocalIQ*](http://www.ft.com/intl/cms/s/0/7146cec2-6920-11e5-a155-02b6f8af6a62.html)
 (acquired by Apple in 2015) used Amazon’s Mechanical
Turk to feed its digital assistant thousands of user queries. Workers
can also be outsourced by employing other independent contractors (as
done by [*Clara*](https://claralabs.com/)
 or [*Facebook
M*](http://www.wired.com/2015/08/facebook-launches-m-new-kind-virtual-assistant/)
). The necessary condition for using this approach is
that the task can be clearly explained and is not too long/boring.

![](https://cdn-images-1.medium.com/max/800/1*at0sKlg96VJizRXzbrFOyg.png)

Another tactic is to incentivize the public to voluntarily contribute
data. An example is [*Snips*](http://snips.ai/)
, a Paris-based AI startup that uses this approach to
get its hands on a certain type of data (confirmation emails for
restaurants, hotels and airlines). Like other startups, Snips uses a
gamified system where users are ranked on a leaderboard.

> **Interesting for**: *Use cases where quality control can be easily
> enforced*

> **Examples**:
> 
> * [DeepMind](https://deepmind.com/), [Maluuba](http://www.maluuba.com/), [AlchemyAPI](http://www.alchemyapi.com/) and many others (see [*here*](https://www.quora.com/Have-any-startups-on-Quora-used-CrowdFlowers-services-Which-person-at-CrowdFlower-is-best-to-talk-to))
> 
> * [VocalIQ](http://www.ft.com/intl/cms/s/0/7146cec2-6920-11e5-a155-02b6f8af6a62.html)
>  (used Mechanical Turk to teach its program how people talk) 
> 
> * [Snips](https://seeds.snips.ai/)(asks people to freely contribute data for research)


------------------------------------------------------------------------


## **Strategy #4: User-in-the-loop** 

A crowdsourcing strategy that deserves its own category is
*user-in-the-loop.* This approach involves designing products that
provide the right incentives for users to give data back to the system.
Two classic examples of companies that have used this approach for many
of their products are *Google* (autocomplete in search, Google
Translate, spam filters, etc.) and *Facebook* (users tagging friends in
photos). Users are often unaware that they provide these companies with
labeled data for free.



![](https://cdn-images-1.medium.com/max/800/1*WxNh3ExuNjqv9kcB04TxcQ.gif)



Many startups in the machine learning space have drawn inspiration from
Google and Facebook by creating products with a fault-tolerant UX **
that explicitly encourage users to correct machine errors. Particularly
notable are
[*reCAPTCHA*](https://www.google.com/recaptcha/intro/index.html)
 and
[*Duolingo*](https://www.duolingo.com/)
 (both founded by Luis von Ahn). Other examples
include [*Unbabel*](https://unbabel.com/)
, [*Wit.ai*](https://wit.ai/)
 and
[*Mapillary*](http://www.mapillary.com/map)
.

> **Interesting for**: *Consumer-centric startups with constant user
> interaction*

> **Examples**: 
> 
> * [Unbabel](https://unbabel.com/)(community translators correct machine-generated translations)
> 
> * [Wit.ai](https://wit.ai/)(provided dashboard/API for users to correct translation errors)
> 
> * [Mapillary](http://www.mapillary.com/map)(users can correct machine-generated
> traffic sign detection)


------------------------------------------------------------------------


## Strategy #5: Side business 

A strategy that seems to be particularly popular among computer vision
startups is to offer a free, domain-specific mobile app that targets
consumers. [*Clarifai*](https://www.clarifai.com/),[*HyperVerge*](http://hyperverge.co/) 
and [*Madbits*](http://www.madbits.com/) (acquired by Twitter in 2014) have all pursued this strategy by offering photo apps that gather additional image data for
their core business.

![](https://cdn-images-1.medium.com/max/800/1*Wz1divYxGkp1ssXVvdJRaw.jpeg)

*Source: Clarifai*

This strategy is not completely without risk (after all, it costs time
and money to successfully develop and promote an app). Startups must
also ensure that they create a strong enough use case that compels users
to give up their data, even if the service lacks the benefits of data
network effects in the beginning.

> **Interesting for**: *Enterprise* *startups/horizontal platforms*

> **Examples**:*
> 
> * [Clarifai](https://www.clarifai.com/)(*Forevery*, photo discovery app)
> 
> * [HyperVerge](http://hyperverge.co/)(Silver*, photo organization app)
> 
> * [Madbits](http://www.madbits.com/)(*Momentsia*, photo collage app)


------------------------------------------------------------------------

## Strategy #6: Data trap 

Another approach to gather useful data exhaust is to build what Matt
Turck has called a “data trap” **** (Leo Polovets has given this
strategy the rather uncharming title “Trojan Horse to collect data”).
The goal is to create something that is valuable even without machine
learning, and then sell it at a cost to gather data (even if the margin
is tiny). In contrast to the previous strategy, building a data trap is
a core part of a startup’s business model (not merely a side business).

![](https://cdn-images-1.medium.com/max/800/1*6igPHv3WFfG_71tX64LyEQ.jpeg)

Source: Tesla Motors / EmTech Digital Conference
A case in point is [*Recombine*](https://recombine.com/)
, a clinical genetic testing company that sells
fertility tests to gather DNA data that can then be analyzed with
machine learning. Another example is
[*BillGuard*](https://www.billguard.com/)
 ** (acquired by Prosper in 2015), a startup that
offers a mobile app to help credit card users catch and dispute “grey
charges.” The app helped BillGuard crowdsource a large amount of fraud
data that could then be used for other purposes. One could even argue
that
[*Tesla*](http://www.autoevolution.com/news/tesla-gathers-more-autopilot-miles-in-a-day-than-google-has-in-its-whole-program-107841.html)
 is pursuing this strategy. With over 100,000
(sensor-equipped) vehicles on the road, Tesla is currently building the
largest training datasets for self-driving cars (gathering more
autopilot miles every day than Google).

> **Interesting for**: *Vertically integrated businesses*

> **Examples**:
> 
> * [Recombine](https://recombine.com/)(sells fertility tests to gather DNA data)
> 
> * [BillGuard](https://www.billguard.com/)(offers mobile app to gather fraud data)
> 
> * [Tesla](http://www.autoevolution.com/news/tesla-gathers-more-autopilot-miles-in-a-day-than-google-has-in-its-whole-program-107841.html)(collects data when drivers are using the
autopilot feature)

------------------------------------------------------------------------

## Strategy #7: Publicly available datasets 

A strategy that many startups have tried — with varying degrees of
success — is mining data from publicly available sources. Web archives
like [*The Common Crawl*](http://commoncrawl.org/)
 contain petabytes of free raw data collected over
years of web crawling. In addition, companies like
[*Yahoo*](http://techcrunch.com/2016/01/14/yahoo-releases-its-biggest-ever-machine-learning-dataset-to-the-research-community/)
 or
[*Criteo*](http://www.criteo.com/news/press-releases/2015/06/criteo-releases-industrys-largest-ever-dataset/)
 have released huge datasets to the research community
(Yahoo released a whopping 13.5 TB of uncompressed data!). And with the
recent proliferation of publicly available government datasets
(spearheaded by the Obama administration), more and more data sources
are becoming freely available.


![](https://cdn-images-1.medium.com/max/800/1*Ol01AbiI94M-eTMyPjUCvg.png)


Several machine learning startups have taken advantage of public data.
When Oren Etzioni started **
[*Farecast*](http://techcrunch.com/2008/04/17/microsoft-acquires-farecast-for-115m/)
 (acquired by Microsoft in 2008), he used a sample of
12,000 price observations that he obtained by scraping information from
a travel website. Similarly,
[*SwiftKey*](https://swiftkey.com/en) 
** (acquired by Microsoft in 2016) collected and analyzed terabytes of
web-crawled data in the early days to create its language models.

> **Interesting for**: *Startups that can identify a relevant public
> dataset*

> **Examples**:
> 
> * [Farecast](http://www.businessinsider.com/oren-etzioni-is-one-successful-founder-2013-9?IR=T)(first version scraped information from a travel website)
> 
> * [SwiftKey](https://aws.amazon.com/de/solutions/case-studies/swiftkey/)(crawled web text to create language models)
> 
> * [The Echo Nest](http://the.echonest.com/)(crawled millions of music-related websites every day) 
> 
> * [Jetpac](https://www.theguardian.com/technology/2014/aug/18/google-buys-neural-network-city-guide-creator-jetpac)(used public Instagram data for its mobile application)

------------------------------------------------------------------------

## Strategy #8: License third-party data 

Another way to access third-party data is to license it, either through
an API that is provided by an external data provider, or by implementing
SDKs in third-party mobile apps to capture data (ideally with end user
consent). In both cases, startups pay an external party for access to
data that was generated for one purpose, and then apply machine learning
to extract new value from that data.

![](https://cdn-images-1.medium.com/max/800/1*09JRxj59g27rRWh0P-SMlw.png)


[*Farecast*](http://techcrunch.com/2008/04/17/microsoft-acquires-farecast-for-115m/)
 and
[*Decide.com*](http://techcrunch.com/2012/07/31/decide-coms-shopping-engine-now-tells-you-what-to-buy-not-just-when-to-buy-it/)
 ** (both founded by Oren Etzioni) have successfully
pursued this strategy. Open data platforms like
[*Clearbit*](https://clearbit.com/) 
or [*Factual*](https://www.factual.com/)
 ** are examples of external data providers. Among the
companies that use third-party data to mine predictive insights are also
several hedge funds and algo-trading firms (which are using
non-traditional datasets like satellite data from startups like
[*Orbital Insight*](https://orbitalinsight.com/)
 or
[*Rezatec*](http://www.rezatec.com/)
).

> **Interesting for**: *Startups that rely on third-party data (e.g.
> industry data)*

> **Examples**:*
> 
> * [Farecast](http://techcrunch.com/2008/04/17/microsoft-acquires-farecast-for-115m/)(licensed airline data to generate airfare predictions)
> 
> * [Decide.com](http://techcrunch.com/2012/07/31/decide-coms-shopping-engine-now-tells-you-what-to-buy-not-just-when-to-buy-it/)(licensed e-commerce data to generate
> price predictions)
> 
> * [Building Radar](https://buildingradar.com/)(uses ESA satellite images to monitor construction projects)


------------------------------------------------------------------------


## Strategy #9: Collaboration with large corporation 

For enterprise startups, the data provider can be a large customer that
provides access to relevant data. In this setup, the startup sells the
customer a solution to a problem (such as reducing fraud) and trains its
learning algorithms using the customer’s data. Ideally, the data
learnings from one customer or instance can then be transferred to all
other customers. Examples in the field of fraud detection are [*Sift
Science*](https://siftscience.com/) 
and [*SentinelOne*](https://www.sentinelone.com/).


![](https://cdn-images-1.medium.com/max/800/1*oq9Gql-Rv7uGVheIJjJErg.jpeg)


Source: Sift Science / TechCrunch
The challenge with this approach is to negotiate upfront that the data
learnings will be owned by the startup while the data itself remains
property of the customer. This can be problematic given that large
corporations often have stringent compliance rules and are very
sensitive of sharing proprietary data.

> **Interesting for**: *Enterprise* *startups*

> **Examples**:*
> 
> * [Sift Science](https://siftscience.com/)(uses company-specific data to find unique fraud signals)
> 
> * [SentinelOne](https://www.sentinelone.com/)(cybersecurity startup that sells
> endpoint protection software) 
> 
> * [Skytree](http://www.skytree.net/)(develops machine learning software for enterprise use)

------------------------------------------------------------------------

## Strategy #10: Small acquisitions 

Matt Turck lists small acquisitions of companies as a way to get access
to particularly relevant datasets (akin to acquisitions of valuable
patent portfolios). [*IBM
Watson*](https://www-03.ibm.com/press/us/en/pressrelease/49132.wss)
, for example, has made four data-related acquisitions
in 2015, transforming its health unit into one of the world’s largest
and most diverse repositories of health-related data.

![](https://cdn-images-1.medium.com/max/800/1*IkTlOm9PWrPJOZRDu7zaRg.png)

Since this approach requires the means to fund the acquisition, it might
only be viable for startups with substantial funding.

> **Interesting for**: *(Later-stage) startups with enough funding*

> **Examples**: Hard to pinpoint (data is rarely the only reason for
> acquisitions)

------------------------------------------------------------------------


There are quite possibly other data acquisition strategies which are not
mentioned here (if so, please drop me a line). There are also several
algorithmic tricks that startups can employ to work around the data
problem (such as [transfer
learning](https://en.wikipedia.org/wiki/Inductive_transfer)
, a technique used by
[*MetaMind*](http://www.kdnuggets.com/2015/10/metamind-mastermind-richard-socher-deep-learning-interview.html)
 for instance).

Whatever strategy you pursue, the key message is: Accessing and owning a
large, domain-specific dataset to build high accuracy models can be the
single hardest problem that founders need to solve in the beginning. In
some cases, it involves finding a quick-fix solution that does not
scale, like employing *humans pretending to be machines pretending to be
humans* (as done by many chatbot startups). In other cases, it requires
to significantly delay the move from free, limited beta to public
release until the benefits of machine learning kick in and customers are
willing to pay for the product.


------------------------------------------------------------------------


*The strategies and examples were drawn from conversations with
entrepreneurs as well as several blog posts, including from* [*Nathan
Benaich*](https://medium.com/@NathanBenaich)
*(*[*here*](http://techcrunch.com/2015/12/25/investing-in-artificial-intelligence/)
*),* [*Chris
Dixon*](https://medium.com/@cdixon) 
*(*[*here*](http://cdixon.org/2015/02/01/the-ai-startup-idea-maze/)
*),* [*Florian
Douetteau*](https://medium.com/@florian.douetteau)
*(*[*here*](http://www.dataiku.com/blog/2015/05/07/the-three-or-four-ways-to-create-a-big-data-startup.html)
*),* [*Leo
Polovets*](https://medium.com/@lpolovets) 
*(*[*here*](http://codingvc.com/the-value-of-data-part-2-building-valuable-datasets)
*),* [*Matt
Turck*](https://medium.com/@mattturck) 
*(*[*here*](http://mattturck.com/2016/01/04/the-power-of-data-network-effects/)
*) and* [*Boris
Wertz*](https://medium.com/@bwertz) 
*(*[*here*](http://versionone.vc/data-not-algorithms-is-key-to-machine-learning-success/)
*).*





