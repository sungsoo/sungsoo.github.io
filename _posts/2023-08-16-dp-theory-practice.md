---
layout: post
title: The Theory and Practice of Differential Privacy
date: 2023-08-16
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source

* [COLT 2020 Keynote 1; Salil Vadhan, "The theory and practice of differential privacy"](https://www.youtube.com/watch?v=4bpFDpT1t7I)

---

# The Theory and Practice of Differential Privacy

* COLT 2020 Keynote 1: Salil Vadhan


## Abstract

*Differential privacy* is a rigorous mathematical definition of privacy for statistical analysis and machine learning. In the simplest setting, consider an algorithm that analyzes a dataset and releases statistics about it (such as means and variances, cross-tabulations, or the parameters of a machine learning model). Such an algorithm is said to be differentially private if by looking at the output, one cannot tell whether any individual's data was included in the original dataset or not. In other words, the guarantee of a differentially private algorithm is that its behavior hardly changes when a single individual joins or leaves the dataset -- anything the algorithm might output on a database containing some individual's information is almost as likely to have come from a database without that individual's information. Most notably, this guarantee holds for every individual and every dataset. Therefore, regardless of how eccentric any single individual's details are, and regardless of the details of anyone else in the database, the guarantee of differential privacy still holds. This gives a formal guarantee that individual-level information about participants in the database is not leaked. Differential privacy achieves this strong guarantee by carefully injecting random noise into computation of the released statistics, so as to hide the effect of each individual.

*Differential Privacy*(차분 프라이버시)는 통계 분석과 기계 학습을 위한 개인정보 보호에 대한 엄격한 수학적 정의입니다. 가장 간단한 설정에서, 데이터셋을 분석하고 그에 관한 통계량(평균, 분산, 교차표 등)이나 기계 학습 모델의 파라미터와 같은 정보를 공개하는 알고리즘이 있다고 가정해보겠습니다. 이러한 알고리즘은 출력 결과를 보고 개별 개인의 데이터가 원래 데이터셋에 포함되었는지 여부를 판단할 수 없다면, 민감도 높은 프라이버시를 가진 것으로 간주됩니다. 다른 말로, 차분 프라이버시를 가진 알고리즘의 보증은 해당 알고리즘이 동작하는 방식이 단일 개인이 데이터셋에 참여하거나 떠날 때 거의 변하지 않는다는 것입니다. 알고리즘이 어떤 개인의 정보를 포함한 데이터베이스에서 출력할 수 있는 결과는 그 개인의 정보가 없는 데이터베이스에서 나올 수 있는 결과와 거의 유사한 가능성을 가집니다. 이러한 보증은 모든 개인과 모든 데이터셋에 대해 성립합니다. 따라서 어떤 개인의 세부 정보가 얼마나 특이하든, 데이터베이스의 다른 개인의 세부 정보가 무엇이든, 차분 프라이버시의 보증은 여전히 유지됩니다. 이는 데이터베이스 참여자들의 개인 수준의 정보가 유출되지 않음을 형식적으로 보증합니다. Differential Privacy는 이러한 강력한 보증을 달성하기 위해 공개된 통계량 계산에 무작위 잡음을 신중하게 주입하여 각 개인의 영향을 감추게 됩니다.

For more background on differential privacy and its applications, we recommend the book chapter For more background on differential privacy and its applications, we recommend the [book chapter](https://admindatahandbook.mit.edu/book/v1.0/diffpriv.html)  by Alexandra Wood, Micah Altman, Kobbi Nissim, and Salil Vadhan, as well as the resources at [https://differentialprivacy.org/resources/](https://differentialprivacy.org/resources/) and [https://privacytools.seas.harvard.edu/courses-educational-materials](https://privacytools.seas.harvard.edu/courses-educational-materials).

## COLT 2020 Keynote: Abstract
Since it was introduced in 2006 by Dwork, McSherry, Nissim, and Smith, differential privacy has become accepted as a gold standard for ensuring that individual-level information is not leaked through statistical analyses or machine learning on sensitive datasets. It has proved to be extremely rich for theoretical investigation, with deep connections to many other topics in theoretical computer science and mathematics, and has also made the transition to practice, with large-scale deployments by the US Census Bureau and technology companies like Google, Apple, and Microsoft.

In this talk, I will survey some of the recent theoretical advances and challenges in differential privacy, highlighting connections to learning theory. I will also discuss efforts toward wider practical adoption, such as OpenDP, a new community effort to build a suite of trusted, open-source tools for deploying differential privacy.

## Bio
Salil Vadhan is the Vicky Joseph Professor of Computer Science and Applied Mathematics at the Harvard John A. Paulson School of Engineering & Applied Sciences, and Lead PI on the Harvard Privacy Tools Project. Vadhan's research in theoretical computer science spans computational complexity, cryptography, and data privacy. He is a Simons Investigator, a Harvard College Professor, and an ACM Fellow, and his past honors include a Godel Prize and a Guggenheim Fellowship.

<iframe width="600" height="400" src="https://www.youtube.com/embed/4bpFDpT1t7I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>