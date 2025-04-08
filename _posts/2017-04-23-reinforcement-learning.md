---
layout: post
title:  Reinforcement Learning
date: 2017-04-23
categories: [computer science]
tags: [machine learning]

---


# Reinforcement Learning

## Abstract 

<font color="blue">강화 학습(Reinforcement learning)</font>은 기계 학습이 다루는 문제의 하나로, 어떤 환경 안에서 정의된 에이전트가 현재의 상태를 인식하여, 선택 가능한 행동들 중 보상을 최대화하는 행동 혹은 행동 순서를 선택하는 방법이다.

환경은 일반적으로 유한상태 <font color="blue">마르코프 결정 프로세스(MDP)</font>로 표현할 수 있다. 이런 관점에서 강화 학습 알고리즘은 동적 계획법과 깊은 연관이 있다. MDP에서 상태 전이 확률(state transition probabilities)와 포상은 확률에 따른 값일 수도 있고, 이미 결정되어 있는 값일 수도 있다.

강화 학습이 원하지 않는 행동을 명시적으로 수정하는 지도 학습과 다른 점은 <font color="blue">온라인 수행</font>에 중심을 두고 있다는 점이다. 강화 학습은 아직 조사되지 않는 영역을 탐험하는 것과 이미 알고 있는 지식을 이용하는 것의 균형을 잡는 것이다. 이 탐험과 이용 사이에 있는 트레이드오프는 <font color="blue">Multi-armed bandit</font>과 같은 문제에서 알아 볼 수 있다.

### Algorithm

<p>수식으로 표현하면, 강화 학습 모델은 다음과 같이 구성된다.</p>
<ol>
<li>환경 상태 집합, <span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML">
  <semantics>
    <mrow class="MJX-TeXAtom-ORD">
      <mstyle displaystyle="true" scriptlevel="0">
        <mi>S</mi>
      </mstyle>
    </mrow>
    <annotation encoding="application/x-tex">{\displaystyle S}</annotation>
  </semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/4611d85173cd3b508e67077d4a1252c9c05abca2" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.51ex; height:2.176ex;" alt="S"></span>;</li>
<li>행동 집합, <span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML">
  <semantics>
    <mrow class="MJX-TeXAtom-ORD">
      <mstyle displaystyle="true" scriptlevel="0">
        <mi>A</mi>
      </mstyle>
    </mrow>
    <annotation encoding="application/x-tex">{\displaystyle A}</annotation>
  </semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7daff47fa58cdfd29dc333def748ff5fa4c923e3" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.754ex; height:2.343ex;" alt="A"></span>;</li>
<li>포상(<span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML">
  <semantics>
    <mrow class="MJX-TeXAtom-ORD">
      <mstyle displaystyle="true" scriptlevel="0">
        <mo>∈<!-- ∈ --></mo>
        <mrow class="MJX-TeXAtom-ORD">
          <mrow class="MJX-TeXAtom-ORD">
            <mi mathvariant="double-struck">R</mi>
          </mrow>
        </mrow>
      </mstyle>
    </mrow>
    <annotation encoding="application/x-tex">{\displaystyle \in {\mathbb {R}}}</annotation>
  </semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/79fe229724b6ed100fa1a67a4382563bd15aa952" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:3.894ex; height:2.176ex;" alt="\in \Bbb{R} "></span>)의 집합;.</li>
</ol>
<p>매 시점 <span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML">
  <semantics>
    <mrow class="MJX-TeXAtom-ORD">
      <mstyle displaystyle="true" scriptlevel="0">
        <mi>t</mi>
      </mstyle>
    </mrow>
    <annotation encoding="application/x-tex">{\displaystyle t}</annotation>
  </semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/65658b7b223af9e1acc877d848888ecdb4466560" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:0.85ex; height:2.009ex;" alt="t"></span>에 에이전트는 자신의 상태(state) <span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML">
  <semantics>
    <mrow class="MJX-TeXAtom-ORD">
      <mstyle displaystyle="true" scriptlevel="0">
        <msub>
          <mi>s</mi>
          <mrow class="MJX-TeXAtom-ORD">
            <mi>t</mi>
          </mrow>
        </msub>
        <mo>∈<!-- ∈ --></mo>
        <mi>S</mi>
      </mstyle>
    </mrow>
    <annotation encoding="application/x-tex">{\displaystyle s_{t}\in S}</annotation>
  </semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/67cebe200c4f9f636629d2bb16d150343b9e91be" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:6.295ex; height:2.509ex;" alt="s_t \in S"></span>와 가능한 행동(action) <span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML">
  <semantics>
    <mrow class="MJX-TeXAtom-ORD">
      <mstyle displaystyle="true" scriptlevel="0">
        <mi>A</mi>
        <mo stretchy="false">(</mo>
        <msub>
          <mi>s</mi>
          <mrow class="MJX-TeXAtom-ORD">
            <mi>t</mi>
          </mrow>
        </msub>
        <mo stretchy="false">)</mo>
      </mstyle>
    </mrow>
    <annotation encoding="application/x-tex">{\displaystyle A(s_{t})}</annotation>
  </semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/d200049874a099b78dc10c824e93c444eb609e53" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.838ex; width:5.518ex; height:2.843ex;" alt="A(s_t)"></span>를 가지고 있다.</p>
