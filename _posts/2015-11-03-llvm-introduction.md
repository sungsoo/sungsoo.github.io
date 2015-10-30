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

## 1. 정의

* LLVM(*Low Level Virtual Machine*, 저수준 가상 기계)은 컴파일, 링크, 런타임 등 각 시점에서 프로그램을 최적화하도록 설계된 모든 프로그래밍 언어에 대응 가능한 컴파일러의 기반이다.
* LLVM으로 Java와 JVM처럼 언어에 가상 머신을 생성, 가상 기계가 특정 머신 기계를 생성하고, 언어와 플랫폼에 독립적인 최적화를 실행한다.
* LLVM은 언어와 구조에서 독립했으며, 언어 모듈과 시스템을 위한 코드 생성 부의 중앙에 위치한다.
* LLVM은 활발히 절차 동안 최적화와 함께 JIT을 정적 컴파일러로 사용, 개발의 각종 단계에서 사용할 수 있는 많은 부분을 가지고 있다. JIT 컴파일러의 경우 런타임에 불필요한 정적 분기를 최적화하는 기능이 있고, 이것은 프로그램이 각종 런타임 옵션이있는 경우 강력한 최적화 기법 (부분 등급)이다.


###  1.1 Type of information to compiler transformations 
 
 a. Compile-time 
 
 b. Link-time 
 
 c. Run-time 
 
 d. In-idle-time


## 2. 코드 표현


LLVM은 언어에서 독립적인 명령어 집합과 형식 시스템을 갖추고 있다. 명령의 대부분은 3-어드레스 코드 형식과 유사하다. 각 명령은 또한 정적 단일 대입 형식이며, 변수(로 입력된 레지스터)는 한 번 지정되면 그 다음은 변경되지 않는다. 따라서 변수간의 의존관계를 분석을 단순하게 할 수 있다. 변환은 어떤 형식이라도 명시적으로 형변환 명령을 통해 실행된다. LLVM의 기본 형식은 다수의 고정 길이의 정수이고, 파생 형식으로 포인터, 배열,벡터, 구조체, 함수의 5가지가 존재한다. 구체적인 언어에서의 형식은 LLVM에서 지원하는 형식들을 결합하여 표현한다. 예를 들면, C++의 클래스는 구조체와 함수와 함수에 대한 포인터의 배열을 함께 사용하여 표현된다.

### 2.1 코드 표현 종류

 a. in-memory compiler IR 
 
 b. on-disk bitcode representation (suitable for fast loading by a Just-In-Time compiler) 
 
 c. human readable assembly language representation


## 3. Three primary LLVM components

3.1 The LLVM Virtual Instruction Set The common language- and target-independent IR Internal (IR) and external (persistent) representation

3.2 A collection of well-integrated libraries Analyses, optimizations, code generators, JIT compiler, garbage collection support, profiling, 

3.3 Acollection of tools built from the libraries Assemblers, automatic debugger, linker, code generator, compiler driver, modular optimizer, 


## 4. Compiler Architecture


### 4.1 Traditional Two-pass Compiler



<p style="TEXT-ALIGN:center;DISPLAY:block"><a href="https://www.sites.google.com/site/compiler7987/llvm/1.png?attredirects=0" imageanchor="1" rel="nofollow"><img src="https://www.sites.google.com/site/compiler7987/llvm/1.png?height=75&amp;"  height="75" border="0" width="770"></a></p>

### 4.2 LLVM GCC 4
### a. Standard compiler organization: front-end, optimizer, codegen
 Parser and front-ends work with language-specific “trees” Optimizers use trees in “GIMPLE” form, modern SSA techniques, etc. RTL code generator use antiquated compiler algorithms/data structures


<div style="TEXT-ALIGN:left;DISPLAY:block">
<p style="TEXT-ALIGN:center;DISPLAY:block"><a href="https://www.sites.google.com/site/compiler7987/llvm/4.png?attredirects=0" imageanchor="1" rel="nofollow"><img src="https://www.sites.google.com/site/compiler7987/llvm/4.png?height=92&amp;width=760"  height="92" border="0" width="760"></a></p>
Pros: Excellent front-ends, support for many processors, defacto standard Cons: Very slow, memory hungry, hard to retarget, no JIT, no LTO, no aggressive optimizations, ...


### b. LLVM Optimizer

<p style="TEXT-ALIGN:center;DISPLAY:block"><a href="https://www.sites.google.com/site/compiler7987/llvm/5.png?attredirects=0" imageanchor="1" rel="nofollow"><img src="https://www.sites.google.com/site/compiler7987/llvm/5.png?height=318&amp;width=784"  height="318" border="0" width="784"></a></p>
 Aggressive and fast optimizer built on modern techniques SSA-based optimizer for light-weight (fast) and aggressive xforms Aggressive loop optimizations: unrolling, unswitching, mem promotion, ... Many InterProcedural (cross function) optimizations: inlining, dead arg elimination, global variable optimization, IP 
 constant prop, 
 EH optzn, ...
 LLVM Code Generator Modern retargetable code generator, easier to retarget than GCC Write LLVM IR to disk for codegen after compile time: link-time, install-time, run-time
