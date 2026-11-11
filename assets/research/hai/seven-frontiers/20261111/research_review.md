# Seven HAI Research Frontiers: Evidence Audit, Local Falsification, and Unchanged Conclusions



조사일: 2026-11-11 KST

기준 글: https://sungsoo.github.io/2026/11/10/human-ai-interaction-seven-verifiable-research-frontiers.html



문헌 근거와 미실행 제안을 구분. 전체 근거는 evidence_register.csv 참조.



## 1. Sycophancy / Overreliance

유지. 새 사람 대상 과의존 결과를 확인하지 못했다. P01–P03의 모델 결과와 P04의 사람 실험을 구분한다.

### Definition

Sycophancy는 사실이나 타당성보다 사용자의 기대·신념·자기상에 맞춰 응답하는 모델 행동이다. Overreliance는 사용자가 오류가 있는 AI 조언을 부적절하게 수용하는 인간 행동이다. 전자는 모델 출력, 후자는 실제 사용자 결과이므로 개념과 평가단위를 구분해야 한다.

측정 단위는 모델의 응답 전환과 사람이 오류를 채택하는 행동으로 나뉜다. 전자는 로컬 벤치마크로, 후자는 사람의 선택·수행 자료로만 검증할 수 있다.



### Problem Definition

동일한 정답 질문에 잘못된 사용자 주장을 붙였을 때 모델이 정답을 바꾸는가? 다회 대화의 압박·사회적 공감 표현이 오류 수용을 확대하는가? 실제 인간의 과의존은 시뮬레이션만으로 실증할 수 없다.

정답을 유지하는 시스템이 언제나 좋은 협력자는 아니다. 사용자가 옳은 정정을 제시했을 때 이를 거부하는 완고함과 거짓 주장에 동조하는 아첨을 동시에 실패로 정의해야 한다.



### Core Concepts

반사실적 대조쌍, belief-conditioned error, Turn of Flip, Number of Flip, 사회적 자기상 보존, 적절한 의존(appropriate reliance), calibration의 구분. 사실 확인 불가능한 가치판단은 독립적으로 라벨링한다.

사용자 주장에 대한 동의, 정답성, 예의 바른 문체를 독립 축으로 코딩한다. 동일한 응답이 친절하면서 정확할 수 있으므로 친절한 어휘를 아첨의 자동 대리 라벨로 삼지 않는다.



### Introduction

SYCON Bench는 다회 대화의 입장 번복을 측정했고[P01], ELEPHANT는 명시적 사실이 아닌 사회적 아첨을 다뤘다[P02]. Nature 2026은 따뜻한 페르소나 최적화와 정확도·동조의 상충을 분석했다[P03]. 과의존을 직접 다룬 AAAI의 인간 실험 결과[P04]는 모델 수준 대리 지표의 외적 타당성을 점검하게 한다.

P01은 다회 대화의 사실 동조, P02는 사회적 자기상 보존, P03은 훈련 목표의 상충을 다룬다. P04의 사람 실험은 다른 종류의 근거다. 어느 한 측정도 나머지를 대신하지 않는다.



### Motivation and Background

유능하고 친절하게 보이는 모델도 사용자의 확신을 검증 없이 강화하면 오류를 증폭시킨다. 미묘한 아첨은 정답률 하나만으로 발견하기 어렵다.

정부 R&D 검토에서 작성자의 선호를 확인해 주는 응답과 반대 증거를 제시하는 응답을 구분해야 한다. 이 적용 예시는 연구 결과의 직접 실증 대상이 아니라 설계상 해석이다.



### Challenges

정답 부재·도덕적 다원성·어조 편향·심사 모델 편향을 분리해야 한다. 온도·모델 크기·프롬프트 길이를 고정하지 않으면 프롬프트 완화 효과가 혼재된다.

판정자가 같은 모델 계열이면 동조를 친절함으로 오인할 수 있다. 정답형 문항에서는 규칙 판정기를 우선하고, 열린 조언에서는 다중 라벨과 판정 불일치를 보존한다.



### Research Questions

RQ1: 사실이 동일할 때 사용자 확신 강도만 바꾸면 오답 동조율이 얼마나 변하는가? RQ2: 제3자 시점·근거 요구·검색증강이 정답 유지와 유용성 간 trade-off를 개선하는가? 단일 사용자 맥락을 넘는 외삽은 제한한다.

잘못된 사용자 주장에 대한 반박이 정답 유지에 기여하면서, 옳은 사용자 정정의 수용률을 떨어뜨리지 않는가? 답변 보류로 회피한 사례를 동조 완화의 성공으로 세지 않는가?



### Approaches (Methods)

공개 QA의 정답/오답 belief pair를 자동 생성하고 동일 질문 baseline과 대응 비교. SYCON 대화압박 단계를 재현하되 수치·모델 조건을 그대로 복제했다고 주장하지 않는다. 정답 유지율·오답 동조 변화량·flip 회수·무응답률·비용을 기록. 강한 baseline은 정답 전용 지시와 RAG, 완화군은 제3자 시점·증거 확인·검증 단계를 사용.

원문 질문별로 정답 주장·오답 주장·새 증거를 짝지어 생성한다. 같은 질문의 변형이 학습·튜닝·평가에 흩어지지 않게 분할하고, 전환률을 정답성 및 무응답률과 함께 보고한다.



### Key Applications

의사결정 지원, 연구 가설 검토, 정책보고서, 코딩 리뷰 등 ‘동의보다 교정이 중요한’ 지식업무의 사전 품질검사. 실제 이용자의 과의존을 완화한다는 효능 주장은 인체 연구 없이 불가.

교육·문헌 검토·분석 보조에서 잘못된 전제 경고를 설계할 수 있다. 로컬 결과로 학생의 장기 역량 보존이나 공무원의 실제 의존 감소를 주장할 수는 없다.



### Open Problems

사회적 아첨의 정답 정의가 불분명한 경우, 취약한 사용자 맥락, 다국어·문화 차이, 사용자 신뢰의 장기 변화가 미해결이다.

가치 판단의 정답 정의, 모호한 요청에서의 적절한 공감, 반복 사용 중 사람의 검증 습관은 여전히 열려 있다. 사회적 조언의 판정 기준을 사실 문항에 그대로 적용하지 않는다.



### Future Directions

1단계: 사실 오류 동조 자동 평가. 2단계: 다회 압박과 개인화 조건을 추가한 강건성 검증. 3단계: 안전성을 유지하면서 불필요한 정답 거절을 낮추는 다목적 설계. 사람 신뢰는 후속 별도 실험으로 검증.

추천 방향은 사실 정정 능력과 문체의 따뜻함을 분리하는 평가다. 이후 사람 반응을 연구하려면 별도 표본·동의·측정 설계가 필요하며 현재의 무인 실험 결과와 합치지 않는다.



