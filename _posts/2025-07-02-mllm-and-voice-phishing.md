---
layout: post
title: Multimodal Large Language Models in Voice Phishing Detection
date: 2025-07-02
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# Multimodal Large Language Models (MLLMs) in Voice Phishing Detection


## Abstract

- Research suggests **multimodal large language models** (MLLMs) can enhance voice phishing detection by combining audio and text analysis.
- It seems likely that MLLMs can process voice calls and transcripts to identify phishing patterns, but direct applications are still emerging.
- The evidence leans toward using MLLMs for both synthesized voice detection and content analysis, with potential for real-time systems.

## Data and Models
MLLMs can analyze voice calls by first turning audio into text using speech recognition, then checking the text for phishing signs like urgent requests or threats. They can also look at the audio itself to spot fake voices, like those made by AI.

## Real-Time Processing
For real-time detection, MLLMs need to work fast, processing audio as it comes in. This might need special hardware to keep up with live calls.

## Challenges
There’s a lack of big datasets with both audio and text for voice phishing, and combining these analyses into one model is still tricky. But research is moving forward to make it work.


---

# Survey Note on Multimodal Large Language Models for Voice Phishing Detection

## Introduction
Voice phishing, or vishing, is a growing cyber threat where attackers use phone calls to deceive victims into sharing sensitive information. With the advancement of AI, multimodal large language models (MLLMs) that can process both audio and text are becoming relevant for detection. This note explores the detailed technical aspects of using MLLMs for voice phishing detection, based on recent research and trends as of 08:08 AM KST on Wednesday, July 2, 2025.

## Background on MLLMs
MLLMs are AI models capable of handling multiple data types, such as text, audio, and images, within a single framework. For voice phishing detection, they can analyze audio signals to detect synthesized voices and process transcribed text to identify phishing patterns. This multimodal approach is promising for improving detection accuracy and efficiency, especially given the increasing sophistication of AI-driven attacks like deepfake voices.

## Key Components of MLLM-Based Voice Phishing Detection

