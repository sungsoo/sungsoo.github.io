---
layout: post
title: Major Algorithms in Voice Phishing Detection
date: 2025-07-02
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# Major Algorithms in Voice Phishing Detection



## Abstract

- 연구는 보이스 피싱 탐지에 딥러닝, NLP, 런타임 권한 추적, 인증 기술을 사용한다고 제안합니다.
- 정확도는 모델과 데이터셋에 따라 94.64%에서 99.78%까지 다양합니다.
- 음성 분석과 텍스트 변환 모두 중요한 접근법으로 보입니다.

### 음성 분석 알고리즘
보이스 피싱 탐지의 핵심은 음성 자체를 분석하는 것입니다. 예를 들어, RawNet은 실제 음성과 합성 음성을 구분하는 딥러닝 모델로, Mel-spectrogram과 MFCC를 사용해 높은 정확도를 제공합니다. 이는 특히 모바일 환경에서 유용하며, 합성 음성 기법을 식별할 수 있습니다. ([VoiceGuard GitHub](https://github.com/Mrkomiljon/voiceguard))

### 자연어 처리(NLP) 기반 알고리즘
음성을 텍스트로 변환한 후 NLP를 적용하는 방법도 효과적입니다. KoBERT는 한국어 음성에서 99.6%의 정확도를 보이며, Llama3-8B는 미세 조정으로 94.64%의 정확도를 달성했습니다. 이는 보이스 피싱의 언어적 패턴을 탐지하는 데 유용합니다. ([Detecting Voice Phishing with Precision](https://arxiv.org/html/2506.06180v1))

### 런타임 권한 추적
VishielDroid는 안드로이드 기기에서 런타임 권한 요청을 모니터링하여 보이스 피싱 멀웨어를 조기에 탐지하며, F1-score 99.78%를 기록합니다. 이는 음성 분석 외에도 시스템 수준에서 보호를 강화합니다. ([The silence of the phishers](https://www.sciencedirect.com/science/article/abs/pii/S0167404825000537))

### 인증 기술
DF-Captcha와 같은 도전-응답 방식은 통화 상대의 정체성을 검증하여 보이스 피싱을 방지합니다. 이는 특히 음성 메일에서 유용하며, 미래에는 디지털 워터마킹과 결합될 가능성이 있습니다. ([AI-Powered Voice Spoofing for Next-Gen Vishing Attacks](https://cloud.google.com/blog/topics/threat-intelligence/ai-powered-voice-spoofing-vishing-attacks))

---

## 보이스 피싱 탐지 기술의 핵심 알고리즘

보이스 피싱(voice phishing, vishing)은 전화나 VoIP를 통해 개인 정보를 탈취하는 사회공학적 공격으로, AI 기술의 발전으로 더욱 정교해지고 있습니다. 2025년 7월 1일 기준, 실시간 탐지 기술은 음성 분석, 자연어 처리(NLP), 런타임 권한 추적, 인증 기술 등 다양한 접근법을 통해 발전하고 있습니다. 아래는 보이스 피싱 탐지 기술의 핵심 알고리즘과 관련 연구를 상세히 정리한 내용입니다.

### 1. 음성 분석을 위한 딥러닝 알고리즘
음성 자체를 분석하여 보이스 피싱을 탐지하는 접근법은 딥러닝 모델을 중심으로 이루어집니다. 대표적인 알고리즘은 다음과 같습니다:

- **RawNet**: VoiceGuard 시스템에서 사용되는 모델로, 실제 음성과 합성 음성을 구분하는 데 특화되어 있습니다. 이 모델은 Mel-spectrogram, MFCC(Mel-Frequency Cepstral Coefficients)와 같은 음성 특징을 추출하여 분석하며, 이진 분류(실제 vs. 합성)와 다중 클래스 분류(예: WaveGrad, DiffWave, MelGAN 식별)를 지원합니다. 예를 들어, VoiceGuard는 모바일 배포를 위해 모델 양자화를 지원하며, 모델 크기와 추론 시간을 줄입니다. ([VoiceGuard GitHub](https://github.com/Mrkomiljon/voiceguard))
  - **성능**: 이진 분류에서 높은 정확도를 보이며, 다중 클래스 분류에서는 특정 합성 기법을 식별하는 데 유용합니다(예: gt: 0.8794, wavegrad: 0.0251 등).
  - **참고 자료**: RawNet의 기반 논문은 [RawNet: Advanced Speaker Recognition with Raw Waveforms](https://arxiv.org/abs/1904.08104)에서 확인할 수 있습니다.

- **기타 딥러닝 모델**: 음성 반사대책(voice anti-spoofing) 연구에서는 데이터 증강과 특징 설계가 탐지 정확도를 높이는 데 기여합니다. 예를 들어, 음성 특징 추출 후 신경망을 통해 이상치를 탐지하는 방법이 사용됩니다.
  - **참고 자료**: [A study on data augmentation in voice anti-spoofing](https://arxiv.org/abs/2110.10491)

### 2. 자연어 처리(NLP) 기반 알고리즘
음성을 텍스트로 변환한 후 NLP 기법을 적용하는 방법은 보이스 피싱의 언어적 패턴을 탐지하는 데 효과적입니다. 주요 알고리즘은 다음과 같습니다:

- **KoBERT**: 한국어 음성을 대상으로 한 탐지에서 사용되는 BERT의 한국어 적응 모델입니다. 음성을 텍스트로 변환한 후, 형태소 분석기를 통해 전처리하고, 보이스 피싱 패턴을 분류합니다. 연구에 따르면, KoBERT는 99.6%의 정확도를 달성하며, 짧은 학습 시간으로 실시간 탐지가 가능합니다.
  - **참고 자료**: [Real-time Korean voice phishing detection based on machine learning](https://www.researchgate.net/publication/356182253_Real-time_Korean_voice_phishing_detection_based_on_machine_learning_approaches)

- **BERT + 전통적 머신러닝**: BERT를 사용하여 Named Entity Recognition(NER)을 수행한 후, 로지스틱 회귀와 같은 전통적 머신러닝 분류기를 적용합니다. 예를 들어, Yu et al. (2024)의 연구에서는 97.3%의 정확도를 달성했습니다.
  - **참고 자료**: [Voice Recognition and Document Classification for Voice Phishing](https://www.hcis-journal.org/index.php/HCIS/article/view/1234)

- **GPT-3.5**: 대형 언어 모델을 사용하여 음성 전사를 분석하며, 19개의 보이스 피싱 평가 기준을 적용하여 94-97%의 정확도를 보입니다. 이 접근법은 전사를 블록 단위로 나누어 분석합니다.
  - **참고 자료**: [Detecting Voice Phishing with Precision](https://arxiv.org/html/2506.06180v1)

- **Llama3-8B**: 작은 언어 모델(SLM)을 보이스 피싱 평가 기준으로 미세 조정하여 사용합니다. 정상 데이터셋에서 100% 정확도를, 적대적 데이터셋에서 94.64%의 정확도를 달성했습니다. 이 연구는 Chain-of-Thought(CoT) 기법도 비교했으나, VP 기준 포함이 더 효과적임을 발견했습니다.
  - **참고 자료**: [Detecting Voice Phishing with Precision](https://arxiv.org/html/2506.06180v1), 데이터셋 및 코드: [VP_detector_SLM GitHub](https://github.com/kufany/VP_detector_SLM)

- **기타 NLP 기법**: Latent Semantic Analysis(LSA)와 Doc2Vec은 초기 연구에서 사용되었으나, 정확도가 0.61 이하로 낮아 한계가 있습니다.

### 3. 런타임 권한 추적 알고리즘
보이스 피싱은 종종 멀웨어를 통해 실행되므로, 시스템 수준에서 탐지가 필요합니다. 대표적인 시스템은 다음과 같습니다:

- **VishielDroid**: 안드로이드 기기에서 보이스 피싱 멀웨어를 조기에 탐지하는 시스템으로, 런타임 권한 요청(예: PROCESS_OUTGOING_CALLS, RECORD_AUDIO)을 실시간으로 모니터링합니다. 98개의 특징만으로 F1-score 99.78%를 달성하며, 기존 솔루션(MalScan: 80.25%, Li et al.: 69.27%, Singh et al.: 78.89%)을 능가합니다. 이 시스템은 안드로이드 8.1부터 12까지 호환 가능하며, 메모리 및 배터리 사용량이 최소화되었습니다.
  - **강점**: 클래스 불균형 및 적응형 공격에서도 견고하며, 소스 코드는 [VishielDroid GitHub](https://github.com/Talleyrand323/VishielDroid)에서 확인 가능합니다.
  - **참고 자료**: [The silence of the phishers](https://www.sciencedirect.com/science/article/abs/pii/S0167404825000537)

### 4. 인증 및 도전-응답 기반 알고리즘
통화 상대의 정체성을 검증하는 방법은 보이스 피싱 방지에 중요한 역할을 합니다:

- **DF-Captcha**: 도전-응답(challenge-response) 방식을 통해 통화 상대의 정체성을 검증합니다. 이는 음성 메일이나 오프라인 음성 노트에서 딥페이크를 식별하는 데 유용하며, 간단한 구현으로 실시간 적용 가능합니다. 그러나 현재 정확도는 일관되지 않아 지속적인 개선이 필요합니다.
  - **미래 방향**: 디지털 워터마킹과 모바일 기기 관리 도구를 통한 통화자 검증이 제안됩니다.
  - **참고 자료**: [AI-Powered Voice Spoofing for Next-Gen Vishing Attacks](https://cloud.google.com/blog/topics/threat-intelligence/ai-powered-voice-spoofing-vishing-attacks)

### 5. 기타 알고리즘 및 기술
추가적인 접근법은 다음과 같습니다:

- **디지털 워터마킹**: 음성에 감지 가능한 워터마크를 삽입하여 합성 음성을 식별하는 미래 기술로, AI 기술로 쉽게 탐지 가능합니다.
- **STIR/SHAKEN 프레임워크**: 통화자 ID 인증을 강화하여 보이스 피싱 방지에 간접적으로 기여합니다. ([FCC STIR/SHAKEN Framework](https://docs.fcc.gov/public/attachments/FCC-20-42A1.pdf))
- **블랙리스트 기반 탐지**: 간단한 방법으로, 특정 번호를 차단하지만, AI 기반 공격에는 한계가 있습니다.

### 기술 비교
아래 표는 주요 알고리즘과 시스템의 성능을 비교한 내용입니다:

| **기술/시스템** | **주요 알고리즘** | **정확도** | **특징** |
|------------------|-------------------|------------|----------|
| RawNet (VoiceGuard) | 딥러닝 (음성 분석) | 이진/다중 클래스 분류 | 모바일 배포 가능 |
| KoBERT | NLP (BERT 기반) | 99.6% | 한국어 특화 |
| Llama3-8B | NLP (미세 조정) | 94.64% (적대적 데이터셋) | 작은 언어 모델 |
| VishielDroid | 런타임 권한 추적 | F1-score 99.78% | 조기 탐지, 안드로이드 한정 |
| DF-Captcha | 도전-응답 | 변동 | 간단한 구현, 정확도 부족 |

### 결론
보이스 피싱 탐지 기술의 핵심 알고리즘은 음성 분석을 위한 딥러닝 모델(RawNet), 자연어 처리 기반 모델(KoBERT, BERT, Llama3-8B), 런타임 권한 추적(VishielDroid), 그리고 인증 기술(DF-Captcha) 등으로 구성됩니다. 이들은 각각 다른 접근 방식을 통해 보이스 피싱 공격을 탐지하고 방지하며, AI 기술의 발전에 따라 더 정교한 탐지 능력을 갖추고 있습니다. 사용자 교육과 기술적 대응을 병행하여 보이스 피싱 피해를 최소화하는 것이 중요합니다.

## Key Citations
- [RawNet Advanced Speaker Recognition with Raw Waveforms](https://arxiv.org/abs/1904.08104)
- [Detecting Voice Phishing with Precision Fine-Tuning Small Language Models](https://arxiv.org/html/2506.06180v1)
- [The silence of the phishers Early-stage voice phishing detection with runtime permission requests](https://www.sciencedirect.com/science/article/abs/pii/S0167404825000537)
- [VoiceGuard Real-Time Voice Phishing Detection using RawNet](https://github.com/Mrkomiljon/voiceguard)
- [AI-Powered Voice Spoofing for Next-Gen Vishing Attacks Google Cloud Blog](https://cloud.google.com/blog/topics/threat-intelligence/ai-powered-voice-spoofing-vishing-attacks)
- [Real-time Korean voice phishing detection based on machine learning approaches ResearchGate](https://www.researchgate.net/publication/356182253_Real-time_Korean_voice_phishing_detection_based_on_machine_learning_approaches)
- [Voice Recognition and Document Classification for Voice Phishing HCIS Journal](https://www.hcis-journal.org/index.php/HCIS/article/view/1234)
- [A study on data augmentation in voice anti-spoofing arXiv](https://arxiv.org/abs/2110.10491)
- [FCC STIR/SHAKEN Framework for Caller ID Authentication](https://docs.fcc.gov/public/attachments/FCC-20-42A1.pdf)
- [VP_detector_SLM GitHub Repository for Voice Phishing Detection](https://github.com/kufany/VP_detector_SLM)
- [VishielDroid GitHub Repository for Voice Phishing Malware Detection](https://github.com/Talleyrand323/VishielDroid)