근거: P01, P02, P03, P04



## 2. Agentic Workflow Control

유지·보완. N01이 실행 경계 격리를 추가한다. P05의 정식본 설명을 구 프리프린트 검색 요약과 분리한다.

### Definition

에이전트 제어는 시스템이 장기 작업의 목표·권한·행동·외부효과를 제한·관찰·중단·복구할 수 있게 하는 기술이다. 인간의 감독이 존재한다는 사실과 실제로 의미 있는 감독이 되는지는 다르다.

통제는 감독자가 개입할 권한, 시스템이 실행 전에 검사하는 경계, 실패 이후 복구 가능성을 포함한다. 모델의 자기 설명은 실제 도구 권한을 제한하는 장치와 다르다.



### Problem Definition

도구 실행과 외부 상태 변경이 일어난 후에만 검토하면 승인·중단이 형식적인 절차가 된다. 위험한 단계만 승인받으면서 저위험 단계는 자동화하는 정책을 정량화한다.

승인을 자주 요청하면 위험이 줄 수 있지만 작업이 정지할 수도 있다. 안전 위반과 승인 비용을 한 축의 평균 점수로 합치기 전에 각각의 실패 빈도를 공개해야 한다.



### Core Concepts

delegation boundary, permission scope, plan verification, ask/act policy, transaction log, rollback 가능 작업과 불가능 작업, least privilege, runtime intervention, 안전성과 throughput.

권한 트리·capability·이벤트 로그·실행 전 검증·중단·보상 동작을 구분한다. 취소 불가능한 외부 효과를 단순한 상태 되돌리기 실험으로 대표해서는 안 된다.



### Introduction

ICML 2026 Oversight Game은 자율 행동과 확인 요청의 전략을 게임으로 공식화했다[P05]. 2026 제어 서베이는 가드레일, 적응 제어, AI 감독, 인간 감독을 구분한다[P06]. AppWorld-UL은 명확화와 승인 기능을 실제형 시뮬레이션 과제로 평가한다[P19].

기존의 감독 게임·통제 서베이에 N01의 실행 경계 격리를 추가한다. N01은 향후 외부 효과를 차단하는 접근이며 에이전트의 내부 메모리를 원상 복구하는 방법은 아니다.



### Motivation and Background

모델의 언어 능력이 뛰어나도 잘못된 API 호출이 외부 자원이나 권한을 변경하면 출력 수정만으로 복구되지 않는다. 따라서 실행 전 권한·예상 피해·복구 경로가 필요하다.

사람이 읽을 수 있는 작업 계획만으로는 데이터 유출이나 권한 초과 실행이 차단되지 않는다. 설명 계층과 실제 실행 정책의 일치가 운영 설계의 출발점이다.



### Challenges

도구 결과의 지연, 위험 점수의 오탐·미탐, 승인 피로, 중첩된 도구 호출, 비가역적 부수효과, 사용자 확인이 늦는 비동기 작업이 난제다.

탐지 지연, 병렬 분기, 재시도와 중복 실행, 이미 전달된 비밀 정보가 난제다. N01의 데이터 노출 계보도 모든 의미적 영향 전파를 완전하게 포착하지는 못한다.



### Research Questions

RQ1: 위험 기반 개입이 모든 단계 승인 대비 감독 횟수를 줄이면서 위험 외부효과를 억제하는가? RQ2: 사전 시뮬레이션+commit guard가 단순 사후 감사보다 복구 불가능 오류를 감소시키는가?

동일한 이상 이벤트에서 위험 기반 승인이 전면 자동·전면 승인보다 위반을 줄이고 정상 작업을 보존하는가? 탐지 이후 누출과 탐지 이전 피해를 별도로 측정하는가?



### Approaches (Methods)

결제·삭제·파일 수정이 모두 가상인 sandbox API를 구축. baseline=(전부 자동/전부 확인/임계값 확인), 제안=(risk-aware ask + precondition check + reversible sandbox). 정량지표=성공률, 무단 실행률, 비가역 오류, 확인 횟수, 지연, 복구 성공률. 동일 예산·seed·행동 도구 사용.

공개 과제 명세를 읽되 실제 메일·결제·외부 계정을 사용하지 않는 모의 도구를 만든다. 계획·승인·실행 이벤트를 시간순으로 고정하고 승인 없는 상태 변경을 검사한다.



### Key Applications

개발 코딩 에이전트, 연구문헌 수집, 문서 자동작성, 기업 내부 프로세스 에이전트. 실제 결제·계정·삭제 작업 대신 합성 환경만 사용.

문서 정리·자료 수집·코드 변경의 드라이런에 적용 가능하다. 의료·산업 설비와 같은 외부 시스템의 안전 인증을 대신하는 로컬 실험은 아니다.



### Open Problems

권한 위임 정당성, 인간의 실질적 이해, 장기 작업 중 권한 갱신, 거부·중단 후 보상, 시스템이 숨긴 외부효과를 탐지하는 문제가 남아 있다.

지연된 사람 승인과 긴급 중단의 충돌, 감독 피로, 책임 소재, 공격자가 제어 정책 자체를 바꾸는 경우가 남는다. 모의 승인자를 실제 인간 감독자로 부르지 않는다.



### Future Directions

도구별 효과 타입과 권한 계약을 정식화하고, 추적 가능한 승인/변경/복구 원장에 연결. 최종 목표는 무조건 인간 승인 횟수 증가가 아니라 위험 대비 최소 개입과 실효적 통제.

권한 정책을 재현 가능한 실행 명세와 연결하고, 같은 작업에서 안전·진행성·개입 부담을 공동 보고하는 연구가 유망하다. P05의 대규모 훈련을 소형 로컬 모델 실험과 동등하다고 주장하지 않는다.



근거: P05, P06, P19, P24, N01



## 3. Uncertainty Awareness / Expression

범위 수정·내용 보완. P07·P08을 배경으로 옮기고 P09 및 N03·N05를 구분한다. N03은 초록 한정이다.

### Definition

불확실성은 모델의 지식·증거 부족(epistemic)과 환경의 본질적 변동성(aleatoric)을 구분하는 개념이다. 정확한 확률값, 언어적 확신, 답변 보류(abstention)는 서로 다른 인터페이스 신호다.

확률 보고의 보정, 맞고 틀림을 구분하는 판별력, 답할지 말지 결정하는 선택 정책은 별개다. 숫자 confidence가 그럴듯하다는 이유만으로 모두 개선되었다고 평가하지 않는다.



### Problem Definition

유창한 오답은 부당한 확신을 유발하지만, 지나친 답변 보류는 도움을 주지 못한다. 확률적 정확성뿐 아니라 답변 여부를 선택하는 효용까지 최적화할 필요가 있다.

