---
layout: post
title: Higher-order Singular Value Decomposition
date: 2015-05-15
categories: [computer science]
tags: [big data]

---

# Higher-order Singular Value Decomposition 


In [multilinear
algebra](https://en.wikipedia.org/wiki/Multilinear_algebra "Multilinear algebra"), there does
not exist a general decomposition method for multi-way arrays (also
known as *N-arrays*, *higher-order arrays*, or *data-tensors*) with all
the properties of a matrix [singular value
decomposition](https://en.wikipedia.org/wiki/Singular_value_decomposition "Singular value decomposition")
(SVD). A matrix SVD simultaneously computes

​(a) a rank-*R* decomposition and

​(b) the orthonormal row/column matrices.

These two properties can be captured separately by two different
decompositions for multi-way
[arrays](https://en.wikipedia.org/wiki/Matrix_(mathematics) "Matrix (mathematics)").

Property (a) is extended to higher order by a class of closely related
constructions known collectively as [CP
decomposition](https://en.wikipedia.org/wiki/CP_decomposition "CP decomposition") (named after
the two most popular and general variants, CANDECOMP and PARAFAC). Such
decompositions represent a tensor as the sum of the n-fold outer
products of rank-1 tensors, where n is the dimension of the tensor
indices.

Property (b) is extended to higher order by a class of methods known
variably as
*[Tucker3](https://en.wikipedia.org/wiki/Tucker_decomposition "Tucker decomposition")*, *N-mode
SVD*, and *N-mode [principal component
analysis](https://en.wikipedia.org/wiki/Principal_component_analysis "Principal component analysis")*
(PCA). (This article will use the general term "Tucker decomposition".)
These methods compute the orthonormal spaces associated with the
different axes (or modes) of a tensor. The Tucker decomposition is also
used in [multilinear subspace
learning](https://en.wikipedia.org/wiki/Multilinear_subspace_learning "Multilinear subspace learning")
as [multilinear principal component
analysis](https://en.wikipedia.org/wiki/Multilinear_principal_component_analysis "Multilinear principal component analysis").
This terminology was coined by P. Kroonenberg in the 1980s, but it was
later called *multilinear SVD* and *[HOSVD](https://en.wikipedia.org/wiki/HOSVD "HOSVD")*
(higher-order SVD) by L. De Lathauwer.

Historically, much of the interest in higher-order SVDs was driven by
the need to analyze empirical data, especially in
[psychometrics](https://en.wikipedia.org/wiki/Psychometrics "Psychometrics") and
[chemometrics](https://en.wikipedia.org/wiki/Chemometrics "Chemometrics"). As such, many of the
methods have been independently invented several times, often with
subtle variations, leading to a confusing literature. Abstract and
general mathematical theorems are rare (though see
Kruskal with regard to the CP decomposition);
instead, the methods are often designed for analyzing specific data
types. The 2008 review article by Kolda and Bader^[[2]](#cite_note-2)^
provides a compact summary of the history of these decompositions, and
many references for further reading.

The concept of HOSVD was carried over to functions by Baranyi and Yam
via the [TP model
transformation](https://en.wikipedia.org/wiki/TP_model_transformation "TP model transformation"). This
extension led to the definition of the HOSVD based canonical form of
tensor product functions and Linear Parameter Varying system models
 and to convex hull manipulation based
control optimization theory, see [TP model transformation in control
theories](https://en.wikipedia.org/wiki/TP_model_transformation_in_control_theories "TP model transformation in control theories").

---

## CP decomposition

Main article: [CP
decomposition](https://en.wikipedia.org/wiki/CP_decomposition "CP decomposition")

### Definition

A CP decomposition of an N-way array *X*, with elements ![x\_{i\_1
\\cdots
i\_N}](http://upload.wikimedia.org/math/c/c/0/cc044d4b7633ee329531a9cfd3ef5a89.png),
is

![X = \\sum\_{r=1}\^{R} D\^{(r)} = \\sum\_{r=1}\^{R} a\^{(r)} \\otimes
\\cdots \\otimes
z\^{(r)}](http://upload.wikimedia.org/math/7/7/a/77a525dfda1664d1a1934bd52a05b15b.png)

where
![\\otimes](http://upload.wikimedia.org/math/e/9/d/e9dd9013ec300ceba41484dfc2c9a876.png)
denotes the [tensor product](https://en.wikipedia.org/wiki/Tensor_product "Tensor product"). The
*R* tensors
![D\^{(r)}](http://upload.wikimedia.org/math/a/e/6/ae644379728c60cc6e2f69d25ae56b50.png)
(known as *simple tensors*, *rank-1 tensors*, *dyads*, or, in [quantum
mechanics](https://en.wikipedia.org/wiki/Quantum_mechanics "Quantum mechanics"), *product
states*) are constructed from the *rN* vectors ![a\^{(r)}, \\cdots,
z\^{(r)}](http://upload.wikimedia.org/math/d/b/2/db2bcc913e3f58abc9328e184bf4d53a.png).
With indices, this is

![x\_{i\_1 \\cdots i\_N} = \\sum\_{r=1}\^{R} a\^{(r)}\_{i\_1} \\cdots
z\^{(r)}\_{i\_N}](http://upload.wikimedia.org/math/b/1/e/b1e06a183a0e49a7d7bb41783f50ecd1.png)

where
![a\^{(r)}\_{i}](http://upload.wikimedia.org/math/0/c/6/0c6b86ec52832e80673c5be75bd60ddb.png)
is the *i*-th element of the vector
![a\^{(r)}](http://upload.wikimedia.org/math/6/c/c/6ccb794085fa352908a5cec272233cdb.png),
etc.

## Tucker decomposition

Main article: [Tucker
decomposition](https://en.wikipedia.org/wiki/Tucker_decomposition "Tucker decomposition")

### History

In 1966, [L. Tucker](https://en.wikipedia.org/wiki/L._Tucker "L. Tucker") proposed a
decomposition method for three-way arrays (referred to as a 3-mode
"[tensors](https://en.wikipedia.org/wiki/Tensor "Tensor")") as a multidimensional extension of
[factor
analysis](https://en.wikipedia.org/wiki/Factor_analysis "Factor analysis").
This decomposition was further developed in the 1980s by P. Kroonenberg,
who coined the terms Tucker3, Tucker3ALS (an alternating least squares
dimensionality reduction algorithm), 3-Mode SVD, and 3-Mode
PCA. In the intervening years, several authors
developed the decomposition for *N*-way arrays. Most recently, this work
was treated in an elegant fashion and introduced to the SIAM community
by L. De Lathauwer et al. who referred to the decomposition as an
*N*-way SVD, multilinear SVD and
HOSVD.

### Definitions

Let the SVD of a real matrix be ![A = U S
V\^T](http://upload.wikimedia.org/math/5/d/a/5da728190a16452aa865cd5eced25b94.png),
then it can be written in an elementwise form as

![a\_{i\_1,i\_2} = \\sum\_{j\_1} \\sum\_{j\_2} s\_{j\_1,j\_2}
u\_{i\_1,j\_1}
v\_{i\_2,j\_2}.](http://upload.wikimedia.org/math/2/5/9/2598de3312173b0fa2568bffd76fe715.png)

![U](http://upload.wikimedia.org/math/4/c/6/4c614360da93c0a041b22e537de151eb.png)
and
![V](http://upload.wikimedia.org/math/5/2/0/5206560a306a2e085a437fd258eb57ce.png)
give, in a certain sense optimal, orthonormal basis for the column and
row space,
![S](http://upload.wikimedia.org/math/5/d/b/5dbc98dcc983a70728bd082d1a47546e.png)
is diagonal with decreasing elements. The higher-order singular value
decomposition (HOSVD) can be defined by the multidimensional
generalization of this concept:

![a\_{i\_1,i\_2,\\dots,i\_N} = \\sum\_{j\_1} \\sum\_{j\_2}\\cdots
\\sum\_{j\_N} s\_{j\_1,j\_2,\\dots,j\_N} u\^{(1)}\_{i\_1,j\_1}
u\^{(2)}\_{i\_2,j\_2} \\dots
u\^{(N)}\_{i\_N,j\_N},](http://upload.wikimedia.org/math/3/4/2/342db8e6bbadb5f1c8b09d0b7fe05239.png)

where the ![U\^{(n)} = [u\^{(n)}\_{i,j}]\_{I\_n \\times
I\_n}](http://upload.wikimedia.org/math/6/d/5/6d53b3015286aaae8b1fcf30efebd9e7.png)
matrices and the ![\\mathcal{S} = [s\_{j\_1,\\dots,j\_N}]\_{I\_1 \\times
I\_2 \\times \\cdots \\times
I\_N}](http://upload.wikimedia.org/math/d/1/a/d1a449f44327b3a4e898d443299c3174.png)
core tensor should satisfy certain requirements (similar ones to the
matrix SVD), namely

-   Each
    ![U\^{(n)}](http://upload.wikimedia.org/math/9/9/2/992a12987fb76e5c92260e1f644c03b0.png)
    is an [orthogonal
    matrix](https://en.wikipedia.org/wiki/Orthogonal_matrix "Orthogonal matrix").
-   Two subtensors of the core tensor
    ![\\mathcal{S}](http://upload.wikimedia.org/math/3/7/9/3791545a70a6e462451c97ad925d43a4.png)
    are orthogonal i.e., ![\\langle\\mathcal{S}\_{i\_n = p},
    \\mathcal{S}\_{i\_n = q}\\rangle =
    0](http://upload.wikimedia.org/math/7/b/b/7bbb859e4333d3e5bb62dbc50059d590.png)
    if ![p \\neq
    q](http://upload.wikimedia.org/math/b/e/7/be79a7c743e196ac62850c0800363371.png).
-   The subtensors in the core tensor
    ![\\mathcal{S}](http://upload.wikimedia.org/math/3/7/9/3791545a70a6e462451c97ad925d43a4.png)
    are ordered according to their [Frobenius
    norm](https://en.wikipedia.org/wiki/Frobenius_norm "Frobenius norm"), i.e.
    ![\\|\\mathcal{S}\_{i\_n = 1}\\| \\geq \\|\\mathcal{S}\_{i\_n =
    2}\\| \\geq \\dots \\geq \\|\\mathcal{S}\_{i\_n =
    I\_n}\\|](http://upload.wikimedia.org/math/2/f/1/2f13f0c1afe23614baadbfac6ad72f24.png)
    for *n* = 1, ..., *N*.

Notation:

![\\mathcal{A} = \\mathcal{S} \\times\_{n=1}\^N
U\^{(n)}](http://upload.wikimedia.org/math/3/b/7/3b744b19de81c811fea1defc072138b6.png)

### Algorithm

The HOSVD can be built from several SVDs, as
follows:

1.  Given a tensor ![\\mathcal{A} \\in \\mathbb{R}\^{I\_1 \\times I\_2
    \\times \\cdots \\times
    I\_N}](http://upload.wikimedia.org/math/8/2/3/8231f9a39603ed20e6ca93b65f99549d.png),
    construct the mode-*k* flattening
    ![\\mathcal{A}\_{(k)}](http://upload.wikimedia.org/math/0/8/1/081337c977481a332a67b13cdbec37cc.png).
    That is, the ![I\_k \\times (\\prod \_{j \\neq k}
    I\_j)](http://upload.wikimedia.org/math/8/4/2/8421d8799ff911a015cc96661f6b894c.png)
    matrix that corresponds to
    ![\\mathcal{A}](http://upload.wikimedia.org/math/8/4/c/84cc21a1ecbbe55e01e12e575a52cca2.png).
2.  Compute the [singular value
    decomposition](https://en.wikipedia.org/wiki/Singular_value_decomposition "Singular value decomposition")
    ![\\mathcal{A}\_{(k)} = U\_k \\Sigma\_k V\^T\_k
    ](http://upload.wikimedia.org/math/3/b/7/3b7359896b5a5b26bf94717538cbc7dd.png),
    and store the left singular vectors
    ![U\_k](http://upload.wikimedia.org/math/e/2/9/e29a945b822d19dbe6f85f2f0d82dd13.png).
3.  The core tensor
    ![\\mathcal{S}](http://upload.wikimedia.org/math/3/7/9/3791545a70a6e462451c97ad925d43a4.png)
    is then the projection of
    ![\\mathcal{A}](http://upload.wikimedia.org/math/8/4/c/84cc21a1ecbbe55e01e12e575a52cca2.png)
    onto the tensor basis formed by the factor matrices
    ![\\{U\_n\\}\_{n=1}\^N](http://upload.wikimedia.org/math/1/5/4/1543a2a3b49b5c80c3a83251792adcb0.png),
    i.e., ![ \\mathcal{S} = \\mathcal{A} \\times\_{n=1}\^N U\_n\^T.
    ](http://upload.wikimedia.org/math/4/4/5/445427c50056071f1faab28ddcd64010.png)

## Applications

Main applications are extracting relevant information from multi-way
arrays. Used in factor analysis, face recognition
([TensorFaces](/w/index.php?title=TensorFaces&action=edit&redlink=1 "TensorFaces (page does not exist)")),
human motion analysis and synthesis.

The HOSVD has been successfully applied to signal processing and big
data, e.g., in genomic signal
processing.and a tensor GSVD.

A combination of HOSVD and SVD also has been applied for real time event
detection from complex data streams (multivariate data with space and
time dimensions) in [Disease
surveillance](https://en.wikipedia.org/wiki/Disease_surveillance "Disease surveillance").

It is also used in [tensor product model
transformation](https://en.wikipedia.org/wiki/Tensor_product_model_transformation "Tensor product model transformation")-based
controller
design. In
[multilinear subspace
learning](https://en.wikipedia.org/wiki/Multilinear_subspace_learning "Multilinear subspace learning"),
it is modified to [multilinear principal component
analysis](https://en.wikipedia.org/wiki/Multilinear_principal_component_analysis "Multilinear principal component analysis") for gait recognition.

In machine learning, the CP-decomposition is the central ingredient in
learning probabilistic latent variables models via the technique of
moment-matching. For example, let us consider the multi-view
model which is a
probabilistic latent variable model. In this model, we posit the
generation of samples as follows: there exists a hidden random variable
that is not observed directly, given which, there are several
[conditionally
independent](https://en.wikipedia.org/wiki/Conditionally_independent "Conditionally independent")
random variables known as the different "views" of the hidden variable.
For simplicity, let us say we have three symmetrical views
![x](http://upload.wikimedia.org/math/9/d/d/9dd4e461268c8034f5c8564e155c67a6.png)
of a
![k](http://upload.wikimedia.org/math/8/c/e/8ce4b16b22b58894aa86c421e8759df3.png)-state
categorical hidden variable
![h](http://upload.wikimedia.org/math/2/5/1/2510c39011c5be704182423e3a695e91.png).
Then the empirical third moment of this latent variable model can be
written as: ![T=\\sum\_{i=1}\^{k}Pr(h=k) E[x|h=k]\^{\\otimes
3}](http://upload.wikimedia.org/math/1/b/0/1b02e1da9ddc7a8d5a2ef403f8e6ad83.png).

In applications such as [topic
modeling](https://en.wikipedia.org/wiki/Topic_modeling "Topic modeling"), this can be
interpreted as the co-occurrence of words in a document. Then the
eigenvalues of this empirical moment tensor can be interpreted as the
probability of choosing a specific topic and each column of the factor
matrix
![E[x|h=k]](http://upload.wikimedia.org/math/9/c/9/9c9e95c7547d3335723ade46cef2babc.png)
corresponds to probabilities of words in the vocabulary in the
corresponding topic.

## References

1.  Kruskal, J. B. (1989). "Rank, decomposition,
    and uniqueness for 3-way and N-way arrays". In R. Coppi & S. Bolasco
    (Eds.), *Multiway data analysis* (pp. 7–18). Amsterdam: Elsevier. [
    [PDF](http://publish.uwo.ca/~harshman/jbkrank.pdf) ].
2.  Kolda, Tamara G.; Bader, Brett W. ["Tensor
    Decompositions and
    Applications"](http://epubs.siam.org/sirev/resource/1/siread/v51/i3/p455_s1).
    *SIAM Rev.* **51**: 455–500 (46 pages).
    [doi](https://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1137/07070111X](//dx.doi.org/10.1137%2F07070111X).
    [CiteSeerX](https://en.wikipedia.org/wiki/CiteSeer#CiteSeerX "CiteSeer"):
    [10.1.1.153.2059](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.153.2059). 
3.  P Baranyi (April 2004). "TP
    model transformation as a way to LMI based controller design". *IEEE
    Transaction on Industrial Electronics* **51** (2): 387–400.
    [doi](https://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1109/tie.2003.822037](//dx.doi.org/10.1109%2Ftie.2003.822037). 
4.  P Baranyi and D. Tikk and Y. Yam
    and R. J. Patton (2003). "From Differential Equations to PDC
    Controller Design via Numerical Transformation". *Computers in
    Industry, Elsevier Science* **51**: 281–297.
    [doi](https://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1016/s0166-3615(03)00058-7](//dx.doi.org/10.1016%2Fs0166-3615%2803%2900058-7). 
5.  P Baranyi and L. Szeidl and P.
    Várlaki and Y. Yam (July 3–5, 2006). *Definition of the HOSVD-based
    canonical form of polytopic dynamic models*. Budapest, Hungary.
    pp. 660–665. 
6.  Ledyard R.
    Tucker](https://en.wikipedia.org/wiki/Ledyard_R._Tucker "Ledyard R. Tucker") (September
    1966). "Some mathematical notes on three-mode factor analysis".
    *[Psychometrika](https://en.wikipedia.org/wiki/Psychometrika "Psychometrika")* **31** (3):
    279–311.
    [doi](https://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1007/BF02289464](//dx.doi.org/10.1007%2FBF02289464). 
7.  P M. Kroonenberg (1983). ["Three-mode
    principal component analysis: Theory and
    applications"](http://three-mode.leidenuniv.nl/bibliogr/kroonenbergpm_thesis/index.html).
    *DSWO Press, Leiden*. 
8.  Lieven De Lathauwer, Bart De Moor and Joos Vandewalle (April 2000).
    ["A multilinear Singular Value
    Decomposition"](http://epubs.siam.org/doi/abs/10.1137/S0895479896305696).
    *[SIAM Journal on Matrix
    Analysis](/w/index.php?title=SIAM_Journal_on_Matrix_Analysis&action=edit&redlink=1 "SIAM Journal on Matrix Analysis (page does not exist)")*
    **21** (4): 1253–1278. 
9.  L Omberg, G. H. Golub and O. Alter (November
    2007). ["A Tensor Higher-Order Singular Value Decomposition for
    Integrative Analysis of DNA Microarray Data From Different
    Studies"](http://dx.doi.org/10.1073/pnas.0709146104). *PNAS* **104**
    (47): 18371–18376.
    [doi](https://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1073/pnas.0709146104](//dx.doi.org/10.1073%2Fpnas.0709146104).
    [PMC](https://en.wikipedia.org/wiki/PubMed_Central "PubMed Central") [2147680](//www.ncbi.nlm.nih.gov/pmc/articles/PMC2147680).
    [PMID](https://en.wikipedia.org/wiki/PubMed_Identifier "PubMed Identifier") [18003902](//www.ncbi.nlm.nih.gov/pubmed/18003902). 
10. L Omberg, J. R. Meyerson, K. Kobayashi, L. S. Drury, J. F. X. Diffley and O. Alter (October 2009). ["Global Effects of DNA Replication and DNA Replication Origin Activity on Eukaryotic Gene Expression"](http://dx.doi.org/10.1038/msb.2009.70). *Molecular Systems Biology* **5**: 312. [doi](https://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1038/msb.2009.70](//dx.doi.org/10.1038%2Fmsb.2009.70).
    [PMC](https://en.wikipedia.org/wiki/PubMed_Central "PubMed Central") [2779084](//www.ncbi.nlm.nih.gov/pmc/articles/PMC2779084).
    [PMID](https://en.wikipedia.org/wiki/PubMed_Identifier "PubMed Identifier") [19888207](//www.ncbi.nlm.nih.gov/pubmed/19888207).
    [Highlight](http://www.alterlab.org/research/highlights/msb.2009.70_Highlight.pdf). 
11. C Muralidhara, A. M. Gross, R. R. Gutell and O. Alter (April 2011). ["Tensor Decomposition Reveals Concurrent Evolutionary Convergences and Divergences and Correlations with Structural Motifs in Ribosomal RNA"](http://dx.doi.org/10.1371/journal.pone.0018768). *PLoS ONE* **6** (4): e18768. [doi](https://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1371/journal.pone.0018768](//dx.doi.org/10.1371%2Fjournal.pone.0018768).    [Highlight](http://www.alterlab.org/research/highlights/pone.0018768_Highlight.pdf). 
12. S P. Ponnapalli, M. A. Saunders, C. F. Van Loan and O. Alter (December 2011). ["A Higher-Order Generalized Singular Value Decomposition for Comparison of Global mRNA Expression from Multiple Organisms"](http://dx.doi.org/10.1371/journal.pone.0028072). *PLoS One* **6** (12): e28072. [doi](https://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1371/journal.pone.0028072](//dx.doi.org/10.1371%2Fjournal.pone.0028072).
    [Highlight](http://www.alterlab.org/research/highlights/pone.0028072_Highlight.pdf). 
13. P Sankaranarayanan, T. E. Schomay, K. A.
    Aiello and O. Alter (April 2015). ["Tensor GSVD of Patient- and
    Platform-Matched Tumor and Normal DNA Copy-Number Profiles Uncovers
    Chromosome Arm-Wide Patterns of Tumor-Exclusive Platform-Consistent
    Alterations Encoding for Cell Transformation and Predicting Ovarian
    Cancer Survival"](http://dx.doi.org/10.1371/journal.pone.0121396).
    *PLoS One* **10** (4): e0121396.
    [doi](https://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1371/journal.pone.0121396](//dx.doi.org/10.1371%2Fjournal.pone.0121396).
    [AAAS EurekAlert! Press
    Release](http://www.eurekalert.org/pub_releases/2015-04/uouh-nmi040915.php)
    and [NAE Podcast
    Feature](https://www.nae.edu/Projects/20730/wtop/134897.aspx). 
14. Hadi Fanaee-T and João Gama (May 2015).
    ["EigenEvent: An algorithm for event detection from complex data
    streams in Syndromic surveillance"](http://arxiv.org/abs/1406.3496).
    *Intelligent Data Analysis* **19** (3). 
15. Haiping Lu, K.N. Plataniotis and A.N.
    Venetsanopoulos, "[A Survey of Multilinear Subspace Learning for
    Tensor
    Data](http://www.dsp.utoronto.ca/~haiping/Publication/SurveyMSL_PR2011.pdf)",
    Pattern Recognition, Vol. 44, No. 7, pp. 1540–1551, Jul. 2011.
16. H Lu, K. N. Plataniotis, and A. N.
    Venetsanopoulos, "[MPCA: Multilinear principal component analysis of
    tensor
    objects](http://www.dsp.utoronto.ca/~haiping/Publication/MPCA_TNN08_rev2010.pdf),"
    IEEE Trans. Neural Netw., vol. 19, no. 1, pp. 18–39, Jan. 2008.
17. Anandkumar,
    Animashree; Ge, Rong; Hsu, Daniel; Kakade, Sham M; Telgarsky, Matus
    (2014). "Tensor decompositions for learning latent variable models".
    *The Journal of Machine Learning Research* **15** (1): 2773–2832. 


