---
layout: post
title: AI’s Models of the World, and Ours
date: 2025-12-23
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# [AI’s Models of the World, and Ours - Theoretically Speaking](https://www.youtube.com/watch?v=siu_r8j5-sg)


## Abstract

When we see someone performing at the top of their craft, we often marvel at both their observable achievements and the hidden internal expertise that they’ve accumulated. Something similar is true, in a very different way, with generative AI and large language models: their successes involve both powerful observable behavior and deep internal representations of the world that they construct for their own uses. How do these internal representations work, and to what extent are they similar to or different from the representations of the world that we build as humans? This distinction is becoming crucial as people interact with powerful AI systems, where a mismatch between the system’s model of the world and our human models of the world can lead to situations in which the system inadvertently “sets us up to fail” through our interactions with it. We explore these questions through the lens of generative AI, drawing on examples from game-playing, geographic navigation, and other complex tasks: When we train a model to win chess games, what happens when we pair it with a weaker partner who makes some of the moves? When we train a model to find shortest driving routes, what happens when it has to deal with unexpected detours? The picture we construct is further complicated by theoretical results indicating that successful generation can be achieved even by agents that are provably incapable of identifying the model they’re generating from. This talk will include joint work with Ashton Anderson, Karim Hamade, Reid McIlroy-Young, Siddhartha Sen, Justin Chen, Sendhil Mullainathan, Ashesh Rambachan, Keyon Vafa, and Fan Wei.

Jon Kleinberg is the Tisch University Professor in the Departments of Computer Science and Information Science at Cornell University. His research focuses on the interaction of algorithms and networks, the roles they play in large-scale social and information systems, and their broader societal implications. He is a member of the National Academy of Sciences, the National Academy of Engineering, the American Academy of Arts and Sciences, and the American Philosophical Society, and he has served in the past on advisory groups including the National AI Advisory Committee and the National Research Council’s Computer Science and Telecommunications Board. He has received MacArthur, Packard, Simons, Sloan, and Vannevar Bush fellowships, as well as awards including the Nevanlinna Prize, the World Laureates Association Prize, the ACM-AAAI Allen Newell Award, and the ACM Prize in Computing.

---

Theoretically Speaking is a lecture series highlighting exciting advances in theoretical computer science for a broad general audience. Events are free and open to the public, with first-come, first-served seating. No special background is assumed. Registration is required. This lecture will be viewable afterward on this page and on our YouTube channel, following captioning.


<iframe width="600" height="400" src="https://www.youtube.com/embed/siu_r8j5-sg?si=dh1rBmFkudEJaR_-" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


제시된 소스(John Kleinberg의 강연 "AI’s Models of the World, and Ours")를 바탕으로, 초인적 AI 시대에 AI와 인간의 세계 모델을 비교 분석한 발표 자료를 작성하였습니다.

---

### **[Slide 1] 제목: AI의 세계 모델과 우리의 모델 (AI’s Models of the World, and Ours)**
*   **부제:** 초인적 AI 시대의 지식 표현과 인간-AI 상호작용의 이론적 고찰,
*   **발표자:** John Kleinberg (Cornell University)
*   **핵심 주제:** AI가 세상을 보는 방식과 인간의 인지 체계 간의 간극 및 조화 가능성

### **[Slide 2] 인터넷 은유의 진화: 라이브러리에서 자동화로**
*   **1993-2004 (라이브러리):** 모든 지식을 연결한 거대하고 보편적인 도서관,
*   **2004-2006 (군중):** 소셜 미디어와 스마트폰의 등장, 인간의 능력 확장 및 상호작용 중심,
*   **2012-현재 (자동화/AI):** 딥러닝과 거대 데이터의 결합, 50년 된 난제들(이미지 인식, 음성 인식 등)의 해결,
*   **시각화 추천:** 10년 단위로 변화하는 인터넷 기술 및 은유의 타임라인 그래프

### **[Slide 3] 데이터 혁명: 1,000억 개의 라벨링된 이미지**
*   **성능 향상의 원인:** 알고리즘의 발전뿐만 아니라 인류가 온라인에 자발적으로 구축한 방대한 데이터셋 덕분,
*   **데이터의 힘:** 1980년대 이론이 증명하지 못한 가설을 7차수(order of magnitude) 이상의 데이터를 통해 실현
*   **알고리즘의 시선:** "알고리즘은 이 방대한 데이터를 통해 세상을 어떻게 보고 있는가?"라는 근본적 질문 제기

### **[Slide 4] 칼 세이건의 "지구 생명체 탐사" 비유**
*   **실험 배경:** 갈릴레오 우주선이 외행성으로 가기 전, 지구를 외계 행성처럼 관측하여 생명체 신호를 탐지할 수 있는지 검증,
*   **알고리즘=외계인:** 알고리즘 역시 세상을 직접 경험하지 않고 데이터(물리적, 화학적 측정치)를 통해 세상을 추론하는 외계 지성체와 유사함,
*   **시각화 추천:** 지구 위를 비행하는 갈릴레오 우주선과 데이터 스트림의 이미지

