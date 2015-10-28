---
layout: post
title: Introduction to Computer Architecture 
date: 2015-11-01
categories: [computer science]
tags: [parallel computing]

---

## Article Source
* Title: [Introduction to Computer Architecture](http://www.ece.cmu.edu/~ece447/s14/doku.php?id=readings)

---

# Readings

<div class="level1">
<ul>
<li class="level1"><div class="li"> <strong>P&amp;P</strong> stands for Patt &amp; Patel's <em>Introduction to Computing Systems: From Bits and Gates to C and Beyond</em></div>
<ul>
<li class="level2"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/PP_Chap1.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/PP_Chap1.pdf" rel="nofollow">P&amp;P Chapter 1 (Fundamentals)</a></div>
</li>
<li class="level2"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/PP_Chap4.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/PP_Chap4.pdf" rel="nofollow">P&amp;P Chapter 4 (The von Neumann Model)</a></div>
</li>
<li class="level2"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/pp-appendixa.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/pp-appendixa.pdf" rel="nofollow">P&amp;P Appendix A (The LC-3b ISA)</a></div>
</li>
<li class="level2"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/pp-appendixc.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/pp-appendixc.pdf" rel="nofollow">P&amp;P Appendix C (The Microarchitecture of the LC-3b, Basic Machine)</a></div>
</li>
</ul>
</li>
<li class="level1"><div class="li"> <strong>P&amp;H</strong> stands for Patterson &amp; Hennessy's <em>Computer Organization and Design: The Hardware/Software Interface</em></div>
</li>
</ul>

</div>

<h2 class="sectionedit2" id="lecture_1_1_13_mon">Lecture 1 (1/13 Mon.)</h2>
<div class="level2">

<p>
<strong>Required:</strong>
</p>
<ul>
<li class="level1"><div class="li"> None</div>
</li>
</ul>

<p>
<strong>Mentioned during lecture:</strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=bstj29-2-147.pdf" class="media mediafile mf_pdf" title="bstj29-2-147.pdf (6.2 MB)">Hamming, R. W. (1950). Error Detecting and Error Correcting Codes. Bell System Technical Journal, 29(2).</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=youandyourresearch.pdf" class="media mediafile mf_pdf" title="youandyourresearch.pdf (94.1 KB)">Hamming, R. W. (1986). You and Your Research. Transcription of the Bell Communications Research Colloquium Seminar.</a></div>
<ul>
<li class="level2"><div class="li"> <a href="http://www.youtube.com/watch?v=a1zDuOPkMSw" class="urlextern" title="http://www.youtube.com/watch?v=a1zDuOPkMSw" rel="nofollow">youtube</a></div>
</li>
</ul>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=05392210.pdf" class="media mediafile mf_pdf" title="05392210.pdf (685.5 KB)">Amdahl, G. M., Blaauw, G. A., &amp; Brooks, F. P. (1964). Architecture of the IBM system/360. IBM J. Res. Dev., 8(2).</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p128-rixner.pdf" class="media mediafile mf_pdf" title="p128-rixner.pdf (177.6 KB)">Rixner, S., Dally, W. J., Kapasi, U. J., Mattson, P., &amp; Owens, J. D. (2000). Memory access scheduling. Proceedings of the 27th annual international symposium on Computer architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=us5630096.pdf" class="media mediafile mf_pdf" title="us5630096.pdf (411.4 KB)">William K. Zuravleff, &amp; Robinson, T. (1997). Controller for a synchronous DRAM that maximizes throughput by allowing memory requests and commands to be issued out of order.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=00964437.pdf" class="media mediafile mf_pdf" title="00964437.pdf (78.6 KB)">Patt, Y. (2001). Requirements, bottlenecks, and good fortune: agents for microprocessor evolution. Proceedings of the IEEE.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?tok=b07a30&amp;media=http%3A%2F%2Fusers.ece.cmu.edu%2F~omutlu%2Fpub%2Fmph_usenix_security07.pdf" class="media mediafile mf_pdf" title="http://users.ece.cmu.edu/~omutlu/pub/mph_usenix_security07.pdf">Moscibroda, T., &amp; Mutlu, O. (2007). Memory performance attacks: denial of memory service in multi-core systems. Proceedings of 16th USENIX Security Symposium.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?tok=6b35b7&amp;media=http%3A%2F%2Fresearch.microsoft.com%2Fpubs%2F79625%2FMICRO2007.pdf" class="media mediafile mf_pdf" title="http://research.microsoft.com/pubs/79625/MICRO2007.pdf">Onur Mutlu and Thomas Moscibroda, "Stall-Time Fair Memory Access Scheduling for Chip Multiprocessors", MICRO 2007. </a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?tok=7761b8&amp;media=http%3A%2F%2Fusers.ece.cmu.edu%2F~omutlu%2Fpub%2Fmemory-channel-partitioning-micro11.pdf" class="media mediafile mf_pdf" title="http://users.ece.cmu.edu/~omutlu/pub/memory-channel-partitioning-micro11.pdf">Sai Prashanth Muralidhara, Lavanya Subramanian, Onur Mutlu, Mahmut Kandemir, and Thomas Moscibroda, "Reducing Memory Interference in Multicore Systems via Application-Aware 
   * Memory Channel Partitioning", MICRO 2011.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?tok=58c5a4&amp;media=http%3A%2F%2Fusers.ece.cmu.edu%2F~omutlu%2Fpub%2Fraidr-dram-refresh_isca12.pdf" class="media mediafile mf_pdf" title="http://users.ece.cmu.edu/~omutlu/pub/raidr-dram-refresh_isca12.pdf">Liu et al., “RAIDR: Retention-Aware Intelligent DRAM Refresh,” ISCA 2012.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?tok=a14b99&amp;media=http%3A%2F%2Fusers.ece.cmu.edu%2F~omutlu%2Fpub%2Fmemory-scaling_memcon13.pdf" class="media mediafile mf_pdf" title="http://users.ece.cmu.edu/~omutlu/pub/memory-scaling_memcon13.pdf">Onur Mutlu, "Memory Scaling: A Systems Architecture Perspective" Technical talk at MemCon 2013 (MEMCON), Santa Clara, CA, August 2013.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit3" id="lecture_2_1_15_wed">Lecture 2 (1/15 Wed.)</h2>
<div class="level2">

<p>
<strong>Required:</strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=00964437.pdf" class="media mediafile mf_pdf" title="00964437.pdf (78.6 KB)">Patt, Y. (2001). Requirements, bottlenecks, and good fortune: agents for microprocessor evolution. Proceedings of the IEEE.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=moscibroda.pdf" class="media mediafile mf_pdf" title="moscibroda.pdf (360.7 KB)">Moscibroda, T., &amp; Mutlu, O. (2007). Memory performance attacks: denial of memory service in multi-core systems. Proceedings of 16th USENIX Security Symposium.</a></div>
</li>
<li class="level1"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/PP_Chap1.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/PP_Chap1.pdf" rel="nofollow">P&amp;P Chapter 1 (Fundamentals)</a></div>
</li>
<li class="level1"><div class="li"> P&amp;H Chapters 1 and 2 (Intro, Abstractions, ISA, MIPS)</div>
</li>
</ul>

<p>
<strong>Mentioned during lecture:</strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=gordon_moore_1965_article.pdf" class="media mediafile mf_pdf" title="gordon_moore_1965_article.pdf (801.3 KB)">Moore, G. E. (1965). Cramming More Components onto Integrated Circuits. Electronics, 38(8).</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=bab6286.0001.001.pdf" class="media mediafile mf_pdf" title="bab6286.0001.001.pdf (5.7 MB)">Burks, A. W., Goldstine, H. H., &amp; Neumann, J. von. (1946). Preliminary discussion of the logical design of an electronic computing instrument.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p126-dennis.pdf" class="media mediafile mf_pdf" title="p126-dennis.pdf (659.8 KB)">Dennis, J. B., &amp; Misunas, D. P. (1975). A preliminary architecture for a basic data-flow processor. Proceedings of the 2nd annual symposium on Computer architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p34-gurd.pdf" class="media mediafile mf_pdf" title="p34-gurd.pdf (2.9 MB)">Gurd, J. R., Kirkham, C. C., &amp; Watson, I. (1985). The Manchester prototype dataflow computer. Commun. ACM, 28(1).</a></div>
</li>
<li class="level1"><div class="li"> Kuhn, T. S. (1962). The Structure of Scientific Revolutions.</div>
</li>
<li class="level1"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/PP_Chap4.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/PP_Chap4.pdf" rel="nofollow">P&amp;P Chapter 4 (The von Neumann Model)</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit4" id="lecture_3_1_17_fri">Lecture 3 (1/17 Fri.)</h2>
<div class="level2">

<p>
<strong>Required:</strong>
</p>
<ul>
<li class="level1"><div class="li"> Note that you should familiarize yourself with these manuals. Please briefly skim through these manuals as you will probably need to refer to them while working on labs and homework</div>
</li>
<li class="level1"><div class="li"> ARM Architecture Reference Manual</div>
<ul>
<li class="level2"><div class="li"> <a href="https://www.scss.tcd.ie/~waldroj/3d1/arm_arm.pdf" class="urlextern" title="https://www.scss.tcd.ie/~waldroj/3d1/arm_arm.pdf" rel="nofollow">Manual (5MB)</a></div>
</li>
</ul>
</li>
<li class="level1"><div class="li"> ARM Architecture Instruction Quick Reference</div>
<ul>
<li class="level2"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=arm-instructionset.pdf" class="media mediafile mf_pdf" title="arm-instructionset.pdf (589.6 KB)">Quick Ref (.5MB)</a></div>
</li>
</ul>
</li>
<li class="level1"><div class="li"> Intel® 64 and IA-32 Architectures Software Developer Manual (2013)</div>
<ul>
<li class="level2"><div class="li"> <a href="http://download.intel.com/products/processor/manual/325462.pdf" class="urlextern" title="http://download.intel.com/products/processor/manual/325462.pdf" rel="nofollow">(15MB) Combined Volumes 1-3</a>3</div>
</li>
</ul>
</li>
</ul>

<p>
<strong>Mentioned during lecture:</strong>
</p>
<ul>
<li class="level1"><div class="li"> P&amp;H Chapter 4, Sections 4.1-4.4.</div>
</li>
<li class="level1"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/pp-appendixc.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/pp-appendixc.pdf" rel="nofollow">P&amp;P Appendix C (The Microarchitecture of the LC-3b, Basic Machine)</a></div>
</li>
<li class="level1"><div class="li"> P&amp;P Chapter 5 (The LC3)</div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p25-patterson.pdf" class="media mediafile mf_pdf" title="p25-patterson.pdf (655.3 KB)">Patterson, D. A., &amp; Ditzel, D. R. (1980). The case for the reduced instruction set computer. SIGARCH Comput. Archit. News, 8(6).</a></div>
</li>
<li class="level1"><div class="li"> <a href="http://www.ece.cmu.edu/~koopman/stack_computers/sec3_2.html" class="urlextern" title="http://www.ece.cmu.edu/~koopman/stack_computers/sec3_2.html" rel="nofollow"> Koopman, P. (1989) Stack Computers: The New Wave.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=chapter9.pdf" class="media mediafile mf_pdf" title="chapter9.pdf (1.6 MB)">Levy, H. (1984). Capability-Based Computer Systems. Chapter 9. The Intel iAPX 432.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p489-wilner.pdf" class="media mediafile mf_pdf" title="p489-wilner.pdf (1 MB)">Wilner, W. T. (1972). Design of the Burroughs B1700. Proceedings of the December 5-7, 1972, fall joint computer conference, part I. </a></div>
</li>
</ul>

</div>

<h2 class="sectionedit5" id="lecture_4_1_22_wed">Lecture 4 (1/22 Wed.)</h2>
<div class="level2">

<p>
<strong>Required</strong>
</p>
<ul>
<li class="level1"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/PP_Chap4.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/PP_Chap4.pdf" rel="nofollow">P&amp;P Chapter 4 (The von Neumann Model)</a></div>
</li>
<li class="level1"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/pp-appendixa.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/pp-appendixa.pdf" rel="nofollow">P&amp;P Appendix A (The LC-3b ISA)</a></div>
</li>
<li class="level1"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/pp-appendixc.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/pp-appendixc.pdf" rel="nofollow">P&amp;P Appendix C (The Microarchitecture of the LC-3b, Basic Machine)</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit6" id="lecture_5_1_24_fri">Lecture 5 (1/24 Fri.)</h2>
<div class="level2">

<p>
<strong>Required</strong>
</p>
<ul>
<li class="level1"><div class="li"> None</div>
</li>
</ul>

</div>

<h2 class="sectionedit7" id="lecture_6_1_27_mon">Lecture 6 (1/27 Mon.)</h2>
<div class="level2">

<p>
<strong>Required:</strong>
</p>
<ul>
<li class="level1"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/pp-appendixc.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/pp-appendixc.pdf" rel="nofollow">P&amp;P Appendix C (The Microarchitecture of the LC-3b, Basic Machine)</a></div>
</li>
<li class="level1"><div class="li"> P&amp;H Appendix D (Mapping Control to Hardware)</div>
</li>
</ul>

<p>
<strong>Optional:</strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=bestway.pdf" class="media mediafile mf_pdf" title="bestway.pdf (296.6 KB)">Wilkes, M. V. (1951). The best way to design an automatic calculating machine. Manchester University Computer Inaugural Conference.</a></div>
</li>
</ul>

<p>
<strong>Mentioned during lecture:</strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=bestway.pdf" class="media mediafile mf_pdf" title="bestway.pdf (296.6 KB)">Wilkes, M. V. (1951). The best way to design an automatic calculating machine. Manchester University Computer Inaugural Conference.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit8" id="lecture_7_1_29_wed">Lecture 7 (1/29 Wed.)</h2>
<div class="level2">

<p>
<strong>Required:</strong>
</p>
<ul>
<li class="level1"><div class="li"> None</div>
</li>
</ul>

<p>
<strong>Mentioned during lecture:</strong>
</p>
<ul>
<li class="level1"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/pp-appendixc.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/pp-appendixc.pdf" rel="nofollow">P&amp;P Appendix C (The Microarchitecture of the LC-3b, Basic Machine)</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit9" id="lecture_8_1_31_fri">Lecture 8 (1/31 Fri.)</h2>
<div class="level2">

<p>
<strong>Required:</strong>
</p>
<ul>
<li class="level1"><div class="li"> None</div>
</li>
</ul>

</div>

<h2 class="sectionedit10" id="lecture_9_2_3_mon">Lecture 9 (2/3 Mon.)</h2>
<div class="level2">

<p>
<strong>Required:</strong>
</p>
<ul>
<li class="level1"><div class="li"> P&amp;H Sections 4.9-4.11</div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=00476078.pdf" class="media mediafile mf_pdf" title="00476078.pdf (2 MB)">Smith, J. E., &amp; Sohi, G. S. (1995). The microarchitecture of superscalar processors. Proceedings of the IEEE.</a></div>
</li>
</ul>

<p>
<strong>Mentioned during lecture:</strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p177-allen.pdf" class="media mediafile mf_pdf" title="p177-allen.pdf (1 MB)">Allen, J. R., Kennedy, K., Porterfield, C., &amp; Warren, J. (1983). Conversion of control dependence to data dependence. Proceedings of the 10th ACM SIGACT-SIGPLAN symposium on Principles of programming languages.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=24400043.pdf" class="media mediafile mf_pdf" title="24400043.pdf (395.1 KB)">Kim, H., Mutlu, O., Stark, J., &amp; Patt, Y. N. (2005). Wish Branches: Combining Conditional Branching and Predication for Adaptive Predicated Execution. Proceedings of the 38th annual IEEE/ACM International Symposium on Microarchitecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=thornton_-_1964_-_parallel_operation_in_the_control_data_6600.pdf" class="media mediafile mf_pdf" title="thornton_-_1964_-_parallel_operation_in_the_control_data_6600.pdf (787.1 KB)">Thornton, J. E. (1964). Parallel Operation in the Control Data 6600. Proceedings of the Fall Joint Computer Conference.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=smith78_hep.pdf" class="media mediafile mf_pdf" title="smith78_hep.pdf (2.3 MB)">Smith, B. J. (1978). A pipelined, shared resource MIMD computer. International Conference on Parallel Processing.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p16-pettis.pdf" class="media mediafile mf_pdf" title="p16-pettis.pdf (1.4 MB)">Pettis, K., &amp; Hansen, R. C. (1990). Profile guided code positioning. Proceedings of the ACM SIGPLAN 1990 conference on Programming language design and implementation.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit11" id="lecture_10_2_5_wed">Lecture 10 (2/5 Wed.)</h2>
<div class="level2">

<p>
<strong>Required:</strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=mcfarling_-_1993_-_combining_branch_predictors.pdf" class="media mediafile mf_pdf" title="mcfarling_-_1993_-_combining_branch_predictors.pdf (79.1 KB)">Mcfarling, S. (1993). Combining branch predictors. WRL Technical Note TN-36.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=kessler_-_1999_-_the_alpha_21264_microprocessor.pdf" class="media mediafile mf_pdf" title="kessler_-_1999_-_the_alpha_21264_microprocessor.pdf (164 KB)">Kessler, R. E. (1999). The Alpha 21264 Microprocessor. IEEE Micro.</a></div>
</li>
</ul>

<p>
<strong>Mentioned during lecture:</strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p300-ball.pdf" class="media mediafile mf_pdf" title="p300-ball.pdf (1.4 MB)">Ball, T., &amp; Larus, J. R. (1993). Branch prediction for free. Proceedings of the ACM SIGPLAN 1993 conference on Programming language design and implementation.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p135-smith.pdf" class="media mediafile mf_pdf" title="p135-smith.pdf (634.1 KB)">Smith, J. E. (1981). A study of branch prediction strategies. Proceedings of the 8th annual symposium on Computer Architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=yeh_patt_-_1991_-_two-level_adaptive_training_branch_prediction.pdf" class="media mediafile mf_pdf" title="yeh_patt_-_1991_-_two-level_adaptive_training_branch_prediction.pdf (1.1 MB)">Yeh, T.-Y., &amp; Patt, Y. N. (1991). Two-level adaptive training branch prediction. Proceedings of the 24th annual international symposium on Microarchitecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p22-chang.pdf" class="media mediafile mf_pdf" title="p22-chang.pdf (848.7 KB)">Chang, P.-Y., Hao, E., Yeh, T.-Y., &amp; Patt, Y. (1994). Branch classification: a new mechanism for improving branch predictor performance. Proceedings of the 27th annual international symposium on Microarchitecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=hpca01.pdf" class="media mediafile mf_pdf" title="hpca01.pdf (144.1 KB)">Daniel A. Jimenez and Calvin Lin. 2001. Dynamic Branch Prediction with Perceptrons. In Proceedings of the 7th International Symposium on High-Performance Computer Architecture (HPCA '01)</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=riseman.1972.tc.pdf" class="media mediafile mf_pdf" title="riseman.1972.tc.pdf (2 MB)">E. M. Riseman and C. C. Foster. 1972. The Inhibition of Potential Parallelism by Conditional Jumps. IEEE Trans. Comput. 21, 12 (December 1972)</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit12" id="lecture_11_2_12_wed">Lecture 11 (2/12 Wed.)</h2>
<div class="level2">

<p>
<strong> Required </strong>
</p>
<ul>
<li class="level1"><div class="li"> None</div>
</li>
</ul>

<p>
<strong> Mentioned during the lecture </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p274-chang.pdf" class="media mediafile mf_pdf" title="p274-chang.pdf (1.3 MB)">Po-Yung Chang, Eric Hao, and Yale N. Patt. 1997. Target prediction for indirect jumps. ISCA'97.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=kim_isca07.pdf" class="media mediafile mf_pdf" title="kim_isca07.pdf (242.4 KB)">Hyesoon Kim, José A. Joao, Onur Mutlu, Chang Joo Lee, Yale N. Patt, and Robert Cohn. 2007. VPC prediction: reducing the cost of indirect branches via hardware-based dynamic devirtualization. ISCA'07</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit13" id="lecture_12_2_14_fri">Lecture 12 (2/14 Fri.)</h2>
<div class="level2">

<p>
<strong> Required </strong>
</p>
<ul>
<li class="level1"><div class="li"> P&amp;H Sections 4.9-4.11</div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=00476078.pdf" class="media mediafile mf_pdf" title="00476078.pdf (2 MB)">Smith, J. E., &amp; Sohi, G. S. (1995). The microarchitecture of superscalar processors. Proceedings of the IEEE.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=00004607.pdf" class="media mediafile mf_pdf" title="00004607.pdf (1.4 MB)">Smith, J. E., &amp; Pleszkun, A. R. (1988). Implementing precise interrupts in pipelined processors. Computers, IEEE Transactions on.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit14" id="lecture_13_2_17_mon">Lecture 13 (2/17 Mon.)</h2>
<div class="level2">

<p>
<strong> Required </strong>
</p>
<ul>
<li class="level1"><div class="li"> none</div>
</li>
</ul>

</div>

<h2 class="sectionedit15" id="lecture_14_2_19_wed">Lecture 14 (2/19 Wed.)</h2>
<div class="level2">

<p>
<strong> Required </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p18-hwu.pdf" class="media mediafile mf_pdf" title="p18-hwu.pdf (821.2 KB)">Hwu, W. W., &amp; Patt, Y. N. (1987). Checkpoint repair for out-of-order execution machines. Proceedings of the 14th annual international symposium on Computer architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=00476078.pdf" class="media mediafile mf_pdf" title="00476078.pdf (2 MB)">Smith, J. E., &amp; Sohi, G. S. (1995). The microarchitecture of superscalar processors. Proceedings of the IEEE.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=00004607.pdf" class="media mediafile mf_pdf" title="00004607.pdf (1.4 MB)">Smith, J. E., &amp; Pleszkun, A. R. (1988). Implementing precise interrupts in pipelined processors. Computers, IEEE Transactions on.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit16" id="lecture_15_2_21_fri">Lecture 15 (2/21 Fri.)</h2>
<div class="level2">

<p>
<strong> Required </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=04523358.pdf" class="media mediafile mf_pdf" title="04523358.pdf (1.2 MB)">Lindholm, E., Nickolls, J., Oberman, S., &amp; Montrym, J. (2008). NVIDIA Tesla: A Unified Graphics and Computing Architecture. Micro, IEEE.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p50-fatahalian.pdf" class="media mediafile mf_pdf" title="p50-fatahalian.pdf (1.8 MB)">Fatahalian, K., &amp; Houston, M. (2008). A closer look at GPUs. Commun. ACM.</a></div>
</li>
</ul>

<p>
<strong>Mentioned during lecture:</strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=30470407.pdf" class="media mediafile mf_pdf" title="30470407.pdf (883.4 KB)">Fung, W. W. L., Sham, I., Yuan, G., &amp; Aamodt, T. M. (2007). Dynamic Warp Formation and Scheduling for Efficient GPU Control Flow. Proceedings of the 40th Annual IEEE/ACM International Symposium on Microarchitecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p253-suleman.pdf" class="media mediafile mf_pdf" title="p253-suleman.pdf (955 KB)">Suleman, M. A., Mutlu, O., Qureshi, M. K., &amp; Patt, Y. N. (2009). Accelerating critical section execution with asymmetric multi-core architectures. Proceedings of the 14th international conference on Architectural support for programming languages and operating systems.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=01447203.pdf" class="media mediafile mf_pdf" title="01447203.pdf (959.1 KB)">Flynn, M. J. (1966). Very high-speed computing systems. Proceedings of the IEEE.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=fisher_-_1983_-_very_long_instruction_word_architectures_and_the_eli-512.pdf" class="media mediafile mf_pdf" title="fisher_-_1983_-_very_long_instruction_word_architectures_and_the_eli-512.pdf (818.2 KB)">Fisher, J. A. (1983). Very Long Instruction Word architectures and the ELI-512. Proceedings of the 10th annual international symposium on Computer architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=smith-1982-decoupled-access-execute-computer-architectures.pdf" class="media mediafile mf_pdf" title="smith-1982-decoupled-access-execute-computer-architectures.pdf (649.1 KB)">Smith, J. E. (1982). Decoupled access/execute computer architectures. Proceedings of the 9th annual symposium on Computer Architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p289-smith.pdf" class="media mediafile mf_pdf" title="p289-smith.pdf (1.2 MB)">Smith, J. E. (1984). Decoupled access/execute computer architectures. ACM Trans. Comput. Syst.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p199-smith.pdf" class="media mediafile mf_pdf" title="p199-smith.pdf (651 KB)">Smith, J. E., Dermer, G. E., Vanderwarn, B. D., Klinger, S. D., &amp; Rozewski, C. M. (1987). The ZS-1 central processor. Proceedings of the second international conference on Architectual support for programming languages and operating systems.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=00030730.pdf" class="media mediafile mf_pdf" title="00030730.pdf (1.4 MB)">Smith, J. E. (1989). Dynamic instruction scheduling and the Astronautics ZS-1. IEEE Computer.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=kung_-_1982_-_why_systolic_architectures.pdf" class="media mediafile mf_pdf" title="kung_-_1982_-_why_systolic_architectures.pdf (2.6 MB)">Kung, H. T. (1982). Why Systolic Architectures? IEEE Computer.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=annaratone_et_al._-_1986_-_warp_architecture_and_implementation.pdf" class="media mediafile mf_pdf" title="annaratone_et_al._-_1986_-_warp_architecture_and_implementation.pdf (1.1 MB)">Annaratone, M., Arnould, E., Gross, T., Kung, H. T., &amp; Lam, M. S. (1986). Warp architecture and implementation. Proceedings of the 13th annual international symposium on Computer architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=annaratone_et_al._-_1987_-_the_warp_computer_architecture_implementation_and_performance.pdf" class="media mediafile mf_pdf" title="annaratone_et_al._-_1987_-_the_warp_computer_architecture_implementation_and_performance.pdf (4.5 MB)">Annaratone, M., Arnould, E., Gross, T., Kung, H. T., &amp; Lam, M. (1987). The warp computer: Architecture, implementation, and performance. IEEE Transactions on Computers.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit17" id="lecture_18_2_28_fri">Lecture 18 (2/28 Fri.)</h2>
<div class="level2">

<p>
<strong>Mentioned during lecture:</strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=01675827.pdf" class="media mediafile mf_pdf" title="01675827.pdf (3.9 MB)">Fisher, J. A. (1981). Trace Scheduling: A Technique for Global Microcode Compaction. IEEE Trans. Comput.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=2fbf01205185.pdf" class="media mediafile mf_pdf" title="2fbf01205185.pdf (1.2 MB)">Hwu, W.-M. W., Mahlke, S. A., Chen, W. Y., Chang, P. P., Warter, N. J., Bringmann, R. A., Ouellette, R. G., et al. (1993). The superblock: an effective technique for VLIW and superscalar compilation. J. Supercomput.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p45-mahlke.pdf" class="media mediafile mf_pdf" title="p45-mahlke.pdf (1.2 MB)">Mahlke, S. A., Lin, D. C., Chen, W. Y., Hank, R. E., &amp; Bringmann, R. A. (1992). Effective compiler support for predicated execution using the hyperblock. Proceedings of the 25th annual international symposium on Microarchitecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=melvin_patt_-_1995_-_enhancing_instruction_scheduling_with_a_block-structured_isa.pdf" class="media mediafile mf_pdf" title="melvin_patt_-_1995_-_enhancing_instruction_scheduling_with_a_block-structured_isa.pdf (1.1 MB)">Melvin, S., &amp; Patt, Y. (1995). Enhancing instruction scheduling with a block-structured ISA. Int. J. Parallel Program.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=hao_et_al._-_1996_-_increasing_the_instruction_fetch_rate_via_block-structured_instruction_set_architectures.pdf" class="media mediafile mf_pdf" title="hao_et_al._-_1996_-_increasing_the_instruction_fetch_rate_via_block-structured_instruction_set_architectures.pdf (1.1 MB)">Hao, E., Chang, P.-Y., Evers, M., &amp; Patt, Y. N. (1996). Increasing the instruction fetch rate via block-structured instruction set architectures. Proceedings of the 29th annual ACM/IEEE international symposium on Microarchitecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=00877947.pdf" class="media mediafile mf_pdf" title="00877947.pdf (138.1 KB)">Huck, J., Morris, D., Ross, J., Knies, A., Mulder, H., &amp; Zahir, R. (2000). Introducing the IA-64 architecture. IEEE Micro.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit18" id="lecture_19_3_19_wed">Lecture 19 (3/19 Wed.)</h2>
<div class="level2">

<p>
<strong>Required:</strong>
</p>
<ul>
<li class="level1"><div class="li"> P&amp;H Chapters 5.1-5.3 (cache chapters)</div>
</li>
<li class="level1"><div class="li"> Hamacher et al. Chapters 8.1-8.7 (cache/memory chapters)</div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=wilkes_-_1965_-_slave_memories_and_dynamic_storage_allocation.pdf" class="media mediafile mf_pdf" title="wilkes_-_1965_-_slave_memories_and_dynamic_storage_allocation.pdf (410.9 KB)">Wilkes, M. V. (1965). Slave Memories and Dynamic Storage Allocation. IEEE Transactions on Electronic Computers.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit19" id="lecture_20_3_21_fri">Lecture 20 (3/21 Fri.)</h2>
<div class="level2">

<p>
<strong> Mentioned in the Lecture</strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=26080167.pdf" class="media mediafile mf_pdf" title="26080167.pdf (400.3 KB)">Qureshi, M. K., Lynch, D. N., Mutlu, O., &amp; Patt, Y. N. (2006). A Case for MLP-Aware Cache Replacement. Proceedings of the 33rd annual international symposium on Computer Architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=05388441.pdf" class="media mediafile mf_pdf" title="05388441.pdf (2 MB)">Belady, L. A. (1966). A study of replacement algorithms for a virtual-storage computer. IBM Syst. J.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit20" id="lecture_21_3_24_mon">Lecture 21 (3/24 Mon.)</h2>
<div class="level2">

<p>
<strong> Required </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=26080167.pdf" class="media mediafile mf_pdf" title="26080167.pdf (400.3 KB)">Qureshi, M. K., Lynch, D. N., Mutlu, O., &amp; Patt, Y. N. (2006). A Case for MLP-Aware Cache Replacement. Proceedings of the 33rd annual international symposium on Computer Architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=05388441.pdf" class="media mediafile mf_pdf" title="05388441.pdf (2 MB)">Belady, L. A. (1966). A study of replacement algorithms for a virtual-storage computer. IBM Syst. J.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit21" id="lecture_22_3_26_wed">Lecture 22 (3/26 Wed.)</h2>
<div class="level2">

<p>
<strong> Recommended: </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p6-bell.pdf" class="media mediafile mf_pdf" title="p6-bell.pdf (650.2 KB)">Bell, G., &amp; Strecker, W. D. (1998). Retrospective: what have we learned from the PDP-11&amp;mdash;what we have learned from VAX and Alpha. 25 years of the international symposia on Computer architecture (selected papers).</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p1-bell.pdf" class="media mediafile mf_pdf" title="p1-bell.pdf (872.7 KB)">Bell, G., &amp; Strecker, W. D. (1976). Computer structures: What have we learned from the PDP-11? Proceedings of the 3rd annual symposium on Computer architecture.</a></div>
</li>
</ul>

<p>
<strong> Mentioned during lecture: </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=tldram-lee.pdf" class="media mediafile mf_pdf" title="tldram-lee.pdf (3.2 MB)">Lee et al., Tiered-Latency DRAM: A Low Latency and Low Cost DRAM Architecture, HPCA 2013.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=raidr-isca12.pdf" class="media mediafile mf_pdf" title="raidr-isca12.pdf (480.4 KB)">Liu et al., RAIDR: Retention-Aware Intelligent DRAM Refresh, ISCA 2012.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=2012_isca_salp.pdf" class="media mediafile mf_pdf" title="2012_isca_salp.pdf (927.3 KB)">Kim et al., “A Case for Exploiting Subarray-Level Parallelism in DRAM, ISCA 2012.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p60-liu.pdf" class="media mediafile mf_pdf" title="p60-liu.pdf (751.7 KB)">Liu et al., “An Experimental Study of Data Retention Behavior in Modern DRAM Devices,” ISCA 2013.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=moscibroda.pdf" class="media mediafile mf_pdf" title="moscibroda.pdf (360.7 KB)">Moscibroda, T., &amp; Mutlu, O. (2007). Memory performance attacks: denial of memory service in multi-core systems. Proceedings of 16th USENIX Security Symposium.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=30470146.pdf" class="media mediafile mf_pdf" title="30470146.pdf (480.7 KB)">Mutlu, O., &amp; Moscibroda, T. (2007). Stall-Time Fair Memory Access Scheduling for Chip Multiprocessors. Proceedings of the 40th Annual IEEE/ACM International Symposium on Microarchitecture (pp. 146–160).</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=3174a063.pdf" class="media mediafile mf_pdf" title="3174a063.pdf (528.1 KB)">Mutlu, O., &amp; Moscibroda, T. (2008). Parallelism-Aware Batch Scheduling: Enhancing both Performance and Fairness of Shared DRAM Systems. Proceedings of the 35th Annual International Symposium on Computer Architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=4299a065.pdf" class="media mediafile mf_pdf" title="4299a065.pdf (554.2 KB)">Kim, Y., Papamichael, M., Mutlu, O., &amp; Harchol-Balter, M. (2010). Thread Cluster Memory Scheduling: Exploiting Differences in Memory Access Behavior. Proceedings of the 2010 43rd Annual IEEE/ACM International Symposium on Microarchitecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=muralidhara_et_al._-_2011_-_reducing_memory_interference_in_multicore_systems_via_application-aware_memory_channel_partitioning.pdf" class="media mediafile mf_pdf" title="muralidhara_et_al._-_2011_-_reducing_memory_interference_in_multicore_systems_via_application-aware_memory_channel_partitioning.pdf (678.5 KB)">Muralidhara, S. P., Subramanian, L., Mutlu, O., Kandemir, M., &amp; Moscibroda, T. (2011). Reducing memory interference in multicore systems via application-aware memory channel partitioning. Proceedings of the 44th Annual IEEE/ACM International Symposium on Microarchitecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p335-ebrahimi.pdf" class="media mediafile mf_pdf" title="p335-ebrahimi.pdf (463.4 KB)">Ebrahimi, E., Lee, C. J., Mutlu, O., &amp; Patt, Y. N. (2010). Fairness via source throttling: a configurable and high-performance fairness substrate for multi-core memory systems. Proceedings of the fifteenth edition of ASPLOS on Architectural support for programming languages and operating systems.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p362-ebrahimi.pdf" class="media mediafile mf_pdf" title="p362-ebrahimi.pdf (719.3 KB)">Ebrahimi, E., Miftakhutdinov, R., Fallin, C., Lee, C. J., Joao, J. A., Mutlu, O., &amp; Patt, Y. N. (2011). Parallel application memory scheduling. Proceedings of the 44th Annual IEEE/ACM International Symposium on Microarchitecture.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit22" id="lecture_24_3_31_mon">Lecture 24 (3/31 Mon.)</h2>
<div class="level2">

<p>
<strong> Recommended: </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p6-bell.pdf" class="media mediafile mf_pdf" title="p6-bell.pdf (650.2 KB)">Bell, G., &amp; Strecker, W. D. (1998). Retrospective: what have we learned from the PDP-11&amp;mdash;what we have learned from VAX and Alpha. 25 years of the international symposia on Computer architecture (selected papers).</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p1-bell.pdf" class="media mediafile mf_pdf" title="p1-bell.pdf (872.7 KB)">Bell, G., &amp; Strecker, W. D. (1976). Computer structures: What have we learned from the PDP-11? Proceedings of the 3rd annual symposium on Computer architecture.</a></div>
</li>
</ul>

<p>
<strong> Mentioned during lecture: </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=tldram-lee.pdf" class="media mediafile mf_pdf" title="tldram-lee.pdf (3.2 MB)">Lee et al., Tiered-Latency DRAM: A Low Latency and Low Cost DRAM Architecture, HPCA 2013.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=raidr-isca12.pdf" class="media mediafile mf_pdf" title="raidr-isca12.pdf (480.4 KB)">Liu et al., RAIDR: Retention-Aware Intelligent DRAM Refresh, ISCA 2012.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=2012_isca_salp.pdf" class="media mediafile mf_pdf" title="2012_isca_salp.pdf (927.3 KB)">Kim et al., “A Case for Exploiting Subarray-Level Parallelism in DRAM, ISCA 2012.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p60-liu.pdf" class="media mediafile mf_pdf" title="p60-liu.pdf (751.7 KB)">Liu et al., “An Experimental Study of Data Retention Behavior in Modern DRAM Devices,” ISCA 2013.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=moscibroda.pdf" class="media mediafile mf_pdf" title="moscibroda.pdf (360.7 KB)">Moscibroda, T., &amp; Mutlu, O. (2007). Memory performance attacks: denial of memory service in multi-core systems. Proceedings of 16th USENIX Security Symposium.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=30470146.pdf" class="media mediafile mf_pdf" title="30470146.pdf (480.7 KB)">Mutlu, O., &amp; Moscibroda, T. (2007). Stall-Time Fair Memory Access Scheduling for Chip Multiprocessors. Proceedings of the 40th Annual IEEE/ACM International Symposium on Microarchitecture (pp. 146–160).</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=3174a063.pdf" class="media mediafile mf_pdf" title="3174a063.pdf (528.1 KB)">Mutlu, O., &amp; Moscibroda, T. (2008). Parallelism-Aware Batch Scheduling: Enhancing both Performance and Fairness of Shared DRAM Systems. Proceedings of the 35th Annual International Symposium on Computer Architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=4299a065.pdf" class="media mediafile mf_pdf" title="4299a065.pdf (554.2 KB)">Kim, Y., Papamichael, M., Mutlu, O., &amp; Harchol-Balter, M. (2010). Thread Cluster Memory Scheduling: Exploiting Differences in Memory Access Behavior. Proceedings of the 2010 43rd Annual IEEE/ACM International Symposium on Microarchitecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=muralidhara_et_al._-_2011_-_reducing_memory_interference_in_multicore_systems_via_application-aware_memory_channel_partitioning.pdf" class="media mediafile mf_pdf" title="muralidhara_et_al._-_2011_-_reducing_memory_interference_in_multicore_systems_via_application-aware_memory_channel_partitioning.pdf (678.5 KB)">Muralidhara, S. P., Subramanian, L., Mutlu, O., Kandemir, M., &amp; Moscibroda, T. (2011). Reducing memory interference in multicore systems via application-aware memory channel partitioning. Proceedings of the 44th Annual IEEE/ACM International Symposium on Microarchitecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p335-ebrahimi.pdf" class="media mediafile mf_pdf" title="p335-ebrahimi.pdf (463.4 KB)">Ebrahimi, E., Lee, C. J., Mutlu, O., &amp; Patt, Y. N. (2010). Fairness via source throttling: a configurable and high-performance fairness substrate for multi-core memory systems. Proceedings of the fifteenth edition of ASPLOS on Architectural support for programming languages and operating systems.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p362-ebrahimi.pdf" class="media mediafile mf_pdf" title="p362-ebrahimi.pdf (719.3 KB)">Ebrahimi, E., Miftakhutdinov, R., Fallin, C., Lee, C. J., Joao, J. A., Mutlu, O., &amp; Patt, Y. N. (2011). Parallel application memory scheduling. Proceedings of the 44th Annual IEEE/ACM International Symposium on Microarchitecture.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit23" id="lecture_25_4_2_wed">Lecture 25 (4/2 Wed.)</h2>
<div class="level2">

<p>
<strong> Mentioned during lecture: </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=raidr-isca12.pdf" class="media mediafile mf_pdf" title="raidr-isca12.pdf (480.4 KB)">Liu et al., RAIDR: Retention-Aware Intelligent DRAM Refresh, ISCA 2012.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p60-liu.pdf" class="media mediafile mf_pdf" title="p60-liu.pdf (751.7 KB)">Liu et al., “An Experimental Study of Data Retention Behavior in Modern DRAM Devices,” ISCA 2013.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=4299a065.pdf" class="media mediafile mf_pdf" title="4299a065.pdf (554.2 KB)">Kim, Y., Papamichael, M., Mutlu, O., &amp; Harchol-Balter, M. (2010). Thread Cluster Memory Scheduling: Exploiting Differences in Memory Access Behavior. Proceedings of the 2010 43rd Annual IEEE/ACM International Symposium on Microarchitecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=muralidhara_et_al._-_2011_-_reducing_memory_interference_in_multicore_systems_via_application-aware_memory_channel_partitioning.pdf" class="media mediafile mf_pdf" title="muralidhara_et_al._-_2011_-_reducing_memory_interference_in_multicore_systems_via_application-aware_memory_channel_partitioning.pdf (678.5 KB)">Muralidhara, S. P., Subramanian, L., Mutlu, O., Kandemir, M., &amp; Moscibroda, T. (2011). Reducing memory interference in multicore systems via application-aware memory channel partitioning. Proceedings of the 44th Annual IEEE/ACM International Symposium on Microarchitecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p335-ebrahimi.pdf" class="media mediafile mf_pdf" title="p335-ebrahimi.pdf (463.4 KB)">Ebrahimi, E., Lee, C. J., Mutlu, O., &amp; Patt, Y. N. (2010). Fairness via source throttling: a configurable and high-performance fairness substrate for multi-core memory systems. Proceedings of the fifteenth edition of ASPLOS on Architectural support for programming languages and operating systems.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p362-ebrahimi.pdf" class="media mediafile mf_pdf" title="p362-ebrahimi.pdf (719.3 KB)">Ebrahimi, E., Miftakhutdinov, R., Fallin, C., Lee, C. J., Joao, J. A., Mutlu, O., &amp; Patt, Y. N. (2011). Parallel application memory scheduling. Proceedings of the 44th Annual IEEE/ACM International Symposium on Microarchitecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=isca08_ipek.pdf" class="media mediafile mf_pdf" title="isca08_ipek.pdf (0 B)">Ipek, E., Mutlu, O., Martinez, J., Caruana, R. (2008). Self-Optimizing Memory Controllers: A Reinforcement Learning Approach. Proceedings of the 42th Annual IEEE/ACM International Symposium on Microarchitecture.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit24" id="lecture_25_4_7_mon">Lecture 25 (4/7 Mon.)</h2>
<div class="level2">

<p>
<strong> Required: </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=mutlu_et_al._-_2003_-_runahead_execution_an_alternative_to_very_large_instruction_windows_for_out-of-order_processors.pdf" class="media mediafile mf_pdf" title="mutlu_et_al._-_2003_-_runahead_execution_an_alternative_to_very_large_instruction_windows_for_out-of-order_processors.pdf (298 KB)">Mutlu, O., Stark, J., Wilkerson, C., &amp; Patt, Y. N. (2003). Runahead Execution: An Alternative to Very Large Instruction Windows for Out-of-Order Processors. Proceedings of the 9th International Symposium on High-Performance Computer Architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=04147648.pdf" class="media mediafile mf_pdf" title="04147648.pdf (256.4 KB)">Srinath, S., Mutlu, O., Kim, H., &amp; Patt, Y. N. (2007). Feedback Directed Prefetching: Improving the Performance and Bandwidth-Efficiency of Hardware Prefetchers. Proceedings of the 2007 IEEE 13th International Symposium on High Performance Computer Architecture.</a></div>
</li>
</ul>

<p>
<strong> Recommended: </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=24400233.pdf" class="media mediafile mf_pdf" title="24400233.pdf (386.5 KB)">Mutlu, O., Kim, H., &amp; Patt, Y. N. (2005). Address-Value Delta (AVD) Prediction: Increasing the Effectiveness of Runahead Execution by Exploiting Regular Memory Allocation Patterns. Proceedings of the 38th annual IEEE/ACM International Symposium on Microarchitecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=01603492.pdf" class="media mediafile mf_pdf" title="01603492.pdf (163.2 KB)">Mutlu, O., Kim, H., &amp; Patt, Y. N. (2006). Efficient Runahead Execution: Power-Efficient Memory Latency Tolerance. IEEE Micro.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=21260119.pdf" class="media mediafile mf_pdf" title="21260119.pdf (289 KB)">Armstrong, D. N., Kim, H., Mutlu, O., &amp; Patt, Y. N. (2004). Wrong Path Events: Exploiting Unusual and Illegal Program Behavior for Early Misprediction Detection and Recovery. Proceedings of the 37th annual IEEE/ACM International Symposium on Microarchitecture.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit25" id="lecture_27_4_8_wed">Lecture 27 (4/8 Wed.)</h2>
<div class="level2">

<p>
<strong> Required: </strong>
</p>
<ul>
<li class="level1"><div class="li"> None</div>
</li>
</ul>

<p>
<strong> Mentioned during lecture: </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p176-baer.pdf" class="media mediafile mf_pdf" title="p176-baer.pdf (1.1 MB)">Baer, J.-L., &amp; Chen, T.-F. (1991). An effective on-chip preloading scheme to reduce data access penalty. Proceedings of the 1991 ACM/IEEE conference on Supercomputing.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=jouppi_-_1990_-_improving_direct-mapped_cache_performance_by_the_addition_of_a_small_fully-associative_cache_and_prefetch_buffers.pdf" class="media mediafile mf_pdf" title="jouppi_-_1990_-_improving_direct-mapped_cache_performance_by_the_addition_of_a_small_fully-associative_cache_and_prefetch_buffers.pdf (1.1 MB)">Jouppi, N. P. (1990). Improving direct-mapped cache performance by the addition of a small fully-associative cache and prefetch buffers. Proceedings of the 17th annual international symposium on Computer Architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=mowry_lam_gupta_-_1992_-_design_and_evaluation_of_a_compiler_algorithm_for_prefetching.pdf" class="media mediafile mf_pdf" title="mowry_lam_gupta_-_1992_-_design_and_evaluation_of_a_compiler_algorithm_for_prefetching.pdf (1.6 MB)">Mowry, T. C., Lam, M. S., &amp; Gupta, A. (1992). Design and evaluation of a compiler algorithm for prefetching. Proceedings of the fifth international conference on Architectural support for programming languages and operating systems.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit26" id="lecture_28_4_14_mon">Lecture 28 (4/14 Mon.)</h2>
<div class="level2">

<p>
<strong> Required: </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=amdahl_-_1967_-_validity_of_the_single_processor_approach_to_achieving_large_scale_computing_capabilities.pdf" class="media mediafile mf_pdf" title="amdahl_-_1967_-_validity_of_the_single_processor_approach_to_achieving_large_scale_computing_capabilities.pdf (281.6 KB)">Amdahl, G. M. (1967). Validity of the single processor approach to achieving large scale computing capabilities. Proceedings of the April 18-20, 1967, spring joint computer conference.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=lamport_-_1979_-_how_to_make_a_multiprocessor_computer_that_correctly_executes_multiprocess_programs.pdf" class="media mediafile mf_pdf" title="lamport_-_1979_-_how_to_make_a_multiprocessor_computer_that_correctly_executes_multiprocess_programs.pdf (465.9 KB)">Lamport, L. (1979). How to Make a Multiprocessor Computer That Correctly Executes Multiprocess Programs.</a></div>
</li>
<li class="level1"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/culler-mesi.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/culler-mesi.pdf" rel="nofollow">C&amp;S, Chapters 5.1 &amp; 5.3</a></div>
</li>
<li class="level1"><div class="li"> P&amp;H, Chapter 5.8</div>
</li>
</ul>

<p>
<strong> Recommended: </strong>
</p>
<ul>
<li class="level1"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/hill_309_314.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/hill_309_314.pdf" rel="nofollow">Hill, Jouppi, Sohi. "Multiprocessors and Multicomputers," pp. 551-560 in Readings in Computer Architecture.</a></div>
</li>
<li class="level1"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/hill_551_560.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/hill_551_560.pdf" rel="nofollow">Hill, Jouppi, Sohi. "Dataflow and Multithreading," pp. 309-314 in Readings in Computer Architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=01447203.pdf" class="media mediafile mf_pdf" title="01447203.pdf (959.1 KB)">Flynn, M. J. (1966). Very high-speed computing systems. Proceedings of the IEEE.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=papamarcos_patel_-_1984_-_a_low-overhead_coherence_solution_for_multiprocessors_with_private_cache_memories.pdf" class="media mediafile mf_pdf" title="papamarcos_patel_-_1984_-_a_low-overhead_coherence_solution_for_multiprocessors_with_private_cache_memories.pdf (577.1 KB)">Papamarcos, M. S., &amp; Patel, J. H. (1984). A low-overhead coherence solution for multiprocessors with private cache memories. Proceedings of the 11th annual international symposium on Computer architecture.</a></div>
</li>
</ul>

<p>
<strong> Mentioned during lecture: </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p176-baer.pdf" class="media mediafile mf_pdf" title="p176-baer.pdf (1.1 MB)">Baer, J.-L., &amp; Chen, T.-F. (1991). An effective on-chip preloading scheme to reduce data access penalty. Proceedings of the 1991 ACM/IEEE conference on Supercomputing.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=04147648.pdf" class="media mediafile mf_pdf" title="04147648.pdf (256.4 KB)">Srinath, S., Mutlu, O., Kim, H., &amp; Patt, Y. N. (2007). Feedback Directed Prefetching: Improving the Performance and Bandwidth-Efficiency of Hardware Prefetchers. Proceedings of the 2007 IEEE 13th International Symposium on High Performance Computer Architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=joseph_grunwald_-_1997_-_prefetching_using_markov_predictors.pdf" class="media mediafile mf_pdf" title="joseph_grunwald_-_1997_-_prefetching_using_markov_predictors.pdf (1.4 MB)">Joseph, D., &amp; Grunwald, D. (1997). Prefetching using Markov predictors. Proceedings of the 24th annual international symposium on Computer architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p279-cooksey.pdf" class="media mediafile mf_pdf" title="p279-cooksey.pdf (1.1 MB)">Cooksey, R., Jourdan, S., &amp; Grunwald, D. (2002). A stateless, content-directed data prefetching mechanism. Proceedings of the 10th international conference on Architectural support for programming languages and operating systems.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=04798232.pdf" class="media mediafile mf_pdf" title="04798232.pdf (360.9 KB)">Ebrahimi, E., Mutlu, O., &amp; Patt, Y. N. (2009). Techniques for bandwidth-efficient prefetching of linked data structures in hybrid prefetching systems. High Performance Computer Architecture, 2009.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p186-chappell.pdf" class="media mediafile mf_pdf" title="p186-chappell.pdf (126.5 KB)">Chappell, R. S., Stark, J., Kim, S. P., Reinhardt, S. K., &amp; Patt, Y. N. (1999). Simultaneous subordinate microthreading (SSMT). Proceedings of the 26th annual international symposium on Computer architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p2-zilles.pdf" class="media mediafile mf_pdf" title="p2-zilles.pdf (1010.5 KB)">Zilles, C., &amp; Sohi, G. (2001). Execution-based prediction using speculative slices. Proceedings of the 28th annual international symposium on Computer architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p40-luk.pdf" class="media mediafile mf_pdf" title="p40-luk.pdf (1.1 MB)">Luk, C.-K. (2001). Tolerating memory latency through software-controlled pre-execution in simultaneous multithreading processors. Proceedings of the 28th annual international symposium on Computer architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p172-zilles.pdf" class="media mediafile mf_pdf" title="p172-zilles.pdf (119.4 KB)">Zilles, C. B., &amp; Sohi, G. S. (2000). Understanding the backward slices of performance degrading instructions. Proceedings of the 27th annual international symposium on Computer architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=mutlu_et_al._-_2003_-_runahead_execution_an_alternative_to_very_large_instruction_windows_for_out-of-order_processors.pdf" class="media mediafile mf_pdf" title="mutlu_et_al._-_2003_-_runahead_execution_an_alternative_to_very_large_instruction_windows_for_out-of-order_processors.pdf (298 KB)">Mutlu, O., Stark, J., Wilkerson, C., &amp; Patt, Y. N. (2003). Runahead Execution: An Alternative to Very Large Instruction Windows for Out-of-Order Processors. Proceedings of the 9th International Symposium on High-Performance Computer Architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=jouppi_-_1990_-_improving_direct-mapped_cache_performance_by_the_addition_of_a_small_fully-associative_cache_and_prefetch_buffers.pdf" class="media mediafile mf_pdf" title="jouppi_-_1990_-_improving_direct-mapped_cache_performance_by_the_addition_of_a_small_fully-associative_cache_and_prefetch_buffers.pdf (1.1 MB)">Jouppi, N. P. (1990). Improving direct-mapped cache performance by the addition of a small fully-associative cache and prefetch buffers. Proceedings of the 17th annual international symposium on Computer Architecture.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit27" id="lecture_29_4_16_wed">Lecture 29 (4/16 Wed.)</h2>
<div class="level2">

<p>
<strong> Required: </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=amdahl_-_1967_-_validity_of_the_single_processor_approach_to_achieving_large_scale_computing_capabilities.pdf" class="media mediafile mf_pdf" title="amdahl_-_1967_-_validity_of_the_single_processor_approach_to_achieving_large_scale_computing_capabilities.pdf (281.6 KB)">Amdahl, G. M. (1967). Validity of the single processor approach to achieving large scale computing capabilities. Proceedings of the April 18-20, 1967, spring joint computer conference.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=lamport_-_1979_-_how_to_make_a_multiprocessor_computer_that_correctly_executes_multiprocess_programs.pdf" class="media mediafile mf_pdf" title="lamport_-_1979_-_how_to_make_a_multiprocessor_computer_that_correctly_executes_multiprocess_programs.pdf (465.9 KB)">Lamport, L. (1979). How to Make a Multiprocessor Computer That Correctly Executes Multiprocess Programs.</a></div>
</li>
<li class="level1"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/culler-mesi.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/culler-mesi.pdf" rel="nofollow">C&amp;S, Chapters 5.1 &amp; 5.3</a></div>
</li>
<li class="level1"><div class="li"> P&amp;H, Chapter 5.8</div>
</li>
</ul>

</div>

<h2 class="sectionedit28" id="lecture_30_4_18_fri">Lecture 30 (4/18 Fri.)</h2>
<div class="level2">

<p>
<strong> Required: </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=lcp.pdf" class="media mediafile mf_pdf" title="lcp.pdf (525.6 KB)">Pekhimenko et al., “Linearly Compressed Pages: A Main Memory Compression Framework with Low Complexity and Low Latency,” MICRO 2013.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=bdi-compression_pact12.pdf" class="media mediafile mf_pdf" title="bdi-compression_pact12.pdf (1 MB)">Pekhimenko et al., "Base-Delta-Immediate Compression: Practical Data Compression for On-Chip Caches," PACT 2012.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=mise-predictable_memory_performance-hpca13.pdf" class="media mediafile mf_pdf" title="mise-predictable_memory_performance-hpca13.pdf (607.2 KB)">Subramanian et al., “MISE: Providing Performance Predictability and Improving Fairness in Shared Main Memory Systems,” HPCA 2013.</a> </div>
</li>
</ul>

</div>

<h2 class="sectionedit29" id="lecture_31_4_28_mon">Lecture 31 (4/28 Mon.)</h2>
<div class="level2">

<p>
<strong> Required: </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=amdahl_-_1967_-_validity_of_the_single_processor_approach_to_achieving_large_scale_computing_capabilities.pdf" class="media mediafile mf_pdf" title="amdahl_-_1967_-_validity_of_the_single_processor_approach_to_achieving_large_scale_computing_capabilities.pdf (281.6 KB)">Amdahl, G. M. (1967). Validity of the single processor approach to achieving large scale computing capabilities. Proceedings of the April 18-20, 1967, spring joint computer conference.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=lamport_-_1979_-_how_to_make_a_multiprocessor_computer_that_correctly_executes_multiprocess_programs.pdf" class="media mediafile mf_pdf" title="lamport_-_1979_-_how_to_make_a_multiprocessor_computer_that_correctly_executes_multiprocess_programs.pdf (465.9 KB)">Lamport, L. (1979). How to Make a Multiprocessor Computer That Correctly Executes Multiprocess Programs.</a></div>
</li>
<li class="level1"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/culler-mesi.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/culler-mesi.pdf" rel="nofollow">C&amp;S, Chapters 5.1 &amp; 5.3</a></div>
</li>
<li class="level1"><div class="li"> P&amp;H, Chapter 5.8</div>
</li>
</ul>

<p>
<strong> Recommended: </strong>
</p>
<ul>
<li class="level1"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/hill_309_314.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/hill_309_314.pdf" rel="nofollow">Hill, Jouppi, Sohi. "Multiprocessors and Multicomputers," pp. 551-560 in Readings in Computer Architecture.</a></div>
</li>
<li class="level1"><div class="li"> (CMU WebISO) <a href="http://www.ece.cmu.edu/~ece447/cmu_only/hill_551_560.pdf" class="urlextern" title="http://www.ece.cmu.edu/~ece447/cmu_only/hill_551_560.pdf" rel="nofollow">Hill, Jouppi, Sohi. "Dataflow and Multithreading," pp. 309-314 in Readings in Computer Architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=01447203.pdf" class="media mediafile mf_pdf" title="01447203.pdf (959.1 KB)">Flynn, M. J. (1966). Very high-speed computing systems. Proceedings of the IEEE.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=papamarcos_patel_-_1984_-_a_low-overhead_coherence_solution_for_multiprocessors_with_private_cache_memories.pdf" class="media mediafile mf_pdf" title="papamarcos_patel_-_1984_-_a_low-overhead_coherence_solution_for_multiprocessors_with_private_cache_memories.pdf (577.1 KB)">Papamarcos, M. S., &amp; Patel, J. H. (1984). A low-overhead coherence solution for multiprocessors with private cache memories. Proceedings of the 11th annual international symposium on Computer architecture.</a></div>
</li>
</ul>

<p>
<strong> Mentioned during lecture: </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p168-patel.pdf" class="media mediafile mf_pdf" title="p168-patel.pdf (650.5 KB)">Patel, J. H. (1979). Processor-memory interconnections for multiprocessors. Proceedings of the 6th annual symposium on Computer architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p196-moscibroda.pdf" class="media mediafile mf_pdf" title="p196-moscibroda.pdf (2.9 MB)">Moscibroda, T., &amp; Mutlu, O. (2009). A case for bufferless routing in on-chip networks. Proceedings of the 36th annual international symposium on Computer architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p27-gottlieb.pdf" class="media mediafile mf_pdf" title="p27-gottlieb.pdf (1.3 MB)">Gottlieb, A., Grishman, R., Kruskal, C. P., McAuliffe, K. P., Rudolph, L., &amp; Snir, M. (1982). The NYU Ultracomputer -- designing a MIMD, shared-memory parallel machine (Extended Abstract). Proceedings of the 9th annual symposium on Computer Architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p22-seitz.pdf" class="media mediafile mf_pdf" title="p22-seitz.pdf (2 MB)">Seitz, C. L. (1985). The cosmic cube. Commun. ACM.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p278-glass.pdf" class="media mediafile mf_pdf" title="p278-glass.pdf (948.3 KB)">Glass, C. J., &amp; Ni, L. M. (1992). The turn model for adaptive routing. Proceedings of the 19th annual international symposium on Computer architecture.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit30" id="lecture_32_4_30_wed">Lecture 32 (4/30 Wed.)</h2>
<div class="level2">

<p>
<strong> Required: </strong>
</p>
<ul>
<li class="level1"><div class="li"> None</div>
</li>
</ul>

<p>
<strong> Mentioned during lecture: </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=amdahl_-_1967_-_validity_of_the_single_processor_approach_to_achieving_large_scale_computing_capabilities.pdf" class="media mediafile mf_pdf" title="amdahl_-_1967_-_validity_of_the_single_processor_approach_to_achieving_large_scale_computing_capabilities.pdf (281.6 KB)">Amdahl, G. M. (1967). Validity of the single processor approach to achieving large scale computing capabilities. Proceedings of the April 18-20, 1967, spring joint computer conference.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=grochowski_et_al._-_2004_-_best_of_both_latency_and_throughput.pdf" class="media mediafile mf_pdf" title="grochowski_et_al._-_2004_-_best_of_both_latency_and_throughput.pdf (284.3 KB)">Grochowski, E., Ronen, R., Shen, J., &amp; Wang, H. (2004). Best of Both Latency and Throughput. Proceedings of the IEEE International Conference on Computer Design (pp. 236–243).</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=tendler_et_al._-_2002_-_power4_system_microarchitecture.pdf" class="media mediafile mf_pdf" title="tendler_et_al._-_2002_-_power4_system_microarchitecture.pdf (430.5 KB)">Tendler, J. M., Dodson, J. S., Fields, J. S., Le, H., &amp; Sinharoy, B. (2002). POWER4 system microarchitecture. IBM J. Res. Dev.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=01289290.pdf" class="media mediafile mf_pdf" title="01289290.pdf (404 KB)">Kalla, R., Sinharoy, B., &amp; Tendler, J. M. (2004). IBM Power5 Chip: A Dual-Core Multithreaded Processor. IEEE Micro.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=kongetira_aingaran_olukotun_-_2005_-_niagara_a_32-way_multithreaded_sparc_processor.pdf" class="media mediafile mf_pdf" title="kongetira_aingaran_olukotun_-_2005_-_niagara_a_32-way_multithreaded_sparc_processor.pdf (126.6 KB)">Kongetira, P., Aingaran, K., &amp; Olukotun, K. (2005). Niagara: A 32-Way Multithreaded Sparc Processor. IEEE Micro.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p253-suleman.pdf" class="media mediafile mf_pdf" title="p253-suleman.pdf (955 KB)">Suleman, M. A., Mutlu, O., Qureshi, M. K., &amp; Patt, Y. N. (2009). Accelerating critical section execution with asymmetric multi-core architectures. Proceedings of the 14th international conference on Architectural support for programming languages and operating systems.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p441-suleman.pdf" class="media mediafile mf_pdf" title="p441-suleman.pdf (411.6 KB)">Suleman, M. A., Mutlu, O., Joao, J. A., Khubaib, &amp; Patt, Y. N. (2010). Data marshaling for multi-core architectures. Proceedings of the 37th annual international symposium on Computer architecture.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p223-joao.pdf" class="media mediafile mf_pdf" title="p223-joao.pdf (717.9 KB)">Joao, J. A., Suleman, M. A., Mutlu, O., &amp; Patt, Y. N. (2012). Bottleneck identification and scheduling in multithreaded applications. Proceedings of the seventeenth international conference on Architectural Support for Programming Languages and Operating Systems.</a></div>
</li>
</ul>

</div>

<h2 class="sectionedit31" id="lecture_33_5_2_fri">Lecture 33 (5/2 Fri.)</h2>
<div class="level2">

<p>
<strong> Required: </strong>
</p>
<ul>
<li class="level1"><div class="li"> None</div>
</li>
</ul>

<p>
<strong> Mentioned during lecture: </strong>
</p>
<ul>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=raidr-isca12.pdf" class="media mediafile mf_pdf" title="raidr-isca12.pdf (480.4 KB)">Liu et al., “RAIDR: Retention-Aware Intelligent DRAM Refresh,” ISCA 2012.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=2012_isca_salp.pdf" class="media mediafile mf_pdf" title="2012_isca_salp.pdf (927.3 KB)">Kim et al., “A Case for Exploiting Subarray-Level Parallelism in DRAM,” ISCA 2012.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=tldram-lee.pdf" class="media mediafile mf_pdf" title="tldram-lee.pdf (3.2 MB)">Lee et al., “Tiered-Latency DRAM: A Low Latency and Low Cost DRAM Architecture,” HPCA 2013.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=p60-liu.pdf" class="media mediafile mf_pdf" title="p60-liu.pdf (751.7 KB)">Liu et al., “An Experimental Study of Data Retention Behavior in Modern DRAM Devices,” ISCA 2013.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=rowclone_micro13.pdf" class="media mediafile mf_pdf" title="rowclone_micro13.pdf (2.4 MB)">Seshadri et al., “RowClone: Fast and Efficient In-DRAM Copy and Initialization of Bulk Data,” MICRO 2013.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=lcp.pdf" class="media mediafile mf_pdf" title="lcp.pdf (525.6 KB)">Pekhimenko et al., “Linearly Compressed Pages: A Main Memory Compression Framework,” MICRO 2013.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=" class="media mediafile mf_" title=" (22 KB)">Chang et al., “Improving DRAM Performance by Parallelizing Refreshes with Accesses,” HPCA 2014.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=error-mitigation-for-intermittent-dram-failures_sigmetrics14.pdf" class="media mediafile mf_pdf" title="error-mitigation-for-intermittent-dram-failures_sigmetrics14.pdf (8 MB)">Khan et al., “The Efficacy of Error Mitigation Techniques for DRAM Retention Failures: A Comparative Experimental Study,” SIGMETRICS 2014.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=luo_dsn14.pdf" class="media mediafile mf_pdf" title="luo_dsn14.pdf (1.6 MB)">Luo et al., “Characterizing Application Memory Error Vulnerability to Optimize Data Center Cost,” DSN 2014.</a></div>
</li>
<li class="level1"><div class="li"> Kim et al., “Flipping Bits in Memory Without Accessing Them: An Experimental Study of DRAM Disturbance Errors,” ISCA 2014.</div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=meza_cal12.pdf" class="media mediafile mf_pdf" title="meza_cal12.pdf (183.4 KB)">Meza et al., “Enabling Efficient and Scalable Hybrid Memories,” IEEE Comp. Arch. Letters 2012.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=rowbuffer-aware-caching_iccd12.pdf" class="media mediafile mf_pdf" title="rowbuffer-aware-caching_iccd12.pdf (577.5 KB)">Yoon et al., “Row Buffer Locality Aware Caching Policies for Hybrid Memories,” ICCD 2012.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=sttram_ispass13.pdf" class="media mediafile mf_pdf" title="sttram_ispass13.pdf (1.8 MB)">Kultursay  et al., “Evaluating STT-RAM as an Energy-Efficient Main Memory Alternative,” ISPASS 2013. </a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=meza_weed13.pdf" class="media mediafile mf_pdf" title="meza_weed13.pdf (667.2 KB)">Meza  et al., “A Case for Efficient Hardware-Software Cooperative Management of Storage and Memory,” WEED 2013.</a></div>
</li>
<li class="level1"><div class="li"> <a href="/~ece447/s14/lib/exe/fetch.php?media=isca09.pdf" class="media mediafile mf_pdf" title="isca09.pdf (2.6 MB)">Lee  et al. “Architecting Phase Change Memory as a Scalable DRAM Alternative,” ISCA 2009.</a>