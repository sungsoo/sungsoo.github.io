# HAI 보완 조사 기록 — 2026-11-09 KST

- 기준: 초기 watch_state.json과 근거표26편; 최신 공용 상태 경로는 404여서 초기 상태 사용.
- 기본 브랜치: GitHub API에서 master 확인. branch protected=false, rulesets=[] 확인.
- 조사 성공과 게시 성공은 독립 기록. 초기 글 HTTP200 및 최초커밋870087fb48affc2cb0f88b8880b3cb45964827b0의 Pages 배포 success 확인.
- 범위: 전체2025-01-01~2026-11-09; 최근14일2026-10-26~11-09 중첩. 주간 전체기간 회전은 T03(신뢰·아첨)와 T06(창의적 소유감)부터 착수. 그 외 주제는 최근 검색과 기존 자료 대조; 전수 재검색 아님.

## 검색식과 채널

공개 웹 검색의 강한 검색엔진을 사용; 시의성 검색에 recency=14 적용. 검색 결과에서 원문으로 이동하여 포함 여부 판단.

1. "human AI" "November" "2026" collaboration arxiv
2. "human agent" interaction arxiv November 2026
3. "AI" sycophancy attachment trust creativity arxiv November 2026
4. site:arxiv.org "human" "AI" "Nov" "2026" trust explanation culture
5. site:arxiv.org "human" "robot" "XR" "2026" "November"
6. site:arxiv.org "human" "AI" "creativity" "November" "2026"
7. site:arxiv.org "human AI" "November 2026" longitudinal evaluation
8. site:arxiv.org "human-ai" after:2026-10-26 before:2026-11-10 collaboration control evaluation
9. site:arxiv.org "creative" "ownership" after:2026-10-26 before:2026-11-10
10. site:arxiv.org "cross-cultural" "mental models" after:2026-10-26 before:2026-11-10
11. site:arxiv.org "human-AI" "7 Nov 2026"
12. site:arxiv.org "human-agent" "6 Nov 2026"
13. site:arxiv.org "sycophancy" "Nov 2026"
14. "Sycophantic AI decreases prosocial" "2405"
15. "Understanding Critical Thinking" "1341"
16. "Users" "mental models" "03038" "September"
17. "HAI" "human" "November 2026" correction retraction arxiv

개별 문헌은 arXiv abs 이력과 HTML 본문·공식 출판사에서 대조. 제3자 집계는 발견 용도로만 사용. 실제 신규 공개나 개정이 아닌 초기 목록 누락도 별도 분류해 포함.

## 선정과 제외

- 포함: P27 2611.00689v1, P28 2611.04466v1, P29 2605.07912v3. 모두 최초공개 기간 적격;초기26편과 정규화제목·arXiv ID 중복 없음.
- P27 1저자는 집계 사이트와 순서가 달라 arXiv의 Michael Granitzer 채택.
- P28은 투고 중 표기;IEEE 채택이나 정식출판으로 표기하지 않음.
- P29는 2026-05-08 최초공개,2026-06-21 v3;11월 신규 발표로 세지 않음.
- 후보 보류: 2611.01566(통계적 위임;직접 랜딩 접근실패,공식 검색초록만),2611.04692(웨어러블;초록 발견),2606.08274(문화·인지 서베이;공식 검색초록),2609.31138(XR;공식 검색초록). 본문 검토 전 갱신의 핵심 근거로 사용하지 않음.
- P03 2611.03092v1,P05 2610.21109v1 서지 재확인. P02 랜딩 직접접근 실패:철회 여부 또는 최신 버전 검증 완료 아님.
- P08 v2 초록21/방법20 상충 유지;P12 정식본2405/v1 1604 유지;P24 v2 및 출판사1341 재확인;P19 검색일2024-09-06 재확인.
- 초기26편 전체의 최신판·철회 상태를 전수 재검증한 것은 아님. 확인 범위에서 중요한 개정·철회를 입증하지 못함.

## 편집·검수

현재 Publisher 및 필수 편집·타이포그래피2종·도식·하이라이트·게시 검수 지침 확인. _config.yml permalink, 최근 게시물2편, 홈페이지의 실제 agentic ai/foundation models 태그 확인.

출처·해석·미검증 제안 분리. 정적 inline SVG는 세 연구 축의 편집상 비교 관계;인과 화살표 없음. YAML 첫 바이트,77개 분석 소절,내부 앵커,29행 근거표,전체제안 동등성 검사. 원격폰트 실패 시 로컬 fallback. Playwright 모듈은 있으나 Chromium 실행파일이 없어 렌더 검수 불가;정적 검사만 수행. 초기 HTML·보고서·근거표는 변경하지 않음.
