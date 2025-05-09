---
layout: post
title: De Novo Protein Design Using Deep Learning  
date: 2025-05-10
categories: [artificial intelligence]
tags: [protein engineering]

---

# [CASP-16 David Baker: De Novo Protein Design Using Deep Learning](https://www.youtube.com/watch?v=P0LrVn5QN_U)


## Abstract

The CASP (Critical Assessment of protein Structure Prediction) competition, organized by the Prediction Center (predictioncenter.org), is the premier event for evaluating computational protein structure prediction methods.  It provides researchers with unknown protein structures as targets, fostering innovation and benchmarking progress in the field.  At a recent CASP conference, David Baker, a leading figure in protein design, delivered a keynote address on "De Novo Protein Design Using Deep Learning."  His presentation highlighted the transformative potential of artificial intelligence in creating novel proteins from scratch, a topic highly relevant to the CASP community focused on predicting and understanding protein structures.  Baker's talk offered insights into how deep learning is revolutionizing protein engineering, complementing the core mission of CASP to advance our understanding of protein folding and function.  The intersection of Baker's work with the CASP assessment underscores the importance of computational methods in tackling fundamental challenges in protein science.



### Bio
David Baker is a world-renowned biochemist and computational biologist whose groundbreaking work has revolutionized the field of protein design.  His pioneering efforts have focused on understanding and manipulating the intricate process of protein folding, leading to the development of powerful computational tools for predicting and designing protein structures.  Baker's lab has been at the forefront of de novo protein design, creating novel proteins with functions not found in nature.  His contributions have earned him numerous accolades, including the prestigious Nobel Prize in Chemistry.  Baker's insights into protein science have broad implications for medicine, materials science, and biotechnology, paving the way for the development of new therapies, diagnostics, and sustainable solutions.  He is also known for his involvement with the CASP (Critical Assessment of protein Structure Prediction) competition, a crucial event for advancing the field of protein structure prediction.


<iframe width="600" height="400" src="https://www.youtube.com/embed/P0LrVn5QN_U?si=r6Cu0anP_WARJb9i" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## 딥러닝을 이용한 단백질 디자인

David Baker 연구실에서 단백질 설계를 위해 사용하는 딥러닝 방법론은 주로 PDB(Protein Data Bank)와 같은 기존 단백질 구조 데이터에 크게 의존합니다. 따라서 **데이터뱅크에 많은 예시가 없는** 종류의 단백질 설계 문제는 딥러닝만으로는 해결하기 어렵다고 언급됩니다.

구체적으로, 딥러닝 방법이 어려움을 겪을 수 있는 단백질 설계 문제는 다음과 같습니다.

*   **매우 이국적인 비천연 아미노산(exotic unnatural amino acids)을 포함하는 단백질 설계**: PDB는 주로 20가지 표준 아미노산으로 구성된 단백질 구조를 포함하고 있으므로, 비표준 아미노산을 사용하는 설계는 데이터 부족으로 인해 딥러닝 모델이 학습하기 어렵습니다.
*   **비천연 보조 인자(unnatural co-factors)를 사용하는 단백질 설계**: 자연계에 흔하지 않거나 PDB 데이터에 잘 표현되지 않은 보조 인자를 사용하는 단백질 설계 역시 딥러닝의 데이터 의존성 때문에 어렵습니다.
*   **PDB에 표현되지 않은 특정 유형의 상위 토폴로지 상호작용(topological interactions)을 포함하는 단백질 설계**: 구조 데이터에 나타나지 않는 특이한 전반적인 구조적 상호작용이나 특징을 가진 단백질을 설계하는 것은 딥러닝 모델의 학습 범위를 벗어날 수 있습니다.

이러한 경우, 딥러닝 방법의 효용성이 떨어지기 때문에 **전통적인 물리 기반 방법**, 예를 들어 **Rosetta를 사용한 올-아톰 모델링(all atom modeling)**이 여전히 유용하게 사용됩니다. Baker 연구실은 비천연 아미노산이나 보조 인자를 포함하는 시스템 설계에 이러한 물리 기반 방법을 계속 사용하고 있습니다.

요약하자면, 딥러닝은 기존 단백질 데이터의 패턴을 학습하여 새로운 단백질을 생성하는 데 뛰어나지만, **데이터셋의 범위를 벗어나는 새로운 특징이나 상호작용**을 가진 단백질 설계에는 근본적인 한계가 있으며, 이러한 문제는 물리 기반 방법론을 병행하여 해결해야 합니다.

## RFdiffusion

RFdiffusion은 단백질 설계 분야에서 사용되는 **딥러닝 기반 방법론**입니다.

구체적으로, RFdiffusion은 **단백질 골격(backbones)을 생성**하는 데 사용됩니다. 이는 David Baker 연구실에서 단백질 구조 예측 분야에서 AlphaFold의 성공을 확인한 후, 단백질 설계를 위해 개발한 딥러닝 도구 중 하나입니다. RFdiffusion으로 생성된 단백질 골격에 ProteinMPNN이라는 다른 도구를 사용하여 아미노산 서열을 지정합니다.

