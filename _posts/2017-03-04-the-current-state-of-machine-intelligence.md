---
layout: post
title: The current state of machine intelligence 3.0
date: 2017-03-04
categories: [computer science]
tags: [machine learning]

---


## Article Source
* Title: [The current state of machine intelligence 3.0](https://www.oreilly.com/ideas/the-current-state-of-machine-intelligence-3-0)
* Authors: Shivon Zilis and James Cham

---




The current state of machine intelligence 3.0 
=============================================

### Watching the appeal and applications of machine intelligence expand.


Almost a year ago, we published our now-annual
[landscape](https://www.oreilly.com/ideas/the-current-state-of-machine-intelligence-2-0)
of machine intelligence companies, and goodness have we seen a lot of
activity since then. This year’s landscape has *a third more companies*
than our first one did two years ago, and it feels even more futile to
try to be comprehensive, since this just scratches the surface of all of
the activity out there.

As has been the case for the last couple of years, our fund still
obsesses over “problem first” machine intelligence—we’ve invested in 35
machine intelligence companies solving 35 meaningful problems in areas
from security to recruiting to software development. (Our fund focuses
on the future of work, so there are some machine intelligence domains
where we invest more than others.)

At the same time, the hype around machine intelligence methods continues
to grow: the words “deep learning” now equally represent a series of
meaningful breakthroughs (wonderful) but also a hyped phrase like “big
data” (not so good!). We care about whether a founder uses the right
method to solve a problem, not the fanciest one. We favor those who
apply technology thoughtfully.

What's the biggest change in the last year? We are getting inbound
inquiries from a different mix of people. For
[v1.0](https://medium.com/@shivon/the-current-state-of-machine-intelligence-f76c20db2fe1#.ei67436b7),
we heard almost exclusively from founders and academics. Then came a
healthy mix of investors, both private and public. Now overwhelmingly we
have heard from existing companies trying to figure out how to transform
their businesses using machine intelligence.

For the first time, *a “one stop shop” of the machine intelligence stack
is coming into view*—even if it’s a year or two off from being neatly
formalized. The maturing of that stack might explain why more
established companies are more focused on building legitimate machine
intelligence capabilities. Anyone who has their wits about them is still
going to be making initial build-and-buy decisions, so we figured an
early attempt at laying out these technologies is better than no
attempt.

[](http://www.shivonzilis.com/)
![machine intelligence
landscape](https://d3ansictanv2wj.cloudfront.net/V-3-MI-Landscape-3.81-1400px-3b7a8a307b1c6a3d2c20c22613e4438f.jpg)

<span class="label">Figure 1. </span>Image courtesy of Shivon Zilis and
James Cham, designed by [Heidi Skinner](http://heidiskinner.com/). (A
larger version can be found [on Shivon Zilis'
website](http://www.shivonzilis.com/).)

Ready player world
------------------

Many of the most impressive looking feats we’ve seen have been in the
gaming world, from DeepMind beating Atari classics and the world’s best
at Go, to the [OpenAI gym](https://gym.openai.com/), which allows anyone
to train intelligent agents across an array of gaming environments.

The gaming world offers a perfect place to start machine intelligence
work (e.g., constrained environments, explicit rewards, easy-to-compare
results, looks impressive)—especially for reinforcement learning. And it
is much easier to have a self-driving car agent go [a trillion
miles](https://blogs.nvidia.com/blog/2016/04/07/toyota-gtc/.) in a
simulated environment than on actual roads. Now we’re seeing the
techniques used to conquer the gaming world moving to the real world. A
newsworthy example of game-tested technology entering the real world was
when DeepMind used neural networks to make Google’s [data centers more
efficient](http://www.theverge.com/2016/7/21/12246258/google-deepmind-ai-data-center-cooling).
This begs questions: What else in the world looks like a game? Or *what
else in the world can we reconfigure to make it look more like a game*?

Early attempts are intriguing. Developers are [dodging meter maids
(brilliant—a modern day Paper
Boy)](https://techcrunch.com/2016/09/11/not-today-satan/), [categorizing
cucumbers](https://cloud.google.com/blog/big-data/2016/08/how-a-japanese-cucumber-farmer-is-using-deep-learning-and-tensorflow),
[sorting
trash](https://techcrunch.com/2016/09/13/auto-trash-sorts-garbage-automatically-at-the-techcrunch-disrupt-hackathon/),
and [recreating the memories of loved ones as conversational
bots](http://www.theverge.com/a/luka-artificial-intelligence-memorial-roman-mazurenko-bot).
Otto’s self-driving trucks [delivering
beer](http://learningenglish.voanews.com/a/self-driving-truck-completes-worlds-first-driverless-shipment-with-load-of-budweiser-beer/3568688.html)
on their first commercial ride even seems like a bonus level from Grand
Theft Auto. We’re excited to see what new creative applications come in
the next year.

Why even bot-her?
-----------------

Ah, the great chatbot explosion of 2016, for better or worse—we liken it
to the mobile app explosion we saw with the launch of iOS and Android.
The dominant platforms (in the machine intelligence case, Facebook,
Slack, Kik) race to get developers to build on their platforms. That
means we’ll get some excellent bots but also many terrible ones—the joys
of public experimentation.

The danger here, unlike the mobile app explosion (where we lacked
expectations for what these widgets could actually do), is that *we
assume anything with a conversation interface will converse with us at
near-human level. Most do not.* This is going to lead to disillusionment
over the course of the next year but it will clean itself up fairly
quickly thereafter.

When our fund looks at this emerging field, we divide each technology
into two components: the conversational interface itself and the “agent”
behind the scenes that’s learning from data and transacting on a user’s
behalf. While you certainly can’t drop the ball on the interface, we
spend almost all our time thinking about that behind-the-scenes agent
and whether it is actually solving a meaningful problem.

We get a lot of questions about whether there will be “one bot to rule
them all.” To be honest, as with many areas at our fund, we disagree on
this. We certainly believe there will not be one *agent* to rule them
all, even if there is one interface to rule them all. For the time
being, bots will be idiot savants: stellar for very specific
applications.

We’ve [written a bit about
this](https://hbr.org/2016/06/machine-intelligence-will-let-us-all-work-like-ceos),
and the framework we use to think about how agents will evolve is a CEO
and her support staff. Many Fortune 500 CEOs employ a scheduler,
handler, a research team, a copy editor, a speechwriter, a personal
shopper, a driver, and a professional coach. Each of these people
performs a dramatically different function and has access to very
different data to do their job. The bot / agent ecosystem will have a
similar separation of responsibilities with very clear winners, and they
will divide fairly cleanly along these lines. (Note that some CEO’s have
a chief of staff who coordinates among all these functions, so perhaps
we will see examples of “one interface to rule them all.”)

You can also see, in our landscape, some of the corporate functions
machine intelligence will re-invent (most often in interfaces other than
conversational bots).

On to 11111000001
-----------------

Successful use of machine intelligence at a large organization is
surprisingly binary, like flipping a stubborn light switch. It’s hard to
do, but once machine intelligence is enabled, an organization sees
everything through the lens of its potential. Organizations like Google,
Facebook, Apple, Microsoft, Amazon, Uber, and Bloomberg (our sole
investor) bet heavily on machine intelligence and have its capabilities
pervasive throughout all of their products.

Other companies are struggling to figure out what to do, as many
boardrooms did on “what to do about the Internet” in 1997. Why is this
so difficult for companies to wrap their heads around? *Machine
intelligence is different from traditional software.* Unlike with big
data, where you could buy a new capability, machine intelligence depends
on deeper organizational and process changes. Companies need to decide
whether they will trust machine intelligence analysis for one-off
decisions or if they will embed often-inscrutable machine intelligence
models in core processes. Teams need to figure out how to test newfound
capabilities, and applications need to change so they offer more than a
system of record; they also need to coach employees and learn from the
data they enter.

Unlike traditional hard-coded software, machine intelligence gives only
probabilistic outputs. We want to ask machine intelligence to make
subjective decisions based on imperfect information (eerily like what we
trust our colleagues to do?). As a result, this new machine intelligence
software will make mistakes, just like we do, and we’ll need to be
thoughtful about when to trust it and when not to.

The idea of this new machine trust is daunting and makes machine
intelligence harder to adopt than traditional software. We’ve had a few
people tell us that the biggest predictor of whether a company will
successfully adopt machine intelligence is whether they have a C-Suite
executive with an advanced math degree. These executives understand it
isn’t magic—it is just (hard) math.

Machine intelligence business models are going to be different from
licensed and subscription software, but we don't know how. Unlike
traditional software, we still lack frameworks for management to decide
where to deploy machine intelligence. Economists like Ajay Agrawal,
Joshua Gans, and Avi Goldfarb have taken the [first steps toward helping
managers understand the economics of machine
intelligence](http://bit.ly/economics-of-AI) and predict where it will
be most effective. But there is still a lot of work to be done.

In the next few years, the danger here isn’t what we see in dystopian
sci-fi movies. The real danger of machine intelligence is that
*executives will make bad decisions about what machine intelligence
capabilities to build*.

Peter Pan's never-never land
----------------------------

We’ve been wondering about the path to grow into a large machine
intelligence company. Unsurprisingly, there have been many machine
intelligence acquisitions (Nervana by Intel, Magic Pony by Twitter, Turi
by Apple, Metamind by Salesforce, Otto by Uber, Cruise by GM,
SalesPredict by Ebay, Viv by Samsung). Many of these happened fairly
early in a company’s life and at quite a high price. Why is that?

Established companies struggle to understand machine intelligence
technology, so it’s painful to sell to them, and the market for buyers
who can use this technology in a self-service way is small. Then, if you
do understand how this technology can supercharge your organization, you
realize it’s so valuable that you want to hoard it. Businesses are
saying to machine intelligence companies, “forget you selling this
technology to others, I’m going to buy the whole thing.”

This absence of a market today makes it difficult for a machine
intelligence startup, especially horizontal technology providers, to
“grow up”—hence the Peter Pans. *Companies we see successfully entering
a long-term trajectory can package their technology as a new
problem-specific application for enterprise or simply transform an
industry themselves as a new entrant* (love this). We flagged a few of
the industry categories where we believe startups might “go the
distance” in this year’s landscape.

Inspirational machine intelligence
----------------------------------

Once we do figure it out, machine intelligence can solve much more
interesting problems than traditional software. We’re thrilled to see so
many smart people applying machine intelligence for good.

Established players like [Conservation
Metrics](http://conservationmetrics.com/category/news/) and [Vulcan
Conservation](http://www.vulcan.com/areas-of-practice/philanthropy/key-initiatives/conservation)
have been using deep learning to protect endangered animal species; the
ever-inspiring team at [Thorn](https://www.wearethorn.org/) is
constantly coming up with creative algorithmic techniques to protect our
children from online exploitation. The philanthropic arms of the tech
titans joined in, enabling nonprofits with free storage, compute, and
even developer time. Google partnered with nonprofits to found [Global
Fishing Watch](http://globalfishingwatch.org/) to detect illegal fishing
activity using satellite data in near real time, satellite intelligence
startup [Orbital Insight](https://orbitalinsight.com/) (in which we are
investors) partnered with [Global Forest
Watch](http://www.globalforestwatch.org/) to detect illegal logging and
other causes of global forest degradation. Startups are getting into the
action, too. The [Creative Destruction
Lab](https://www.creativedestructionlab.com/) machine intelligence
accelerator (with whom we work closely) has companies working on
problems like earlier [disease](http://www.deepgenomics.com/)
[detection](http://www.winterlightlabs.com/) and
[injury](http://www.rightbluelabs.com/)
[prevention](http://www.plantiga.com/). One area where we have seen some
activity but would love to see more is machine intelligence to [assist
the elderly](http://www.intuitionrobotics.com/).

In talking to many people using machine intelligence for good, they all
cite the critical role of open source technologies. In the last year,
we’ve seen the launch of [OpenAI](https://openai.com/blog/), which
offers everyone access to world class research and environments, and
better and better releases of TensorFlow and Keras. Non-profits are
always trying to do more with less, and machine intelligence has allowed
them to extend the scope of their missions without extending budget.
Algorithms allow non-profits to inexpensively scale what would not be
affordable to do with people.

We also saw growth in universities and corporate think tanks, where new
centers like [USC’s Center for AI in Society](http://cais.usc.edu/),
[Berkeley’s Center for Human Compatible
AI](http://www.goodventures.org/our-portfolio/grants/uc-berkeley-center-for-human-compatible-ai),
and the multiple-corporation [Partnership on
AI](https://www.partnershiponai.org/) study the ways in which machine
intelligence can help humanity. The White House even got into the act:
after a [series of
workshops](https://www.whitehouse.gov/blog/2016/05/03/preparing-future-artificial-intelligence)
around the U.S., they published a [48-page
report](https://www.whitehouse.gov/blog/2016/05/03/preparing-future-artificial-intelligence)
outlining their recommendations for applying machine intelligence to
safely and fairly address broad social problems.

On a lighter note, we’ve also heard whispers of more artisanal versions
of machine intelligence. Folks are doing things like using computer
vision algorithms to help them choose the best cocoa beans for
high-grade chocolate, [write
poetry](http://www.creativeai.net/posts/bN4vEfMiXCodw3Ry3/wavenet-for-poem-generation-preliminary-results),
cook steaks, and generate
[musicals](https://www.theguardian.com/stage/2015/dec/01/beyond-the-fence-computer-generated-musical-greenham-common).

Curious minds want to know. If you’re working on a unique or important
application of machine intelligence we’d love to hear from you.

Looking forward
---------------

We see all this activity only continuing to accelerate. The world will
give us more open sourced and commercially available machine
intelligence building blocks, there will be more data, there will be
more people interested in learning these methods, and there will always
be problems worth solving. We still need ways of explaining the
difference between machine intelligence and traditional software, and
we’re working on that. The value of code is different from data, but
what about the value of the model that code improves based on that data?

Once we understand machine intelligence deeply, we might look back on
the era of traditional software and think it was just a prologue to
what’s happening now. We look forward to seeing what the next year
brings.

Thank Yous
----------

A massive thank you to the Bloomberg Beta team, David Klein, Adam
Gibson, Ajay Agrawal, Alexandra Suich, Angela Tranyens, Anthony
Goldblum, Avi Goldfarb, Beau Cronin, Ben Lorica, Chris Nicholson, Doug
Fulop, Dror Berman, Dylan Tweney, Gary Kazantsev, Gideon Mann, Gordon
Ritter, Jack Clark, John Lilly, Jon Lehr, Joshua Gans, Matt Turck,
Matthew Granade, Mickey Graham, Nick Adams, Roger Magoulas, Sean
Gourley, Shruti Gandhi, Steve Jurvetson, Vijay Sundaram, Zavain Dar, and
for the help and fascinating conversations that led to this year’s
report!

Landscape designed by [Heidi Skinner](http://heidiskinner.com/).

*Disclosure: Bloomberg Beta is an investor in Alation, Arimo, Aviso,
Brightfunnel, Context Relevant, Deep Genomics, Diffbot, Digital Genius,
Domino Data Labs, Drawbridge, Gigster, Gradescope, Graphistry,
Gridspace, Howdy, Kaggle, Kindred.ai, Mavrx, Motiva, PopUpArchive,
Primer, Sapho, Shield.AI, Textio, and Tule.*

