---
layout: post
title: Geometric Deep Learning for Protein Design  
date: 2025-05-10
categories: [artificial intelligence]
tags: [protein engineering]

---

# [Promises and Pitfalls of Geometric Deep Learning for Protein Design](https://www.youtube.com/watch?v=mwtaywMl_Cs)


## Abstract

Protein design appears to be an ideal application of geometric deep learning, with well-motivated symmetries and inductive biases from physics and structural biology. Indeed, until recently in silico protein design was completely dominated by hand-crafted structural models. Recent successes with sequence models are challenging this paradigm, but many researchers still believe strong geometric inductive biases are essential for generalization in data-scarce regimes. We will review a pragmatic assessment of the strengths and weaknesses of structural and sequence-based methods, and discuss the greatest opportunities and challenges facing structural methods in particular in contemporary protein design problems.

### Bio
Samuel Stanton is a Machine Learning Scientist at Genentech, working on ML-driven drug discovery with the Prescient Design team. Prior to joining Genentech, Samuel received his PhD from the NYU Center for Data Science as an NDSEG fellow under the supervision of Dr. Andrew Gordon Wilson. Samuel’s recent work includes core contributions to Genentech’s “lab-in-the-loop” active learning system for molecule lead optimization, as well as basic research on uncertainty quantification and decision-making with machine learning.


<iframe width="600" height="400" src="https://www.youtube.com/embed/mwtaywMl_Cs?si=wP0Ze56areUwmaZC" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Major Challenges

기하학적 딥 러닝을 단백질 설계에 적용할 때 여러 주요 과제와 예상치 못한 장애물들이 존재하며, **단백질 설계에 기하학적 딥 러닝을 적용하는 것은 아직 완전히 해결된 문제가 아니라고** 언급됩니다.

다음은 자료에서 확인된 주요 과제들입니다:

*   **정적인 구조 데이터와 단백질의 동적 본질 간의 불일치**:
    *   단백질은 리보솜에서 번역된 후 정적인 특정 구조로 접히는 것이 아니라 접힌 후에 움직이며, 이는 **구조적 형태 앙상블(conformational ensemble)**로 알려져 있습니다. 단백질의 기능은 3D 공간에서의 아미노산 실제 배열의 결과이며, 서열이 구조적 형태 앙상블을 결정하고, 이것이 다시 기능을 결정하는 정보 흐름을 따릅니다.
    *   그러나 단백질 접힘 모델 학습에 사용되는 PDB의 단백질 구조는 **얼어붙은 결정화된 구조(frozen crystallized structures)**입니다. 우리는 단백질이 사람과 같은 환경에서 작용하기를 원하지만, 이러한 환경은 얼어붙은 상태가 아닙니다. 접힘 모델이 예측하는 것은 이러한 얼어붙은 구조에 대한 최선의 추측이며, 이는 실제 실온 구조와 다를 수 있습니다. 이는 **도메인 이동(domain shift)**의 고전적인 예시입니다.
    *   **단백질은 정적인 점 구름(static point clouds) 그 이상**입니다. 설계 문제 또한 정적인 방식으로 제시되는 경우가 많습니다.

*   **형태 앙상블에 적절하게 조건화하는 방법**:
    *   단백질이 정적인 구조가 아니라는 점이 더 널리 인식되고 있지만, 여전히 정적인 방식으로 조건화하고 있습니다. 시작 상태와 원하는 최종 상태를 포함하는 "비디오" 또는 궤적과 같은 것에 조건화하는 방법은 아직 해결되지 않은 문제입니다.
    *   전통적인 분자 동역학(MD) 시뮬레이션은 학습에 필요한 양의 데이터를 얻기에는 너무 느립니다. AlphaFold와 같은 최근 연구들은 MD를 실제로 실행하지 않고 MD와 유사한 데이터를 얻는 방법에 대해 고민하기 시작했습니다.

