---
layout: post
title: AGI and Agentic AI in Voice Phishing Detection
date: 2025-07-03
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# AGI and Agentic AI in Voice Phishing Detection


## Abstract
- Research suggests AGI and agentic AI could enhance voice phishing detection, but direct applications are limited.
- It seems likely that agentic AI can autonomously monitor and respond to threats, while AGI might generalize across attack types.
- The evidence leans toward current systems using specific AI models, not fully realizing AGI or agentic AI yet.

## AGI in Voice Phishing Detection
AGI, or artificial general intelligence, refers to AI that can perform any intellectual task a human can. For voice phishing, it could mean systems that understand conversation contexts, recognize phishing patterns, and adapt to new attacks. While no direct AGI applications exist, research suggests AGI could generalize across attack types, like detecting both voice cloning and social engineering tactics.

## Agentic AI in Voice Phishing Detection
Agentic AI involves AI systems that act autonomously, making decisions and taking actions. In voice phishing, it could monitor calls, detect suspicious patterns, and respond, like verifying identities or alerting users. Current systems, such as VishielDroid, show agentic AI-like behavior by autonomously tracking app permissions, but full realization is still emerging.

## Current State and Future Potential
Current voice phishing detection uses specific AI models like RawNet and machine learning, not AGI or fully agentic AI. However, research indicates these technologies could evolve, with agentic AI enhancing real-time responses and AGI offering broader adaptability.

---

# Detailed Survey Note on AGI and Agentic AI in Voice Phishing Detection

## Introduction
Voice phishing, or vishing, is a growing cyber threat where attackers use phone calls to deceive victims into sharing sensitive information. With AI advancements, detection systems are evolving, and the concepts of AGI (Artificial General Intelligence) and agentic AI are becoming relevant. This note explores how these technologies could apply to voice phishing detection, based on recent research and trends as of July 1, 2025.

## AGI: Definition and Relevance
AGI refers to AI systems capable of performing any intellectual task a human can, across diverse domains. In voice phishing detection, AGI would imply systems that understand conversation contexts, recognize phishing patterns, and adapt to new attack types without specific programming. While AGI is not yet fully realized, research suggests it could generalize across various phishing methods, such as voice cloning, deepfake audio, and social engineering tactics.

For example, AGI could analyze audio data to detect subtle differences between normal conversations and phishing attempts, learning from new data to adapt to evolving threats. However, current systems, like VoiceGuard, use specific deep learning models (e.g., RawNet) for voice synthesis detection, which are not AGI but show potential for broader generalization.

## Agentic AI: Definition and Relevance
Agentic AI involves AI systems that autonomously perceive their environment, reason through challenges, act on plans, and continuously learn. In voice phishing detection, agentic AI could monitor calls in real-time, detect suspicious patterns, and take actions like verifying identities, alerting users, or even engaging attackers to gather more information.

Current examples include VishielDroid, which autonomously tracks Android app runtime permission requests to detect vishing malware early, achieving an F1-score of 99.78%. This shows agentic AI-like behavior, as it operates independently to identify threats. Other systems, like Keepnet's Incident Responder, detect and mitigate threats 48.6x faster than manual processes, suggesting agentic AI's potential for real-time response.

## Current Research and Applications
Recent research highlights the use of AI in voice phishing detection, but AGI and agentic AI are not directly mentioned in most studies. Instead, specific AI models and techniques are employed:

- **VishielDroid**: This system uses runtime permission tracking to detect vishing malware on Android devices, autonomously identifying malicious behavior. It aligns with agentic AI's autonomous operation, as it doesn't require human intervention for initial detection ([The silence of the phishers: Early-stage voice phishing detection with runtime permission requests](https://www.sciencedirect.com/science/article/abs/pii/S0167404825000537)).
- **VoiceGuard**: Utilizes RawNet for real-time voice phishing detection, distinguishing real from synthesized voices using deep learning. It supports binary and multi-class classification, with features like Mel-spectrogram and MFCCs, but is not AGI, focusing on specific tasks ([VoiceGuard GitHub](https://github.com/Mrkomiljon/voiceguard)).
- **AI-Driven Defenses**: Articles like Keepnet's discuss how organizations use AI-driven systems for adaptive phishing detection, including vishing, with tools like AI-Driven Phishing Simulations ([How Hackers Use Agentic AI for Social Engineering & Phishing](https://keepnetlabs.com/blog/how-hackers-use-agentic-ai-to-advance-social-engineering)). These suggest agentic AI's role in autonomous threat detection.

## Potential Applications and Future Directions
While AGI and agentic AI are not fully implemented in voice phishing detection, their potential is significant:

- **AGI Applications**: AGI could provide generalization across attack types, understanding context like specific keywords or sentence structures indicative of phishing. It could continuously learn from new data, adapting to new attack forms, such as AI-generated deepfake voices stealing over HK$200 million, as reported ([AI-Powered Voice Spoofing for Next-Gen Vishing Attacks](https://cloud.google.com/blog/topics/threat-intelligence/ai-powered-voice-spoofing-vishing-attacks)).
- **Agentic AI Applications**: Agentic AI could autonomously monitor calls, detect anomalies, and respond, such as verifying identities with biometric methods or alerting users. It could engage in conversations to confuse attackers, aligning with systems like DF-Captcha for real-time authentication.

Research also suggests agentic AI's role in Security Operations Centers (SOCs), automating decision-making, incident response, and threat detection, which could include voice phishing ([Transforming cybersecurity with agentic AI to combat emerging cyber threats](https://www.sciencedirect.com/science/article/pii/S0308596125000734)).

## Challenges and Limitations
- **Current Limitations**: AGI is not yet realized, and current systems use specific AI models like neural networks and machine learning, not achieving human-like general intelligence. Agentic AI, while promising, is partially implemented, with systems like VishielDroid limited to Android environments.
- **Risks**: Integrating AI, especially agentic AI, introduces new vulnerabilities, such as prompt injection attacks, requiring robust safeguards ([AI Agents Are Here. So Are the Threats](https://unit42.paloaltonetworks.com/agentic-ai-threats/)).

## Comparative Analysis
Below is a table comparing AGI and agentic AI in voice phishing detection:

| **Aspect**          | **AGI**                                      | **Agentic AI**                                |
|---------------------|----------------------------------------------|----------------------------------------------|
| **Definition**      | AI with human-like general intelligence      | Autonomous AI for decision-making and action |
| **Current Use**     | Not directly applied, potential for generalization | Partially implemented, e.g., VishielDroid    |
| **Capabilities**    | Context understanding, continuous learning   | Real-time monitoring, autonomous response    |
| **Examples**        | Hypothetical, no direct systems             | VishielDroid, Keepnet Incident Responder     |
| **Future Potential**| Broad adaptability to new attacks           | Enhanced real-time threat detection          |

## Conclusion
AGI and agentic AI hold significant potential for voice phishing detection, with agentic AI showing early applications in autonomous monitoring and response, while AGI could offer broader generalization. Current research focuses on specific AI models, but future developments may see these technologies integrated, enhancing detection capabilities against evolving threats.

## Key Citations
- [The silence of the phishers: Early-stage voice phishing detection with runtime permission requests](https://www.sciencedirect.com/science/article/abs/pii/S0167404825000537)
- [VoiceGuard Real-Time Voice Phishing Detection using RawNet](https://github.com/Mrkomiljon/voiceguard)
- [AI-Powered Voice Spoofing for Next-Gen Vishing Attacks](https://cloud.google.com/blog/topics/threat-intelligence/ai-powered-voice-spoofing-vishing-attacks)
- [How Hackers Use Agentic AI for Social Engineering & Phishing](https://keepnetlabs.com/blog/how-hackers-use-agentic-ai-to-advance-social-engineering)
- [AI Agents Are Here. So Are the Threats](https://unit42.paloaltonetworks.com/agentic-ai-threats/)
- [Transforming cybersecurity with agentic AI to combat emerging cyber threats](https://www.sciencedirect.com/science/article/pii/S0308596125000734)