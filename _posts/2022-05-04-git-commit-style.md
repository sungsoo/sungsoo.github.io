---
layout: post
title: Git Commit Message Style Guide
date: 2022-05-04
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Git Commit Message Style Guide - 개인/팀을 위한 커밋 메시지 스타일 가이드](https://blog.munilive.com/posts/my-git-commit-guide.html)


---


# Git Commit Message Style Guide 

## Introduction

This style guide acts as the official guide to follow in your projects.
Udacity evaluators will use this guide to grade your projects. There are
many opinions on the "ideal" style in the world of development.
Therefore, in order to reduce the confusion on what style students
should follow during the course of their projects, we urge all students
to refer to this style guide for their projects.


## Commit Messages

### Message Structure

A commit messages consists of three distinct parts separated by a blank
line: the title, an optional body and an optional footer. The layout
looks like this:

    type: Subject

    body

    footer

The title consists of the type of the message and subject.

### The Type

The type is contained within the title and can be one of these types:

-   **feat:** A new feature
-   **fix:** A bug fix
-   **docs:** Changes to documentation
-   **style:** Formatting, missing semi colons, etc; no code change
-   **refactor:** Refactoring production code
-   **test:** Adding tests, refactoring test; no production code change
-   **chore:** Updating build tasks, package manager configs, etc; no
    production code change

### The Subject

Subjects should be no greater than 50 characters, should begin with a
capital letter and do not end with a period.

Use an imperative tone to describe what a commit does, rather than what
it did. For example, use **change**; not changed or changes.

### The Body

Not all commits are complex enough to warrant a body, therefore it is
optional and only used when a commit requires a bit of explanation and
context. Use the body to explain the **what** and **why** of a commit,
not the how.

When writing a body, the blank line between the title and the body is
required and you should limit the length of each line to no more than 72
characters.

### The Footer

The footer is optional and is used to reference issue tracker IDs.

### Example Commit Message

    feat: Summarize changes in around 50 characters or less

    More detailed explanatory text, if necessary. Wrap it to about 72
    characters or so. In some contexts, the first line is treated as the
    subject of the commit and the rest of the text as the body. The
    blank line separating the summary from the body is critical (unless
    you omit the body entirely); various tools like `log`, `shortlog`
    and `rebase` can get confused if you run the two together.

    Explain the problem that this commit is solving. Focus on why you
    are making this change as opposed to how (the code explains that).
    Are there side effects or other unintuitive consequences of this
    change? Here's the place to explain them.

    Further paragraphs come after blank lines.

     - Bullet points are okay, too

     - Typically a hyphen or asterisk is used for the bullet, preceded
       by a single space, with blank lines in between, but conventions
       vary here

    If you use an issue tracker, put references to them at the bottom,
    like this:

    Resolves: #123
    See also: #456, #789


## 목적

Git Commit Message Style Guide의 목적은 Commit Message를 통해서 추가/수정사항에 커밋 메시지만으로 파악이 가능하고, 빠르게 원하는 커밋 내용을 확인하고 파악하게 하는데 있다.

## 메시지 구조

-   커밋 메시지의 기본적인 구조는 `제목(Subject)`, `본문(Body)`, `꼬리말(Footer)` 3개의 구역으로 나누며, 각 구역은 한 칸의 빈 줄로 구분한다.

``` text
    type: [#issueNumber - ]Subject

    Body

    Footer
```

-   각 구역별 가이드 내용을 공유하기 전 원문의 가이드 내용이 적용된 예시를 먼저 보여주겠다. 이것을 보면 가이드의 내용을 보지 않더라도 어떤 형식을 취하는지 이해할 것이라 생각한다.

``` text
     feat: Summarize changes in around 50 characters or less

     More detailed explanatory text, if necessary. Wrap it to about 72
     characters or so. In some contexts, the first line is treated as the
     subject of the commit and the rest of the text as the body. The
     blank line separating the summary from the body is critical (unless
     you omit the body entirely); various tools like `log`, `shortlog`
     and `rebase` can get confused if you run the two together.

     Explain the problem that this commit is solving. Focus on why you
     are making this change as opposed to how (the code explains that).
     Are there side effects or other unintuitive consequenses of this
     change? Here's the place to explain them.

     Further paragraphs come after blank lines.

     - Bullet points are okay, too

     - Typically a hyphen or asterisk is used for the bullet, preceded
        by a single space, with blank lines in between, but conventions
        vary here

     If you use an issue tracker, put references to them at the bottom,
     like this:

     Resolves: #123
     See also: #456, #789
```

### 제목(Subject)

-   제목은 항시 입력해야 하며 반드시 타입과 함께 작성되어야 한다.
-   `type: [#issueNumber - ]Subject`형태로 작성한다.
    -   개인/팀의 스타일에 따라 `type`과 `Subject`의 위치 또는 표현
        방식(`:`대신 `[]`로 감싼 다던가)은 마음껏 변경해도 된다. 다만,
        반드시 제목은 작성해야 하며, 제목에는 `type`과 `Subject`가 함께
        작성되어야 한다.
    -   `[]`안의 내용은 옵션이며 Github등 이슈 트래킹이 가능한 도구를
        함께 쓴다면 `#1234`와 같이 이슈트래킹에서 제공하는 이슈 번호를
        제목 앞에 넣어 주면 된다. ex)
        `feat: #1234 - 회원 생성 서비스 추가`
    -   하나의 이슈에 대한 처리일 경우 이슈 번호를 다는 것도 좋지만 여러
        개의 이슈가 합쳐진 경우 제목에 이슈 번호를 달지 않는 게 더
        좋다.