답할 수 있는 문항에서 무응답이 늘면 정답률이 겉으로 오를 수 있다. 평가의 핵심은 같은 응답 범위에서의 위험과 답변 기회의 손실을 함께 비교하는 것이다.



### Core Concepts

Expected Calibration Error(ECE), Brier score, coverage-risk curve, selective accuracy, AUROC for failure detection, claim-level confidence, verbal probability, abstention threshold. 불확실성 문구가 조작 요인으로 작동할 수 있음.

ECE는 구간화 선택에 민감하고, Brier score에는 정답 라벨과 확률이 필요하다. 확률을 출력하지 않는 모델에는 억지로 수치를 부여하지 않고 선택적 정확도·coverage를 우선 기록한다.



### Introduction

2025년 정식 출판된 무응답 서베이[P07]와 원자 주장 보정 연구[P08]는 최초 공개가 2024년인 배경 자료다. 기간 내 근거 P09는 응답 보류가 프롬프트 형식으로도 유발될 수 있음을 보여 준다.

P07·P08은 2025년 출판본이지만 최초 공개가 2024년이어서 배경으로 이동한다. 기간 내 핵심 근거 P09에 N03의 특징 제어 후보와 N05의 확신 보고 전이 결과를 보완한다.



### Motivation and Background

하나의 문서에서도 어떤 문장은 확실하고 다른 문장은 추정일 수 있다. 응답 전체에 단일 확신 점수를 부여하면 검토할 주장 위치를 드러내지 못한다.

사용자가 보는 언어적 확신과 내부 신호가 같은 것은 아니다. N05는 확신을 표현하는 훈련의 가능성을 보이면서도 학습한 과제에서 다른 과제로의 이전을 따로 검증해야 함을 강조한다.



### Challenges

같은 LLM이 정답 생산자와 평가자일 때 자기평가 편향이 커질 수 있다. 기준 정답이 없는 개방형 요청, 분포 외 질문, 포맷 변화에 따른 ECE 왜곡도 문제다.

정답률·문항 난도가 바뀌면 calibration도 달라진다. N03은 초록만 확인했으므로 특징 선택·임계값·상세 효과를 추정하지 않으며, SAE 도구가 MPS에서 그대로 동작한다고 전제하지 않는다.



### Research Questions

RQ1: 응답 수준 점수보다 주장별 신뢰도 표시가 오류 위치를 더 잘 찾는가? RQ2: 동일 coverage에서 evidence-aware selective prediction이 verbal confidence 기반 방법보다 위험을 줄이는가?

선택지에 Unknown을 추가한 효과가 참된 오류 감지보다 큰가? 단일 문항 확신 추정의 개선이 문항 쌍의 상대 확신 비교에도 전이되는가? N05의 결과는 이 전이가 자동적이지 않음을 보완한다.



### Approaches (Methods)

짧은 정답형 공개 데이터셋과 긴 RAG 응답을 분리 평가. 단위 주장 분할 후 증거·정답으로 라벨링, ECE/Brier/coverage-risk 및 토큰당 비용 측정. 잘못된 확신 신호와 정답 가능 상황에서의 과도한 무응답을 모두 실패로 기록.

동일한 정답 라벨과 문항으로 포맷·보류 정책을 교차 비교한다. 검증 세트에서 임계값을 고정한 뒤 평가하고, 보정과 정확도 및 형식 파싱 실패를 별도 열로 남긴다.



### Key Applications

과학 문헌 검토, 보고서 근거 확인, 재난·의료 정보의 비임상 실험, 정책 질의응답. 임상 진단의 검증 효능을 주장하지 않는다.

문헌 사실 확인·정책 FAQ·도구 호출 전 질문 보류에 사용할 수 있다. 이 연구 범위에서 실제 사용자가 확신 신호를 적절히 해석한다는 효과는 검증하지 않는다.



### Open Problems

자기보고 confidence의 보정, 긴 연쇄 추론의 중간 불확실성, 서로 모순되는 검색 증거, 위험도 기반 개인화 표시의 실제 사용자 효과는 미해결.

장문 답변의 의존적 주장, 검색 누락, 시간에 따른 정답 변경, 서로 다른 모델의 수치 해석 차이가 남는다. 작은 로컬 모델 결과를 frontier 모델의 수치로 확장하지 않는다.



### Future Directions

단어 수준 확신에서 주장·근거·시점 단위로 이동하고, 임계값 설정을 과제별 비용 함수와 연결. 오류 감지 성능은 사람의 의존 행동과 분리 검증.

우선 과제는 출력 형식 변화에 강한 선택 정책과 과제 간 보정 전이다. 모델의 자기보고가 유용한 신호인지 테스트하되, 사람의 신뢰 조절 효과와는 독립된 결론으로 제시한다.



근거: P09, N03, N05



## 4. Contestable / Interactive AI

유지. P10·P11의 확정 출판이나 새로운 사용자 효과는 확인되지 않았다. 개념의 운영화를 제안한다.

### Definition

Contestability는 결정의 사실·절차·근거를 다투고 재검토를 요구하는 능력이다. Algorithmic recourse는 원하는 결과를 얻기 위해 입력 조건을 어떻게 바꿀지 안내하는 문제로, 현재 결정의 정당성을 다투는 이의 제기와 구분한다.

이의 제기 가능성은 출력에 이유가 붙는 성질보다 넓다. 결정의 근거를 확인하고, 오류를 지적하며, 새 증거를 제출하고, 결정 변경의 이유를 추적하는 절차를 뜻한다.



### Problem Definition

AI가 이의제기를 말로 수용하더라도 실제 상태를 수정하지 않거나, 반대로 검증되지 않은 압력에 쉽게 굴복할 수 있다. 정당한 수정과 조작에 대한 저항의 동시 달성이 문제다.

모든 이의 제기을 수용하면 아첨이 되고, 어떤 이의 제기도 수용하지 않으면 구제가 불가능하다. 따라서 타당한 이의와 부당한 압박을 구분하는 기계적 수용 기준이 필요하다.



### Core Concepts

claim-evidence graph, objection type, evidence admissibility, revision trace, decision version, valid correction rate, manipulation resistance, change auditability, actor authority.

증거 적격성·결정 버전·변경 권한·수정 사유·재심 경로를 나누어 기록한다. 새로운 설명의 생성과 실제 결정의 갱신은 서로 다른 이벤트다.



### Introduction

2025년 contestability 프레임워크[P10]와 2026년 개념 연구[P11]는 설명가능성과 실질 번복 가능성의 차이를 강조한다. 이들은 규범적·설계적 제안이며, 보편적인 성능 개선이 입증되었다고 해석하면 안 된다.

P10·P11은 contestability의 설계·개념 근거다. 오늘 확인 범위에서 이 두 프리프린트의 정식 출판 전환을 확정하지 않았고, 사용자 효능의 새로운 실험도 확인하지 못했다.



### Motivation and Background

