---
layout: post
title: 5 technologies that will help big data cross the chasm
date: 2014-05-11
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [5 technologies that will help big data cross the chasm](https://gigaom.com/2014/05/06/5-technologies-that-will-help-big-data-cross-the-chasm/)
* Authors:  [Derrick
Harris](https://gigaom.com/author/dharrisstructure/ "Posts by Derrick Harris")


[![](http://sungsoo.github.com/images/five-tech.png)](http://sungsoo.github.com/images/five-tech.png)

# Summary:

Big data has been a buzzword for years, but it’s a lot more than just
buzz. There are now so many tools and technologies for creating,
collecting and analyzing data that almost anything is possible if you
know where to look.

![Photo by
bestdesigns/Thinkstock](https://gigaom2.files.wordpress.com/2014/05/476812603.jpg?w=300&h=200&crop=1)

photo: [bestdesigns /
Thinkstock](http://www.thinkstockphotos.com/image/stock-photo-vast-binary-code-sea/476812603/popup?sq=data%20sea/f=CPIHVX/s=Popularity "bestdesigns / Thinkstock")

We’re on the cusp of a real turning point for big data. Its applications
are becoming clearer, its tools are getting easier and its architectures
are maturing in a hurry. It’s no longer just about log files,
clickstreams and tweets. It’s not just about Hadoop and what’s possible
(or not) with MapReduce.

With each passing day, big data is becoming more about creativity — if
someone can think of an application, they can probably build it. That
makes the concept of big data a lot more tangible and a lot more useful
to a lot more companies, and it makes the market for big data a lot more
lucrative.

Here are five technologies helping spur a shift in thinking from “Why
would I want to use some technology that Yahoo built? And how?” to “We
have problem that needs solving. Let’s find the right tool to solve it.”

# Apache Spark

When it comes to open source big data projects, [they don’t get
much hotter than Apache
Spark](https://gigaom.com/2014/02/27/as-mapreduce-fades-apache-spark-is-now-a-top-level-project/).
The data-processing framework is garnering a lot of users and a lot of
supporters — including from Hadoop vendors
[MapR](https://gigaom.com/2014/04/10/spark-is-now-part-of-maprs-hadoop-distro-too/)
and
[Cloudera](https://gigaom.com/2013/10/28/spark-is-a-really-big-deal-for-big-data-and-cloudera-gets-it/)
— because it promises to be almost everything for Hadoop deployments
(arguably the foundation of most enterprise big data environments) that
MapReduce wasn’t. It’s fast, it’s easy to program and it’s flexible.

Right now, Spark is getting a lot of attention as an engine for
machine-learning workloads — for example, [Cloudera
Oryx](https://gigaom.com/2014/02/28/cloudera-is-rebuilding-machine-learning-for-hadoop-with-oryx/)
and [even Apache
Mahout](https://gigaom.com/2014/03/27/apache-mahout-hadoops-original-machine-learning-project-is-moving-on-from-mapreduce/)
are porting their code bases to Spark — [as well as for interactive
queries](https://amplab.cs.berkeley.edu/benchmark/) and [data
analysis](https://gigaom.com/2014/03/31/next-generation-bi-startup-clearstory-raises-21m/).
As the project’s community grows, the list of target workloads should
expand, as well.

[![Source:
Databricks](https://gigaom2.files.wordpress.com/2014/05/spark-stack-new.png?w=708&h=297)](https://gigaom2.files.wordpress.com/2014/05/spark-stack-new.png)

Source: Databricks

Spark’s popularity is aided by the YARN resource manager for Hadoop and
the [Apache Mesos cluster-management
software](https://gigaom.com/2014/02/20/mesosphere-thinks-everyones-servers-should-run-like-twitters-do-and-its-here-to-help/),
both of which make it possible to run Spark, MapReduce and other
processing engines on the same cluster using the same Hadoop storage
layer. I wrote in 2012 about the move away from MapReduce as [one of
five big trends helping us rethink big
data](https://gigaom.com/2012/11/03/5-trends-that-are-changing-how-we-do-big-data/),
and Spark has stepped up as the biggest part of that migration.

# Cloud computing


This might seem obvious — we’ve been [talking about the convergence of
cloud computing and big data for
years](https://gigaom.com/2011/04/20/big-data-is-on-a-collision-course-with-the-cloud/)
— but cloud computing offerings have advanced significantly in the just
the past year. There are [bigger, faster and ever-cheaper raw compute
options](https://gigaom.com/2014/04/25/more-evidence-that-scale-is-the-name-of-the-game-in-cloud-computing/),
many offering high memory capacity, solid-state drives or even GPUs. All
of this makes it much easier, and much more economically feasible, to
run myriad types of data-processing workloads in the cloud.

The market for managed Hadoop and database services [continues to
grow](https://gigaom.com/2013/06/13/ex-yahoo-cto-launches-altiscale-hardcore-hadoop-as-a-service/),
as well as the market for analytics services. They’re quickly adding new
capabilities and, as the technologies underpinning them
advance, [they’re becoming faster and more
scalable](https://gigaom.com/2013/03/14/google-bigquery-is-now-even-bigger/).

[![Amazon CTO Werner Vogels announcing Kinesis in
November.](https://gigaom2.files.wordpress.com/2013/11/kinesis2.png?w=708)](https://gigaom2.files.wordpress.com/2013/11/kinesis2.png)

Amazon CTO Werner Vogels announcing Kinesis in November.

Cloud providers are also targeting emerging use cases, such as stream
processing, the internet of things and artificial intelligence. Amazon
Web Services [offers a service called
Kinesis](https://gigaom.com/2013/12/17/amazons-streaming-data-service-kinesis-is-now-available/)
for processing data as it crosses the wire. Microsoft is [previewing a
service designed specifically to capture and store
data](https://gigaom.com/2014/04/15/microsoft-is-trying-to-be-the-platform-company-for-big-data-apps-too/)streaming
off of sensors. A handful of vendors, including
[IBM](https://gigaom.com/2013/11/14/have-at-it-programmers-ibm-makes-watson-available-via-api/),
[Expect
Labs](https://gigaom.com/2014/02/19/more-ai-for-developers-as-expect-labs-releases-the-mindmeld-api/)
and
[AlchemyAPI](https://gigaom.com/2013/09/19/alchemyapi-says-its-delivering-google-level-deep-learning-as-a-service/)
are providing various flavors of artificial intelligence via API,
meaning developers can build intelligent applications without first
mastering machine learning.

We’ll talk a lot more about the future of cloud computing at out
[Structure
conference](http://events.gigaom.com/structure-2014?utm_source=data&utm_medium=editorial&utm_campaign=intext&utm_term=839569+5-technologies-that-will-help-big-data-cross-the-chasm&utm_content=dharrisstructure)
June 18 and 19 in San Francisco. Speakers include Amazon CTO Werner
Vogels, Google SVP and Technical Fellow Urs Hölzle, and Microsoft EVP
Scott Guthrie. Also, Airbnb VP Mike Curtis will discuss how that company
runs big data workloads in the cloud, and New York Times Chief Data
Scientist Chris Wiggins will talk about the newspaper’s work in machine
learning.

# Sensors


A lot of talk about sensors focuses on the volume and speed at which
they generate data, but what’s often ignored is the strategic decisions
that go into choosing the right sensors to gather the *right* data. If
there’s are real-world measurements that need to be taken, or events
that need to be logged, there’s probably a fairly inexpensive sensor
available to do the job. Sensors [are integral to smarter
cars](https://gigaom.com/2013/12/20/put-a-computer-in-your-tank-fuel-fingerprints-mean-smarter-car-engines/),
of course, but also to everything from
[agriculture](https://gigaom.com/2014/04/08/meet-the-minnesota-company-pulling-petabytes-of-data-from-the-field/)
to [hospital
sanitation](https://gigaom.com/2014/03/04/why-the-internet-of-things-is-big-datas-latest-killer-app-if-you-do-it-right/).

And if there’s not a usable sensor commercially available, it’s not
inconceivable to build one from scratch. A team of university
researchers, for example, [built a cheap sensor to measures the wing
speed of
insects](https://gigaom.com/2014/04/29/scientists-created-a-cheap-accurate-way-to-identify-insects-and-wrote-a-great-big-data-explainer-in-the-process/)
using a cheap laser pointer and digital recorder. It helped them capture
more, better data than previous researchers, resulting in a
significantly more-accurate model for classifying bugs.

[![The setup used to measure the insects'
data.](https://gigaom2.files.wordpress.com/2014/04/setup.jpg?w=708&h=349)](https://gigaom2.files.wordpress.com/2014/04/setup.jpg)

The setup used to measure the insects’ data.

That type of creativity highlights what’s possible thanks to the
convergence of sensors, consumer electronics, big data, and, presumably,
the maker movement and 3-D printing. If more, different and better data
will lead to better analysis, [it’s easier than ever to collect it
yourself](https://gigaom.com/2014/02/14/when-everything-is-data-theres-opportunity-in-everything/)rather
than wait for someone else to do it.

# Artificial intelligence


Thanks to the proliferation of data in the form of photos, videos,
speech and text, there’s now an incredible amount of effort going into
building algorithms and systems that can help computers understand those
inputs. From a big data perspective, the interesting thing about these
approaches — whether they’re called [deep
learning](https://gigaom.com/2013/11/01/the-gigaom-guide-to-deep-learning-whos-doing-it-and-why-it-matters/),
[cognitive
computing](https://gigaom.com/2013/10/03/ibm-brings-in-academic-superstars-to-move-cognitive-computing-beyond-watson/)
or some other flavor of artificial intelligence —  is that they’re not
yet really about analytics in the same way so many other big data
projects are.

AI researchers aren’t so concerned — yet — with uncovering trends or
finding the needle in the haystack as they are with automating tasks
that humans can already do. The big difference, of course, is that, done
right, the systems [can perform tasks such as object or facial
recognition](https://gigaom.com/2014/03/18/facebook-shows-off-its-deep-learning-skills-with-deepface/),
or [text
analysis](https://gigaom.com/2014/05/02/darpa-is-working-on-its-own-deep-learning-project-for-natural-language-processing/),
much faster and at a much greater scale than humans can. As they get
more accurate and require less training, these systems could power
everything from intelligent ad platforms to much smarter self-driving
cars.

<iframe width="600" height="400" src="//www.youtube.com/embed/I9blbxoa5mk" frameborder="0" allowfullscreen></iframe>

Remarkably, the techniques for doing all this stuff are [being
democratized at rapid
clip](https://gigaom.com/2014/04/24/democratizing-deep-learning-with-an-iphone-app-and-open-source-sdk/)
and will soon be accessible to a lot more people via software, open
source libraries and even APIs. Google and Facebook are [spending
hundreds of millions of
dollars](https://gigaom.com/2014/01/29/google-isnt-the-only-company-working-on-artificial-intelligence-its-just-the-richest/)
advancing the state of the art in AI, but anyone brave enough to give it
a whirl can get their hands on similar capabilities for very little
money, if not free.

# Quantum computing


Commercial quantum computing is still a way off, but we can already see
what might be possible when it arrives. According to D-Wave Systems, the
company that has sold prototype versions of its quantum computer to
Google, NASA and Lockheed Martin, [it’s particularly good at advanced
machine learning tasks and difficult optimization
problems](https://gigaom.com/2013/10/11/google-nasa-explain-quantum-computing-and-making-mincemeat-of-big-data/).
Google is testing out computer vision algorithms that could eventually
run on smartphones; Lockheed is trying to improve software validation
for flight systems.

<iframe width="600" height="400" src="//www.youtube.com/embed/9PUgZykQowE" frameborder="0" allowfullscreen></iframe>

It’s powerful stuff that could help companies of all stripes solve some
difficult computing and analytic tasks that today’s most-advanced
systems and techniques can’t. Or, at least, quantum computing should be
able to solve those problems faster and more efficiently.

Before that can happen, though, mainstream businesses will need access
to quantum resources and some knowledge in how to use them. D-Wave is
[vowing to make the resources available via the
cloud](https://gigaom.com/2014/01/31/leave-the-absolute-zero-to-nasa-your-quantum-computer-will-be-in-the-cloud/),
and is working on compilers to simplify the programming aspect. There’s
a lot of ground to cover before that happens, but [the technology is
moving
fas](https://gigaom.com/2014/03/19/quantum-computers-will-leave-moores-law-far-far-behind/)t
and quantum computer instances delivered via the Amazon Web Services or
Google clouds isn’t out of the realm of possibility.

# Related research 

-   [What you missed in cloud in the third quarter of
    2013](http://research.gigaom.com/report/cloud-and-data-third-quarter-2013-analysis-and-outlook/?utm_source=data&utm_medium=editorial&utm_campaign=auto3&utm_term=839569+5-technologies-that-will-help-big-data-cross-the-chasm&utm_content=dharrisstructure "Permanent Link to What you missed in cloud in the third quarter of 2013")
    October 2013
-   [Cloud and data first-quarter 2013: analysis and
    outlook](http://research.gigaom.com/report/cloud-and-data-first-quarter-2013-analysis-and-outlook/?utm_source=data&utm_medium=editorial&utm_campaign=auto3&utm_term=839569+5-technologies-that-will-help-big-data-cross-the-chasm&utm_content=dharrisstructure "Permanent Link to Cloud and data first-quarter 2013: analysis and outlook")
    April 2013
-   [Why we must apply big data analytics to human-generated
    data](http://research.gigaom.com/report/applying-big-data-analytics-to-human-generated-data/?utm_source=data&utm_medium=editorial&utm_campaign=auto3&utm_term=839569+5-technologies-that-will-help-big-data-cross-the-chasm&utm_content=dharrisstructure "Permanent Link to Why we must apply big data analytics to human-generated data")
    January 2014