*   **강력한 사전 정보 사용의 어려움**:
    *   기하학적 딥 러닝은 사전 물리적 지식을 모델에 통합하는 것을 목표로 합니다. 물리학은 강력한 사전 정보(prior)로 여겨집니다. "물리학은 강력한 사전 정보이니 더 나을 것이다"라고 생각할 수 있지만, 실제로는 더 미묘합니다.
    *   **강력한 사전 정보는 매우 용서가 없습니다(extremely unforgiving)**. 만약 가정이 잘못되었거나 구현에 오류가 있다면, 모델은 잘못된 곳으로 수렴하게 되며, 아무리 많은 데이터를 사용해도 진실에 도달할 수 없게 됩니다. 사전 정보의 강도는 가정의 진실성과 구현의 품질에 대한 확신에 비례해야 합니다.
    *   등변성(equivariance)과 같은 강력한 가정을 모델에 도입하는 것은 구현이 매우 어렵고, 별칭(aliasing)을 올바르게 처리하지 않으면 깨질 수 있습니다. 이는 올바르다는 고위험 고수익 도박과 같습니다.

*   **유연한 영역 설계의 어려움**:
    *   구조적 방법(전통적인 물리학 기반 접근법과 ML 증강 접근법 모두)은 **매우 단단하고 대칭적인 구조**를 가진 단백질을 설계하는 데 가장 효과적입니다. 대칭적인 단백질이나 캡시드와 같은 구조는 구조적 방법으로 잘 설계될 수 있습니다.
    *   그러나 항체와 같이 기능이 **CDR(초가변 영역)**에 의해 결정되는 단백질은 다릅니다. CDR은 단단하지 않고 매우 유연하며, 구조 모델에게 가장 어려운 부분입니다. 전체 항체 구조의 RMSD가 나쁘지 않더라도, 루프(loops) 부분에서 큰 실수가 발생할 수 있으며, 이는 항체가 결합하는지 여부에 대한 예측을 완전히 바꿀 수 있습니다. 이것은 모델이 예측하기 매우 어려운 것이며, 세밀한 예측을 하려는 경우 주요 장애물입니다.

*   **평가 및 일반화의 과제**:
    *   현재 구조적 정보를 포함하는 모델에 대한 평가는 종종 구조에 편향된 작업(예: 접힘 예측, 원격 상동성 예측)에 초점을 맞춥니다. 더 일반적인 기능적 분석(functional assays)에 대한 평가는 결과가 혼합되어 있으며, 구조 정보가 항상 도움이 되는 것은 아닙니다.
    *   생성 모델의 인기 때문에 현재 많이 논의되지는 않지만, **일반화(generalization)의 어려움**은 실제로 좋은 결과를 얻는 데 있어 큰 병목 중 하나입니다. 다양한 방법이 합리적인 후보 라이브러리를 생성하지만, 실제로 테스트하고 싶은 것을 선택하는 것이 문제입니다.

*   **관점의 과제**:
    *   이 분야는 합리주의적이고 모델 중심적인 경향이 있습니다. 그러나 **도메인 지식(domain knowledge)**은 모델 아키텍처뿐만 아니라 문제를 구성하는 방식, 고려하는 데이터 등 모든 곳에 중요합니다. 항체 엔지니어와의 대화를 통해 샘플링 코드의 작은 변경(길이 변화 비활성화)만으로도 발현율이 두 배가 된 예시처럼, 모델에만 초점을 맞추면 그림의 상당 부분을 놓칠 수 있습니다.
    *   경쟁 상대를 아는 것도 중요합니다. ML 커뮤니티에서는 종종 새로운 표적에 대한 결합체(binder) 식별(hit identification)에 초점을 맞추지만, 제약 회사에서는 이미 동물에 항원을 주입하는 것과 같은 비계산적인 방법으로 이 문제를 해결하고 있을 수 있습니다. 새로운 계산 방법의 영향력(impact)은 이러한 기존 해결책을 넘어서야 합니다.

*   **적절한 문제 선택**:
    *   기하학적 딥 러닝 알고리즘은 데이터가 부족한 환경에서 잘 작동한다는 이유로 개발되는 경우가 많습니다. 그러나 결합 친화도(binding affinity)와 같은 문제는 진정으로 데이터가 부족한 문제가 아닐 수 있습니다. 체내에서 항체가 얼마나 빨리 배출되는지를 나타내는 **클리어런스(clearance)**와 같이 원숭이를 통해서만 신뢰할 수 있게 측정할 수 있는 특성은 진정으로 데이터가 부족한 예시입니다. 하지만 이러한 문제는 매우 복잡한 시스템이기 때문에 훨씬 더 어려운 문제일 수 있습니다.