‘왜 이렇게 결정했는가’에 답하는 설명 인터페이스와 ‘그 근거가 오류임을 증명하면 다시 결정하는가’는 다른 시스템 능력이다.

기획·평가 문서에서는 사실관계 오류 정정과 가치 기준 변경이 다르다. 동일한 점수표를 유지한 채 증거를 수정하는 경우와 평가 규칙 자체를 바꾸는 경우를 구분해야 감사가 가능하다.



### Challenges

잘못된 이의제기·조작 프롬프트·근거가 부족한 반론과 정당한 증거를 구분해야 한다. 오류 수정 권한과 작업 변경 권한도 별개다.

여러 개의 타당한 모델이 다른 판단을 낼 수 있고, 유창한 반박이 사실상 무근거일 수도 있다. 판정 기준이 불완전한 상황을 정답형 문제의 수정 성공률로 환원하지 않는다.



### Research Questions

RQ1: 변경불가능한 결정 로그와 근거 연결이 단순 재생성보다 정당한 오류 정정율을 높이는가? RQ2: 허위 권위 주장과 가짜 출처를 거르는 규칙이 정당한 이의 수용률을 과도하게 떨어뜨리는가?

증거 검사 후 수정하는 방식이 설명만 추가하는 방식보다 타당한 정정을 잘 반영하는가? 잘못된 반박이 들어왔을 때 원래의 올바른 결정을 유지하는가?



### Approaches (Methods)

고정된 허가규칙이 있는 합성 심사·문서 평가 데이터를 만든다. 정당한 반론=원문 오류/누락 사실, 부당한 압력=검증 불가능한 권위·가짜 근거로 대조. baseline=(그냥 재질문/설명만 제공), 제안=(evidence check→decision revision→audit). 정정 재현율·허위 번복율·감사 가능성 기록.

근거가 있는 정정·무근거 주장·무관한 새 정보·상충하는 증거를 쌍으로 구성한다. 변경 전후의 결정 ID와 증거 ID를 연결하고 정답 회복과 잘못된 번복을 따로 센다.



### Key Applications

논문 근거 검토, 데이터 품질 판정, 공공행정 지원 의사결정의 사전 점검(실제 행정처분 자동화 아님), 소프트웨어 코드 리뷰.

보고서 사실 정정·코드 리뷰·규칙 기반 모의 심사에 적용할 수 있다. 실제 행정 구제의 적법성이나 이용자의 공정성 인식은 별도 연구가 필요하다.



### Open Problems

이의제기 권한의 범위, 복수 이해관계자, 시간에 따라 변하는 증거, 이의 결과의 책임 귀속, 정당한 거절의 표현 방식이 남는다.

현실의 평가 기준은 합의되지 않을 수 있다. 이의를 낼 역량의 개인차, 반복 이의의 부담, 접근성·공정성은 사람이 없는 시뮬레이션만으로 결론낼 수 없다.



### Future Directions

결정→이의→증거→수정→재검증을 버전 그래프로 관리하는 contestability-by-design. 실제 사용자들의 공정성 인식은 별도 연구 없이는 결론 내리지 않음.

새 실험 제안은 증거를 통과한 이의에 한해서 변경하는 제어기의 오류 특성을 측정하는 것이다. 인터페이스의 만족도보다 먼저 변경의 적절성과 이력 완전성을 반증 가능하게 만든다.



근거: P10, P11, P24



## 5. Provenance / Contribution / Ownership

유지·보완. 두 CiteGuard를 구분하고 공개 코드로 재현 가능한 부분을 제한한다. 심리적 소유감은 사람 근거로 남긴다.

### Definition

Provenance는 자료·편집·모델·도구의 생성 계보를 기록하는 기술적 속성이고, contribution은 누가 어떤 변화를 제공했는가에 대한 기술적·사회적 평가다. 법적 소유권과 심리적 소유감은 기록 기술만으로 결정되지 않는다.

출처 추적은 어디에서 왔는지, 기여 귀속은 어떤 행위가 결과를 바꿨는지, 심리적 소유감은 누가 자신의 것이라 느끼는지를 묻는다. 세 질문을 하나의 소유권 점수로 합치지 않는다.



### Problem Definition

AI 생성 문장의 인용이 원자료를 실제로 지지하는지, 편집 중 근거가 바뀌었는지, 공동 작업자별 기여가 추적되는지를 검증한다. 사용자들이 소유감을 얼마나 느끼는지는 인간 실험의 대상이다.

인용이 사람 선택 참고문헌과 일치해도 주장의 모든 부분이 지지되는 것은 아니다. 주장이 지지되어도 시점이 틀리거나 출처가 바뀌었을 수 있다.



### Core Concepts

claim-to-source alignment, evidence freshness, edit span, version DAG, trace provenance, source support/contradiction, attribution precision, author contribution ledger.

귀속 정확도·주장 지지·시간 유효성·편집 기여·심리적 소유감을 서로 다른 열로 둔다. FDR은 여러 검정에서 거짓 발견의 비율을 제어하는 통계 개념이며 개별 주장 무오류 보증이 아니다.



### Introduction

인용 귀속 연구[P12], 근거 수명주기 연구[P13], 공동 창작 기여 인식[P14], prompting·editing과 심리적 소유감[P15]은 서로 다른 평가 대상을 다룬다.

P12의 Choi 등 CiteGuard는 인용 귀속, N04의 Jiang CiteGuard는 주장–증거의 통계적 제어다. 제목 일부가 같아도 저자·DOI/정식본·평가 과제가 다른 별개 연구로 등록한다.



### Motivation and Background

최종 출력에 URL이 붙어 있어도 근거가 무관하거나 과거 버전일 수 있다. 생성·검토·수정의 단계 기록 없이는 오류의 출처를 소급하기 어렵다.

정책 근거의 과거 버전과 최신 수정본이 섞이면 올바른 문장을 잘못된 시점에 적용할 수 있다. P13의 수명주기 관점은 단순 URL 표시를 넘어서는 기술적 동기를 제공한다.



### Challenges

다중문서 혼합 기여의 정량화, 모델 내부 경로의 해석 제한, 자료 삭제/비공개, 편집 간 의미 변형, 실제 저작권법의 관할 차이가 난제.

검증기의 오류, 교환가능성 위반, 자료의 비공개·삭제, 수정본 추적 누락이 난제다. N04 공개 저장소는 FEVER·합성 core를 제공하지만 논문 NQ 전체 생성·판정 파이프라인은 포함하지 않는다.



### Research Questions

RQ1: 문장 단위 출처 표기보다 편집 이력과 주장-증거 시점 검사가 허위 인용율을 줄이는가? RQ2: ‘누가 쓰고 누가 검토했는지’가 지워지는 단계를 자동 탐지할 수 있는가?

