---
layout: post
title: Parallel Computing Overview
date: 2014-03-29
categories: [computer science]
tags: [parallel computing]

---


# Parallel Computing


**Parallel computing** is a form of
[computation](http://en.wikipedia.org/wiki/Computing "Computing") in which many calculations
are carried out simultaneously,[[1]](#cite_note-1) operating on the
principle that large problems can often be divided into smaller ones,
which are then solved
[concurrently](http://en.wikipedia.org/wiki/Concurrency_(computer_science) "Concurrency (computer science)")
("in parallel"). There are several different forms of parallel
computing:
[bit-level](http://en.wikipedia.org/wiki/Bit-level_parallelism "Bit-level parallelism"),
[instruction
level](http://en.wikipedia.org/wiki/Instruction_level_parallelism "Instruction level parallelism"),
[data](http://en.wikipedia.org/wiki/Data_parallelism "Data parallelism"), and [task
parallelism](http://en.wikipedia.org/wiki/Task_parallelism "Task parallelism"). Parallelism has
been employed for many years, mainly in [high-performance
computing](http://en.wikipedia.org/wiki/High_performance_computing "High performance computing"),
but interest in it has grown lately due to the physical constraints
preventing [frequency
scaling](http://en.wikipedia.org/wiki/Frequency_scaling "Frequency scaling").[[2]](#cite_note-2)
As power consumption (and consequently heat generation) by computers has
become a concern in recent years,[[3]](#cite_note-3) parallel
computing has become the dominant paradigm in [computer
architecture](http://en.wikipedia.org/wiki/Computer_architecture "Computer architecture"),
mainly in the form of [multi-core
processors](http://en.wikipedia.org/wiki/Multi-core_processor "Multi-core processor").[[4]](#cite_note-View-Power-4)

Parallel computers can be roughly classified according to the level at
which the hardware supports parallelism, with
[multi-core](http://en.wikipedia.org/wiki/Multi-core "Multi-core") and
[multi-processor](http://en.wikipedia.org/wiki/Symmetric_multiprocessing "Symmetric multiprocessing")
computers having multiple processing elements within a single machine,
while [clusters](http://en.wikipedia.org/wiki/Computer_cluster "Computer cluster"),
[MPPs](http://en.wikipedia.org/wiki/Massively_parallel_(computing) "Massively parallel (computing)"),
and [grids](http://en.wikipedia.org/wiki/Grid_computing "Grid computing") use multiple
computers to work on the same task. Specialized parallel computer
architectures are sometimes used alongside traditional processors, for
accelerating specific tasks.

[Parallel computer
programs](http://en.wikipedia.org/wiki/Parallel_algorithm "Parallel algorithm") are more
difficult to write than sequential ones,[[5]](#cite_note-5) because
concurrency introduces several new classes of potential [software
bugs](http://en.wikipedia.org/wiki/Software_bug "Software bug"), of which [race
conditions](http://en.wikipedia.org/wiki/Race_condition "Race condition") are the most common.
[Communication](http://en.wikipedia.org/wiki/Computer_networking "Computer networking") and
[synchronization](http://en.wikipedia.org/wiki/Synchronization_(computer_science) "Synchronization (computer science)")
between the different subtasks are typically some of the greatest
obstacles to getting good parallel program performance.

The maximum possible [speed-up](http://en.wikipedia.org/wiki/Speedup "Speedup") of a single
program as a result of parallelization is known as [Amdahl's
law](http://en.wikipedia.org/wiki/Amdahl%27s_law "Amdahl's law").


References
----------

1.  **[\](#cite_ref-1)** Gottlieb, Allan; Almasi, George S. (1989).
    [*Highly parallel
    computing*](http://dl.acm.org/citation.cfm?id=160438). Redwood City,
    Calif.: Benjamin/Cummings.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [0-8053-0177-1](http://en.wikipedia.org/wiki/Special:BookSources/0-8053-0177-1 "Special:BookSources/0-8053-0177-1"). 
    Cite uses deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"))
2.  **[\](#cite_ref-2)** S.V. Adve et al. (November 2008). ["Parallel
    Computing Research at Illinois: The UPCRC
    Agenda"](http://www.upcrc.illinois.edu/documents/UPCRC_Whitepaper.pdf)
    (PDF). Parallel@Illinois, University of Illinois at
    Urbana-Champaign. "The main techniques for these performance
    benefits – increased clock frequency and smarter but increasingly
    complex architectures – are now hitting the so-called power wall.
    The computer industry has accepted that future performance increases
    must largely come from increasing the number of processors (or
    cores) on a die, rather than making a single core go faster."
3.  **[\](#cite_ref-3)** Asanovic et al. Old [conventional wisdom]:
    Power is free, but transistors are expensive. New [conventional
    wisdom] is [that] power is expensive, but transistors are "free".
4.  **[\](#cite_ref-View-Power_4-0)** Asanovic, Krste et al. (December
    18, 2006). ["The Landscape of Parallel Computing Research: A View
    from
    Berkeley"](http://www.eecs.berkeley.edu/Pubs/TechRpts/2006/EECS-2006-183.pdf)
    (PDF). University of California, Berkeley. Technical Report No.
    UCB/EECS-2006-183. "Old [conventional wisdom]: Increasing clock
    frequency is the primary method of improving processor performance.
    New [conventional wisdom]: Increasing parallelism is the primary
    method of improving processor performance ... Even representatives
    from Intel, a company generally associated with the 'higher
    clock-speed is better' position, warned that traditional approaches
    to maximizing performance through maximizing clock speed have been
    pushed to their limit."
5.  **[\](#cite_ref-5)** Hennessy, John L.; Patterson, David A., Larus,
    James R. (1999). *Computer organization and design : the
    hardware/software interface* (2. ed., 3rd print. ed.). San
    Francisco: Kaufmann.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [1-55860-428-6](http://en.wikipedia.org/wiki/Special:BookSources/1-55860-428-6 "Special:BookSources/1-55860-428-6"). 
    Cite uses deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"))
6.  \ [***a***](#cite_ref-llnltut_6-0)
    [***b***](#cite_ref-llnltut_6-1) Barney, Blaise. ["Introduction to
    Parallel
    Computing"](http://www.llnl.gov/computing/tutorials/parallel_comp/).
    Lawrence Livermore National Laboratory. Retrieved 2007-11-09. 
7.  **[\](#cite_ref-7)** Hennessy, John L.; Patterson, David A. (2002).
    *Computer architecture / a quantitative approach.* (3rd ed.). San
    Francisco, Calif.: International Thomson. p. 43.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [1-55860-724-2](http://en.wikipedia.org/wiki/Special:BookSources/1-55860-724-2 "Special:BookSources/1-55860-724-2"). 
    Cite uses deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"))
8.  **[\](#cite_ref-8)** Rabaey, Jan M. (1996). *Digital integrated
    circuits : a design perspective*. Upper Saddle River, N.J.:
    Prentice-Hall. p. 235.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [0-13-178609-1](http://en.wikipedia.org/wiki/Special:BookSources/0-13-178609-1 "Special:BookSources/0-13-178609-1"). 
9.  **[\](#cite_ref-9)** Flynn, Laurie J. (8 May 2004). ["Intel Halts
    Development Of 2 New
    Microprocessors"](http://www.nytimes.com/2004/05/08/business/08chip.html?ex=1399348800&en=98cc44ca97b1a562&ei=5007).
    *New York Times*. Retrieved 5 June 2012. 
10. **[\](#cite_ref-Moore1965paper_10-0)** Moore, Gordon E. (1965).
    ["Cramming more components onto integrated
    circuits"](ftp://download.intel.com/museum/Moores_Law/Articles-Press_Releases/Gordon_Moore_1965_Article.pdf)
    (PDF). *[Electronics
    Magazine](http://en.wikipedia.org/wiki/Electronics_(magazine) "Electronics (magazine)")*.
    p. 4. Retrieved 2006-11-11. 
11. **[\](#cite_ref-11)** Amdahl, Gene M. (1967). ["Validity of the
    single processor approach to achieving large scale computing
    capabilities"](http://dl.acm.org/citation.cfm?id=160438).
    *Proceeding AFIPS '67 (Spring) Proceedings of the April 18–20, 1967,
    spring joint computer conference*: 483–485.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1145/1465482.1465560](http://dx.doi.org/10.1145%2F1465482.1465560). 
12. **[\](#cite_ref-12)** Brooks, Frederick P. (1996). *The mythical
    man month essays on software engineering* (Anniversary ed., repr.
    with corr., 5. [Dr.] ed.). Reading, Mass. [u.a.]: Addison-Wesley.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [0-201-83595-9](http://en.wikipedia.org/wiki/Special:BookSources/0-201-83595-9 "Special:BookSources/0-201-83595-9"). 
13. **[\](#cite_ref-13)** Gustafson, John L. (May 1988). ["Reevaluating
    Amdahl's
    law"](http://www.scl.ameslab.gov/Publications/Gus/AmdahlsLaw/Amdahls.html).
    *Communications of the ACM* **31** (5): 532–533.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1145/42411.42415](http://dx.doi.org/10.1145%2F42411.42415). 
14. **[\](#cite_ref-14)** Bernstein, A. J. (1 October 1966). "Analysis
    of Programs for Parallel Processing". *IEEE Transactions on
    Electronic Computers*. EC-15 (5): 757–763.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1109/PGEC.1966.264565](http://dx.doi.org/10.1109%2FPGEC.1966.264565). 
15. **[\](#cite_ref-15)** Roosta, Seyed H. (2000). *Parallel processing
    and parallel algorithms : theory and computation*. New York, NY
    [u.a.]: Springer. p. 114.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [0-387-98716-9](http://en.wikipedia.org/wiki/Special:BookSources/0-387-98716-9 "Special:BookSources/0-387-98716-9"). 
16. **[\](#cite_ref-16)** Lamport, Leslie (1 September 1979). "How to
    Make a Multiprocessor Computer That Correctly Executes Multiprocess
    Programs". *IEEE Transactions on Computers* **C–28** (9): 690–691.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1109/TC.1979.1675439](http://dx.doi.org/10.1109%2FTC.1979.1675439). 
17. **[\](#cite_ref-17)** Patterson and Hennessy, p. 748.
18. **[\](#cite_ref-18)** Singh, David Culler ; J.P. (1997). *Parallel
    computer architecture* ([Nachdr.] ed.). San Francisco: Morgan
    Kaufmann Publ. p. 15.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [1-55860-343-3](http://en.wikipedia.org/wiki/Special:BookSources/1-55860-343-3 "Special:BookSources/1-55860-343-3"). 
19. **[\](#cite_ref-19)** Culler et al. p. 15.
20. **[\](#cite_ref-20)** [Patt, Yale](http://en.wikipedia.org/wiki/Yale_Patt "Yale Patt")
    (April 2004). "[The Microprocessor Ten Years From Now: What Are The
    Challenges, How Do We Meet
    Them?](http://users.ece.utexas.edu/~patt/Videos/talk_videos/cmu_04-29-04.wmv)
    (wmv). Distinguished Lecturer talk at [Carnegie Mellon
    University](http://en.wikipedia.org/wiki/Carnegie_Mellon_University "Carnegie Mellon University").
    Retrieved on November 7, 2007.
21. **[\](#cite_ref-Culler124_21-0)** Culler et al. p. 124.
22. **[\](#cite_ref-Culler125_22-0)** Culler et al. p. 125.
23. \ [***a***](#cite_ref-PH713_23-0)
    [***b***](#cite_ref-PH713_23-1) Patterson and Hennessy, p. 713.
24. \ [***a***](#cite_ref-HP549_24-0)
    [***b***](#cite_ref-HP549_24-1) Hennessy and Patterson, p. 549.
25. **[\](#cite_ref-25)** Patterson and Hennessy, p. 714.
26. **[\](#cite_ref-26)** [What is
    clustering?](http://www.webopedia.com/TERM/c/clustering.html)
    Webopedia computer dictionary. Retrieved on November 7, 2007.
27. **[\](#cite_ref-27)** [Beowulf
    definition.](http://www.pcmag.com/encyclopedia_term/0,2542,t=Beowulf&i=38548,00.asp)
    *PC Magazine*. Retrieved on November 7, 2007.
28. **[\](#cite_ref-28)** [Architecture share for
    06/2007](http://www.top500.org/stats/list/29/archtype). TOP500
    Supercomputing Sites. Clusters make up 74.60% of the machines on the
    list. Retrieved on November 7, 2007.
29. **[\](#cite_ref-29)** Hennessy and Patterson, p. 537.
30. **[\](#cite_ref-30)** [MPP
    Definition.](http://www.pcmag.com/encyclopedia_term/0,,t=mpp&i=47310,00.asp)
    *PC Magazine*. Retrieved on November 7, 2007.
31. **[\](#cite_ref-31)** Kirkpatrick, Scott (2003). "COMPUTER SCIENCE:
    Rough Times Ahead". *Science* **299** (5607): 668–669.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1126/science.1081623](http://dx.doi.org/10.1126%2Fscience.1081623).
    [PMID](http://en.wikipedia.org/wiki/PubMed_Identifier "PubMed Identifier") [12560537](//www.ncbi.nlm.nih.gov/pubmed/12560537). 
32. \ [***a***](#cite_ref-DAmour_32-0)
    [***b***](#cite_ref-DAmour_32-1)
    [***c***](#cite_ref-DAmour_32-2) D'Amour, Michael R., Chief
    Operating Officer, [DRC Computer
    Corporation](/w/index.php?title=DRC_Computer_Corporation&action=edit&redlink=1 "DRC Computer Corporation (page does not exist)").
    "Standard Reconfigurable Computing". Invited speaker at the
    University of Delaware, February 28, 2007.
33. **[\](#cite_ref-33)** Boggan, Sha'Kia and Daniel M. Pressel (August
    2007). [GPUs: An Emerging Platform for General-Purpose
    Computation](http://www.arl.army.mil/arlreports/2007/ARL-SR-154.pdf)
    (PDF). ARL-SR-154, U.S. Army Research Lab. Retrieved on November 7,
    2007.
34. **[\](#cite_ref-34)** Maslennikov, Oleg (2002). ["Systematic
    Generation of Executing Programs for Processor Elements in Parallel
    ASIC or FPGA-Based Systems and Their Transformation into
    VHDL-Descriptions of Processor Element Control
    Units".](http://www.springerlink.com/content/jjrdrb0lelyeu3e9/)
    *Lecture Notes in Computer Science*, **2328/2002:** p. 272.
35. **[\](#cite_ref-35)** Shimokawa, Y.; Y. Fuwa and N. Aramaki (18-21
    Nov 1991). ["A parallel ASIC VLSI neurocomputer for a large number
    of neurons and billion connections per second
    speed"](http://ieeexplore.ieee.org/xpl/freeabs_all.jsp?arnumber=170708).
    *International Joint Conference on Neural Networks* **3**:
    2162–2167.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1109/IJCNN.1991.170708](http://dx.doi.org/10.1109%2FIJCNN.1991.170708).
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [0-7803-0227-3](http://en.wikipedia.org/wiki/Special:BookSources/0-7803-0227-3 "Special:BookSources/0-7803-0227-3"). 
    Cite uses deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"));
    Check date values in: `|date=`
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#bad_date "Help:CS1 errors"))
36. **[\](#cite_ref-36)** Acken, Kevin P.; Irwin, Mary Jane; Owens,
    Robert M. (1 January 1998). *The Journal of VLSI Signal Processing*
    **19** (2): 97–113.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1023/A:1008005616596](http://dx.doi.org/10.1023%2FA%3A1008005616596). 
    Cite uses deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"))
37. **[\](#cite_ref-37)** Kahng, Andrew B. (June 21, 2004) "[Scoping
    the Problem of DFM in the Semiconductor
    Industry](http://www.future-fab.com/documents.asp?grID=353&d_ID=2596)."
    University of California, San Diego. "Future design for
    manufacturing (DFM) technology must reduce design [non-recoverable
    expenditure] cost and directly address manufacturing
    [non-recoverable expenditures] – the cost of a mask set and probe
    card – which is well over \$1 million at the 90 nm technology node
    and creates a significant damper on semiconductor-based innovation."
38. \ [***a***](#cite_ref-PH751_38-0)
    [***b***](#cite_ref-PH751_38-1) Patterson and Hennessy, p. 751.
39. **[\](#cite_ref-39)** The [Sidney Fernbach Award given to MPI
    inventor Bill
    Gropp](http://awards.computer.org/ana/award/viewPastRecipients.action?id=16)
    refers to MPI as "the dominant HPC communications interface"
40. **[\](#cite_ref-40)** Shen, John Paul; Mikko H. Lipasti (2004).
    *Modern processor design : fundamentals of superscalar processors*
    (1st ed.). Dubuque, Iowa: McGraw-Hill. p. 561.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [0-07-057064-7](http://en.wikipedia.org/wiki/Special:BookSources/0-07-057064-7 "Special:BookSources/0-07-057064-7").
    "However, the holy grail of such research – automated
    parallelization of serial programs – has yet to materialize. While
    automated parallelization of certain classes of algorithms has been
    demonstrated, such success has largely been limited to scientific
    and numeric applications with predictable flow control (e.g., nested
    loop structures with statically determined iteration counts) and
    statically analyzable memory access patterns. (e.g., walks over
    large multidimensional arrays of float-point data)."  Cite uses
    deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"))
41. **[\](#cite_ref-41)** *Encyclopedia of Parallel Computing, Volume
    4* by David Padua 2011 [ISBN
    0387097651](http://en.wikipedia.org/wiki/Special:BookSources/0387097651) page 265
42. **[\](#cite_ref-42)** Asanovic, Krste, et al. (December 18, 2006).
    [The Landscape of Parallel Computing Research: A View from
    Berkeley](http://www.eecs.berkeley.edu/Pubs/TechRpts/2006/EECS-2006-183.pdf)
    (PDF). University of California, Berkeley. Technical Report No.
    UCB/EECS-2006-183. See table on pages 17–19.
43. \ [***a***](#cite_ref-infamous_43-0)
    [***b***](#cite_ref-infamous_43-1) Patterson and Hennessy,
    pp. 749–50: "Although successful in pushing several technologies
    useful in later projects, the ILLIAC IV failed as a computer. Costs
    escalated from the \$8 million estimated in 1966 to \$31 million by
    1972, despite the construction of only a quarter of the planned
    machine ... It was perhaps the most infamous of supercomputers. The
    project started in 1965 and ran its first real application in 1976."
44. **[\](#cite_ref-44)** [Menabrea, L.
    F.](http://en.wikipedia.org/wiki/Federico_Luigi,_Conte_Menabrea "Federico Luigi, Conte Menabrea")
    (1842). [Sketch of the Analytic Engine Invented by Charles
    Babbage](http://www.fourmilab.ch/babbage/sketch.html). Bibliothèque
    Universelle de Genève. Retrieved on November 7, 2007.
45. \ [***a***](#cite_ref-PH753_45-0)
    [***b***](#cite_ref-PH753_45-1) [***c***](#cite_ref-PH753_45-2)
    Patterson and Hennessy, p. 753.
46. **[\](#cite_ref-46)** da Cruz, Frank (2003). ["Columbia University
    Computing History: The IBM
    704"](http://www.columbia.edu/acis/history/704.html). Columbia
    University. Retrieved 2008-01-08. 
47. **[\](#cite_ref-47)** Parallel Programming, S. Gill, The Computer
    Journal Vol. 1 \#1, pp2-10, British Computer Society, April 1958.
48. \ [***a***](#cite_ref-G_Wilson_48-0)
    [***b***](#cite_ref-G_Wilson_48-1)
    [***c***](#cite_ref-G_Wilson_48-2)
    [***d***](#cite_ref-G_Wilson_48-3)
    [***e***](#cite_ref-G_Wilson_48-4) Wilson, Gregory V (1994). ["The
    History of the Development of Parallel
    Computing"](http://ei.cs.vt.edu/~history/Parallel.html). Virginia
    Tech/Norfolk State University, Interactive Learning with a Digital
    Library in Computer Science. Retrieved 2008-01-08. 
49. **[\](#cite_ref-49)** Anthes, Gry (November 19, 2001). ["The Power
    of
    Parallelism"](http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=65878).
    *[Computerworld](http://en.wikipedia.org/wiki/Computerworld "Computerworld")*. Retrieved
    2008-01-08. 
50. **[\](#cite_ref-50)** Patterson and Hennessy, p. 749.


References
---
[1] [Parallel computing](http://en.wikipedia.orghttp://en.wikipedia.org/wiki/Parallel_computing), From Wikipedia, the free encyclopedia, 2014.