-   타입은 영문 소문자로 작성한다.
-   제목은 최대 50자를 넘지 않도록 주의한다.
    -   요즘에는 모니터 해상도조 좋아지고 하드웨어 스펙들도 좋아져서
        50자를 넘겨 70자 정도까진 괜찮은거 같다.
-   제목은 해당 커밋에 대한 주요 내용을 간략하게 기록한다.
    -   원문에서는 명령조로 작성하라고 되어 있지만, 실제
        명령문이라기보다는 동사원형으로 쓰라는 설명입니다. 한국어를
        명령조로 쓰게 되면 말이 이상할 뿐만 아니라 커밋 메시지를 보는
        사람도 이상하게 느낄 겁니다. 우리나라 정서상 그런 것인 거죠.
        그래서 커밋 메시지는 50자를 넘지 않는 한도 내에서 작업한 내용을
        의미하도록 작성하면 되도록 규칙을 정했습니다.
    -   단, 구문 형태, 또는 과거 형태 중 하나를 선택하도록 했습니다.
        -   예를 들어, 구문이면, `회원 생성 서비스 추가` 이런 식으로
            작성할 것이고, 과거 형태면, `회원 생성 서비스를 추가함` 이런
            식으로 작성한다.
    -   커밋의 내용을 한방에 표현할 수 있는 제목이면 가장 좋다.
    -   또한 원문에서는 영어의 표현이기 때문에 첫 글자를 항시 대문자로
        작성하고 있다.
-   제목의 마지막에 마침표(.)을 찍지 않는다.

#### 타입(type)의 종류

아래 타입의 종류를 모두 사용할 필요는 없다, 프로젝트의 성격이나 상황에
맞춰서 적절하게 골라서 사용하면 되는데 `fix`, `docs`, `style`,
`refactor`, `test`, `chore`의 타입을 기본으로 하고, `feat`를 사용하거나
`new`, `improve`를 사용하는 것 중 하나를 선택하고, 릴리스에 대한 별도의
커밋을 남기고 싶은 경우 `release` 타입을 추가하면 된다.
전 회사의 경우 `feat`, `fix`, `docs`, `sytle`, `refactor`, `test`,
`chore`를 사용했었다.

-   `feat`: 새로운 기능을 추가하거나 기존의 기능을 요구 사항 변경으로
    변경한 경우
    기능 추가와 수정을 나누어서 쓰고 싶은 경우 아래 처럼 2개로 나누어서
    타입을 지정할 수 있다.
    -   `new`: 새로운 기능을 추가 한 경우
    -   `improve`: 기존 기능을 수정 한 경우, 요구 사항이 변경되어 수정된
        경우에도 `improve` 타입으로 한다.
-   `fix`: 기능상 버그 픽스를 했을 경우
-   `docs`: 문서(주석)의 추가/수정의 경우, 직접적인 코드의 변화 없이
    순수하게 문서(주석)만 추가/수정했을 경우
-   `style`: UI를 추가/변경 하거나 스타일 관련 작업을 했을 경우
-   `refactor`: 기능의 변화가 아닌 코드를 리팩토링했을 경우, 코드 리뷰
    등으로 로직(기능)의 변화 없이 단순 함수 내부에서만 사용하는 이름을
    변경하였거나, 코드 pretty 등을 적용했을 경우
