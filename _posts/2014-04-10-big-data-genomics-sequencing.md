---
layout: post
title: Big Data Genomics Sequencing
date: 2014-04-10
categories: [computer science]
tags: [big data, big data, tez]

---

Big Data Genomics Sequencing
============================

The University of North Carolina at Chapel Hill is using big data to find better treatments for patients through genomic sequencing technologies
------------------------------------------------------------------------------------------------------------------------------------------------

### Charles Schmitt, Director of Informatics and Data Sciences at RENCI, UNC

![charles-schmitt.jpg](http://sungsoo.github.com/images/charles-schmitt.jpg)  
*Charles Schmitt*  
“*The Hadoop system allows us to perform very custom analysis that you wouldn’t find in a traditional business intelligence tool or that would work in a SQL relational type of structure.*”

**The University of North Carolina at Chapel Hill (UNC) decided to
invest heavily in genomics sequencing technologies, both to support the
clinical-care mission of its healthcare system and to further basic
genomic and biology research. This institution-wide initiative is a
data-intensive undertaking that requires managing and analyzing hundreds
to thousands of individual genomes to fit the different needs of
clinicians and researchers.**

To address this big data challenge, we use a three-stage process. It
starts in the wet lab, where a patient’s tissue is collected. Then a
combination of 11 production high-throughput genomics sequencers, made
by Illumina and Pacific Biosciences, generate hundreds of millions of
short DNA sequences for each patient. With that data, researchers use
parallelized computational workflows to reassemble the genome and
perform quality control on the reassembly—fixing errors in the
reassembly.

Once the genomes are pulled together, our second stage detects
variations for an individual, often using large patient populations to
help resolve ambiguities in the individual’s sequence data. This data is
organized into a hybrid solution that uses a relational database to
store canonical variations, high-performance file systems to hold data,
and a Hadoop\*-based approach for data-intensive analysis. Links to
public domain and private databases help researchers identify the impact
of variations on protein formation, whether the variants are known to be
associated with clinically relevant conditions, and other known
characteristics of the variation.

The final step is the report to the physicians—the third stage of the
process. Key to this stage is a process termed “clinical binning” that
is performed using a custom-made piece of software that UNC has
developed. This assigns a clinical relevancy to every one of the
variants, allowing clinicians and patients to determine the types of
variants they care about. Once variants are binned, we have a web site
that delivers the information on the individual to his or her
physicians. This stage also manages the overall process, from blood-draw
to analysis to reporting, including several stages that provide
independent validation of the identified variants.

Our solution relies on a large commodity cluster that uses 50
Intel®-processor-based blade servers processing up to 30 genomes a week.
Right now, we have about 200 to 300 terabytes of genomic data on a large
EMC Isilon\* data system.

The management of genomic data is orchestrated through a UNC-based data
grid technology called Enterprise iRODS\*. Security for sensitive
genomic and patient data is provided by the UNC-built Secure Medical
Workspace\* technology.

The Hadoop system allows us to perform very custom analysis that you
wouldn’t find in a traditional business intelligence tool or that would
work in a SQL\* relational type of structure. Our analyses amend well to
a MapReduce\* structure. The other issue is that tests with databases
that use extract, transform, load (ETL) take an incredibly long time
with that much data. With Hadoop there’s no ETL; we just add a file into
the system.

We’ve learned a lot about big data analytics. For example, we made
investments in a few technologies that were designed to provide
flexibility in running workflows on different computational
clusters—before we knew what we really required. Instead, we would have
been better off by focusing on tailoring our specific analytics needs
for our existing infrastructure. But this is always a challenging
balance to make.

The thing we did best was staying agile in our processes and being
flexible in our technical approaches. After all, genomics sequencing is
such a new technology, and things are changing rapidly. The questions
that people are asking today are changing just as rapidly, so the
informatics solutions have to be similarly adjustable.

# References
[1] Charles Schmitt, [*Big Data Genomics Sequencing*](http://www.intel.com/content/www/us/en/big-data/renci-peer-story.html), Intel Big Data Blog.