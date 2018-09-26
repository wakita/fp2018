---
title: "Functional Programming"
date: "Fall, 2018"
---

# The outline of the course

## Guidance

- [Day 1: Overview](01-overview.html)

# OCaml Basics

## Introduction to OCaml

[Day 2](02-ocaml1.html)
:   - Primitive data types

    - Compound types (tuples, lists, variants)

    - Pattern matching

    - Functions as values

Day 3
:   - Recursive data types

    - Recursive functions

# Min-Caml Compiler

## Frontend

Lexer
: Conversion of a program text to a stream of tokens

Parser
: Conversion of a stream of tokens to an abstract syntax tree

KNF (k-Normal form)
: Abstract syntax tree

Typing
: Type analysis, type inference (unification)

## Backend (optimizers)

Beta reduction
: .

Alpha conversion
: Unique naming

Associativity
: Reduction of nexted `let`s

Inlining
: inline code expansion

Constant folding
: Compile-time computation of simple expressions

## Backend (code generation)

Closure conversion
: Elimination of cunctional closures

Virtual machine
: Generation of abstract machine code

Register assignment
: Assignment of phisical registers to abstract ones

Code generation and the runtime system
: Generation of executable code