<p>에이전트는 어떤 행동 <i>a</i> ∈ <i>A</i>(<i>s</i><sub><i>t</i></sub>) 을 취하고, 환경으로부터 새로운 상태 <i>s</i><sub><i>t</i>+1</sub>와 포상(reward) <i>r</i><sub><i>t</i>+1</sub>을 받는다. 이 상호작용에 기반해서 강화 학습 에이전트는 누적된 포상값 <i>R</i>을 최대화 하는 정책(policy) π: <i>S</i>→<i>A</i>을 개발한다.</p>
<p>종료 상태(terminal state)가 존재하는 MDPs에서는 <span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML">
  <semantics>
    <mrow class="MJX-TeXAtom-ORD">
      <mstyle displaystyle="true" scriptlevel="0">
        <mi>R</mi>
        <mo>=</mo>
        <msub>
          <mi>r</mi>
          <mrow class="MJX-TeXAtom-ORD">
            <mn>0</mn>
          </mrow>
        </msub>
        <mo>+</mo>
        <msub>
          <mi>r</mi>
          <mrow class="MJX-TeXAtom-ORD">
            <mn>1</mn>
          </mrow>
        </msub>
        <mo>+</mo>
        <mo>⋯<!-- ⋯ --></mo>
        <mo>+</mo>
        <msub>
          <mi>r</mi>
          <mrow class="MJX-TeXAtom-ORD">
            <mi>n</mi>
          </mrow>
        </msub>
        <mo>=</mo>
        <munderover>
          <mo>∑<!-- ∑ --></mo>
          <mrow class="MJX-TeXAtom-ORD">
            <mi>t</mi>
            <mo>=</mo>
            <mn>1</mn>
          </mrow>
          <mrow class="MJX-TeXAtom-ORD">
            <mi>n</mi>
          </mrow>
        </munderover>
        <msub>
          <mi>r</mi>
          <mrow class="MJX-TeXAtom-ORD">
            <mi>t</mi>
          </mrow>
        </msub>
      </mstyle>
    </mrow>
    <annotation encoding="application/x-tex">{\displaystyle R=r_{0}+r_{1}+\cdots +r_{n}=\sum _{t=1}^{n}r_{t}}</annotation>
  </semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/47bb197ef318bd95faedc9354a49e921c7ac1769" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -3.005ex; width:31.45ex; height:7.009ex;" alt="R=r_0+r_1+\cdots+r_n = \sum_{t=1}^n r_t"></span>이고, 그렇지 않은 MDPs에서는 <span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML">
  <semantics>
    <mrow class="MJX-TeXAtom-ORD">
      <mstyle displaystyle="true" scriptlevel="0">
        <mi>R</mi>
        <mo>=</mo>
        <munderover>
          <mo>∑<!-- ∑ --></mo>
          <mrow class="MJX-TeXAtom-ORD">
            <mi>t</mi>
            <mo>=</mo>
            <mn>1</mn>
          </mrow>
          <mrow class="MJX-TeXAtom-ORD">
            <mi>n</mi>
          </mrow>
        </munderover>
        <msup>
          <mi>γ<!-- γ --></mi>
          <mrow class="MJX-TeXAtom-ORD">
            <mi>t</mi>
          </mrow>
        </msup>
        <msub>
          <mi>r</mi>
          <mrow class="MJX-TeXAtom-ORD">
            <mi>t</mi>
          </mrow>
        </msub>
      </mstyle>
    </mrow>
    <annotation encoding="application/x-tex">{\displaystyle R=\sum _{t=1}^{n}\gamma ^{t}r_{t}}</annotation>
  </semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/8ffd9289850e5e9a8256bdca04c3b2ec9badd118" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -3.005ex; width:12.652ex; height:7.009ex;" alt="R = \sum_{t=1}^n \gamma^t r_t"></span>가 된다. 여기서 <i>γ</i>는 미래의 포상이 현재에 얼마나 가치 있는지를 표현하는 할인율(discount factor)로 0과 1사이의 값이다.</p>