출처–주장–버전 연결이 URL 목록보다 시간 오류를 줄이는가? 감사성 이득을 유지하면서 근거가 맞는 주장을 과도하게 차단하지 않는가? 기여 로그가 누락되는 편집 유형은 무엇인가?



### Approaches (Methods)

문서 생성→인용→사람/AI 편집을 모사하는 synthetic pipeline을 만들고 원자료 ID·버전·편집 delta를 ledger에 기록. baseline=(최종 URL만 표기/RAG 출처 태그), 제안=(claim-source-version graph + 자동 검증). source support precision/recall, stale citation rate, 누락 기여 로그율을 측정.

원자료 ID·버전·문장 위치·편집 연산을 로그에 저장한다. 검증용 정답 계보는 생성기가 미리 가진 합성 자료로 구성하고, FEVER 기반 의미 지지는 별도의 실험으로 유지한다.



### Key Applications

연구논문 초안, 공공 R&D 보고서, AI 지원 코드 개발, 공동 창작 문서의 감사 추적. 기술적 귀속 결과를 법적 소유권 판정으로 오인하지 않는다.

연구 검토·공공 보고서·공동 코드 작성의 변경 추적에 적합하다. P14·P15의 인간 인식 결과는 설계 참고이며 기술 로그만으로 소유감·법적 권리를 재현할 수 없다.



### Open Problems

복잡한 편집에 대한 기여의 공정한 배분, 인간이 느끼는 창작 자율성, AI 모델의 학습원본에 대한 추적 가능성, 이종 도구 간 상호운용성 문제가 남는다.

무엇을 기여로 인정할지에 관한 규범적 합의와 추적 가능한 행위의 범위가 다르다. 관찰되지 않은 아이디어 기여나 학습 데이터 전체의 계보를 완전하게 복원했다는 주장을 피한다.



### Future Directions

증거-버전-기여 그래프를 공통 표현으로 정의하고 검증가능한 attribution을 생성 단계에 삽입. 심리적 ownership 효과와 법적 판단은 독립된 검증 층으로 둔다.

의미적 지지와 시간 유효성을 분리한 공개 오류 주입 벤치마크를 우선 제안한다. 로그 완전성의 증가가 실제 공동 창작자의 인식 개선으로 이어지는지는 이후의 독립 검증 과제다.



근거: P12, P13, P14, P15, N04



## 6. Synthetic Interaction Evaluation

유지·보완. N02로 프로토콜 재현성을 확장하되 인간 대리 타당성을 주장하지 않는다. P16 버전 수치 차이를 남긴다.

### Definition

합성 사용자 평가란 LLM 또는 상태 기계가 사용자의 질문, 오류, 선호, 응답 지연, 지식 변화 등을 모사하여 에이전트의 행동을 반복 측정하는 방법이다. 재현 가능성은 높일 수 있어도 실제 인간의 통계적 대표성을 보장하지 않는다.

합성 상호작용은 통제 가능한 입력을 생성하는 실험 장치다. 인간과 얼마나 유사한가는 과제·집단·지표별 경험적 질문이며, 문장이 자연스럽다는 사실만으로 답할 수 없다.



### Problem Definition

같은 에이전트가 사용자 시뮬레이터의 모델·프롬프트에 따라 평가 순위가 달라진다면 벤치마크 결과가 사용자 행동이 아닌 시뮬레이터 특성에 의존한다.

시뮬레이터가 특정 에이전트의 문체를 선호하면 시스템 순위가 왜곡된다. 비교 대상 에이전트와 사용자 생성기의 모델 계열을 섞어 편향의 방향을 드러내야 한다.



### Core Concepts

user simulator validity, latent user state, knowledge trajectory, multi-turn transition, coverage, demographic distribution shift, evaluator leakage, simulator-induced ranking variance.

프로토콜 재현성·행동 예측·효과 방향 일치·집단별 편향·과제 순위 안정성을 구분한다. 실행 가능한 실험 코드는 사람 데이터의 타당성을 대체하지 않는다.



### Introduction

EMNLP 2026 KnowSim은 학습하는 사용자 지식 상태를 추적하고[P16], ACL 2026 Lost in Simulation은 합성 사용자의 대표성과 공정성 문제를 보여준다[P17]. 실제 쇼핑 기록 기반 ACL 연구는 단순 프롬프트형 다회 행동 예측의 낮은 정확도를 확인했다[P18].

P16의 정보 학습, P17의 대리 사용자 불일치, P18의 실제 로그 예측을 함께 읽는다. N02는 프로토콜을 프로그램으로 분리하는 방법을 더하며, 인간 대체의 유효성은 별도 문제로 남긴다.



### Motivation and Background

사람을 새로 모집하지 않아도 실패 사례를 대량 생성하고 제어 정책을 비교할 수 있다. 하지만 시뮬레이션이 실제 상호작용을 반영하는지 별도 검증이 필요하다.

반복 실행할 때 지시·기억·역할이 달라지면 비교의 대상도 달라진다. 재현 가능한 절차와 문맥 관리가 먼저 갖추어져야 어떤 실패가 모델 탓인지 평가 장치 탓인지 구분할 수 있다.



### Challenges

합성 사용자 다양성 부족, 질문 충실도, 동질화된 모델 편향, 약한 근거로 생성한 행동정답, 동일 평가모델 간 공모, 실사용 분포 변동이 치명적이다.

P16은 정식 초록의 8개 모델을 채택하고 프리프린트 검색 요약의 9개는 버전 메모로 남긴다. 이 차이를 효과의 재현 실패나 공식 정정으로 임의 해석하지 않는다.



### Research Questions

RQ1: 규칙기반·LLM기반·혼합형 시뮬레이터에서 에이전트 성능 순위가 얼마나 안정적인가? RQ2: 소수의 공개 인간 상호작용 기록을 ‘개발’이 아닌 ‘최종 검증’에 사용할 때 과대평가가 얼마나 줄어드는가?

생성기 모델을 바꾸면 에이전트 순위가 뒤집히는가? 같은 프로토콜에서도 기억 정책 변화가 효과 방향을 바꾸는가? 실제 자료가 있는 부분집단에서만 타당성이 유지되는가?



### Approaches (Methods)

공개 인가 데이터만 사용하고 개인정보를 제거한다. 서로 다른 사용자 생성기 3종, 모델·seed 교차, train/test 사용자 세션 단위 분리. 에이전트 성공률뿐 아니라 순위 역전율, 행동 분포 거리, 사용자 조건별 오차, off-policy 일반화 지표를 사용.

규칙 기반·LLM 기반·혼합 사용자 생성기를 동일한 Show/Ask 유사 프로토콜에 연결한다. 평가용 프로토콜을 튜닝에서 제외하고 기억 상태·시드·모델 해시를 모두 기록한다.



### Key Applications