### **[Slide 5] 초기 소셜 미디어 데이터의 '외계인 신호' 분석**
*   **2005년 사진 태깅 데이터:** 위도/경도 좌표를 점으로 찍었을 때 나타나는 지구의 형상,
*   **특이점 발견:** 인구 밀도가 아닌 '사진을 찍고 업로드하는 행위'의 밀도 반영 (히말라야 등반객, 랜드마크 중심)
*   **데이터의 노이즈:** 좌표 설정 오류(0,0)로 인해 대서양 한복판에 나타나는 허구의 랜드마크 발생

### **[Slide 6] 컴퓨팅의 핵심: 추상화 장벽 (Abstraction Barriers)**
*   **모래시계 모델:** 하단의 개념적 인프라(알고리즘, 칩)와 상단의 응용 프로그램을 연결하는 얇은 인터페이스,
*   **기능:** 하위 구현 방식을 몰라도 상위에서 일관된 모델(공유 메모리, 튜링 머신 등)을 통해 소통 가능
*   **AI의 도전:** 현재 AI는 방대한 데이터와 어플리케이션 사이에서 이 추상화 장벽을 재정의하는 중
*   **그림 추천:** 하단(데이터/ML), 중앙(인터페이스), 상단(AI 앱)으로 구성된 모래시계 다이어그램

### **[Slide 7] 초인적(Superhuman) AI의 시험대: 체스 (Chess)**
*   **선택 이유:** 인간의 창의성, 전문성, 예술성이 집약된 영역이자 AI가 이미 인간을 압도한 분야,
*   **역사적 이정표:** 1997년 딥 블루의 카스파로프 격파, 2005년 이후 인간이 컴퓨터를 이기는 시대 종결
*   **현 수준:** 세계 챔피언(레이팅 2800)보다 훨씬 높은 AI 레이팅(3300~3600)

### **[Slide 8] 정형화된 사실(Stylized Facts) 1 & 2: 인기와 전문성**
*   **인기의 유지:** AI가 인간을 능가해도 체스의 인기는 스트리밍과 온라인 플레이를 통해 역대 최고치 기록
*   **전문성의 민주화:** 엔진을 켠 관찰자가 보드 앞의 전문가보다 상황을 더 잘 이해하게 되는 '전문성의 역전' 현상 발생,
*   **표 추천:** 1980년대(전문가 중심) vs 2020년대(AI 엔진 기반 관객 중심) 비교표

### **[Slide 9] 정형화된 사실 3: 미적 표준의 침식**
*   **과거:** 계산 능력의 한계로 인해 '보기 좋은 형태', '안전한 위치' 등 미적 휴리스틱을 안전의 대리자로 활용,
*   **현재:** AI는 '보기 흉해도' 전술적으로 완벽한 수를 선택, 인간도 이를 학습하며 미적 기준이 파괴되고 변화함,
*   **비유:** 70-80년대의 체스가 우아한 검술 장면이었다면, 현대 체스는 깨진 맥주병을 들고 싸우는 난투극과 같음

### **[Slide 10] 정형화된 사실 4: AI가 파놓은 함정**
*   **실패 유발:** 엔진을 켜고 볼 때는 당연해 보이는 수가 엔진을 끄는 순간 인간에게는 실행 불가능한 난제가 됨,
*   **갑작스러운 제어권 반환:** 자율주행차나 코드 생성 AI가 복잡한 상황에서 인간에게 통제권을 넘길 때 발생하는 '실행 불가능성' 문제
*   **그림 추천:** AI 도구(안내자)가 갑자기 사라지고 당황한 인간이 남겨진 상황의 삽화

### **[Slide 11] 프로젝트 Maya: 인간처럼 두는 AI**
*   **목표:** 단순히 이기는 AI가 아니라, 특정 레이팅(예: 1500)의 인간이 둘 법한 수를 예측하는 AI 구축,
*   **방법:** Alpha Zero의 오픈 소스 버전인 Leela의 신경망을 인간 데이터로 미세 조정,
*   **발견:** 1100 레이팅 Maya가 실제로는 1400의 실력을 보임. 인간은 전형적인 실수가 아닌 '특이한 실수' 때문에 점수를 잃는다는 가설 확인,

### **[Slide 12] 미메틱(Mimetic) 모델과 귀속의 오류**
*   **개념:** 특정 개인의 행동 데이터를 학습하여 그 사람처럼 행동하게 만든 개인화 모델,
*   **위험성:** 모델의 행동을 실제 인물의 의도로 착각하는 문제 (예: 바비 피셔 모델의 수를 피셔의 실제 수로 혼동),
*   **사례:** 워터게이트 사건의 'Deepthroat' 명대사 "돈을 쫓아라(Follow the money)"는 실제 인물이 아닌 영화 시나리오 작가(미메틱 모델)의 창작물임,

### **[Slide 13] 협력적 AI: 실패를 방지하는 파트너**
*   **실험:** AI와 인간이 한 팀이 되어 번갈아 가며 수를 두는 '4인 체스' 환경,
*   **문제:** 초인적 AI(Leela)가 인간 파트너가 이해할 수 없는 난해한 수를 두어 팀을 패배로 이끔,
*   **해결:** Maya(인간 모델)와의 자기 대전 학습을 통해 '이해 가능한 수'를 두는 파트너 봇 개발, 초인적 성능보다 '가독성'이 팀 승리에 더 중요함을 증명,

