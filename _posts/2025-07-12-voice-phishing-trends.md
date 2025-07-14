---
layout: post
title: Research Trends in Voice Phishing Detection
date: 2025-07-12
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# Research Trends in Voice Phishing Detection 

보이스 피싱(voice phishing, vishing)은 사기꾼들이 전화 통화를 통해 개인 정보 유출이나 금전적 피해를 유도하는 범죄로, 전 세계적으로 심각한 사회적·경제적 문제를 초래하고 있습니다. 특히, AI 기술의 발전으로 사기 방법이 더욱 정교해지면서 이를 탐지하기 위한 연구도 빠르게 발전하고 있습니다. 2025년 기준으로 국내외 보이스 피싱 탐지 방법에 대한 최신 연구동향을 아래에서 상세히 정리하였습니다.

## 국제적 연구동향

### 1. AI 및 머신러닝 기반 탐지
AI와 머신러닝은 보이스 피싱 탐지의 핵심 기술로 자리 잡았습니다. 주요 연구는 다음과 같습니다:

- **BERT와 CNN 하이브리드 모델**: "Real-Time Voice Phishing Detection Using BERT"([ResearchGate, 2025](https://www.researchgate.net/publication/391978836_Real-Time_Voice_Phishing_Detection_Using_BERT))에서는 BERT를 활용해 음성 데이터를 텍스트로 변환한 후, CNN으로 특징을 추출하여 피싱 콜을 탐지하는 모델을 제안했습니다. 이 모델은 97.5%의 정확도를 달성하며, 기업 환경에서의 실시간 탐지에 적합합니다.
- **딥페이크 음성 탐지**: AI로 생성된 가짜 음성(deepfake)이 보이스 피싱에 활용되면서, 이를 탐지하기 위한 연구가 활발히 진행되고 있습니다. DeepDetection(Kang et al., 2022)은 오토인코더를 사용해 딥페이크 음성을 탐지하며, 음성 데이터의 미세한 특징을 분석합니다([MDPI, 2023](https://www.mdpi.com/2227-7390/11/14/3217)).
- **NLP 기반 접근**: 음성을 텍스트로 변환한 후 자연어 처리(NLP)를 적용해 사기 패턴을 식별하는 방법이 주목받고 있습니다. 이는 특히 대화 내용의 의도 분석(intent analysis)과 감정 분석(sentiment analysis)을 통해 사기 여부를 판단하는 데 효과적입니다([Wikipedia, Voice Phishing](https://en.wikipedia.org/wiki/Voice_phishing)).

### 2. 모바일 보안 및 런타임 권한 모니터링
모바일 기기, 특히 Android 환경에서의 보이스 피싱 탐지는 중요한 연구 분야입니다:
- **VishielDroid**: "The silence of the phishers: Early-stage voice phishing detection with runtime permission requests"([ScienceDirect, 2025](https://www.sciencedirect.com/science/article/abs/pii/S0167404825000537))에서는 Android의 런타임 권한(PROCESS_OUTGOING_CALLS, WRITE_CONTACTS, RECORD_AUDIO)을 모니터링하여 보이스 피싱 앱을 탐지하는 VishielDroid를 제안했습니다. 이 시스템은 98개의 특징을 사용해 F1 점수 99.78%를 달성했으며, 불균형 데이터셋에서도 97.78%의 성능을 유지했습니다. 또한, Android 8.1~12 버전과 호환됩니다.
- **FakeCalls 맬웨어 탐지**: 한국 사용자를 타겟으로 한 FakeCalls 맬웨어는 금융 앱을 모방해 정보를 탈취합니다. 이를 탐지하기 위해 앱 동작 분석과 권한 모니터링을 결합한 접근법이 연구되고 있습니다([The Hacker News, 2023](https://thehackernews.com/2023/03/fakecalls-vishing-malware-targets-south.html)).

### 3. 규제적 조치
- **STIR/SHAKEN 프레임워크**: 미국 FCC는 2020년 3월 31일 STIR/SHAKEN 프레임워크를 도입하여 호출자 ID 인증을 강화했습니다. 이는 호출자 ID 위조를 줄여 보이스 피싱의 효과를 감소시키는 데 기여하고 있습니다([Wikipedia, Voice Phishing](https://en.wikipedia.org/wiki/Voice_phishing)).
- **클라우드 보안**: 클라우드 기반 탐지 및 응답 기능을 갖춘 CNAPP(Cloud Native Application Protection Platforms)가 보이스 피싱 탐지에 활용되고 있습니다([Mobile ID World, 2025](https://mobileidworld.com/voice-phishing-attacks-surge-442-in-2024-as-ai-enhances-social-engineering-tactics/)).

### 4. 사용자 인식 및 교육
- 사용자 교육은 보이스 피싱 예방의 핵심 요소로, 사기 콜의 특징(예: 급한 어조, 의심스러운 번호)을 인식하도록 돕습니다. FTC는 알 수 없는 번호의 전화를 받지 말고, 의심스러운 요청에 응답하지 말 것을 권장합니다([Wikipedia, Voice Phishing](https://en.wikipedia.org/wiki/Voice_phishing)).
- **통계적 인사이트**: 2025년 피싱 통계에 따르면, 조직의 57%가 매일 또는 매주 피싱 공격을 경험하며, 신입 직원은 첫 90일 동안 피싱 피해에 44% 더 취약합니다([Keepnet, 2024](https://keepnetlabs.com/blog/top-phishing-statistics-and-trends-you-must-know)).

### 5. 2025년 최신 트렌드
- **AI 기반 정교한 공격 대응**: 2024년 보이스 피싱 공격이 442% 증가하며, 생성형 AI를 활용한 고도로 개인화된 공격이 증가했습니다. 이에 따라 AI 기반 탐지 시스템이 필수적입니다([Mobile ID World, 2025](https://mobileidworld.com/voice-phishing-attacks-surge-442-in-2024-as-ai-enhances-social-engineering-tactics/)).
- **실시간 위협 탐지**: 실시간 탐지 도구는 사전 공격 행동을 식별하는 데 중요하며, 특히 빠르게 진행되는 현대적 침입에 대응합니다.
- **다중 인증(MFA)**: 피싱 방지 MFA는 조직의 보안 강화를 위해 권장됩니다.

## 국내 연구동향

한국에서는 보이스 피싱이 심각한 사회적 문제로, 2006년 이후 143건의 정부 대책에도 불구하고 피해 규모가 증가하고 있습니다([MK, 2025](https://www.mk.co.kr/en/society/11366723)). 이에 따라 학계와 산업계는 한국어 특화 탐지 기술 개발에 집중하고 있습니다.

### 1. 한국어 전용 데이터셋 및 모델
- **KorCCVi 데이터셋**: 한국어 보이스 피싱 탐지를 위해 개발된 KorCCVi 데이터셋은 실제 피싱 시도와 실패 사례를 포함하며, 다양한 사기 시나리오를 반영합니다([GitHub, Korean Voice Phishing Detection](https://github.com/selfcontrol7/Korean_Voice_Phishing_Detection)). KorCCVi v2는 695개의 피싱 샘플과 2232개의 비피싱 샘플(총 2927개)로 구성되어 있습니다([MDPI, 2023](https://www.mdpi.com/2227-7390/11/14/3217)).
- **Attention-Based 1D CNN-BiLSTM**: "Attention-Based 1D CNN-BiLSTM Hybrid Model Enhanced with FastText Word Embedding for Korean Voice Phishing Detection"([MDPI, 2023](https://www.mdpi.com/2227-7390/11/14/3217))에서는 FastText 워드 임베딩을 사용한 1D CNN-BiLSTM 하이브리드 모델을 제안했습니다. 이 모델은 KorCCVi v2 데이터셋에서 정확도 99.32%, F1 점수 99.31%를 달성했으며, 실시간 탐지에 적합합니다.
- **KoBERT 기반 모델**: Moussavou와 Park(2022)은 KoBERT를 사용해 KorCCVi v1 데이터셋에서 F1 점수 99.57%, 정확도 99.60%를 기록했습니다([MDPI, 2023](https://www.mdpi.com/2227-7390/11/14/3217)).

### 2. 실시간 탐지 기술
- **실시간 한국어 보이스 피싱 탐지**: "Real-time Korean voice phishing detection based on machine learning approaches"([ResearchGate, 2021](https://www.researchgate.net/publication/356182253_Real-time_Korean_voice_phishing_detection_based_on_machine_learning_approaches))에서는 CNN과 BiLSTM을 결합한 모델을 제안하여 KorCCVi v2 데이터셋에서 정확도 99.32%를 달성했습니다. 이 모델은 실시간 탐지 성능을 강화하기 위해 워드 및 문장 어텐션 메커니즘을 활용했습니다.
- **A Real-time Efficient Detection Technique of Voice Phishing with AI**: DBpia에서 발표된 이 연구는 KorCCVi 데이터셋을 활용해 AI 기반 실시간 탐지 기술을 개발했으며, 한국어 보이스 피싱의 특성을 반영했습니다([DBpia, 2021](https://www.dbpia.co.kr/Journal/articleDetail?nodeId=NODE10583070)).

### 3. 정부 및 산업계 협력
- 한국 정부는 금융위원회(36건), 경찰청(35건), 방송통신위원회(28건) 등을 통해 143건의 보이스 피싱 대책을 발표했으나, 사기꾼들의 SIM 카드 변경 등 진화된 전술로 인해 효과가 제한적입니다([MK, 2025](https://www.mk.co.kr/en/society/11366723)).
- **FakeCalls 맬웨어**: 한국 사용자를 타겟으로 한 FakeCalls 맬웨어는 금융 앱을 모방해 정보를 탈취하며, 이를 탐지하기 위한 연구가 진행 중입니다([The Hacker News, 2023](https://thehackernews.com/2023/03/fakecalls-vishing-malware-targets-south.html)).

### 4. 한계 및 과제
- **데이터셋 크기**: KorCCVi와 같은 데이터셋은 비교적 소규모로, 일반화 가능성이 제한적입니다.
- **실세계 테스트 부족**: 많은 연구가 실세계 환경에서의 테스트를 충분히 수행하지 못했습니다.
- **비한국어 데이터셋 적용**: 한국어 특화 모델은 다른 언어 데이터셋에 대한 일반화가 어려운 한계가 있습니다.

## 연구 비교

| **연구** | **연도** | **방법** | **기술** | **데이터셋** | **성능** | **특징** |
|----------|----------|----------|----------|--------------|----------|----------|
| VishielDroid | 2025 | 런타임 권한 모니터링 | Android 권한 분석 | - | F1 점수 99.78% | 모바일 보안 중심 |
| Attention-Based 1D CNN-BiLSTM | 2023 | NLP, 딥러닝 | FastText, CNN, BiLSTM | KorCCVi v2 (2927개 샘플) | 정확도 99.32%, F1 점수 99.31% | 한국어 전용 모델 |
| KoBERT 기반 모델 | 2022 | NLP, 딥러닝 | KoBERT | KorCCVi v1 | F1 점수 99.57%, 정확도 99.60% | 한국어 NLP 모델 활용 |
| BERT-CNN 하이브리드 | 2025 | NLP, 딥러닝 | BERT, CNN | - | 정확도 97.5% | 이메일 피싱 탐지 확장 가능 |
| DeepDetection | 2022 | 딥페이크 탐지 | Autoencoder | - | - | 가짜 음성 탐지 중심 |

## 종합적 분석
- **국제적 트렌드**: AI와 머신러닝, 특히 NLP와 딥러닝을 활용한 보이스 피싱 탐지가 주류를 이루고 있습니다. 모바일 보안과 딥페이크 음성 탐지, 규제적 조치(STIR/SHAKEN)는 보이스 피싱 방지의 핵심 요소입니다.
- **국내 트렌드**: 한국에서는 한국어 특화 데이터셋과 모델 개발이 활발하며, 실시간 탐지와 AI 기술 활용이 주요 연구 방향입니다. 정부와 산업계의 협력은 필수적이지만, 사기 방법의 진화로 인해 지속적인 기술 개발이 필요합니다.
- **공통 트렌드**: AI 기반 정교한 사기 탐지, 모바일 보안 강화, 언어별 특화 솔루션, 사용자 교육의 중요성이 강조되고 있습니다.

## 참고 문헌
- [ScienceDirect, 2025](https://www.sciencedirect.com/science/article/abs/pii/S0167404825000537)
- [MDPI, 2023](https://www.mdpi.com/2227-7390/11/14/3217)
- [ResearchGate, 2025](https://www.researchgate.net/publication/391978836_Real-Time_Voice_Phishing_Detection_Using_BERT)
- [ResearchGate, 2021](https://www.researchgate.net/publication/356182253_Real-time_Korean_voice_phishing_detection_based_on_machine_learning_approaches)
- [Wikipedia, Voice Phishing](https://en.wikipedia.org/wiki/Voice_phishing)
- [MK, 2025](https://www.mk.co.kr/en/society/11366723)
- [Ironscales, 2024](https://ironscales.com/guides/phishing-prevention/voice-phishing)
- [Keepnet, 2024](https://keepnetlabs.com/blog/top-phishing-statistics-and-trends-you-must-know)
- [Mobile ID World, 2025](https://mobileidworld.com/voice-phishing-attacks-surge-442-in-2024-as-ai-enhances-social-engineering-tactics/)
- [The Hacker News, 2023](https://thehackernews.com/2023/03/fakecalls-vishing-malware-targets-south.html)
- [DBpia, 2021](https://www.dbpia.co.kr/Journal/articleDetail?nodeId=NODE10583070)
- [GitHub, Korean Voice Phishing Detection](https://github.com/selfcontrol7/Korean_Voice_Phishing_Detection)