코딩 상담봇, 앱 사용 도구 에이전트, 명확화 대화, 학습 지원 시스템. 실제 사람 대상 영향의 최종 주장은 기존 인간 데이터 검증 수준까지만 제한.

워크플로우 회귀 검사·인터페이스 스트레스 테스트·질문 비용 비교에 유용하다. 사용자 만족·웰빙·문화별 수용성을 합성 대화로 입증했다고 표현하지 않는다.



### Open Problems

모델 업데이트로 사용자 모사가 변하는 문제, 비표준 언어집단에서의 편향, 공개 데이터의 표본 한계, 장기 관계를 합성할 수 있는지 불확실.

N02의 12명 전문가 검토는 도구 작성 과정에 관한 사람 자료다. 시뮬레이션 응답이 실제 참가자 결과와 일치한다는 증거로 합산하면 구성 타당도가 무너진다.



### Future Directions

합성 벤치마크를 정답이 아니라 스트레스 테스트로 취급하고 ‘모사 정확도·편향·교차 시뮬레이터 안정성’을 함께 제출하는 평가 프로토콜 구축.

실행 프로토콜 공개와 인간 자료 기반 외부 타당화를 서로 독립된 산출물로 설계한다. 사람 자료 사용 권한이 없는 경우에는 합성 평가의 민감도만 보고하고 인간 일반화를 보류한다.



근거: P16, P17, P18, P19, N02



## 7. Multi-Agent Coordination

유지·보완. N01을 운영 제약 근거로 추가한다. 규모·권한·오염 경계와 비용 공정성을 함께 평가한다.

### Definition

다중 에이전트 조정은 복수의 AI가 부분적인 정보·역할·권한을 가진 채 공통 목표를 위한 상태 공유, 작업 분배, 질문, 검증, 종료 합의를 수행하는 과정이다. 독립 모델의 평균 성능과 집단 결과의 정확성은 다르다.

조정의 단위는 역할·메시지·공유 상태·도구 권한의 결합이다. 에이전트 수를 늘리는 것이 곧 분산된 전문성이나 인간 조직의 협업을 뜻하지 않는다.



### Problem Definition

여러 에이전트를 추가하면 검토량과 통신 비용이 증가하지만 오류도 전파할 수 있다. 동일 작업에서 다중 시스템의 실질 이익을 단일 강한 에이전트와 비교한다.

최종 답이 맞더라도 중간 상태가 틀리면 다음 과제에서 실패할 수 있다. 성공률과 함께 상태 불일치·권한 침범·통신량을 기록해야 조정의 비용과 이득이 드러난다.



### Core Concepts

coordination topology, communication budget, shared state, handoff integrity, joint planning, privacy constraints, consensus, termination condition, cost-aware escalation.

토폴로지·역할 분담·확인 질문·공유 상태 커밋·정보 최소화·오염 전파 경계를 구분한다. 한 단계의 검증이 전체 시스템의 안전 보장으로 확대되지 않도록 한다.



### Introduction

ACL 2025 MultiAgentBench는 다양한 토폴로지와 협업 프로토콜을 비교했고[P20], ACL 2026 MAS-BENCH는 단순 정렬에서도 대규모 협력이 흔들릴 수 있음을 보였다[P21]. AgentAsk는 전달 경계의 명확화[P22], PAC-BENCH는 프라이버시 제약[P23], PeopleJoin은 합성 조직 정보수집[P26]을 다뤘다.

P20–P23은 협업·분산 정렬·질문·프라이버시 제약을 달리 다룬다. N01은 오염 이후 정상 분기를 얼마나 살리며 경계를 닫는지라는 운영 측정을 추가한다.



### Motivation and Background

작업을 쪼개기만 하면 모든 참여자의 오류와 누락을 결합하게 될 위험이 있다. 협업의 핵심은 에이전트 수가 아니라 공유 상태의 정합성과 전달 경계의 검증이다.

큰 팀은 더 많은 호출과 오류 경로를 만든다. 단일 에이전트가 같은 토큰·도구 호출 예산을 썼을 때와 비교하지 않으면 역할 분담의 효과를 계산량 효과와 혼동한다.



### Challenges

이전 단계의 오해가 이후 여러 작업으로 전파되고, 각 에이전트가 자신만의 단어·상태 의미를 사용하면 전체 결과가 불일치한다. 정보 제한과 비밀유지 요구가 협력을 어렵게 한다.

동일 모델 복제의 오류 상관, 낡은 공유 상태, 메시지 누락, 비밀 정보 전파, 검증기 병목이 난제다. N01의 제한된 테스트베드 결과를 무제한 확장성의 근거로 쓰지 않는다.



### Research Questions

RQ1: 공통 상태 원장과 명확화 메시지가 토폴로지 변화에 따른 실패를 줄이는가? RQ2: 다중 협업이 추가 토큰·도구·재시도 비용을 제외해도 강한 단일 에이전트보다 우수한가?

공유 상태 검증이 단순한 역할 프롬프트보다 오류 전파를 줄이는가? 정보 최소화는 정상 작업 성공을 얼마나 희생하는가? 확인 질문은 늘어난 비용을 상쇄하는가?



### Approaches (Methods)

같은 모델군·토큰·총 도구예산에서 단일, 다중 star/chain/graph, shared-ledger+clarification을 비교. 분산 정렬·문서 합성·정보집계에서 미션 성공률, handoff 오류, 공유 상태 불일치, 에이전트당 메시지, 최종 합의 실패, 성능/비용을 평가.

정렬 배열·다중 문서 질의를 고정하고 단일 에이전트·역할 분담·공유 상태 검증을 비교한다. 정상 분기 보존과 위반 이후 누출을 사건 단위로 측정하고 전체 호출 예산을 맞춘다.



### Key Applications

AI 공동 연구, 소프트웨어 개발팀 에이전트, 정책자료 조사 및 통합, 여러 정보 소유자를 연결하는 비식별 정보수집.

다중 문서 수집·연구 지원·코드 검토의 모의 팀에 적용할 수 있다. 사람의 실제 팀 성과·역할 만족도·책임 수용은 이 기술 벤치마크의 결론이 아니다.



### Open Problems

이기종 모델 간 의미 일치, 오류 책임 분담, 집단 합의의 안전성, 비용-성능 최적화, 실제 조직 업무로의 전이가 미해결.

분산 시스템의 완료성·안전성과 LLM의 의미 오류를 함께 다루는 보편적 프로토콜이 부족하다. 벤치마크 내 역할 명칭을 바꾼 것만으로 현실 조직의 전문성을 재현했다고 주장하지 않는다.



### Future Directions

집단 지능의 최소 단위를 ‘에이전트 수’가 아닌 ‘검증 가능한 상태 전이와 전달 계약’으로 전환. privacy-aware 정보 공유·단일 확정(commit)·증거 기반 협업을 통합하고 반증 실험 수행.

