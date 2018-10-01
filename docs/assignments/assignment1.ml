---
author: "Ken Wakita"
title: "FP: Assignment 1 (Sept. 28)"
---

# Assignment

Published date
: Oct. 1, 2018

Due date
: Oct. 10, 2018

Method of Submission
: [OCW-i](https://secure.ocw.titech.ac.jp/ocwi/)

    Upload `answer1.ml` at the respective page of OCW-i.

    You need to register for this class to open the OCW-i assignment page.

Delayed Submission
: Each submission is weighed according to half-value period of 10 days.  That means if you submit a perfect answer 30 days after the due date, you will receive $1/8$ the full points.  In other words, you lose $1 - 1/2^{1/10} \approx 6.7\text {%}$ points each day after the due date has passed.  It is very wise to keep the due date.^[この半減期はトイチ金融よりも遥かに非情なので気をつけて下さい．/ This half-value period is much worse than the interest rate of the meanest loan office; time is money.]

# READ the MANUAL FIRST

Read [the OCaml Manual Chapter1](https://caml.inria.fr/pub/docs/manual-ocaml/coreexamples.html) first.  When you are finished, try to answer the following questions.

# Your Mission

Download [answer1.ml](/fp2018/assignments/answer1.ml).  This is a template file for your answers.  You may find half-solved answers to the five problems described below.  OCaml interpreter happily accept this file: (Feed this file to OCaml interpreter with `ocaml answer1.ml` from the command line and OCaml accepts it without any complaint.)  However, `answer1.ml` contains inappropriate definitions at several places.  For example `area_of_circle` and `radius_of_circle` always answers zeros which are clearly wrong answers in almost all cases.

Your mission is to correctly modify `answer1.ml`.


## Problem 1. `circle_area`

Define a function named `circle_area` that takes a circle's radius and gives its area.

## Problem 2. `radius_of_circle`

Define a function named `radius_of_circle` that takes an area of a circle and gives its radius.

Hint
: - Basic math functions are documented in [Pervasives module](https://caml.inria.fr/pub/docs/manual-ocaml/libref/Pervasives.html).

## Problem 3. `circle_areas`

Define a function named `circle_areas` that takes a list of circles' radii and gives their areas.

Hints
: - You may reuse the definition of `circle_area`.

    - `circle_areas [1.0; 3.0; 5.0]` should give `[3.14159265358979312; 28.274333882308138; 78.5398163397448315]`.

    - You may want to use functions from the [`List` module](https://caml.inria.fr/pub/docs/manual-ocaml/libref/List.html).  You can equally easily solve this problem without using the List module.

## Problem 4. `mul_num`

Define `div_num` that emulates faction over numbers: $n_1 / n_2$.

Hints
: - Look at the definition of `add_num` defined in [Section 1.4](https://caml.inria.fr/pub/docs/manual-ocaml/coreexamples.html#sec11)

## Problem 5. `rotate`

Define a function named `rotate` that takes a point coordinate ($p$`: mutable_point`) and an angle in radian ($\theta$`: float`) and performs rotation on $p$ by $\theta$ around the origin.

Hints
: - [Rotation matrix](https://en.wikipedia.org/wiki/Rotation_matrix)
    - [Section 1.5: Imperative features](https://caml.inria.fr/pub/docs/manual-ocaml/coreexamples.html#sec12)
