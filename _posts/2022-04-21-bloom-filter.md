---
layout: post
title: What are Probabilistic Data Structures?
date: 2022-04-21
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [What are Probabilistic Data Structures?](https://www.youtube.com/watch?v=-jiOPKt7avE)


---

# What are Probabilistic Data Structures?

* Bloom Filter Source Code: [https://gist.github.com/badamczewski/42ec5d3aabd47c32684cdb87851f8a51](https://gist.github.com/badamczewski/42ec5d3aabd47c32684cdb87851f8a51)




## Abstract

블룸 필터(Bloom filter)는 원소가 집합에 속하는지 여부를 검사하는데 사용되는 확률적 자료 구조이다. 1970년 Burton Howard Bloom에 의해 고안되었다. 블룸 필터에 의해 어떤 원소가 집합에 속한다고 판단된 경우 실제로는 원소가 집합에 속하지 않는 긍정 오류가 발생하는 것이 가능하지만, 반대로 원소가 집합에 속하지 않는 것으로 판단되었는데 실제로는 원소가 집합에 속하는 부정 오류는 절대로 발생하지 않는다는 특성이 있다. 집합에 원소를 추가하는 것은 가능하나, 집합에서 원소를 삭제하는 것은 불가능하다. 집합 내 원소의 숫자가 증가할수록 긍정 오류 발생 확률도 증가한다. 

## Structure

블룸 필터는 *m* 비트 크기의 비트 배열 구조를 가진다. 또한 블룸 필터에서는 *k* 가지의 서로 다른 해시 함수를 사용하며, 각 해시 함수는 입력된 원소에 대해 *m* 가지의 값을 균등한 확률로 출력해야 한다.

블룸 필터는 집합에 원소를 추가하는 명령어와 원소가 속하는지를 검사하는 명령어를 지원한다. (원소를 삭제하는 명령어는 존재하지 않는다.)

* 원소를 추가하는 경우, 추가하려는 원소에 대해 *k* 가지의 해시 값을 계산한 다음, 각 해시 값에 대응하는 비트를 1로 설정한다.
* 원소를 검사하는 경우, 해당 원소에 대해 *k* 가지의 해시 값을 계산한 다음, 각 해시 값에 대응하는 비트값을 읽는다. 모든 비트가 1인 경우 속한다고 판단하며, 나머지는 속하지 않는다고 판단한다.

<iframe width="600" height="400" src="https://www.youtube.com/embed/-jiOPKt7avE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## Bloom Filters

<iframe width="600" height="400" src="https://www.youtube.com/embed/qBTdukbzc78" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="600" height="400" src="https://www.youtube.com/embed/heEDL9usFgs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>