-   `test`: 테스트 코드를 별도로 추가하거나, 변경했을 경우, 만약 기능을
    추가하면서 테스트 코드를 동시에 작성했으면 `feat` 타입으로 사용
-   `chore`: 기능/테스트 코드, 문서, 스타일, 리팩토링을 제외한, 배포,
    빌드 등과 같이 프로젝트의 기타 작업들에 대해 추가/수정했을 경우,
    lint 등의 적용으로 코드 스타일을 수정 했을 때도 chore 사용
-   `release`: 릴리스를 하기 위해 패키지 버전을 올리거나, 릴리스 버전
    커밋을 찍기 위한 경우

> git emoji를 사용할 경우 타입을 이모지로 대체하거나 타입 앞에 이모지를
> 붙여 사용한다.

### 본문(Body)

-   커밋에서 수정된 상세내역을 작성한다. 여기선 평서문으로 작성하면
    된다.
-   본문은 생략 가능하며, 제목(Subject) 라인과 반드시 한 줄을 띄운다.
-   되도록 한 줄에는 72자 이하로 작성하고 길어질 경우 개행해서 다음 줄에
    입력한다.
    -   제목과 마찬가지로 100자 정도까지는 괜찮은 거 같다.
-   수정 내역을 블릿 기호(`*`) 이용해서 하나씩 입력하는 방법도 좋다.
-   본문의 내용은 어떻게보다는 무엇을 왜에 맞춰 작성한다.
    -   본문에는 이 커밋이 무엇을 왜 고쳤는지 적혀 있는 것이 나중에
        히스토리 파악하거나, 코드의 변경 의미를 파악하기에 훨씬 도움이
        된다.
    -   어떻게 고쳐졌는지는 코드의 히스토리를 통해 충분히 파악할 수
        있으니 반드시 무엇을 왜 했는지에 대해 작성하도록 한다.

### 꼬리말(Footer)

-   꼬리말을 해당 커밋과 연관된 이슈 트래킹 번호를 입력한다.

-   제목에는 커밋이 온전히 한 개의 이슈에 해당하는 경우에만 추가해서
    사용하고 그 외의 경우 대부분 꼬리말에 이슈 번호를 라벨과 함께
    추가한다.

-   꼬리말은 생략 가능하며, 반드시 제목(Subject) 또는 본문(Body)
    라인과는 반드시 한 줄을 띄운다.

``` text
     Resolves: #1234
     See also: #1235, #1236
```

#### 라벨의 종류

-   `Resolves`: 문의나, 요청에 의한 이슈에 해당하는 경우 이슈 번호
-   `Closes`: 일반적인 개발과 관련된 이슈에 해당하는 경우 이슈 번호
-   `Fixes`: 버그 픽스, 핫 픽스 관련 이슈에 해당하는 경우 이슈 번호
-   `See also`: 커밋의 이슈와 연관되어 있는 이슈들이 존재 하는 경우, 또는 관련된 이슈들이 있는 경우 이슈 번호

## 마무리

마지막 꼬리말(Footer)의 라벨의 경우, `Resolves` 한 가지만 사용해도 된다,
Github의 경우 Commit Message 또는 Pull Request의 경우 메시지에 있는
키워드로 이슈를 닫을 수 있는데 그때 위 라벨의 `Resolves`, `Closes`,
`Fixes`로 닫을 수 있다.
그 외 추가로 필요하다면 꼬리말에 이슈 관련 번호를 입력해서 커밋을 통해
실제 해당 커밋의 배경이 어떠한지를 추적 가능하게 하게 하면 된다.
그리고, 제목 및 내용에서의 글자 제한을 두는 것을 `git log`통해 로그를
확인할 때 글자가 잘려 보이는 것들을 방지하기 위함도 있지만, 너무 길게
주저리주저리 쓰기보단 간결하게 쓰기를 원하는 것 같다.

위 가이드의 내용은 `Udacity Git Commit Message Style Guide` 기반으로
사용하면서 불편한점들을 다른 사용자들의 가이드를 참고해서 일부 수정한 것들이다.
개인/팀 단위의 작업을 하면서 위 가이드를 참고하여 새로운 자신만의 커밋 가이드를 만들어 보기 바란다.

### 참고한 사이트

-   [Udacity Git Commit Message Style
    Guide](https://udacity.github.io/git-styleguide/)
-   [좋은 git 커밋 메시지를 작성하기 위한 7가지
    약속](https://meetup.toast.com/posts/106)
-   [Emoji-Log: A new way to write Git commit
    messages](https://opensource.com/article/19/2/emoji-log-git-commit-messages)
