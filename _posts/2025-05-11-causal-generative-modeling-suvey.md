---
layout: post
title: A Survey on Causal Generative Modeling 
date: 2025-05-11
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# [A Survey on Causal Generative Modeling](https://github.com/Akomand/Causal-Generative-Modeling-Survey)


## [Overview](https://notebooklm.google.com/notebook/a8a514a5-ef22-45a9-afc3-31b39a048a22/audio)

인과 생성 모델링 분야는 전통적인 심층 생성 모델(예: VAE, GAN, Normalizing Flows, Diffusion Models)의 한계를 극복하기 위해 부상했습니다. 전통적인 모델은 복잡한 데이터 분포를 근사화하여 새로운 데이터를 생성하는 데는 능숙하지만, 생성 과정에 영향을 미치는 기저 요인들이 무엇인지, 그리고 그 요인들이 어떻게 영향을 미치는지(인과 메커니즘)는 포착하지 못합니다.

인과 생성 모델링의 핵심 목표는 변수 간의 인과 메커니즘을 모델링하여, 보다 **견고하고 실제 세계의 복잡성을 반영하는 모델**을 학습하는 것입니다. 이를 통해 특정 요인을 변경했을 때 나타나는 효과를 **개입(Intervention)**을 통해 쉽게 추론할 수 있으며, 학습 데이터의 범위를 벗어나는 상황에 대한 **반사실적(Counterfactual) 인스턴스**를 생성하여 "환자 시뮬레이션"과 같은 것을 가능하게 합니다.

이 분야의 주요 연구 문제 및 접근 방식은 크게 두 가지 범주로 나눌 수 있습니다:

1.  **인과 표현 학습 (Causal Representation Learning, CRL)**:
    *   **연구 문제:** 관측된 데이터(x)로부터 기저에 있는 인과 변수(z), 해당 인과 DAG(방향성 비순환 그래프), 그리고 인과 메커니즘(z를 생성하는 함수)을 학습하는 것을 목표로 합니다. 주요 과제는 이러한 기저 인과 요인과 메커니즘을 **식별 가능하게(Identifiable)** 학습하는 것입니다. 식별 가능성은 모델 학습을 여러 번 수행하더라도 (허용 가능한 모호성 내에서) 항상 동일한 고유한 해를 얻는 것을 보장합니다.
    *   **접근 방식:** 다양한 유형의 데이터를 활용하고 특정 가정을 통해 식별성을 달성합니다.
        *   **데이터 유형별 접근 방식:**
            *   **관측 데이터 (Observational):** 순수한 통계적 상관관계만 모델링하며 인과적 관점을 제공하지 않습니다. 단독으로는 식별성을 보장하기 어렵습니다.
            *   **개입 데이터 (Interventional):** 시스템을 조작하여 다른 변수에 대한 하류 효과를 관찰하는 데 중점을 둡니다. 인과 변수에 대한 단일 노드 개입을 포함하는 짝지어지지 않은(unpaired) 개입 데이터를 사용한 접근 방식이 있습니다. 여러 관련 분포로부터 학습하는 멀티 환경 설정도 포함됩니다.
            *   **반사실 데이터 (Counterfactual):** 가장 복잡한 계층이며, 특정 개입 하에 사실과 반대되는 대안적 상황을 상상하는 단위 수준 쿼리를 다룹니다.
        *   **모델 및 기술 기반 접근 방식:**
            *   **VAE 기반:** CausalVAE, SCM-VAE, ICM-VAE, DEAR, Discrepancy-VAE 등이 있습니다. 이러한 모델은 잠재 공간의 인과 변수에 대한 사후 분포를 학습합니다. 종종 보조 레이블 정보나 구조적 인과 사전(prior)을 사용하여 식별성을 도모합니다.
            *   **Temporal Methods:** CITRIS, iCITRIS, BISCUIT 등 시간적 종속성과 개입을 활용하여 인과 변수를 식별하는 접근 방식입니다. BISCUIT은 알려지지 않은 이진 상호작용(binary interaction) 변수를 가정합니다.
            *   **비모수적 CRL:** 인과 그래프나 개입 대상이 모두 알려지지 않은 설정에서 CRL을 연구합니다.
            *   **식별성 기술:** 보조 변수/레이블 사용, 대비 학습(contrastive learning), 독립 메커니즘 분석(Independent Mechanism Analysis), 희소성(sparsity) 제약, 멀티 환경/멀티 뷰 데이터 활용 등이 식별성을 달성하기 위한 주요 기술입니다.

2.  **제어 가능한 반사실 생성 (Controllable Counterfactual Generation, CCG)**:
    *   **연구 문제:** 사실적 관찰에 대한 반사실적 이미지를 생성하는 것이 주요 목표입니다. 특히 관측된 레이블이 주어졌을 때 고품질의 이미지 반사실을 생성하는 데 중점을 둡니다.
    *   **접근 방식:** 다양한 유형의 생성 모델을 활용하여 인과 관계를 모델링하고 반사실적 추론을 수행합니다. 반사실적 추론은 일반적으로 Pearl의 인과 계층(Pearl's Causal Hierarchy, PCH)의 세 단계, 즉 **납치(Abduction), 행동(Action), 예측(Prediction)**을 따릅니다.
        *   **납치 (Abduction):** 관측값(z)과 호환되는 노이즈 항(ϵ)을 추론합니다 (즉, p(ϵ|z)).
        *   **행동 (Action):** 원하는 조작에 해당하는 개입 do(zi = c)를 수행하여 수정된 SCM(C̃)을 생성합니다. 개입은 부모와의 종속성을 제거하는 '하드 개입' 또는 부모에 대한 종속성을 변경하는 '소프트 개입'일 수 있습니다.
        *   **예측 (Prediction):** 수정된 SCM(C̃)과 추론된 노이즈(p(ϵ|z))를 기반으로 반사실적 결과를 계산합니다.
    *   **모델 패러다임 기반 접근 방식:**
        *   **GAN 기반:** CausalGAN, CGN, CONIC 등이 있습니다. 이러한 모델은 생성자를 사용하여 인과 변수 간의 메커니즘을 학습하고 적대적 학습 과정을 통해 샘플을 생성합니다. CausalGAN은 조건부 GAN을 수정하여 개입 분포에서 샘플링을 지원합니다.
        *   **Flow/VAE 기반:** DSCM, Causal-HVAE 등이 있습니다. DSCM은 정규화 흐름(Normalizing Flows)을 사용하여 SCM을 모델링하고 VAE 기반 방법을 통해 외인성 노이즈를 추론하여 반사실적 추론을 수행합니다. Causal-HVAE는 잠재 매개변수(mediator)를 도입하여 직간접 효과 계산을 가능하게 합니다.
        *   **Diffusion 기반:** Diff-SCM, DCM 등이 있습니다. 확산 모델은 고품질 데이터 생성에 효과적이며, 인과 프로세스를 모델링하여 반사실 추론을 가능하게 합니다. DCM은 각 인과 변수에 대해 별도의 확산 모델을 학습하고 부모 변수에 조건을 부여하여 반사실 추론을 수행합니다.

이 분야의 애플리케이션으로는 신뢰할 수 있는 AI, 정밀 의학 및 생물학이 언급됩니다. 예를 들어, 희소하거나 수집이 어려운 환자 데이터를 증강하는 데 사용될 수 있습니다.

현재 연구 과제로는 인과적 요인과 메커니즘의 식별성 문제, 특히 대규모 생성 모델에서의 식별성 연구, 차등 프라이버시(Differential Privacy) 보존, 확산 모델을 사용한 인과 표현 학습 등이 있습니다.


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