### **[Slide 14] LLM 내부에 세계 모델이 존재하는가?**
*   **질문:** 단순한 토큰 예측 모델인 LLM이 내부적으로 체스판이나 지도를 재구성하고 있는가?,
*   **함정:** 우리가 아는 방식(X와 O)이 아니더라도 AI는 전혀 다른 표현형(숫자 합 게임 등)으로 동일한 논리를 구현할 수 있음,
*   **표 추천:** 틱택토(공간 모델) vs 15 만들기 숫자 게임(산술 모델)의 동일성 비교표

### **[Slide 15] 이론적 도구: 마이힐-네로드(Myhill-Nerode) 정리**
*   **방법론:** 블랙박스 시스템에서 상태(State)를 직접 추출할 수 없으므로, 동일하게 동작하는 시퀀스(Sequence)들의 묶음으로 상태를 정의,
*   **적용:** 맨해튼의 주행 경로 시퀀스들을 통해 LLM 내부에 '교차로'라는 상태가 존재하는지 역추적,
*   **결론:** AI 모델들은 대부분의 경우 훌륭한 결과물을 내놓지만, 내부적으로는 일관된 상태 표현이 결여된 경우가 많음

### **[Slide 16] 서사(Narrative) 속의 잠재적 상태**
*   **사례:** LLM이 작성한 대학생들의 대화 장면. 텍스트 이면에 캐릭터의 감정, 관계, 과거사 등 방대한 잠재 상태 존재,
*   **의문:** LLM이 단어를 뱉을 때 이 상태들을 실제로 인지하는가, 아니면 단순한 문자열 조합인가?
*   **불쾌한 골짜기:** 물리적 모델링(피부, 머리카락의 반사율 등) 없이 생성된 이미지가 주는 이질감과 AI 모델의 한계,

### **[Slide 17] 언어 학습의 새로운 모델: 생성 vs 식별**
*   **전통적 이론:** 1967년 마크 골드의 연구는 언어를 완벽히 '식별'하는 것이 수학적으로 불가능함을 제시,
*   **발상의 전환:** AI는 언어의 모든 경계 케이스를 식별할 필요 없이, 타당한 문장을 '생성'할 수만 있으면 됨
*   **결과:** 식별보다 생성이 훨씬 다루기 쉬운(tractable) 문제이며, 적은 데이터로도 유효한 출력을 내놓을 수 있음,

### **[Slide 18] 인지적 도구: 인간의 공간 지능 vs AI**
*   **인간의 특성:** 우리는 보행 생물로서 공간적 추론에 특화됨 (예: 체스 왕의 움직임은 직관적이나 기사의 움직임은 난해함),
*   **AI의 특성:** 모든 상태 변화를 동등한 그래프 노드 연결로 인식, 인간에게 쉬운 것과 어려운 것의 구분이 없음
*   **수학적 함의:** 좋은 정의는 복잡한 논리를 원자 단위로 압축하여 인간의 인지 부하를 줄여주지만, AI는 이러한 우아함 없이도 정답에 도달 가능,

### **[Slide 19] 미래 과제: 더 안전하고 협력적인 AI를 향해**
*   **투명성 확보:** AI가 내놓은 결과뿐만 아니라 그 이면의 추론 경로(Chain-of-Thought)를 함께 제시해야 함,
*   **개인화와 다양성:** 소수의 거대 모델(단일 문화)에서 벗어나 개별 행동에 맞춘 미메틱 모델의 발전 가능성,
*   **이론과 실제의 교차로:** 기술적 진보와 사회적 영향 사이에서 추상화 장벽을 구축하는 이론적 도구의 중요성,

### **[Slide 20] 결론: 수학은 '인간의 이해'를 증진하는 활동**
*   **수학의 본질:** 단순히 정리를 증명하는 기계적 활동이 아닌, 인간의 이해를 넓히는 공동체의 노력 (Bill Thurston),
*   **시사점:** AI가 초인적 성능을 보여주더라도, 결국 중요한 것은 그 지식이 인간에게 어떻게 해석되고 활용되느냐의 문제임
*   **메타포:** **AI라는 '강력한 외계 도구'를 우리 인지 체계와 어떻게 정렬(Alignment)시킬 것인가가 향후 10년의 핵심 과제.**

---

**[이론적 비유]**
이 강연의 핵심은 **'모래시계의 목(neck)'** 비유로 요약됩니다. 과거에는 인간이 이 인터페이스를 설계하고 통제했지만, 이제는 AI가 스스로 데이터를 통해 자신만의 모델을 구축하고 있습니다. 우리는 마이힐-네로드 정리와 같은 이론적 도구를 돋보기 삼아, AI가 만든 이 '검은 상자' 속 세계 모델을 인간이 이해할 수 있는 언어로 다시 번역해내야 합니다. 이는 마치 외계인의 신호를 분석해 그들의 지도를 재구성하는 과정과 같습니다.