### 1. Audio Transcription
- The first step involves converting voice calls into text using automatic speech recognition (ASR). Models like Whisper ([Whisper](https://openai.com/research/whisper)) are commonly used for this purpose.
- This transcription enables the system to analyze the content of the conversation, which is crucial for detecting phishing indicators in the text.

### 2. Text Analysis with LLMs
- The transcribed text is fed into an LLM, which can be fine-tuned or prompted to detect phishing indicators. For example, LLMs can identify keywords (e.g., "account number," "password"), sentence structures, or social engineering tactics (e.g., threats, urgent requests).
- Research on fine-tuning small language models like Llama3-8B for voice phishing detection shows high accuracy, with reports of up to 94.64% accuracy on datasets like KorCCVi ([Detecting Voice Phishing with Precision: Fine-Tuning Small Language Models](https://arxiv.org/html/2506.06180v1)).
- For Korean voice phishing, models like KoBERT can be used, leveraging datasets like KorCCVi, which contains 2,927 entries of actual voice phishing transcripts ([Text Classification of Voice Phishing Transcripts](https://github.com/kimdesok/Text-classification-of-voice-phishing-transcipts)).

### 3. Audio Analysis
- Simultaneously, the audio is analyzed for features indicating synthesized or manipulated voices. Models like RawNet, used in systems like VoiceGuard, can distinguish between real and synthesized voices using features like Mel-spectrogram and MFCCs ([VoiceGuard: Real-Time Voice Phishing Detection using RawNet](https://github.com/Mrkomiljon/voiceguard)).
- This analysis can detect unnatural speech patterns, background noises, or other anomalies that suggest a phishing attempt.

### 4. Multimodal Integration
- The results from text analysis and audio analysis are combined to make a final decision. For instance, if the text suggests a phishing attempt and the audio indicates a synthesized voice, the confidence in detecting a voice phishing attack increases.
- MLLMs can potentially integrate these analyses within a single model, leveraging their ability to process multiple modalities. Current research, however, often uses separate models for audio and text, with integration at the decision level.

### 5. Real-Time Processing
- For practical applications, the system needs to process audio streams in near real-time. This requires optimized models and possibly hardware acceleration, such as GPUs or TPUs, to handle live calls without significant delay.
- Systems like VishielDroid, which detect voice phishing malware by tracking runtime permission requests, achieve real-time detection with an F1-score of 99.78%, suggesting the feasibility of real-time processing ([The silence of the phishers: Early-stage voice phishing detection with runtime permission requests](https://www.sciencedirect.com/science/article/abs/pii/S0167404825000537)).

## Related Research and Technologies
While direct research on MLLMs for voice phishing detection is limited, several studies and technologies provide insights:

- **VoiceGuard**: This system uses RawNet for real-time voice phishing detection, focusing on audio analysis to distinguish real from synthesized voices. It supports binary and multi-class classification, with features like Mel-spectrogram and MFCCs, and is designed for mobile deployment ([VoiceGuard: Real-Time Voice Phishing Detection using RawNet](https://github.com/Mrkomiljon/voiceguard)).
- **KorCCVi Dataset**: Contains transcripts from actual voice phishing calls, useful for training text-based detection models. It includes 2,927 entries of voice phishing texts and 2,232 non-fraudulent call texts, covering topics like travel and food ([Text Classification of Voice Phishing Transcripts](https://github.com/kimdesok/Text-classification-of-voice-phishing-transcipts)).
- **Fine-Tuning LLMs**: Research on fine-tuning small language models like Llama3-8B for voice phishing detection by analyzing transcripts shows promising results, with accuracy up to 94.64% on adversarial datasets ([Detecting Voice Phishing with Precision: Fine-Tuning Small Language Models](https://arxiv.org/html/2506.06180v1)).
- **Patents**: US11423926B2 describes a real-time voice phishing detection system with tampering, content, and spoofing detectors, suggesting a multimodal approach by combining audio and text analysis ([Real-time voice phishing detection](https://patents.google.com/patent/US11423926B2/en)).
- **AI-Powered Voice Spoofing**: Discussions on AI-driven voice spoofing attacks highlight the need for advanced detection, with MLLMs potentially countering these threats by analyzing both audio and content ([AI-Powered Voice Spoofing for Next-Gen Vishing Attacks](https://cloud.google.com/blog/topics/threat-intelligence/ai-powered-voice-spoofing-vishing-attacks)).

## Challenges and Limitations
- **Data Availability**: There is a lack of large, labeled datasets that include both audio and text for voice phishing, which is essential for training MLLMs effectively. Datasets like KorCCVi are helpful but limited in scale.
- **Model Integration**: Integrating audio and text analysis into a single MLLM is still in early stages. Current systems often use separate models for each modality, with integration at the decision level, which may not fully leverage the multimodal capabilities of MLLMs.
- **Real-Time Capability**: Ensuring real-time processing for live calls is challenging, requiring optimized models and hardware. This is critical for practical deployment in call centers or mobile devices.
- **Risks**: Using MLLMs introduces potential vulnerabilities, such as prompt injection attacks, which need robust safeguards ([A survey on large language model (LLM) security and privacy: The Good, The Bad, and The Ugly](https://www.sciencedirect.com/science/article/pii/S266729522400014X)).

## Comparative Analysis
Below is a table comparing the key components and their roles in MLLM-based voice phishing detection:

| **Component**        | **Description**                                      | **Role in Detection**                          | **Challenges**                          |
|----------------------|-----------------------------------------------------|-----------------------------------------------|-----------------------------------------|
| Audio Transcription  | Converts voice to text using ASR (e.g., Whisper)    | Enables text analysis for phishing content     | Accuracy of transcription, real-time processing |
| Text Analysis        | Analyzes transcripts with LLMs for phishing patterns | Identifies keywords, threats, social engineering | Requires large labeled datasets         |
| Audio Analysis       | Detects synthesized voices using models like RawNet | Identifies voice tampering or anomalies        | Limited datasets for synthesized voices |
| Multimodal Integration | Combines audio and text results                   | Increases detection confidence                 | Integration complexity, model efficiency |
| Real-Time Processing | Processes streams in near real-time                | Enables live call detection                    | Hardware requirements, latency          |

## Future Directions
- **Data Collection**: Develop larger datasets that include both audio and text, labeled for voice phishing, to train MLLMs effectively.
- **Model Optimization**: Research on integrating audio and text processing within a single MLLM, potentially using architectures like those in "Survey on multimodal large language models" ([survey on multimodal large language models](https://academic.oup.com/nsr/article/11/12/nwae403/7896414)).
- **Real-Time Systems**: Explore hardware acceleration and model quantization for real-time deployment, similar to VoiceGuard's mobile deployment capabilities.

## Conclusion
Multimodal large language models offer significant potential for voice phishing detection by combining audio and text analysis. While direct research is limited, existing technologies like RawNet for audio and LLMs for text analysis can be integrated to create a comprehensive system. Challenges include data availability, model integration, and real-time processing, but ongoing research and patents suggest a promising future for MLLM-based voice phishing detection.

## Key Citations
- [Real-time voice phishing detection patent](https://patents.google.com/patent/US11423926B2/en)
- [VoiceGuard Real-Time Voice Phishing Detection using RawNet](https://github.com/Mrkomiljon/voiceguard)
- [Text Classification of Voice Phishing Transcripts](https://github.com/kimdesok/Text-classification-of-voice-phishing-transcipts)
- [Detecting Voice Phishing with Precision: Fine-Tuning Small Language Models](https://arxiv.org/html/2506.06180v1)
- [AI-Powered Voice Spoofing for Next-Gen Vishing Attacks](https://cloud.google.com/blog/topics/threat-intelligence/ai-powered-voice-spoofing-vishing-attacks)
- [The silence of the phishers: Early-stage voice phishing detection with runtime permission requests](https://www.sciencedirect.com/science/article/abs/pii/S0167404825000537)
- [A survey on large language model (LLM) security and privacy: The Good, The Bad, and The Ugly](https://www.sciencedirect.com/science/article/pii/S266729522400014X)
- [survey on multimodal large language models](https://academic.oup.com/nsr/article/11/12/nwae403/7896414)