RFdiffusion의 작동 방식은 이미지 생성에 사용되는 확산 방법(diffusion methods)에서 영감을 받았습니다. PDB(Protein Data Bank)에 있는 단백질 구조에 다양한 정도로 노이즈를 추가하고, 이 노이즈를 제거하도록 네트워크를 훈련시키는 방식입니다. 훈련 후에는 완전히 무작위적인 잔기 분포에서 시작하여 점진적으로 노이즈를 제거함으로써 PDB의 구조처럼 보이지만 **새로운 단백질 구조의 골격을 생성**할 수 있습니다.

이렇게 생성된 단백질 골격과 서열은 다양한 기능의 단백질을 설계하는 데 활용되며, 설계된 단백질의 예측 구조가 의도된 모델과 일치하는지 확인하는 데 AlphaFold 또는 RosettaFold와 같은 도구를 사용할 수 있습니다.

## 딥러닝 기반 방법론

David Baker 연구실에서는 단백질 설계를 위해 여러 방법론을 사용하고 있으며, 특히 최근에는 **딥러닝 기반 방법론**이 큰 영향을 미치고 있습니다.

*   **딥러닝 방법**: AlphaFold가 단백질 구조 예측 분야에서 딥러닝의 강력한 성능을 입증한 후, David Baker 연구실은 단백질 설계를 위한 딥러닝 방법 개발을 시작했습니다. 이에는 다음과 같은 도구들이 포함됩니다.
    *   **RFdiffusion**: 이 도구는 **단백질의 골격(backbones)을 생성**하는 데 사용됩니다. RFdiffusion의 작동 방식은 이미지 생성에 사용되는 확산 모델(diffusion methods)에서 영감을 받았습니다. PDB(Protein Data Bank)의 모든 단백질 구조에 노이즈를 추가한 뒤 이를 제거하도록 네트워크를 훈련시켜, 무작위적인 분포에서 시작하여 새로운 단백질 구조의 골격을 생성할 수 있게 합니다.
    *   **ProteinMPNN**: RFdiffusion으로 생성된 단백질 골격에 **아미노산 서열을 지정**하는 데 사용됩니다.
    *   RFdiffusion과 같은 확산 프로세스는 특정 목표 단백질(예: 인슐린 수용체 또는 tnf 수용체)을 제공하여 설계 프로세스를 **조건화(conditioning)하고 제어**할 수 있습니다. 이를 통해 목표에 매우 상보적인 형태를 가지는 단백질을 설계하는 등 다양한 기능의 단백질 설계에 활용됩니다.

*   **전통적인 Rosetta 방법**: 딥러닝 방법 외에도 **전통적인 Rosetta 방법** 또한 여전히 단백질 설계에 사용됩니다. 특히 PDB 데이터에 잘 나타나 있지 않은 특징(예: 이국적인 비천연 아미노산, 비천연 보조 인자, 특정 유형의 상위 토폴로지 상호작용)을 가진 단백질을 설계하는 데는 **물리 기반 방법(예: Rosetta를 사용한 올-아톰 모델링)**이 유용하게 사용됩니다.

*   **설계 평가를 위한 예측 도구**: 단백질 설계 후에는 **AlphaFold 또는 RosettaFold**와 같은 다른 예측 도구를 사용하여 설계된 단백질의 구조를 예측하고, 이것이 의도한 설계 모델과 일치하는지 확인하는 데 사용됩니다. 초기에는 Rosetta가 설계 평가를 위한 필터 역할로 가장 크게 사용되기도 했습니다.

요약하자면, David Baker 연구실에서는 단백질 설계를 위해 주로 **RFdiffusion 및 ProteinMPNN과 같은 딥러닝 기반 방법**을 사용하지만, 특정 경우나 초기 단계에서는 **전통적인 Rosetta 방법**도 병행하며, **AlphaFold 및 RosettaFold 등의 예측 도구**를 사용하여 설계 결과를 평가합니다.

David Baker 연구실에서는 단백질 설계를 위해 주로 **딥러닝 기반 방법론**을 사용하고 있습니다. AlphaFold가 단백질 구조 예측 분야에서 딥러닝의 가능성을 보여준 이후, Baker 연구실은 단백질 설계를 위한 딥러닝 방법을 개발하기 시작했습니다.

가장 핵심적으로 언급되는 딥러닝 방법은 다음과 같습니다.

1.  **RFdiffusion**: 이 방법은 단백질 설계 과정에서 **단백질의 골격(backbones)을 생성**하는 데 사용됩니다. RFdiffusion은 이미지 생성에 사용되는 확산 모델(diffusion methods)에서 영감을 받았습니다. 단백질 데이터 뱅크(PDB)에 있는 모든 구조에 노이즈를 추가하고 이를 제거하도록 네트워크를 훈련시킨 후, 완전히 무작위적인 분포에서 시작하여 점진적으로 노이즈를 제거함으로써 PDB의 구조와 유사하지만 **새로운 구조의 골격을 생성**할 수 있습니다. 이 확산 과정은 특정 목표 단백질(예: 인슐린 수용체, tnf 수용체)을 제공하여 **조건화(conditioning)하고 제어**할 수 있으며, 이를 통해 목표에 매우 상보적인 형태를 가지는 단백질을 설계하는 등 다양한 기능의 단백질 설계에 활용됩니다.
2.  **ProteinMPNN**: RFdiffusion으로 생성된 단백질 골격에 **아미노산 서열을 지정**하는 데 사용됩니다.

