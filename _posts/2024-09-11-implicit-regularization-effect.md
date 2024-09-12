---
layout: post
title: Towards Understanding the Implicit Regularization Effect of SGD
date: 2024-09-11
categories: [artificial intelligence]
tags: [machine learning]
use_math: true

---

### Article Source


* [Towards Understanding the Implicit Regularization Effect of SGD](https://www.youtube.com/watch?v=G70dA2tmbu0)

---



# Towards Understanding the Implicit Regularization Effect of SGD

* Pierfrancesco Beneventano, Princeton University

## ABSTRACT 


<iframe width="600" height="400" src="https://www.youtube.com/embed/G70dA2tmbu0?si=extiTUgBd0wDsbDy" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

**Stochastic Gradient Descent (SGD)의 Implicit Regularization Effect**는 심층 신경망의 학습 과정에서 SGD가 명시적으로 규제(regularization) 용어를 추가하지 않아도 모델의 일반화 성능을 향상시키는 경향이 있다는 것을 의미합니다. 즉, SGD는 규제화(regularization) 없이도 과적합(overfitting)을 줄이고, 좋은 일반화(generalization)를 달성하는 데 중요한 역할을 합니다. 이 효과는 명시적인 정규화 없이도 SGD가 학습 과정에서 모델이 덜 복잡한 해결책으로 수렴하도록 유도하는 것으로 이해할 수 있습니다.

### SGD에서의 Implicit Regularization 개념

1. **정규화(Regularization)의 정의**:
   일반적으로 **정규화**는 과적합을 방지하기 위해 모델의 복잡성을 제어하는 기법을 의미합니다. 흔히 사용하는 명시적 정규화 기법에는 L2 정규화(가중치 감쇠), L1 정규화, 드롭아웃 등이 있습니다. 이들은 모델이 데이터에 과도하게 맞추는 것을 방지하고, 더 일반화된 해결책을 찾도록 유도합니다.

2. **SGD의 작동 방식**:
   SGD는 전체 데이터셋 대신 무작위로 선택된 소규모 배치(batch)에 대한 그래디언트(경사)를 사용하여 모델을 업데이트합니다. 일반적인 경사 하강법(GD)이 전체 데이터셋에 대한 기울기를 계산하는 데 비해, SGD는 훨씬 더 작은 배치를 기반으로 학습하므로 노이즈가 포함된 업데이트를 수행하게 됩니다.

   이러한 업데이트 과정은 매우 미세한 진동을 일으키며, 이를 통해 SGD가 지나치게 모델의 복잡성을 증가시키지 않게끔 합니다. 이 "노이즈"는 가중치 공간에서 매끄러운 최소값을 찾도록 돕고, 덜 복잡한 해결책으로 수렴하게 만들며, 이는 결과적으로 **암묵적 정규화(Implicit Regularization)**로 작용하게 됩니다.

### Implicit Regularization의 효과

1. **SGD의 노이즈**:
   - **노이즈의 역할**: 전체 데이터를 기반으로 한 경사 하강법(GD)은 매우 정확한 방향으로 최적화를 수행합니다. 하지만 그 과정에서 복잡한 모델, 즉 학습 데이터에 지나치게 잘 맞는 모델(과적합될 가능성이 높은 모델)로 이어질 수 있습니다. 반면, SGD는 미니배치의 데이터에 따라 각 업데이트에서 노이즈가 섞여있기 때문에, 모델이 너무 복잡한 방향으로 학습하는 것을 방지해줍니다. 이 노이즈가 모델의 가중치가 특정 방식으로 지나치게 조정되지 않도록 도와주며, 그 결과 **일반화 성능**이 향상됩니다.

2. **명시적 정규화 없이도 일반화**:
   - **SGD는 간단한 솔루션을 선호**: SGD는 명시적인 정규화 항 없이도, 모델이 전체 데이터에 대한 손실을 최소화하면서 덜 복잡한(regularized) 형태로 수렴하도록 유도합니다. 이는 과적합된 모델보다는 더 단순한 모델로 수렴하는 경향을 보이게 만들며, 이러한 단순한 모델이 일반적으로 더 좋은 일반화 성능을 발휘합니다.
   - **Flat Minima(평평한 최소점) 선호**: SGD는 모델을 sharp minima(날카로운 최소점)보다 flat minima(평평한 최소점)로 수렴시키는 경향이 있습니다. Sharp minima는 특정 데이터셋에 과도하게 맞추어진 반면, flat minima는 작은 데이터셋 변화에 대해서도 강건하게 유지될 가능성이 높습니다. 이러한 flat minima는 일반적으로 더 나은 일반화 성능을 가지는 것으로 알려져 있습니다.

3. **Batch Size와 Implicit Regularization**:
   - **작은 배치 크기의 중요성**: 배치 크기가 작을수록 SGD의 노이즈가 더 크고, 이는 암묵적인 정규화 효과를 더 강하게 만들어줍니다. 반면, 배치 크기가 매우 크면 경사 하강법(GD)에 가까워지기 때문에 이러한 암묵적인 정규화 효과가 약해집니다.
   - 작은 배치 크기는 노이즈를 더 많이 유도하여 flat minima로 수렴할 확률을 높이고, 그 결과 모델의 일반화 성능을 향상시킵니다.

### 수학적 관점에서의 암묵적 정규화

Implicit Regularization의 효과를 더 수학적으로 표현하려면, SGD가 최소화하려는 **손실 함수(loss function)**의 성질을 분석할 수 있습니다. 예를 들어, 선형 회귀 문제에서 L2 손실 함수를 최소화하는 경우, 경사 하강법은 최적 해를 찾아갑니다. 이 과정에서 SGD는 일반적으로 매우 복잡한 해결책이 아닌 더 단순한 해에 수렴하는 경향이 있습니다. 이는 다음과 같은 방식으로 설명됩니다:

1. **SGD는 적은 크기의 패널티를 자연스럽게 적용**:
   - SGD가 수행하는 작은 노이즈와 같은 업데이트는 가중치 벡터가 너무 크거나 너무 복잡한 방향으로 이동하는 것을 방지합니다. 이는 암묵적으로 L2 정규화와 유사한 효과를 나타냅니다.

2. **일반화 오차에 미치는 영향**:
   - SGD는 파라미터 공간에서 무작위적으로 진동하면서 모델의 복잡성이 크게 증가하는 것을 막아줍니다. 모델이 더 단순해지고, 이는 일반화 오차가 감소하는 것으로 이어집니다.

3. **확률적 과정의 수렴 특성**:
   - SGD는 비선형 모델에서 경사 하강법의 단순한 버전과 달리, 더 부드러운(flat) 최소값을 찾게 되며, 이는 더 작은 편차를 가진 모델로 수렴하게 합니다.

### 예시: SGD의 암묵적 정규화 효과

다양한 연구들은 SGD의 암묵적 정규화 효과를 관찰해왔습니다. 예를 들어, 다음과 같은 현상들이 확인되었습니다:

1. **딥러닝에서의 일반화 성능**: 심층 신경망에서 명시적인 정규화 없이도 SGD만으로 좋은 일반화 성능을 보이는 경우가 많습니다. 특히 학습 데이터의 양이 많고 모델이 복잡할수록 이러한 효과가 두드러지게 나타납니다.
2. **최종 성능 향상**: 실험적으로도 SGD는 더 작은 배치 크기로 학습했을 때 더 일반화된 성능을 보이는 경우가 많습니다. 이는 작은 배치가 더 큰 노이즈를 유도하여 암묵적 정규화 효과를 강화시키기 때문입니다.

### 결론

**SGD의 Implicit Regularization Effect**는 딥러닝에서 매우 중요한 현상으로, 명시적인 정규화 기법을 추가하지 않아도 모델이 좋은 일반화 성능을 보이는 이유를 설명하는 개념입니다. 이는 학습 과정에서 SGD가 포함하는 노이즈와, 그로 인해 모델이 덜 복잡하고 일반화된 해결책으로 수렴하는 특성에 기인합니다.

이러한 암묵적 정규화는 특히 SGD가 심층 신경망을 학습할 때, 작은 배치 크기를 사용할수록 그 효과가 강화되며, 복잡한 모델이 과적합되는 것을 방지하고 성능을 향상시키는 중요한 요인 중 하나입니다.