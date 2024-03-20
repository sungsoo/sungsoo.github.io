---
layout: post
title: MultiDiffusion; Fusing Diffusion Paths for Controlled Image Generation
date: 2024-03-20
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [MultiDiffusion; Fusing Diffusion Paths for Controlled Image Generation](https://www.youtube.com/watch?v=Rx6HR2teD88)

---


# MultiDiffusion; Fusing Diffusion Paths for Controlled Image Generation


## Abstract
Recent advances in text-to-image generation with diffusion models present transformative capabilities in image quality. However, user controllability of the generated image, and fast adaptation to new tasks still remains an open challenge, currently mostly addressed by costly and long re-training and fine-tuning or ad-hoc adaptations to specific image generation tasks. In this work, we present MultiDiffusion, a unified framework that enables versatile and controllable image generation, using a pre-trained text-to-image diffusion model, without any further training or finetuning. At the center of our approach is a new generation process, based on an optimization task that binds together multiple diffusion generation processes with a shared set of parameters or constraints. We show that MultiDiffusion can be readily applied to generate high quality and diverse images that adhere to user-provided controls, such as desired aspect ratio (e.g., panorama), and spatial guiding signals, ranging from tight segmentation masks to bounding boxes. 

* Speaker: Omer Bar-Tal

최근 확산 모델을 이용한 텍스트-투-이미지 생성 기술의 발전은 이미지 품질 측면에서 획기적인 성능 향상을 가져왔습니다. 하지만 사용자의 조작 가능성과 새로운 작업에 대한 빠른 적응은 여전히 해결해야 할 과제이며, 현재 대부분은 비용이 많이 드는 재훈련 및 미세 조정 또는 특정 이미지 생성 작업에 대한 임시 조정을 통해 해결되고 있습니다.

이 연구에서는 사전 훈련된 텍스트-투-이미지 확산 모델을 사용하여 다양하고 제어 가능한 이미지 생성을 가능하게 하는 통합 프레임워크인 MultiDiffusion을 제안합니다. 이 프레임워크는 추가적인 훈련이나 미세 조정 없이도 다양한 이미지 생성을 달성합니다. 우리의 접근 방식의 핵심은 여러 확산 생성 프로세스를 공유된 매개 변수 또는 제약 조건으로 묶는 최적화 작업을 기반으로 하는 새로운 생성 프로세스입니다. MultiDiffusion은 사용자가 제공하는 제어 정보(예: 원하는 종횡비(파노라마 등), 엄격한 세분화 마스크부터 바운딩 박스까지)를 따르는 고품질이고 다양한 이미지를 쉽게 생성할 수 있다는 것을 보여줍니다.

### 핵심 내용:
* 사전 훈련된 텍스트-투-이미지 확산 모델 활용
*  추가 훈련이나 미세 조정 없이 다양하고 제어 가능한 이미지 생성
*  최적화 작업을 통한 여러 확산 생성 프로세스 통합
*  사용자 지정 제어 정보에 따른 이미지 생성 (예: 종횡비, 공간 안내 신호)


<iframe width="600" height="400" src="https://www.youtube.com/embed/Rx6HR2teD88?si=lve-XSwVv0kQpGlw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>