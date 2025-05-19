---
layout: post
title: Get Started with GitHub Copilot in VS Code 2025
date: 2025-05-19
categories: [artificial intelligence]
tags: [artificial general intelligence]

---


# [Get Started with GitHub Copilot in VS Code (2025)](https://www.youtube.com/watch?v=vdBxfFVXnc0) 

## Abstract
Visual Studio Code(이하 VS Code)에서 GitHub Copilot을 효과적으로 활용하려면 기본적인 사용법과 단축키를 숙지하는 것이 중요합니다. 아래에 주요 기능과 단축키를 정리해 드리겠습니다.

## [GitHub Copilot for Python Development](https://www.youtube.com/watch?v=wNsiJWewyjU)

<iframe width="600" height="400" src="https://www.youtube.com/embed/wNsiJWewyjU?si=wtSK0dEpfXsX5U7L" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---

<iframe width="600" height="400" src="https://www.youtube.com/embed/vdBxfFVXnc0?si=hO2oWSxS_3tIO1X4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


---

## 🧰 GitHub Copilot 설치 및 설정

1. **VS Code 설치**: [Visual Studio Code 공식 웹사이트](https://code.visualstudio.com/)에서 VS Code를 설치합니다.

2. **Python 확장 프로그램 설치**: VS Code의 확장 프로그램 마켓플레이스에서 `Python`을 검색하여 설치합니다.

3. **GitHub Copilot 확장 프로그램 설치**:

   * `Ctrl + P`를 눌러 명령 팔레트를 열고,
   * `ext install GitHub.copilot`을 입력한 후 Enter를 눌러 설치합니다.([TECHCOMMUNITY.MICROSOFT.COM][1])

4. **GitHub 계정 로그인 및 Copilot 활성화**: 설치 후 GitHub 계정으로 로그인하여 Copilot을 활성화합니다.

---

## ✨ Python에서 Copilot 활용 방법

### 1. **코드 자동 완성**

Python 파일에서 코드를 작성하면 Copilot이 실시간으로 코드 제안을 제공합니다. 예를 들어:

```python
# 두 수의 최대공약수를 구하는 함수
def gcd(a, b):​:contentReference[oaicite:29]{index=29}
```

위와 같이 주석을 작성하면 Copilot이 해당 기능에 맞는 함수를 자동으로 제안합니다.

### 2. **자연어 주석을 통한 코드 생성**

주석을 활용하여 원하는 기능을 설명하면 Copilot이 이에 맞는 코드를 생성합니다. 예:

```python
# 리스트에서 중복을 제거하고 정렬하는 함수
def unique_sorted_list(lst):​:contentReference[oaicite:39]{index=39}
```

위 주석을 작성하면 Copilot이 중복 제거 및 정렬 기능을 수행하는 함수를 제안합니다.

### 3. **Copilot Chat 기능 활용**

Copilot Chat을 통해 자연어로 질문하거나 코드에 대한 설명을 요청할 수 있습니다. 예:

* "이 함수의 시간 복잡도는 어떻게 되나요?"
* "이 코드를 더 효율적으로 바꿔줘"

이러한 질문을 통해 Copilot이 코드 분석 및 개선을 도와줍니다.

---

## ⌨️ 주요 단축키 정리

| 기능        | Windows/Linux            | macOS                          |                                                                            |
| --------- | ------------------------ | ------------------------------ | -------------------------------------------------------------------------- |
| 제안 수락     | `Tab`                    | `Tab`                          |                                                                            |
| 제안 무시     | `Esc`                    | `Esc`                          |                                                                            |
| 다음 제안 보기  | `Alt + ]`                | `Option + ]`                   |                                                                            |
| 이전 제안 보기  | `Alt + [`                | `Option + [`                   |                                                                            |
| 제안 수동 호출  | `Alt + \`                | `Option + \`                   |                                                                            |
| 모든 제안 보기  | `Ctrl + Enter`           | `Control + Enter`              |                                                                            |
| Chat 뷰 열기 | `Ctrl + Alt + I`         | `Control + Command + I`        |                                                                            |
| 빠른 질문하기   | `Ctrl + Shift + Alt + L` | `Shift + Option + Command + L` |                                                                            |
| 인라인 채팅 시작 | `Ctrl + I`               | `Command + I`                  | ([GitHub Docs][2], [Real Python][3], [Reddit][4], [Visual Studio Code][5]) |

---

## 💡 활용 팁

* **함수 설명 요청**: 함수 위에 커서를 두고 "이 함수의 역할을 설명해줘"라고 입력하면 Copilot이 해당 함수의 기능을 설명합니다.

* **코드 리팩토링**: "이 코드를 더 효율적으로 바꿔줘"와 같은 요청을 통해 Copilot이 리팩토링을 제안합니다.

* **테스트 코드 생성**: "이 함수에 대한 테스트 코드를 작성해줘"와 같은 요청으로 테스트 코드를 자동 생성할 수 있습니다.

---

GitHub Copilot은 Python 개발 시 생산성을 높이는 강력한 도구입니다. 위의 기능들을 활용하여 효율적인 개발 환경을 구축하시길 바랍니다. 추가적인 도움이 필요하시면 언제든지 문의해주세요!

---

[1]: https://techcommunity.microsoft.com/t5/educator-developer-blog/get-started-with-github-copilot-with-vscode-and-python-extension/ba-p/3736564?utm_source=chatgpt.com "Get Started with GitHub Copilot with VSCode and Python Extension"
[2]: https://docs.github.com/en/copilot/using-github-copilot/getting-code-suggestions-in-your-ide-with-github-copilot?utm_source=chatgpt.com "Getting code suggestions in your IDE with GitHub Copilot"
[3]: https://realpython.com/github-copilot-python/?utm_source=chatgpt.com "GitHub Copilot: Fly With Python at the Speed of Thought"
[4]: https://www.reddit.com/r/vscode/comments/1ec4w48/why_is_copilot_in_vscode_so_bad/?utm_source=chatgpt.com "Why is copilot in vscode so bad? - Reddit"
[5]: https://code.visualstudio.com/docs/copilot/copilot-vscode-features?utm_source=chatgpt.com "GitHub Copilot in VS Code cheat sheet"


## 🔧 GitHub Copilot 설치 및 활성화

1. **확장 프로그램 설치**: VS Code의 확장 프로그램 마켓플레이스에서 `GitHub Copilot`을 검색하여 설치합니다.
2. **GitHub 계정 로그인**: 설치 후 GitHub 계정으로 로그인하여 Copilot을 활성화합니다.
3. **상태 확인**: VS Code 하단의 Copilot 아이콘이 활성화되어 있는지 확인합니다.

---

## ⌨️ 주요 단축키 정리

### ✨ 코드 자동 완성 및 제안

* **제안 수락**: `Tab`
* **제안 무시**: `Esc`
* **다음 제안 보기**: Windows/Linux: `Alt + ]`, macOS: `Option + ]`
* **이전 제안 보기**: Windows/Linux: `Alt + [`, macOS: `Option + [`
* **제안 수동 호출**: Windows/Linux: `Alt + \`, macOS: `Option + \`
* **모든 제안 보기**: Windows/Linux: `Ctrl + Enter`, macOS: `Control + Option + Enter`([TECHCOMMUNITY.MICROSOFT.COM][1], [Reddit][2])

### 💬 Copilot Chat 기능

* **Chat 뷰 열기**: Windows/Linux: `Ctrl + Alt + I`, macOS: `Control + Command + I`
* **빠른 질문하기 (Quick Chat)**: Windows/Linux: `Ctrl + Shift + Alt + L`, macOS: `Shift + Option + Command + L`
* **인라인 채팅 시작**: Windows/Linux: `Ctrl + I`, macOS: `Command + I`([Stack Overflow][3])

인라인 채팅은 코드 에디터 내에서 직접 Copilot과 상호작용할 수 있는 기능으로, 특정 코드 블록에 대한 설명이나 수정 요청 등을 자연어로 입력할 수 있습니다. ([Visual Studio Code][4])

---

## ⚙️ 단축키 커스터마이징

VS Code에서는 사용자의 편의에 맞게 단축키를 변경할 수 있습니다.

1. **단축키 설정 열기**: `Ctrl + K` → `Ctrl + S`를 눌러 단축키 설정 창을 엽니다.
2. **명령어 검색**: 상단의 검색창에 변경하고자 하는 명령어를 입력합니다. 예: `Trigger Inline Suggestion`
3. **단축키 변경**: 해당 명령어를 선택한 후 원하는 키 조합을 입력하여 단축키를 변경합니다.([Reddit][2])

---

## 💡 활용 팁

* **코드 설명 요청**: 인라인 채팅 또는 Chat 뷰를 통해 특정 코드의 기능이나 작동 방식에 대한 설명을 요청할 수 있습니다.
* **코드 리팩토링**: 자연어로 "이 코드를 더 효율적으로 바꿔줘"와 같은 요청을 통해 Copilot이 리팩토링을 제안합니다.
* **테스트 코드 생성**: "이 함수에 대한 테스트 코드를 작성해줘"와 같은 요청으로 테스트 코드를 자동 생성할 수 있습니다.

---

GitHub Copilot은 개발자의 생산성을 높이는 강력한 도구입니다. 위의 단축키와 기능들을 숙지하여 효율적인 개발 환경을 구축하시길 바랍니다. 추가적인 도움이 필요하시면 언제든지 문의해주세요!

[1]: https://techcommunity.microsoft.com/t5/educator-developer-blog/get-started-with-github-copilot-with-vscode-and-python-extension/ba-p/3736564?utm_source=chatgpt.com "Get Started with GitHub Copilot with VSCode and Python Extension"
[2]: https://www.reddit.com/r/webdev/comments/1gpni94/is_there_a_way_to_trigger_github_copilot/?utm_source=chatgpt.com "Is there a way to trigger GitHub Copilot suggestions by pressing a ..."
[3]: https://stackoverflow.com/questions/77896807/is-there-a-shortcut-to-focus-to-the-github-copilot-chat-panel-in-vscode?utm_source=chatgpt.com "Is there a shortcut to focus to the GitHub Copilot Chat panel in ..."
[4]: https://code.visualstudio.com/docs/copilot/chat/getting-started-chat?utm_source=chatgpt.com "Getting started with Copilot Chat in VS Code"