권한과 데이터 흐름을 명시하고 실패 주입을 표준화하는 연구가 유망하다. 규모 확대에 앞서 작은 팀에서 상태 일관성과 비용 공정성이 유지되는지를 먼저 반증한다.



근거: P20, P21, P22, P23, P26, N01



## 변경 비교

추가 검토 · 프리프린트 | N01 Airlock · 11월 4일 최초 공개 | 통제·다중 에이전트에 선택적 실행 격리 보완. 오염된 기억의 롤백과 구분. | 기존 판단 유지 + 운영 측정 확장

추가 검토 · 프리프린트 | N02 Executable Human Study Programs · 11월 9일 제출 | 합성 연구 절차를 실행 가능한 프로그램으로 분리. 전문가 12명은 도구 검토 표본. | 절차 재현성과 인간 대체 타당성을 분리

추가 후보 · 초록 한정 | N03 Dr. No · 11월 2일 최초 공개 | 특징 기반 무응답 제어. 직접 본문·최신 버전 접근 제한으로 수치 보류. | 상세 효능 판단 보류

정식본 추가 확인 | N04 Jiang의 CiteGuard · ICML 2026 | P12 Choi 등의 동명 연구와 다른 논문. FDR 가정·공개 재현 범위 점검. | 귀속 정확도 ≠ 통계적 지지 보장

정식본 추가 확인 | N05 확신 보고 전이 · 11월 5일 출판 | 학습 이득과 과제 간 전이 제한. 공식 본문의 과제·전이·공개 자료 항목 확인. | 불확실성 표현의 일반화는 별도 평가

기간 범위 보완 | P07·P08 최초 공개 2024년 | 2025년 정식 출판으로 인한 포함 혼동을 해소. 오늘자 배경 자료로 분리. | 최초 글 수정 없음 · 신규 연구 수에서 제외

서지·버전 보완 | P12 / N04, P13, P16, P18 | 동명 CiteGuard 분리, P13·P18 전체 제목 복원, P16 정식 8개 / 프리프린트 검색 9개 기록. | 효과 변화·공식 정정으로 단정하지 않음

출판 상태 재확인 | P02 ICLR; P14 CHI; 기존 ACL·PMLR 자료 | 공식 proceedings·저자기관으로 정식본 존재 확인. | 정식본 확인과 신규 채택 사건 구분

정정·철회·독립 재현 | 이번 확인 범위에서 새 사건 미확인 | 공식 출처를 우선했으나 전 세계 공지·모든 버전을 전수 확인한 것은 아님. | 발견 없음 ≠ 존재하지 않음

변경 없는 결론 | R1–R7 전체 | 모델·시스템 성능, 합성 평가 타당성, 실제 사람 반응은 분리. | 사람 없는 반증 실험은 기술 주장에 한정



## 원문 근거

- P01 Measuring Sycophancy of Language Models in Multi-turn Dialogues — https://aclanthology.org/2025.findings-emnlp.121/ — Findings EMNLP 2025 · 정식 출판 — 공식 초록·서지 확인. 실제 사용자의 과의존을 측정한 결과가 아니다.

- P02 ELEPHANT: Measuring and understanding social sycophancy in LLMs — https://www.microsoft.com/en-us/research/publication/elephant-measuring-and-understanding-social-sycophancy-in-llms/ — ICLR 2026 proceedings 확인 — 기관 원문·ICLR 공식 초록 확인. 인간 응답 비교를 장기 사용자 행동 실험으로 읽지 않는다.

- P03 Training language models to be warm can reduce accuracy and increase sycophancy — https://www.nature.com/articles/s41586-026-10410-0 — 2026-04-29 · Nature 652, 1159–1165 — 공식 출판 페이지·초록 확인. 모델 오류 변화는 사람의 실제 의존 행동 변화와 다르다.

- P04 Too Sure for Our Own Good: A User Study on AI Confidence and Human Reliance — https://ojs.aaai.org/index.php/AAAI/article/view/38798 — 2026-03-14 · AAAI 40(21), 17445–17453 — 공식 출판사 검색 색인의 초록·DOI 확인. 본문 직접 접근 제한. 과제 밖·장기 효과 일반화 불가.

- P05 The Oversight Game: Learning to Cooperatively Balance an AI Agent’s Safety and Autonomy — https://proceedings.mlr.press/v306/overman26b.html — ICML 2026 · PMLR 306; 웹 메타데이터 2026-09-29 — 정식 초록·서지 확인. 구 프리프린트 검색 초록의 gridworld 설명만으로 정식본을 요약하지 않음. 사람 실험 아님.

- P06 On Controllability in Agentic AI: A Survey — https://link.springer.com/article/10.1007/s11023-026-09783-y — 2026-05-26 · Minds and Machines 36, 29 — 출판사 초록·서지 확인. 서베이 분류를 개별 통제기의 실증 효능으로 인용하지 않는다.

- P07 Know Your Limits: A Survey of Abstention in Large Language Models — https://aclanthology.org/2025.tacl-1.26/ — TACL 2025 · 기간 외 배경 — 최초 공개가 2024년이므로 엄격한 2025년 이후 신규 연구에서 제외. 2025년 정식 출판 사실은 보존.

- P08 Atomic Calibration of LLMs in Long-Form Generations — https://aclanthology.org/2025.findings-ijcnlp.9/ — Findings IJCNLP 2025 · 기간 외 배경 — 최초 공개가 2024년. 2025년 정식본이라는 이유만으로 기간 내 최초 연구로 세지 않음.

- P09 LLM Abstention Can Be a Prompt Artifact, in Addition to Genuine Uncertainty — https://aclanthology.org/2026.emnlp-main.549/ — EMNLP 2026 · 정식 출판 — 공식 초록·저자 코드 문서 확인. 무응답 증가를 곧바로 진짜 불확실성 개선으로 해석하지 않는다.

- P10 Explainable AI Systems Must Be Contestable: Here's How to Make It Happen — https://arxiv.org/abs/2506.01662 — 프리프린트 · 확정 출판 미확인 — 공식 arXiv 초록·서지 확인. 보편적 사용자 효능을 검증한 실험으로 취급하지 않음.

- P11 Explainable AI Isn't Enough! Rethinking Algorithmic Contestability — https://arxiv.org/abs/2605.16041 — 프리프린트 · 확정 출판 미확인 — 공식 arXiv 초록·서지 확인. 원칙의 타당성과 실제 구제 절차 성과는 별도 검증 필요.

- P12 CiteGuard: Faithful Citation Attribution for LLMs via Retrieval-Augmented Validation — https://aclanthology.org/2026.acl-long.282/ — 2026-07 · ACL · 정식 출판 — 공식 초록·서지 확인. N04와 다른 CiteGuard. 인용 귀속 정확도는 모든 주장에 대한 의미적 지지나 FDR 보장과 다르다.

