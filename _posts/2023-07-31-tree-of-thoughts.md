---
layout: post
title: How to write Tree of Thoughts Prompts
date: 2023-07-31
categories: [artificial intelligence]
tags: [machine learning, foundation models]

---

### Article Source

* [How to write Tree of Thoughts Prompts](https://www.youtube.com/watch?v=2lnW1PSB2_g)


---


# How to write Tree of Thoughts Prompts

Ever wondered how AI could mimic human brainstorming and solve complex problems? Join Richard Walker from Lucidate as we delve into the fascinating world of Large Language Models (LLMs) and Prompt Engineering. This video explains the 'Tree of Thought' prompting technique, designed to emulate human brainstorming and prove beneficial in problem-solving, particularly in mathematical reasoning.

<iframe width="600" height="400" src="https://www.youtube.com/embed/2lnW1PSB2_g" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

Explore how LLMs, although not explicitly designed to solve mathematical problems, can use this technique to effortlessly solve complex problems. Discover how the discipline of prompt engineering is expanding rapidly and the potential it holds for the future.
We'll be using a simple logic problem to demonstrate the Tree of Thoughts prompting process, comparing results with different prompts, and even evaluating how GPT-4 stands in this aspect.
Don't forget to try this yourself with your own prompts and scenarios and share your results in the comments! We're excited to see what you come up with. For more exciting AI content, make sure to like, subscribe, and hit that notification bell to stay updated with our latest videos. Happy Exploring!"


1. Carlos is at the swimming pool.
2. He walks to the locker room, carrying a towel.
3. He puts his watch in the towel and carries the towel tightly to a lounger at the poolside.
4. At the lounger he opens and vigorously shakes the towel, then walks to the snack bar.
5. He leaves the towel at the snack bar, then walks to the diving board.
6. Later Carlos realises he has has lost his watch. Where is the single most likely location of the watch?


Think through each step logically.

1. 카를로스는 수영장에 있습니다.
2. 그는 수건을 들고 탈의실로 걸어갑니다.
3. 그는 수건에 시계를 넣고 수건을 꽉 쥐고 수영장 가장자리에 있는 쇼즈 의자로 이동합니다.
4. 쇼즈 의자에서 그는 수건을 흔들면서 수건을 열고, 그 후 스낵 바로 이동합니다.
5. 그는 수건을 스낵 바에 두고, 그 다음 다이빙 보드로 걸어갑니다.
6. 나중에 카를로스는 시계를 잃어버렸다는 것을 깨닫습니다. 시계의 가장 확률적인 위치는 어디인가요?

Imagine three different experts are answering this question.
They will brainstorm the answer step by step reasoning carefully and taking all facts into consideration
All experts will write down 1 step of their thinking,
then share it with the group.
They will each critique their response, and the all the responses of others
They will check their answer based on science and the laws of physics
Then all experts will go on to the next step and write down this step of their thinking.
They will keep going through steps until they reach their conclusion taking into account the thoughts of the other experts
If at any time they realise that there is a flaw in their logic they will backtrack to where that flaw occurred 
If any expert realises they're wrong at any point then they acknowledges this and start another train of thought
Each expert will assign a likelihood of their current assertion being correct
Continue until the experts agree on the single most likely location
The question is...

상상해보세요. 세 명의 다른 전문가들이 이 질문에 답하고 있습니다.
그들은 조심스럽게 이유를 찾아가며 모든 사실을 고려하여 답을 떠올립니다.
모든 전문가들은 자신의 생각하는 한 단계를 적습니다.
그리고 그 단계를 그룹과 공유합니다.
각 전문가는 자신의 응답과 다른 사람들의 응답을 비평합니다.
그들은 과학과 물리학의 법칙을 바탕으로 답을 검증합니다.
그런 다음 모든 전문가들은 다음 단계로 이동하고 이 생각의 단계를 적습니다.
그들은 상대 전문가들의 생각을 고려하여 결론에 도달할 때까지 계속해서 단계를 진행합니다.
만약 언제든지 그들이 논리에 결함이 있다는 것을 깨닫는다면, 그 결함이 발생한 곳으로 되돌아갑니다.
어떤 전문가가 어느 시점에서 틀렸다고 깨닫는다면, 그것을 인정하고 다른 사고의 흐름을 시작합니다.
각 전문가는 현재 주장이 맞을 가능성을 할당합니다.
전문가들이 가장 가능성이 높은 위치에 동의할 때까지 계속합니다.

## Tree of Thoughts: Deliberate Problem Solving with Large Language Models (Full Paper Review)

* Paper: [https://arxiv.org/abs/2305.10601](https://arxiv.org/abs/2305.10601)
* Authors: Shunyu Yao, Dian Yu, Jeffrey Zhao, Izhak Shafran, Thomas L. Griffiths, Yuan Cao, Karthik Narasimhan


### Abstract

Language models are increasingly being deployed for general problem solving across a wide range of tasks, but are still confined to token-level, left-to-right decision-making processes during inference. This means they can fall short in tasks that require exploration, strategic lookahead, or where initial decisions play a pivotal role. To surmount these challenges, we introduce a new framework for language model inference, Tree of Thoughts (ToT), which generalizes over the popular Chain of Thought approach to prompting language models, and enables exploration over coherent units of text (thoughts) that serve as intermediate steps toward problem solving. ToT allows LMs to perform deliberate decision making by considering multiple different reasoning paths and self-evaluating choices to decide the next course of action, as well as looking ahead or backtracking when necessary to make global choices. Our experiments show that ToT significantly enhances language models' problem-solving abilities on three novel tasks requiring non-trivial planning or search: Game of 24, Creative Writing, and Mini Crosswords. For instance, in Game of 24, while GPT-4 with chain-of-thought prompting only solved 4% of tasks, our method achieved a success rate of 74%. Code repo with all prompts: this https URL.


<iframe width="600" height="400" src="https://www.youtube.com/embed/ut5kp56wW_4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>


## Tree of Thoughts - GPT-4 Reasoning is Improved 900%

So a new A.I. paper is released:

Tree of Thoughts: Deliberate Problem Solving with Large Language Models

It’s by researchers at Princeton University and Google DeepMind.

It's shows how increase the ability for GPT-4 to autonomously solve complex problems... but it comes with a warning.


<iframe width="600" height="400" src="https://www.youtube.com/embed/BrjAt-wvEXI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>