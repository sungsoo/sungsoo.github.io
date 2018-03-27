---
layout: post
title: Cellular Automata
date: 2018-03-27
categories: [computer science]
tags: [machine learning]

---

Cellular Automata
========

A *cellular automaton* is a model of a world with very simple physics. "*Cellular*" means that the space is divided into *discrete chunks*, called *cells*. An "*automaton*" is a machine that performs computations—it could be a real machine, but more often the "*machine*" is a mathematical abstraction or a computer simulation.

Automata are governed by rules that determine how the system evolves in time. Time is divided into *discrete steps*, and the rules specify how to compute the state of the world during the next time step based on the current state.

As a trivial example, consider a *cellular automaton* (CA) with a single cell. The state of the cell is an integer represented with the variable \$x_i\$, where the subscript i indicates that xi is the state of the system during time step i. As an initial condition, \$x_0 = 0\$.

Now all we need is a rule. Arbitrarily, I’ll pick \$x_i = x_i−1 + 1\$, which says that after each time step, the state of the CA gets incremented by 1. So far, we have a simple CA that performs a simple calculation: it counts.

But this CA is atypical; normally the number of possible states is finite. To bring it into line, I’ll choose the smallest interesting number of states, 2, and another simple rule, \$x_i = (x_i−1 + 1)%2\$, where % is the remainder (or modulus) operator.

This CA performs a simple calculation: it blinks. That is, the state of the cell switches between 0 and 1 after every time step.

Most CAs are *deterministic*, which means that rules do not have any random elements; given the same initial state, they always produce the same result. There are also *nondeterministic* CAs, but I will not address them here.