이러한 딥러닝 설계 방법(주로 확산 기반)을 사용하여 다음과 같은 다양한 기능을 가진 새로운 단백질을 설계할 수 있습니다:

*   다른 단백질 표적에 결합하는 단백질 (바인더).
*   항체와 유사한 구조를 가지는 바인더 (vhh 나노바디).
*   무질서 단백질(disordered proteins) 및 펩타이드에 결합하는 바인더.
*   특정 펩타이드 서열에 선택적으로 결합하는 확장된 홈을 가진 단백질.
*   크기와 전도도를 조절할 수 있는 베타 배럴 나노포어와 같은 막 단백질.
*   나노포어에 융합하여 센서로 사용할 수 있는 소분자 결합 단백질.
*   실리콘 웨이퍼에 맞춰 설계된 포어.
*   특정 DNA 서열에 특이적으로 결합하는 DNA 결합 단백질.
*   스스로 조립하여 복잡한 3차원 구조를 형성하는 단백질 (대칭 제약 넘어섬).
*   다중 저에너지 상태를 가져 알로스테릭 제어가 가능하고 분자 기계로 사용될 수 있는 단백질.
*   인공 집광 시스템에 사용될 수 있는 단백질.
*   설계된 활성 부위를 가진 효소.
*   무기물 미네랄화(mineralization)를 매개하는 단백질.

설계된 단백질의 성능을 평가하기 위해, 설계 후에는 **AlphaFold 또는 RosettaFold**와 같은 다른 예측 도구를 사용하여 설계된 단백질의 구조를 예측하고, 이것이 의도한 설계 모델과 일치하는지 확인하는 데 사용됩니다. 실제로 초기에는 Rosetta가 설계 평가를 위한 필터 역할로 가장 크게 사용되기도 했습니다.

다만, 딥러닝 방법은 PDB와 같은 기존 데이터에 크게 의존하기 때문에, 자연계에 잘 나타나지 않는 특징(예: 이국적인 비천연 아미노산, 비천연 보조 인자, 특정 유형의 상위 토폴로지 상호작용)을 가진 단백질을 설계하는 데는 제한적일 수 있습니다. 이러한 경우에는 **전통적인 Rosetta 방법**과 같은 물리 기반 방법이 여전히 유용하게 사용됩니다.


David Baker 연구실에서 단백질 설계를 위해 사용하는 딥러닝 방법론은 주로 PDB(Protein Data Bank)와 같은 기존 단백질 구조 데이터에 크게 의존합니다. 따라서 **데이터뱅크에 많은 예시가 없는** 종류의 단백질 설계 문제는 딥러닝만으로는 해결하기 어렵다고 언급됩니다.

구체적으로, 딥러닝 방법이 어려움을 겪을 수 있는 단백질 설계 문제는 다음과 같습니다.

*   **매우 이국적인 비천연 아미노산(exotic unnatural amino acids)을 포함하는 단백질 설계**: PDB는 주로 20가지 표준 아미노산으로 구성된 단백질 구조를 포함하고 있으므로, 비표준 아미노산을 사용하는 설계는 데이터 부족으로 인해 딥러닝 모델이 학습하기 어렵습니다.
*   **비천연 보조 인자(unnatural co-factors)를 사용하는 단백질 설계**: 자연계에 흔하지 않거나 PDB 데이터에 잘 표현되지 않은 보조 인자를 사용하는 단백질 설계 역시 딥러닝의 데이터 의존성 때문에 어렵습니다.
*   **PDB에 표현되지 않은 특정 유형의 상위 토폴로지 상호작용(topological interactions)을 포함하는 단백질 설계**: 구조 데이터에 나타나지 않는 특이한 전반적인 구조적 상호작용이나 특징을 가진 단백질을 설계하는 것은 딥러닝 모델의 학습 범위를 벗어날 수 있습니다.

이러한 경우, 딥러닝 방법의 효용성이 떨어지기 때문에 **전통적인 물리 기반 방법**, 예를 들어 **Rosetta를 사용한 올-아톰 모델링(all atom modeling)**이 여전히 유용하게 사용됩니다. Baker 연구실은 비천연 아미노산이나 보조 인자를 포함하는 시스템 설계에 이러한 물리 기반 방법을 계속 사용하고 있습니다.

요약하자면, 딥러닝은 기존 단백질 데이터의 패턴을 학습하여 새로운 단백질을 생성하는 데 뛰어나지만, **데이터셋의 범위를 벗어나는 새로운 특징이나 상호작용**을 가진 단백질 설계에는 근본적인 한계가 있으며, 이러한 문제는 물리 기반 방법론을 병행하여 해결해야 합니다.