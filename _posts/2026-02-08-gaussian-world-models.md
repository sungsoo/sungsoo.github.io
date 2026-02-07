---
layout: post
title: Gaussian World Models
date: 2026-02-08
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# Gaussian World Models

**Gaussian World Models**는 2025~2026년 로보틱스·Embodied AI 분야에서 가장 빠르게 부상하고 있는 **3D 기반 World Model**입니다. 3D Gaussian Splatting(3DGS)의 폭발적 효율성을 World Model에 그대로 이식해, "로봇이 3D 공간을 진짜 이해하고 미래를 상상하며 행동"하게 만듭니다.

## 1. Definition (정의)
**Gaussian World Model (GWM)**은 장면을 수백만 개의 **3D Gaussian primitives(작은 타원형 점 구름)**로 표현한 후,  
로봇 행동에 따라 이 Gaussian들이 어떻게 **전파·변형**되는지를 학습하는 **생성적 3D 세계 모델**입니다.  

기존 World Model(이미지·비디오 기반)이 2D 픽셀을 통째로 예측하는 반면, Gaussian World Model은 **기하·물리·시간(4D)**을 명시적으로 모델링해  

- 실시간 렌더링 (100fps 이상)  
- 물리적으로 정확한 미래 예측  
- 새로운 배치·행동에도 강건한 일반화  
를 동시에 달성합니다.

비유: "세상을 레고 블록 하나하나로 쪼개서, 물리 법칙으로 움직이게 하는 디지털 트윈"

## 2. Introduction (배경과 필요성)
기존 이미지 기반 World Model (Dreamer, Diffusion Policy 등)은  

- 기하·물리 정보가 부족 → occlusion, deformable 물체, long-horizon 태스크에서 실패  
- 실세계 데이터가 수십만 장 필요 → Sim-to-Real gap 크다  

3D Gaussian Splatting(2023~2024 폭발적 성장)이 등장하면서  

→ 사진 같은 사실성 + 실시간 렌더링 + 미분 가능성을 동시에 가짐  

→ 이를 World Model로 확장하면 "데이터 효율적 + 물리 정확한 + 스케일 가능한" 세계 모델이 탄생합니다.

2025 ICCV에서 발표된 **GWM**이 이 방향의 대표작으로, "3D World Model의 데이터 스케일링 잠재력"을 처음 증명했습니다.

## 3. Approaches (Methods) – 주요 구현 방식
두 가지 대표 접근이 있습니다.

**A. Latent Diffusion Transformer 기반 GWM (ICCV 2025)**

- 입력: 3D Gaussian Splats (기존 3DGS 모델로 재구성)
- 3D VAE → Gaussian을 compact latent 공간으로 압축
- Latent Diffusion Transformer (DiT) → 로봇 행동 조건으로 미래 Gaussian latent 생성
- 디코딩 → 미래 장면을 Gaussian Splatting으로 렌더링

→ 장점: 장면 수준(fine-grained) 예측, 행동 조건화 완벽, 모델 기반 RL 가능

**B. Physically Embodied Gaussian Splatting (CoRL 2024, 실시간 보정형)**

- Dual Representation: Particle (물리·기하) + Gaussian (시각)
- Particle 기반 물리 시뮬레이션으로 미래 예측
- 카메라 관측과 예측 이미지 비교 → "visual forces"로 particle 위치 실시간 보정
- 3카메라만으로 30Hz 실시간 동작

→ 장점: deformables(로프), 다중 객체, 실시간 디지털 트윈 완성

## 4. Key Applications (주요 응용)
- **Robotic Manipulation** (pick-and-place, bimanual 등) → 데모 30개로 SOTA 초월
- **Imitation Learning + Self-supervised Future Prediction** → 시각 표현 크게 향상
- **Model-based Reinforcement Learning** → GWM을 neural simulator로 사용
- **Real-to-Sim Transfer & Synthetic Data Generation** → Gaussian splat을 Isaac Sim, Unreal로 바로 내보냄
- **Embodied Navigation & Long-horizon Planning** → occlusion-free 3D 예측

실험 결과 (GWM 논문): 실제 Franka 로봇에서 기존 RGB Diffusion Policy보다 성공률 크게 상회.

## 5. Future Directions (향후 방향)
- **Multimodal & Large-Scale Pre-training** → 인터넷 비디오·텍스트로 Gaussian World Model 사전학습 (World Labs Marble 스타일)
- **Physics-Informed + Neurosymbolic** → LLM으로 물리 규칙 생성 후 Gaussian에 grounding
- **Hierarchical & Test-time Scaling** → 고수준 계획 + 저수준 Gaussian 예측 결합
- **Real-robot Deployment at Scale** → 10~100개 데모만으로 새로운 태스크 zero-shot
- **Embodied Foundation Model의 Backbone** → 2026~2027년 "Physical AI"의 표준 표현으로 자리 잡을 전망

## 주요 출처 (URL)
- **GWM: Towards Scalable Gaussian World Models for Robotic Manipulation** (ICCV 2025)  
  https://arxiv.org/abs/2508.17600  
  프로젝트 페이지: https://gaussian-world-model.github.io/

- **Physically Embodied Gaussian Splatting** (CoRL 2024)  
  https://arxiv.org/abs/2406.10788  
  프로젝트 페이지: https://embodied-gaussians.github.io/

- 관련 서베이 & 추가 논문: Awesome World Models 리스트  
  https://github.com/Li-Zn-H/AwesomeWorldModels

**한 줄 요약**  
Gaussian World Models는 "3DGS라는 게임체인저를 World Model에 넣어, 로봇이 진짜 3D 세계를 생각하고 행동하게 만드는" 2025~2026년 최고의 기술 트렌드입니다. 이제 로봇이 "상상하면서" 움직이는 시대가 정말 시작됐습니다! 

