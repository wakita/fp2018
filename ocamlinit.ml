(* Save this file as ".ocamlinit" under the directory, where you have min-caml.top *)

open Alpha;; open Asm;; open Assoc;; open Beta;; open Closure;; open ConstFold;;
open Elim;; open Emit;; open Id;; open Inline;; open KNormal;; open Lexer;; open M;;
open Main;; open Parser;; open RegAlloc;; open S;; open Simm;; open Syntax;;
open Type;; open Typing;; open Virtual;;

let compose f g x = (* Function composition *)
  f (g x)

let fib_p = "let rec fib n = if n < 2 then 1 else fib (n - 1) + fib (n - 1) in print(fib 5)"

let knf_p = "print(1 + 2 + 3)"
let if_p  = "print(if 1 > 0 then 1 else 0)"

let alpha_p = "print(let x = 1 in let x = 2 in x)"

let lex     = Lexing.from_string
let ast     = compose (Parser.exp Lexer.token) Lexing.from_string
let typing  = compose Typing.f ast
let knf     = compose KNormal.f typing
let alpha   = compose Alpha.f knf

let beta_p = "print(let x = 1 in let y = x in x + y)"
let assoc_let_p = "print(let x = let y = 1 in let z = 2 in y + z in x)"
let assoc_letrec_p = "print(let x = let rec f x = x + 1 in f 1 in x)"
let assoc_tuple_p = "print(let x = (1, 2) in let (a, b) = x in a + b)"
let constfold_p = "print(let x = 1 in let y = 2 in if y - 1 = x then x + y else y)"
let inline_p = "print(let rec f n = if n <= 1 then 1 else f(n - 2) + f(n - 1) in f 5)"
let inline_p2 = "print(let rec f n = if n = 0 then 1 else n + f (n - 1) in f(10))"

let beta      = compose Beta.f alpha
let assoc     = compose Assoc.f alpha
let inline    = compose Inline.f alpha
let constfold = compose ConstFold.f alpha
let elim      = compose Elim.f alpha

let clconv_p = "print(let a = 1 in let rec incr x = x + a in incr 5)"
let clconv    = compose Closure.f alpha

let assignment = "let x = 1 in let rec f y z = x + y + z in print_int(f 2 3)"

(* let fp6 = "let rec f x1 x2 x3 x4 x5 x6 = x1 + x2 + x3 + x4 + x5 + x6 in print_int(f 1 2 3 4 5 6)" *)

(* let fp4 = "let rec f x = let x1 = x + 1 in let x2 = x + 2 in let x3 = x + 3 in let x4 = x + 4 in x1 + x2 + x3 + x4 in print_int(f 1 2 3 4)"
let fp5 = "let rec f x = let x1 = x + 1 in let x2 = x + 2 in let x3 = x + 3 in let x4 = x + 4 in let x5 = x + 5 in x1 + x2 + x3 + x4 + x5 in print_int(f 1 2 3 4 5)" *)

let vm = compose Virtual.f clconv
let reg = compose RegAlloc.f vm