- P13 Lifecycle Faithfulness for Grounded Retrieval-Augmented Generation: Benchmarks, Evaluation, and the Vera-Life Controller — https://aclanthology.org/2026.groundlm-1.18/ — 2026-10 · GroundLM workshop · 정식 출판 — 공식 초록·서지 확인. 워크숍 논문이며 주학회 본회의와 구분. 소유감 실험 아님.

- P14 Which Contributions Deserve Credit? Perceptions of Attribution in Human-AI Co-Creation — https://arxiv.org/abs/2502.18357 — CHI 2025 · IBM 공식 기관 기록 확인 — arXiv 초록·IBM 정식 출판 기록 확인. 인식 조사이며 법적 소유권 판정 아님.

- P15 How Prompting and Editing Shape Psychological Ownership in AI-assisted Creative Writing — https://www.sciencedirect.com/science/article/pii/S2949882126001349 — 2026-08-22 온라인 공개 · Computers in Human Behavior: Artificial Humans — 출판사 검색 초록·Aalto 공식 기관 서지 확인. 직접 본문 접근 제한. 인과 해석은 조작된 조건 내로 한정.

- P16 KnowSim: Evaluating Information Calibration in LLM Assistants with User Simulators that Learn — https://aclanthology.org/2026.emnlp-main.1307/ — 2026-10 · EMNLP · 정식 출판 — 정식 초록은 8개 frontier LLM, 프리프린트 검색 초록은 9개로 달라 정식본 8개 채택. 공식 정정 공지 확인과는 구분.

- P17 Lost in Simulation: LLM-Simulated Users are Unreliable Proxies for Human Users in Agentic Evaluations — https://aclanthology.org/2026.acl-long.2192/ — 2026-07 · ACL · 정식 출판 — 공식 ACL 서지·초록 원문과 arXiv 초록 확인. 특정 표본·과제의 차이를 모든 문화·배치에 일반화하지 않는다.

- P18 Can LLM Agents Simulate Multi-Turn Human Behavior? Evidence from Real Online Customer Behavior Data — https://aclanthology.org/2026.acl-long.2034/ — 2026-07 · ACL · 정식 출판 — 공식 초록·서지 확인. 행동 예측 정확도는 대화의 그럴듯함·주관적 신뢰의 지표가 아니다.

- P19 AppWorld-UL: Benchmarking Diverse Agent-User Interactions for Tool-Use — https://proceedings.mlr.press/v306/chen26eg.html — ICML 2026 · PMLR 306; 웹 메타데이터 2026-09-29 — 공식 초록·프로젝트·코드 문서 확인. LLM 사용자 기반 과제를 실제 사람 대상 현장 실험으로 부르지 않음.

- P20 MultiAgentBench : Evaluating the Collaboration and Competition of LLM agents — https://aclanthology.org/2025.acl-long.421/ — 2025-07 · ACL · 정식 출판 — 공식 초록·저자 저장소 확인. 인간 팀 구성 효능의 근거 아님.

- P21 When 20 Agents Fail to Sort: The Distributed Sorting Benchmark for Scalable Multi-Agent Systems — https://aclanthology.org/2026.findings-acl.1698/ — 2026-07 · Findings ACL · 정식 출판 — 공식 초록·서지 확인. 작은 모델 로컬 검증은 논문의 모든 설정 재현과 다르다.

- P22 AgentAsk: Multi-Agent Systems Need to Ask — https://aclanthology.org/2026.acl-long.1294/ — 2026-07 · ACL · 정식 출판 — 공식 초록·서지 확인. 질문 증가 자체가 성능·비용 개선을 보장하지 않는다.

- P23 PAC-BENCH: Evaluating Multi-Agent Collaboration under Privacy Constraints — https://aclanthology.org/2026.findings-acl.1552/ — 2026-07 · Findings ACL · 정식 출판 — 공식 초록·서지 확인. 공유량 감소를 자동으로 프라이버시 보장으로 읽지 않는다.

- P24 Designing meaningful human oversight in AI — https://link.springer.com/article/10.1007/s43681-026-01147-7 — 2026-05-04 · AI and Ethics · 정식 출판 — 출판사 초록·서지 확인. 승인 버튼 존재만으로 인간 감독의 실효성을 보장하지 않는다.

- P25 LLM-Based Human-Agent Collaboration and Interaction Systems: A Survey — https://aclanthology.org/2026.findings-acl.1811/ — 2026-07 · Findings ACL · 정식 출판 — 공식 초록·서지 확인. 유형 분류와 특정 시스템 인간 효능을 구분한다.

- P26 LLM Agents for Coordinating Multi-User Information Gathering — https://aclanthology.org/2025.findings-acl.916/ — 2025-07 · Findings ACL · 정식 출판 — 공식 초록·서지 확인. 합성 조직의 사용자는 실제 조직의 인간 참가자가 아니다.

- N01 Airlock: Bounding the Multi-Agent Blast Radius via Selective Online Containment — https://arxiv.org/html/2611.06727v1 — 프리프린트 · 확정 출판 미확인 — 전체 HTML의 설계·한계 확인. 향후 외부 효과를 격리하며 이미 오염된 메모리의 롤백은 아니다. 공개 코드 존재와 독립 재현 성공은 별개.

- N02 Executable Human Study Programs with Silicon Participants — https://arxiv.org/abs/2611.11969 — 프리프린트 · 확정 출판 미확인 — 전체 HTML의 방법·한계 확인. 12명 사회과학 연구자의 도구 사용 검토는 합성 참가자가 인간을 대체한다는 검증이 아니다.

- N03 Dr. No: Feature Steering for Abstention in Vision-Language Models — https://arxiv.org/abs/2611.03862 — 프리프린트 · 최신 버전 재확인 제한 — 공식 arXiv 검색 색인의 초록만 확인. 본문 직접 접근 실패. 효과 수치·상세 설정을 채택하지 않고 보류 후보로 표시. 사람 실험 아님.

- N04 CiteGuard: Conformal False-Discovery Control for Faithful Retrieval-Augmented Generation — https://proceedings.mlr.press/v306/jiang26f.html — ICML 2026 · PMLR 306, 52157–52187 — 정식 초록·공식 코드 문서 확인. 공개 FEVER/합성 core와 비공개 NQ end-to-end 자료를 구분. P12와 동일 논문의 개정이 아니다.

- N05 Generalization of fine-tuned uncertainty communication and metacognition in large language models — https://www.nature.com/articles/s44488-026-00030-y — 2026-11-05 · Communications AI & Computing 1, 26 — 공식 출판 본문의 방법·자료/코드 공개 항목 확인. 원 훈련은 GPT4.1-mini·Llama3.1-70B의 클라우드 서비스 사용. 로컬 동등 재현·사람 의존 감소는 검증하지 않음.