---
layout: post
title: A Survey on Causal Generative Modeling 
date: 2025-05-11
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# [A Survey on Causal Generative Modeling](https://github.com/Akomand/Causal-Generative-Modeling-Survey)


## Preliminaries
### Causality
1. **Causality**, *Cambridge University Press, Cambridge, UK, 2 edition, 2009* [[book](https://doi.org/10.1145/3501714.3501743)]

2. **On Pearl’s Hierarchy and the Foundations of Causal Inference**, *Probabilistic and Causal Inference: The Works of Judea Pearl 2022* [[paper](https://doi.org/10.1145/3501714.3501743)]

3. **Elements of Causal Inference: Foundations and Learning Algorithms**, *The MIT Press 2017* [[book](https://mitpress.mit.edu/9780262037310/elements-of-causal-inference/)]


### Independent Component Analysis 
1. **Analyse générale des liaisons stochastiques: etude particulière de l’analyse factorielle linéaire**, *Review of the International Statistical Institute 1953* [[paper](https://www.jstor.org/stable/1401511)]
   
2. **Independent component analysis, a new concept?** *Signal Processing 1994* [[paper](https://www.sciencedirect.com/science/article/abs/pii/0165168494900299)]
   
3. **Nonlinear Independent Component Analysis: Existence and Uniqueness Results**, *Neural Networks 1999* [[paper](https://www.sciencedirect.com/science/article/abs/pii/S0893608098001403)]

4. **Nonlinear ICA using Auxiliary Variables and Generalized Contrastive Learning**, *AISTATS 2019* [[paper](https://arxiv.org/abs/1805.08651)]

5. **The Incomplete Rosetta Stone Problem: Identifiability Results for Multi-View Nonlinear ICA**, *UAI 2019* [[paper](https://arxiv.org/abs/1905.06642)]

6. **Independent mechanism analysis, a new concept?**, *NeurIPS 2021* [[paper](https://arxiv.org/abs/2106.05200)]

7. **On the identifiability of nonlinear ICA: Sparsity and beyond**, *NeurIPS 2022* [[paper](https://arxiv.org/abs/2206.07751)]

8. **Generalizing nonlinear ICA beyond structural sparsity**, *NeurIPS 2023* [[paper](https://arxiv.org/abs/2311.00866)]

9. **Disentanglement via mechanism sparsity regularization: A new principle for nonlinear ICA**, *CLeaR 2022* [[paper](https://arxiv.org/abs/2107.10098)]

### Identifiability in Generative Models
1. **Indeterminacy in Generative Models: Characterization and Strong Identifiability**, *AISTATS 2023* [[paper](https://arxiv.org/abs/2206.00801)]

### Disentangled Representation Learning
1. **Challenging Common Assumptions in the Unsupervised Learning of Disentangled Representations**, *ICML 2019* [[paper](https://arxiv.org/abs/1811.12359)]

2. **Variational Autoencoders and Nonlinear ICA: A Unifying Framework**, *AISTATS 2020* [[paper](https://arxiv.org/abs/1907.04809)]

3. **Weakly-supervised Disentanglement Without Compromises**, *ICML 2020* [[paper](https://arxiv.org/abs/2002.02886)]

4. **On Disentangled Representations Learned From Correlated Data**, *ICML 2021* [[paper](https://arxiv.org/abs/2006.07886)]

5. **Embrace the Gap: VAEs Perform Independent Mechanism Analysis**, *NeurIPS 2022* [[paper](https://arxiv.org/abs/2206.02416)]

6. **Synergies between disentanglement and sparsity: Generalization and identifiability in multi-task learning**, *ICML 2023* [[paper](https://proceedings.mlr.press/v202/lachapelle23a.html)]

## Causal Representation Learning (CRL)
### Observational
#### Static
1. **CausalVAE: Disentangled Representation Learning via Neural Structural Causal Models**, *CVPR 2021* [[paper](https://openaccess.thecvf.com/content/CVPR2021/html/Yang_CausalVAE_Disentangled_Representation_Learning_via_Neural_Structural_Causal_Models_CVPR_2021_paper.html)]
  
2. **Weakly Supervised Disentangled Generative Causal Representation Learning**, *JMLR 2022* [[paper](https://arxiv.org/abs/2010.02637)]

3. **SCM-VAE: Learning Identifiable Causal Representations via Structural Knowledge**, *IEEE Big Data 2022* [[paper](https://ieeexplore.ieee.org/document/10021114)]

4. **Learning Causally Disentangled Representations via the Principle of Independent Causal Mechanisms**, *IJCAI 2024* [[paper](https://arxiv.org/abs/2306.01213)]

5. **Unpaired Multi-Domain Causal Representation Learning**, *NeurIPS 2023* [[paper](https://openreview.net/forum?id=zW1uVN6Mbv)],

6. **Causal Representation Learning Made Identifiable by Grouping of Observational Variables**, *ICML 2024* [[paper](https://openreview.net/forum?id=SL6V527p1F&referrer=%5Bthe%20profile%20of%20Aapo%20Hyvarinen%5D(%2Fprofile%3Fid%3D~Aapo_Hyvarinen1))]

7. **Causal Representation Learning from Multiple Distributions: A General Setting**, *ICML 2024* [[paper](https://proceedings.mlr.press/v235/zhang24br.html)]

8. **Learning Linear Causal Representations from General Environments: Identifiability and Intrinsic Ambiguity**, *NeurIPS 2024* [[paper](https://arxiv.org/abs/2311.12267)]*

9. **Identifying General Mechanism Shifts in Linear Causal Representations**, *NeurIPS 2024* [[paper](https://arxiv.org/abs/2410.24059)]*

10. **Multi-Domain Causal Representation Learning via Weak Distributional Invariances**, *AISTATS 2024* [[paper](https://proceedings.mlr.press/v238/ahuja24a.html)]

11. **Multi-View Causal Representation Learning with Partial Observability**, *ICLR 2024* [[paper](https://openreview.net/forum?id=OGtnhKQJms)]

12. **A Sparsity Principle for Partially Observable Causal Representation Learning**, *ICML 2024* [[paper](https://proceedings.mlr.press/v235/xu24ac.html)]

13. **Identifiability Guarantees for Causal Disentanglement from Purely Observational Data**, *NeurIPS 2024* [[paper](https://arxiv.org/abs/2410.23620)]*

14. **From Causal to Concept-Based Representation Learning**, *NeurIPS 2024* [[paper](https://openreview.net/forum?id=FcVnIBYbkW)]

#### Temporal
15. **Learning Temporally Causal Latent Processes from General Temporal Data**, *ICLR 2022* [[paper](https://openreview.net/forum?id=RDlLMjLJXdq)]

16. **Temporally Disentangled Representation Learning**, *NeurIPS 2022* [[paper](https://openreview.net/forum?id=Vi-sZWNA_Ue)]

17. **Temporally Disentangled Representation Learning under Unknown Nonstationarity**, *NeurIPS 2023* [[paper](https://openreview.net/forum?id=V8GHCGYLkf&noteId=jgG1mMzOkD)]

18. **CaRiNG: Learning Temporal Causal Representation under Non-Invertible Generation Process**, *ICML 2024* [[paper](https://proceedings.mlr.press/v235/chen24ai.html)]*

19. **Causal Temporal Representation Learning with Nonstationary Sparse Transition**, *NeurIPS 2024*, [[paper](https://arxiv.org/abs/2409.03142)]*

   
### Interventional
#### Static
20. **Interventional Causal Representation Learning**, *ICML 2023* [[paper](https://arxiv.org/abs/2209.11924)]

21. **Linear Causal Disentanglement via Interventions**, *ICML 2023* [[paper](https://arxiv.org/abs/2211.16467)]

22. **Learning Linear Causal Representations from Interventions under General Nonlinear Mixing**, *NeurIPS 2023* [[paper](https://arxiv.org/abs/2306.02235)]

23. **Identifiability Guarantees for Causal Disentanglement from Soft Interventions**, *NeurIPS 2023* [[paper](https://arxiv.org/abs/2307.06250)]

24. **Causal Component Analysis**, *NeurIPS 2023* [[paper](https://arxiv.org/abs/2305.17225)]
    
25. **Nonparametric Identifiability of Causal Representations from Unknown Interventions**, *NeurIPS 2023* [[paper](https://arxiv.org/abs/2306.00542)]

26. **Score-based Causal Representation Learning From Interventions**, *CRL@NeurIPS 2023* [[paper](https://openreview.net/forum?id=MytNJ6lXAV)]

27. **General Identifiability and Achievability for Causal Representation Learning**, *AISTATS 2024* [[paper](https://proceedings.mlr.press/v238/varici24a.html)]

28. **Identifying Linearly-Mixed Causal Representations from Multi-Node Interventions**, *CLeaR 2024* [[paper](https://arxiv.org/abs/2311.02695)]

29. **Linear Causal Representation Learning from Unknown Multi-node Interventions**, *NeurIPS 2024* [[paper](https://arxiv.org/abs/2406.05937)]*

30. **Sample Complexity for Interventional Causal Representation Learning**, *NeurIPS 2024* [[paper](https://openreview.net/forum?id=XL9aaXl0u6&noteId=0uxPDmh1nn)]*

#### Temporal 
31. **CITRIS: Causal Identifiability for Temporal Intervened Sequences**, *ICML 2022* [[paper](https://arxiv.org/abs/2202.03169)]

32. **Causal Representation Learning for Instantaneous and Temporal Effects in Interactive Systems**, *ICLR 2023* [[paper](https://arxiv.org/abs/2206.06169)]

33. **BISCUIT: Causal Representation Learning from Binary Interactions**, *UAI 2023* [[paper](https://proceedings.mlr.press/v216/lippe23a.html)]

34. **Disentanglement via Mechanism Sparsity Regularization: A New Principle for Nonlinear ICA**, *CLeaR 2022* [[paper](https://arxiv.org/abs/2107.10098)]


### Counterfactual

35. **Self-Supervised Learning with Data Augmentations Provably Isolates Content from Style**, *NeurIPS 2021* [[paper](https://arxiv.org/abs/2106.04619)]

36. **Weakly supervised causal representation learning**, *NeurIPS 2022* [[paper](https://arxiv.org/abs/2203.16437)]

37. **Diffusion-based Causal Representation Learning**, *Entropy 2024* [[paper](https://www.mdpi.com/1099-4300/26/7/556)]


## Controllable Counterfactual Generation (CCG)

### GAN-based

1. **CausalGAN: Learning Causal Implicit Generative Models with Adversarial Training**, *ICLR 2018* [[paper](https://openreview.net/forum?id=BJE-4xW0W)]

2. **Counterfactual Generative Networks**, *ICLR 2021* [[paper](https://arxiv.org/abs/2101.06046)]

3. **Counterfactual Generation under Confounding**, *CML4Impact@NeurIPS 2022* [[paper](https://arxiv.org/abs/2305.18183)]


### Flow/VAE-based

4. **Deep Structural Causal Models for Tractable Counterfactual Inference**, *NeurIPS 2020* [[paper](https://arxiv.org/abs/2006.06485)]

5. **High Fidelity Image Counterfactuals with Probabilistic Causal Models**, *ICML 2023* [[paper](https://arxiv.org/abs/2306.15764)]

6. **Counterfactual Image Editing**, *ICML 2024* [[paper](https://proceedings.mlr.press/v235/pan24a.html)]*

7. **Deep Backtracking Counterfactuals for Causally Compliant Explanations**, *TMLR 2024* [[paper](https://openreview.net/forum?id=Br5esc2CXR)]*


### Diffusion-based

8. **Diffusion Causal Models for Counterfactual Estimation**, *CLeaR 2022* [[paper](https://arxiv.org/abs/2202.10166)]

9. **Causal Diffusion Autoencoders: Toward Counterfactual Generation via Diffusion Probabilistic Models**, *ECAI 2024* [[paper](https://arxiv.org/abs/2404.17735)]*

10. **Modeling Causal Mechanisms with Diffusion Models for Interventional and Counterfactual Queries**, *TMLR 2024* [[paper](https://arxiv.org/abs/2302.00860)]

## Evaluation Metrics
### Causal Representation Learning/Disentanglement

**Disentanglement, Completeness, and Informativeness (DCI)** 
- **A Framework for the Quantitative Evaluation of Disentangled Representations**, *ICLR 2018* [[paper](https://openreview.net/forum?id=By-7dz-AZ)]
- **DCI-ES: An Extended Disentanglement Framework with Connections to Identifiability**, *ICLR 2023* [[paper](https://arxiv.org/abs/2210.00364)]

**Interventional Robustness Score (IRS)**
- **Robustly disentangled causal mechanisms: Validating deep representations for interventional robustness**, *ICML 2019* [[paper](https://arxiv.org/abs/1811.00007)]

**Mean Correlation Coefficient (MCC)**

**Mutual Information Gap (MIG)**
- **Isolating sources of disentanglement in variational autoencoders**, *NeurIPS 2018* [[paper](https://arxiv.org/abs/1802.04942)]

**Causal Disentanglement Score (CDS)**
- **Exploring the Latent Space of Autoencoders with Interventional Assays**, *NeurIPS 2022* [[paper](https://arxiv.org/abs/2106.16091)]


### Counterfactual Generation
**Counterfactual Latent Divergence (CLD)**
- **Diffusion Causal Models for Counterfactual Estimation**, *CLeaR 2022* [[paper](https://arxiv.org/abs/2202.10166)]

**Axiomatic Evaluation (Composition, Reversibility, Effectiveness)**
- **Measuring axiomatic soundness of counterfactual image models**, *ICLR 2023* [[paper](https://arxiv.org/abs/2303.01274)]
- **Benchmarking Counterfactual Image Generation**, *NeurIPS 2024* [[paper](https://arxiv.org/abs/2403.20287)]

## Applications

**Marrying Causal Representation Learning with Dynamical Systems for Science**, *NeurIPS 2024* [[paper](https://arxiv.org/abs/2405.13888)]*

**Learning Identifiable Factorized Causal Representations of Cellular Responses**, *NeurIPS 2024* [[paper](https://arxiv.org/abs/2410.22472)]*
