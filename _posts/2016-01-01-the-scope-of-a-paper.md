---
layout: post
title: The Scope of a Paper
date: 2016-01-01
categories: [computer science]
tags: [publications]

---

# The Scope of a Paper

To begin a paper, the first task is to *identify your aims*. Write down everything that motivated you to start the research. *What did you want to achieve? What problems did you expect to address? What makes the problems interesting?* Next, define the scope of the work that you plan to write up. To do so, it is necessary to make choices about what to include, and thus it is necessary to identify what *might* be included. Typically, by this stage your research has become focused on investigation of a small number of specific questions, and you have preliminary experimental or theoretical results that suggest what the core contribution of the work is going to be.

You might start, for example, by asking questions such as:

* Which *results* are the most *surprising*?
* What is the one result that other researchers might adopt in *their work*?
* Are the other outcomes independent enough to be published separately later on? Are they interesting enough to justify their being included?
* Does it make sense to explain the new algorithms first, followed by description of the previous algorithms in terms of how they differ from the new work? Or is the contribution of the new work more obvious if the old approaches are described first, to set the context?
* What assumptions or definitions need to be formalized before the main theorem can be presented?
* What is the key background work that has to be discussed?
* Who is the readership? For example, are you writing for specialists in your
area, your examiners, or a general computer science audience?

## A writing-up checklist

* Have you identified your *aims* and *scope*?
* Are you maintaining a *log* and *notebook*?
* Does the paper follow a *narrative*?
* In what forum, or kind of forum, do you plan to publish?
* What other papers should your write-up *resemble*?
* Are you writing to a *well-defined* structure and organization?
* Have you chosen a form for the *argument* and *results*?
* Have you established a *clear connection* between the background, methods, and results?
* How are results being selected for presentation? How do the *results* relate to your *original aims*?
* Have you used any *unusual patterns* of organization? 
* Have the results been *critically analyzed*?
* Are the *requirements* for a thesis met?
* Do you and your co-authors have an *agreed* methodology for *sharing* the work of completing the write-up?

A valuable exercise at this stage is to speculate on the format and scope
of the results. Early in the investigation, decisions will have been made about how the results are to be evaluated—that is, about which measures are to be used to determine whether the research has succeeded or failed. For example, it may be that network congestion is the main respect in which the research is expected to have yielded improvements in performance. But how is network congestion to be measured? As a function of data volume, number of machines, network bandwidth, or something else? Answering this question suggests a form of presentation into which the experimental results can be inserted: a graph, perhaps. The form of this graph can be sketched even before any coding has begun, and doing so identifies the kind of output that the code is required to produce.

Consider a detailed example: an investigation of external sorting in database systems. In this task, a large relation—tens of millions of records, say, constituting several gigabytes—must be sorted on a field specified in a query. An effective sorting method is to sort the relation one block at a time, storing the sorted blocks in a temporary file then merging them to give the final result. Costs include processing time for sorting and merging, transfer time to and from disk, and temporary space requirements. The balance between these costs is governed by available in-memory buffer space, as large blocks are expensive to sort but cheap to merge. The specific research question being investigated is whether disk costs can be reduced by compressing the data while it is sorted.

Speculation about how compression might affect costs suggest how the work should be measured. For small relations, compression seems unlikely to be of help—compressing and then decompressing adds processing costs but does not provide savings if all the data fits in memory. For large relations, on the other hand, the savings due to reduced disk traffic, increased numbers of records per block, and use of less temporary space may be significant. Thus it seems likely that the savings due to compression would increase with the size of relation to be sorted, suggesting use of a graph of data volume against sorting time for fixed block size. Note too that the question of what to measure identifies an implicit assumption: that the data was uncompressed to begin with and is returned uncompressed. All of these decisions and steps help to determine the paper's content.

The content of a paper is to a significant extent determined by the readership. You may be reporting a particular piece of work, but the way it is reported is determined by the characteristics of the audience. For example, a paper on machine learning for computer vision may have entirely different implications for the two fields, and thus different aspects of the results might be emphasized. Also, an expert on vision cannot be assumed to have any experience with machine learning, so the way in which the material is explained to the two readerships must be based on your judgement, in each case, of what is common knowledge and what is unfamiliar. The nature of the audience may even determine the scope of what can be reported.

Making choices about the content of a paper places limits on its scope; these choices identify material to be excluded. Broadly speaking, many research programs are a cycle of innovation and evaluation, with the answers or resolution of one investigation creating the questions that lead to the next. An advance in, say, string sorting might well have implications for integer sorting, and further work could pursue these implications. But at some point it is necessary to stop undertaking new work and write up what has been achieved so far. The new ideas may well be exciting—and less stale than the work that has been preoccupying you for months—but they are likely to be less well understood, and completing the old work is more important than trying to include too many results. If the newer work can be published independently, then write it up separately. A long, complex paper, however big a breakthrough it represents, is hard to referee. From an editor's perspective, accepting such a paper may be difficult to justify if it squeezes out several other contributions.

Another element in the process of developing a paper is deciding where the work might be published. There are many factors that should be considered when making this decision, such as relevance to your topic and how your work measures against the standard for that forum. In particular, the venue partly determines the scope of a paper. For example, is there a page limit? Are there specific conventions to be observed? Are the other papers in that venue primarily theoretical or experimental? What prior knowledge or background is a reader likely to have? Do the editors require that your code be available online? If you select a particular forum but haven’t cited any papers that have appeared there, you may have made the wrong choice.

Once the material for a paper has been collected it has to be organized into a coherent self-contained narrative, which ultimately will form the body of the write-up. Turning this narrative into a write-up involves putting it in the form of an academic paper: including an introduction, a bibliography, and so on. These issues are discussed later.