---
layout: post
title: Backdoor Criterion
date: 2025-02-24
categories: [artificial intelligence]
tags: [machine learning]

---



# Backdoor Criterion

Backdoor criterion는 인과 추론에서 변수 $$X$$의 효과를 결과 $$Y$$에 대해 추정할 때, 혼란(confounding) 요인에 의한 왜곡을 제거하기 위한 조건이다. 이 기준은 Judea Pearl이 제안한 것으로, 인과 그래프(DAG) 상에서 $$X$$와 $$Y$$ 사이의 인과 효과를 올바르게 식별하기 위해 조정해야 할 변수 집합 $$Z$$를 결정하는 방법을 제공한다.

---

### 1. 기본 개념

인과 그래프에서는 변수들 간의 인과 관계가 방향성 있는 엣지로 표현된다. $$X$$가 $$Y$$에 인과적 영향을 미치고 있다고 가정할 때, $$X$$와 $$Y$$ 사이에는 인과 경로가 존재한다. 그러나 관측 데이터에는 $$X$$와 $$Y$$ 사이의 순수한 인과 효과뿐만 아니라, 공통 원인(confounder)에 의한 상관관계도 포함될 수 있다.

Backdoor path란 $$X$$에서 시작하여 $$Y$$로 도달하는 경로 중, 첫 번째 엣지가 $$X$$로 들어오는(즉, $$X$$의 원인이 되는) 경로를 의미한다. 이 경로는 $$X$$와 $$Y$$ 사이에 인과적 연결이 없더라도 두 변수 간의 상관관계를 유발할 수 있다.

Backdoor criterion는 이러한 모든 backdoor path를 차단(block)하는 변수 집합 $$Z$$를 찾는 조건이다. $$Z$$가 backdoor criterion을 만족하면, 아래와 같이 조정된 분포를 통해 인과 효과를 식별할 수 있다.

$$
P(Y \mid do(X=x)) = \sum_{z} P(Y \mid X=x, Z=z) P(Z=z)
$$

여기서 $$do(X=x)$$는 $$X$$에 대해 인위적 개입을 했을 때의 분포를 나타낸다.

---

### 2. Backdoor Criterion의 정의

변수 집합 $$Z$$가 $$X$$와 $$Y$$ 사이에서 backdoor criterion을 만족하기 위해서는 두 조건을 충족해야 한다.

1. **후방 경로 차단 (Blocking of Backdoor Paths):**  
   $$X$$에서 $$Y$$로 가는 모든 backdoor path가 $$Z$$에 의해 차단되어야 한다. 즉, $$Z$$를 조건으로 할 때, $$X$$와 $$Y$$ 사이의 통계적 독립성이 성립해야 한다(혼란 요인의 영향을 제거).

2. **조정 변수의 선택 (No Descendants of $$X$$):**  
   $$Z$$에 $$X$$의 후손(Descendant)이 포함되어서는 안 된다. $$X$$의 후손을 조건으로 하면 인과 효과의 경로를 왜곡시킬 위험이 있다.

---

### 3. 구체적 예제

#### 예제 1: 공통 원인 모형

변수 $$X$$와 $$Y$$가 공통 원인 $$U$$에 의해 연결된 경우를 생각해보자.

$$
U \rightarrow X, \quad U \rightarrow Y, \quad X \rightarrow Y
$$

이 경우, $$U$$는 $$X$$와 $$Y$$ 사이의 backdoor path $$X \leftarrow U \rightarrow Y$$를 형성한다.  
- **문제:** 관측된 $$P(Y \mid X)$$는 $$X$$의 직접적 인과 효과 외에도 $$U$$에 의한 영향을 포함한다.
- **해결:** 변수 $$U$$를 조정 변수로 선택하면, backdoor path가 차단된다. 즉, $$Z = \{U\}$$로 조정하면
  $$
  P(Y \mid do(X=x)) = \sum_{u} P(Y \mid X=x, U=u) P(U=u)
  $$
  이 식을 통해 $$X$$의 인과 효과를 정확하게 추정할 수 있다.

#### 예제 2: 매개 변수와 혼란 변수의 구분

인과 그래프에서 $$X$$가 $$Y$$에 영향을 미치며, 동시에 $$X$$와 $$Y$$ 사이에 공통 원인 $$C$$가 존재한다고 하자.

$$
C \rightarrow X, \quad C \rightarrow Y, \quad X \rightarrow Y
$$

여기서 $$C$$는 $$X$$와 $$Y$$ 사이의 backdoor path $$X \leftarrow C \rightarrow Y$$를 형성한다.  
- **조정 방법:** $$C$$를 조건 변수로 사용하면 backdoor path가 차단되어, $$X$$의 인과 효과를 추정할 수 있다.

---

### 4. 요약

Backdoor criterion은 인과 그래프 상에서 $$X$$와 $$Y$$ 사이의 순수 인과 효과를 추정하기 위해, $$X$$의 부모가 되는 변수들 중에서 $$X$$와 $$Y$$ 사이의 backdoor path를 모두 차단할 수 있는 적절한 변수 집합 $$Z$$를 선택하는 기준이다.  
- $$Z$$는 $$X$$의 후손을 포함하지 않아야 하며, 모든 backdoor path를 차단해야 한다.  
- 이 조건이 충족되면, 관측 분포 $$P(Y \mid X, Z)$$를 이용하여 $$P(Y \mid do(X))$$를 식별할 수 있다.

이와 같이 Backdoor criterion은 인과 효과 추정에서 혼란 요인을 통제하여, 올바른 인과 추론을 가능하게 하는 핵심 원칙으로 사용된다.