## Reinforcement Learning Overview

*Reinforcement learning* describes a large class of learning problems characteristic of autonomous agents interacting in an environment: sequential decision-making problems with delayed reward. Reinforcement-learning algorithms seek to learn a policy (mapping from states to actions) that maximizes the reward received over time.

Unlike in *supervised learning* problems, in reinforcement-learning problems, there are no labeled examples of correct and incorrect behavior. However, unlike *unsupervised learning* problems, a reward signal can be perceived.
Many different algorithms for solving reinforcement-learning problems are covered in other entries. This entry provides just a brief high-level classification of the algorithms.

Perhaps the most well-known approach to solving reinforcement-learning problems, as covered in detail by Sutton and Barto (1998), is based on learning a value function, which represents the long-term expected reward of each state the agent may encounter, given a particular policy. This approach typically assumes that the environment is a  *Markov decision process* in which rewards are discounted over time, though it is also possible to optimize for average reward per time step as in *average-reward reinforcement learning*. If a complete model of the environment is available,  dynamic programming, or specifically *value iteration*, can be used to compute an optimal value function, from which an optimal policy can be derived.

If a model is not available, an optimal value function can be learned from experience via *model-free techniques* such as *temporal difference learning*, which combine elements of dynamic programming with Monte Carlo estimation. Partly due to Watkins' elegant proof that *Q-learning *converges to the optimal value function (Watkins 1989), temporal difference methods are currently among the most commonly used approaches for reinforcement-learning problems.

Watkins' convergence proof relies on executing a policy that visits every state infinitely often. In practice, Q-learning does converge in small, discrete domains. However in larger and particularly in continuous domains, the learning algorithm must generalize the value function across states, a process known as *value function approximation*. Examples include *instance-based reinforcement learning*, *Gaussian process reinforcement learning*, and *relational reinforcement learning*.

Even when combined with value function approximation, the most basic *value-free methods*, such as Q-learning and SARSA, are very inefficient with respect to experience: they are not sample-efficient. With the view that experience is often more costly than computation, much research has been devoted to making more efficient use of experience, for instance, via *hierarchical reinforcement learning*, *reward shaping*, or *model-based reinforcement learning* in which the experience is used to learn a domain model, which can then be solved via dynamic programming.

Though these methods make efficient use of the experience that is presented to them, the goal of optimizing sample efficiency also motivates the study of *efficient exploration* in reinforcement learning. The study of exploration methods can be isolated from the full reinforcement learning problem by removing the notion of temporally delayed reward as is done in  associative reinforcement learning or by removing the notion of states altogether as is done in *k*-armed bandits. *k*-Armed bandit algorithms focus entirely on the exploration versus exploitation challenge, without having to worry about generalization across states or delayed rewards. Back in the context of the full RL problem, *Bayesian reinforcement learning* enables optimal exploration given prior distributions over the parameters of the learning problem. However, its computational complexity has limited its use so far to very small domains.

Although most of the methods above revolve around learning a value function, reinforcementlearning problems can also be solved without learning value functions, by directly searching the space of potential policies via policy search. Effective ways of conducting such a search include *policy gradient reinforcement learning*, *least squares reinforcement-learning* methods, and *evolutionary reinforcement learning*.

As typically formulated, the goal of a reinforcement-learning algorithm is to learn an optimal (or high-performing) policy based on knowledge of, or experience of, a reward function (and state transition function). However, it is also possible to take the opposite perspective that of trying to learn the reward function based on observation of the optimal policy. This problem formulation is known as *inverse reinforcement learning*.

Leveraging this large body of theory and algorithms, a current focus in the field is deploying large-scale, successful applications of reinforcement learning. Two such applications treated herein are *autonomous helicopter flight using reinforcement learning* and *robot learning*.

## References

[1] Sutton RS, Barto AG (1998) *Reinforcement learning: an introduction*. MIT, Cambridge

[2] Watkins CJCH (1989) *Learning from delayed rewards*. PhD thesis, King’s College, Cambridge
