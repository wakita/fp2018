---
title: "Functional Programming: Day 1"
date: "Sep. 27, 2018"
---

## Today's course material

![http://bit.ly/fp2018-day1](/fp2018/images/01-overview.png "QR code")

- Bookmark:

    [https://wakita.github.io/fp2018/](https://wakita.github.io/fp2018/)

## Guidance (9/25)

- [Course Description](http://www.ocw.titech.ac.jp/index.php?module=General&action=T0300&JWC=201804054&lang=EN)

- Introduction to OCaml

- The organization of the [MinCaml](http://esumii.github.io/min-caml/index-e.html) compiler

Note
: - This is a side note.

    - Another side note

# Assignments<br/>↓

## 1. Read the following pages and get ready to OCaml

- [What is OCaml?](http://ocaml.org/learn/description.html)

- [OCaml: The Basics](http://ocaml.org/learn/tutorials/basics.html)

    Learn the basic syntax (comments, function calls, function definition), basic types, type casting, and functional types.

## 2. Install OCaml on your laptop

- Linux: use the package manager of your Linux distribution

- Mac: `brew install ocaml`

- Windows: a binary distribution is available from [the official site](http://protz.github.io/ocaml-installer/)

## 3. Try out some

- Start OCaml interpreter: open terminal on Linux /Mac or start `cmd.exe` on Windows

- Run `ocaml`.  If your installation is fine OCaml welcomes you with its version number and a prompt `# `:

    ```
            OCaml version 4.05.0

    # 
    ```

- Try out some examples from [OCaml: The Basics](http://ocaml.org/learn/tutorials/basics.html)

    ```ocaml
    let repeated s n =
      for i = 1 to n do
        print_endline(s)
      done;;

    repeated "hello" 3;;
    ```

## That's it

- Please bring your laptop for the next class

- Recommended reading:

    - [Chapter 1: The core language](https://caml.inria.fr/pub/docs/manual-ocaml/coreexamples.html) from OCaml manual
