---
layout: post
title: Intro to Large Language Models
date: 2024-01-15
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source

* [Intro to Large Language Models](https://www.youtube.com/watch?v=zjkBMFhNj_g)

---

# Intro to Large Language Models

## Abstract

This is a 1 hour general-audience introduction to Large Language Models: the core technical component behind systems like ChatGPT, Claude, and Bard. What they are, where they are headed, comparisons and analogies to present-day operating systems, and some of the security-related challenges of this new computing paradigm.
As of November 2023 (this field moves fast!).

Context: This video is based on the slides of a talk I gave recently at the AI Security Summit. The talk was not recorded but a lot of people came to me after and told me they liked it. Seeing as I had already put in one long weekend of work to make the slides, I decided to just tune them a bit, record this round 2 of the talk and upload it here on YouTube. Pardon the random background, that's my hotel room during the thanksgiving break.

- Slides as PDF: [https://drive.google.com/file/d/1pxx_ZI7O-Nwl7ZLNk5hI3WzAsTLwvNU7/view](https://drive.google.com/file/d/1pxx_ZI7O-Nwl7ZLNk5hI3WzAsTLwvNU7/view) (42MB)
- Slides. as Keynote: [https://drive.google.com/file/d/1FPUpFMiCkMRKPFjhi9MAhby68MHVqe8u/view](https://drive.google.com/file/d/1FPUpFMiCkMRKPFjhi9MAhby68MHVqe8u/view) (140MB)


<iframe width="600" height="400" src="https://www.youtube.com/embed/zjkBMFhNj_g?si=Mev_w1nyl3ok5fYW" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

Few things I wish I said (I'll add items here as they come up):
- The dreams and hallucinations do not get fixed with finetuning. Finetuning just "directs" the dreams into "helpful assistant dreams". Always be careful with what LLMs tell you, especially if they are telling you something from memory alone. That said, similar to a human, if the LLM used browsing or retrieval and the answer made its way into the "working memory" of its context window, you can trust the LLM a bit more to process that information into the final answer. But TLDR right now, do not trust what LLMs say or do. For example, in the tools section, I'd always recommend double-checking the math/code the LLM did.
- How does the LLM use a tool like the browser? It emits special words, e.g. |BROWSER|. When the code "above" that is inferencing the LLM detects these words it captures the output that follows, sends it off to a tool, comes back with the result and continues the generation. How does the LLM know to emit these special words? Finetuning datasets teach it how and when to browse, by example. And/or the instructions for tool use can also be automatically placed in the context window (in the “system message”).
- You might also enjoy my 2015 blog post "Unreasonable Effectiveness of Recurrent Neural Networks". The way we obtain base models today is pretty much identical on a high level, except the RNN is swapped for a Transformer. [https://karpathy.github.io/2015/05/21/rnn-effectiveness/](https://karpathy.github.io/2015/05/21/rnn-effectiveness/)
- What is in the run.c file? A bit more full-featured 1000-line version hre: [https://github.com/karpathy/llama2.c/blob/master/run.c](https://github.com/karpathy/llama2.c/blob/master/run.c)