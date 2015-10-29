---
layout: post
title: Introduction to LLVM
date: 2015-11-03
categories: [computer science]
tags: [data management]

---

## Article Source
* Title: [LLVM](https://sites.google.com/site/compiler7987/llvm)

---


# Introduction to LLVM


<div id="sites-canvas-main" class="sites-canvas-main">
<div id="sites-canvas-main-content">
<table xmlns="http://www.w3.org/1999/xhtml" class="sites-layout-name-one-column sites-layout-hbox" cellspacing="0"><tbody><tr><td class="sites-layout-tile sites-tile-name-content-1">
<div dir="ltr">

## 1. 정의

<div>&nbsp;</div>
<div>&nbsp; LLVM(Low Level Virtual Machine, 저수준 가상 기계)은 컴파일, 링크, 런타임 등 각 시점에서 프로그램을 최적화하도록 설계된 모든 프로그래밍 언어에 대응 가능한 컴파일러의 기반이다.</div>
<div>&nbsp; LLVM으로 Java와 JVM처럼 언어에 가상 머신을 생성, 가상 기계가 특정 머신 기계를 생성하고, 언어와 플랫폼에 독립적인 최적화를 실행한다. LLVM은 언어와 구조에서 독립했으며, 언어 모듈과 시스템을 위한 코드 생성 부의 중앙에 위치한다. LLVM은 활발히 절차 동안 최적화와 함께 JIT을 정적 컴파일러로 사용, 개발의 각종 단계에서 사용할 수 있는 많은 부분을 가지고 있다. JIT 컴파일러의 경우 런타임에 불필요한 정적 분기를 최적화하는 기능이 있고, 이것은 프로그램이 각종 런타임 옵션이있는 경우 강력한 최적화 기법 (부분 등급)이다.</div>
<div><strong>&nbsp;&nbsp;&nbsp; 1.1 Type of information to compiler transformations<br></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a. Compile-time<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b. Link-time<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c. Run-time<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d. In-idle-time<br></div>
<div><strong>&nbsp;</strong></div>

## 2. 코드 표현

<div>&nbsp;</div>
<div>&nbsp;&nbsp;&nbsp;LLVM은 언어에서 독립적인 명령어 집합과 형식 시스템을 갖추고 있다. 명령의 대부분은 3-어드레스 코드 형식과 유사하다. 각 명령은 또한 정적 단일 대입 형식이며, 변수(로 입력된 레지스터)는 한 번 지정되면 그 다음은 변경되지 않는다. 따라서 변수간의 의존관계를 분석을 단순하게 할 수 있다. 변환은 어떤 형식이라도 명시적으로 형변환 명령을 통해 실행된다. LLVM의 기본 형식은 다수의 고정 길이의 정수이고, 파생 형식으로 포인터, 배열,&nbsp;벡터, 구조체, 함수의 5가지가 존재한다. 구체적인 언어에서의 형식은 LLVM에서 지원하는 형식들을 결합하여 표현한다. 예를 들면, C++의 클래스는 구조체와 함수와 함수에 대한 포인터의 배열을 함께 사용하여 표현된다.</div>

### 2.1 코드 표현 종류

<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a. in-memory compiler IR<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b. on-disk bitcode representation (suitable for fast loading by a Just-In-Time compiler)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c. human readable assembly language representation<br>&nbsp;</div>
<div>&nbsp;</div>

## 3. Three primary LLVM components
<div><strong>&nbsp;&nbsp;&nbsp;&nbsp;3.1 The LLVM Virtual Instruction Set<br></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The common language- and target-independent IR<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Internal (IR) and external (persistent) representation</div>
<div><strong>&nbsp;&nbsp;&nbsp;&nbsp;3.2&nbsp;A collection of well-integrated libraries<br></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Analyses, optimizations, code generators, JIT compiler, garbage collection support, profiling, …</div>
<div><strong>&nbsp;&nbsp;&nbsp;&nbsp;3.3 A&nbsp;collection of tools built from the libraries<br></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Assemblers, automatic debugger, linker, code generator, compiler driver, modular optimizer, …<br></div>
<div>&nbsp;</div>

## 4. Compiler Architecture
<div>&nbsp;</div>

### 4.1 Traditional Two-pass Compiler

<div>&nbsp;</div>
<div>
<p style="TEXT-ALIGN:center;DISPLAY:block"><a href="https://www.sites.google.com/site/compiler7987/llvm/1.png?attredirects=0" imageanchor="1" rel="nofollow"><img src="https://www.sites.google.com/site/compiler7987/llvm/1.png?height=75&amp;width=770" style="WIDTH:678px;HEIGHT:65px" height="75" border="0" width="770"></a></p></div>
<div>&nbsp;</div>

### 4.2 LLVM GCC 4
### a. Standard compiler organization: front-end, optimizer, codegen
</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Parser and front-ends work with language-specific “trees”<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Optimizers use trees in “GIMPLE” form, modern SSA techniques, etc.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RTL code generator use antiquated compiler algorithms/data structures</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>
<div style="TEXT-ALIGN:left;DISPLAY:block">
<p style="TEXT-ALIGN:center;DISPLAY:block"><a href="https://www.sites.google.com/site/compiler7987/llvm/4.png?attredirects=0" imageanchor="1" rel="nofollow"><img src="https://www.sites.google.com/site/compiler7987/llvm/4.png?height=92&amp;width=760" style="WIDTH:701px;HEIGHT:79px" height="92" border="0" width="760"></a></p></div>&nbsp;</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pros: Excellent front-ends, support for many processors, defacto standard<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cons: Very slow, memory hungry, hard to retarget, no JIT, no LTO, no aggressive optimizations, ...</div>
<div>&nbsp;</div>

### b. LLVM Optimizer

<div>&nbsp;</div>
<div>
<p style="TEXT-ALIGN:center;DISPLAY:block"><a href="https://www.sites.google.com/site/compiler7987/llvm/5.png?attredirects=0" imageanchor="1" rel="nofollow"><img src="https://www.sites.google.com/site/compiler7987/llvm/5.png?height=318&amp;width=784" style="WIDTH:741px;HEIGHT:298px" height="318" border="0" width="784"></a></p></div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Aggressive and fast optimizer built on modern techniques<br></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SSA-based optimizer for light-weight (fast) and aggressive xforms<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Aggressive loop optimizations: unrolling, unswitching, mem promotion, ...<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Many InterProcedural (cross function) optimizations: inlining, dead arg elimination, global variable optimization, IP </div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; constant prop, </div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EH optzn, ...</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>LLVM Code Generator<br></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Modern retargetable code generator, easier to retarget than GCC<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Write LLVM IR to disk for codegen after compile time:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;link-time, install-time, run-time</div>
<div>&nbsp;</div>