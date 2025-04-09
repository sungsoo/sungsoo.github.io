---
layout: post
title: Test-Driven Development in a nutshell
date: 2014-02-17 
categories: [computer science]
tags: [liberal arts]

---

테스트 주도 개발(*Test-Driven Development*, TDD)은 매우 짧은 개발 사이클을 반복하는 소프트웨어 개발 프로세스 중 하나이다. 우선 개발자는 바라는 향상 또는 새로운 함수를 정의하는 (초기적 결함을 점검하는) 자동화된 테스트 케이스를 작성한다. 그런 후에, 그 케이스를 통과하기 위한 최소한의 양의 코드를 생성한다. 그리고 마지막으로 그 새 코드를 표준에 맞도록 리팩토링한다. 이 기법을 개발했거나 '재발견' 한 것으로 인정되는 Kent Beck은 2003년에 TDD가 단순한 설계를 장려하고 자신감을 불어넣어준다고 말했다.

TDD in a nutshell
---

1. Write a test
2. Watch the test fail
3. Write application logic - as simple as possible
4. Pass the test
5. Refactor, removing duplication
6. Pass the test again



![](http://sungsoo.github.com/images/tdd01.png)



Test-Driven Development Cycle
---
A graphical representation of the development cycle, using a basic flowchart
The following sequence is based on the book [*Test-Driven Development by Example*](http://en.wikipedia.org/wiki/Test-Driven_Development_by_Example).

![](http://sungsoo.github.com/images/tdd-cycle.png)

Add a test
---
In test-driven development, each new feature begins with writing a test. This test must inevitably fail because it is written before the feature has been implemented. (If it does not fail, then either the proposed "new" feature already exists or the test is defective.) To write a test, the developer must clearly understand the feature's specification and requirements. The developer can accomplish this through use cases and user stories to cover the requirements and exception conditions, and can write the test in whatever testing framework is appropriate to the software environment. This could also be a modification of an existing test. This is a differentiating feature of test-driven development versus writing unit tests after the code is written: it makes the developer focus on the requirements before writing the code, a subtle but important difference.

Run all tests and see if the new one fails
---
This validates that the test harness is working correctly and that the new test does not mistakenly pass without requiring any new code. This step also tests the test itself, in the negative: it rules out the possibility that the new test always passes, and therefore is worthless. The new test should also fail for the expected reason. This increases confidence (though does not guarantee) that it is testing the right thing, and passes only in intended cases.

Write some code
---
The next step is to write some code that causes the test to pass. The new code written at this stage is not perfect, and may, for example, pass the test in an inelegant way. That is acceptable because later steps improve and hone it.
At this point, the only purpose of the written code is to pass the test; no further (and therefore untested) functionality should be predicted and 'allowed for' at any stage.

Run tests
---
If all test cases now pass, the programmer can be confident that the code meets all the tested requirements. This is a good point from which to begin the final step of the cycle.

Refactor code
---
Now the code should be cleaned up as necessary. Move code from where it was convenient for passing the test to where it logically belongs. Remove any duplication you can find. Make sure that variable and method names represent their current use. Clarify any constructs that might be misinterpreted. Use Kent Beck's four rules of simple design to guide you, as well as anything else you know about writing clean code. By re-running the test cases, the developer can be confident that code refactoring is not damaging any existing functionality.
The concept of removing duplication is an important aspect of any software design. In this case, however, it also applies to removing any duplication between the test code and the production code—for example magic numbers or strings repeated in both to make the test pass in step 3.

Repeat
---
Starting with another new test, the cycle is then repeated to push forward the functionality. The size of the steps should always be small, with as few as 1 to 10 edits between each test run. If new code does not rapidly satisfy a new test, or other tests fail unexpectedly, the programmer should undo or revert in preference to excessive debugging. Continuous integration helps by providing revertible checkpoints. When using external libraries it is important not to make increments that are so small as to be effectively merely testing the library itself, unless there is some reason to believe that the library is buggy or is not sufficiently feature-complete to serve all the needs of the main program being written.

Using Assertions in Code
---
![](http://sungsoo.github.com/images/tdd02.png)

Creating a Basic Test
---
![](http://sungsoo.github.com/images/tdd03.png)

References
---
[1] Beck, K. *Test-Driven Development by Example*, Addison Wesley - Vaseem, 2003.