요약하자면, 기하학적 딥 러닝을 단백질 설계에 적용하는 주요 과제는 단백질의 동적 특성, 구조 결정의 한계(결정화 아티팩트), 유연한 영역 설계의 어려움, 강력한 사전 정보 사용의 위험, 효과적인 평가 방법 부족, 그리고 단순히 모델에만 집중하기보다는 폭넓은 도메인 지식과 실제 문제의 맥락을 이해하는 것의 중요성 등입니다.


## 단백질 설계의 전통적인 방법

주로 **물리학 기반 접근법(physics-based approaches)**에 의해 지배되었습니다.

이러한 접근법의 대표적인 모델로는 **Rosetta**가 언급됩니다.

물리학 기반 접근법의 일반적인 작업 흐름은 다음과 같습니다:
1.  **구조적 방식으로 요구사항을 지정**합니다. 예를 들어, 특정 에피토프(epitope)에 상보적인 결합 인터페이스를 원하거나 특정 대칭 또는 안정성 개념을 가진 구조를 원한다고 명시합니다. 즉, 목표를 구조적인 용어로 지정합니다.
2.  이러한 사양을 **충족하는 구조를 설계**합니다.
3.  그다음 **역접힘(inverse folding)**을 통해 해당 구조를 서열 공간(sequence space)으로 매핑합니다.

이러한 **구조적 방법(structural methods)**은 (전통적인 물리학 기반 접근법과 ML 증강 접근법 모두 포함하여) **매우 강성(rigid)적이고 대칭적인 구조**를 가진 단백질을 설계하는 데 가장 효과적입니다. 예를 들어, 실험실에서 발현되는 단백질이나 매우 예쁜(pretty) 대칭적인 단백질을 생성하는 데 좋습니다. 대칭적인 단백질이나 캡시드(capsids)와 같은 구조는 이러한 구조적 방법으로 잘 설계될 수 있습니다. 이러한 방법은 **강력한 귀납 편향(strong inductive biases)**을 가지고 있기 때문에 데이터가 많이 필요하지 않는 경향이 있습니다.

하지만 이러한 전통적인 방법은 **문제에 따라 매우 특화된(problem-specific)** 경향이 있으며, 약간 다르지만 상당히 다른 문제를 위해 재구성하는 데 상당한 시간이 소요될 수 있습니다. 또한 항체와 같이 **유연한 영역(flexible regions)**에 의해 기능이 결정되는 단백질 설계에는 어려움을 겪습니다. 특히 항체의 CDR(초가변 영역)과 같이 강성하지 않고 유연한 부분은 구조 모델에게 가장 어려운 부분이며, 이러한 루프(loops) 부분에서 발생하는 큰 실수는 항체 결합 예측을 완전히 바꿀 수 있습니다.


## 단백질 설계를 위한 기하학적 딥러닝

단백질 설계를 위한 기하학적 딥러닝은 아직 **완전히 해결된 문제가 아니며**, 여러 주요 한계 또는 예상치 못한 장애물에 직면해 있습니다. 이러한 한계들은 다음과 같습니다.

*   **단백질의 동적인 특성과 정적인 구조 데이터 간의 불일치**: 단백질은 접힌 후에도 움직이며, 이는 **구조적 형태 앙상블(conformational ensemble)**로 존재합니다. 그러나 단백질 접힘 모델 학습에 사용되는 PDB의 단백질 구조는 종종 **얼어붙은 결정화된 구조(frozen crystallized structures)**입니다. 우리가 단백질이 기능하길 바라는 환경(예: 인체)은 얼어붙은 상태가 아니며, 이는 실제 실온 구조와 다를 수 있습니다. 이는 **도메인 이동(domain shift)**의 고전적인 예시입니다. 단백질은 **정적인 점 구름(static point clouds) 그 이상**이며, 현재의 구조 모델들은 이러한 정적인 구조를 예측하는 데 집중하고 있습니다.
*   **형태 앙상블에 적절하게 조건화하는 방법의 부재**: 단백질의 동적인 특성이 인식되고 있지만, 여전히 모델들은 정적인 방식으로 조건화됩니다. 시작 상태와 최종 상태를 포함하는 "비디오" 또는 궤적과 같은 것에 조건화하는 방법은 **아직 해결되지 않은 문제입니다**. 전통적인 분자 동역학(MD) 시뮬레이션은 학습에 필요한 데이터를 얻기에는 너무 느립니다.
*   **유연한 영역(예: 항체 CDR) 설계의 어려움**: 구조적 방법은 **매우 단단하고 대칭적인 구조**를 가진 단백질 설계에 가장 효과적입니다. 그러나 항체의 기능이 결정되는 **CDR(초가변 영역)**은 단단하지 않고 매우 유연하며, 구조 모델에게 가장 어려운 부분입니다. 전체 항체 구조의 RMSD가 좋더라도, 루프(loops) 부분에서 큰 실수가 발생할 수 있으며, 이는 항체가 결합하는지 여부에 대한 예측을 완전히 바꿀 수 있습니다. 이는 **정밀한 예측을 하려는 경우 주요 장애물**입니다.
*   **강력한 사전 정보(물리학) 사용의 위험**: 기하학적 딥 러닝은 물리학과 같은 강력한 사전 정보를 통합하려 하지만, **강력한 사전 정보는 매우 용서가 없습니다(extremely unforgiving)**. 가정이 잘못되었거나 구현(예: 등변성 처리)에 오류가 있다면, 모델은 잘못된 곳으로 수렴하게 되며, 아무리 많은 데이터를 사용해도 진실에 도달할 수 없게 됩니다. 이는 **고위험 고수익 도박과 같습니다**. 사전 정보의 강도는 가정의 진실성과 구현의 품질에 대한 확신에 비례해야 합니다.
*   **평가 방법의 한계와 일반화의 어려움**: 구조적 정보를 포함하는 모델에 대한 현재 평가는 종종 접힘 예측이나 원격 상동성 예측과 같이 **구조에 편향된 작업**에 초점을 맞춥니다. 더 일반적인 기능적 분석(functional assays)에 대한 평가는 **결과가 혼합되어 있으며**, 구조 정보가 항상 도움이 되는 것은 아닙니다. 생성 모델의 인기 때문에 현재 많이 논의되지 않지만, **일반화(generalization)의 어려움**은 실제로 좋은 결과를 얻는 데 있어 큰 병목 중 하나입니다.
*   **관점의 한계 및 도메인 지식의 중요성 간과**: 이 분야는 합리주의적이고 모델 중심적인 경향이 있습니다. 그러나 **도메인 지식(domain knowledge)**은 모델 아키텍처뿐만 아니라 문제를 구성하는 방식, 고려하는 데이터 등 **모든 곳에 중요합니다**. 모델에만 초점을 맞추면 그림의 상당 부분을 놓칠 수 있으며, 경쟁 상대를 아는 것(기존의 비계산적 해결책) 또한 새로운 계산 방법의 영향력(impact)을 평가하는 데 중요합니다.
*   **적절한 문제 선택의 중요성**: 기하학적 딥 러닝 알고리즘은 데이터가 부족한 환경에서 잘 작동한다는 이유로 개발되는 경우가 많습니다. 그러나 결합 친화도(binding affinity)와 같은 문제는 진정으로 데이터가 부족한 문제가 아닐 수 있습니다. 체내에서 항체가 얼마나 빨리 배출되는지를 나타내는 **클리어런스(clearance)**와 같이 원숭이를 통해서만 신뢰할 수 있게 측정할 수 있는 특성은 진정으로 데이터가 부족한 예시이지만, 이러한 문제는 **매우 복잡한 시스템**이기 때문에 훨씬 더 어려운 문제일 수 있습니다. 올바른 도구를 올바른 문제에 적용하는 것이 중요합니다.

요약하자면, 기하학적 딥 러닝을 단백질 설계에 적용하는 것은 단백질의 동적인 본질을 포착하기 어려운 정적인 데이터의 한계, 유연한 구조 설계의 어려움, 강력하지만 부정확할 수 있는 사전 정보의 위험성, 기능적 평가 및 일반화의 불확실성, 그리고 모델 자체를 넘어선 광범위한 도메인 지식과 문제의 실제 맥락을 이해하는 것의 중요성 등 여러 복합적인 한계에 직면해 있습니다.