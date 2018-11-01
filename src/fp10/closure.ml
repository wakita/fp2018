(* FP-style function application *)

let a = 3 in
let b = 4 in
let rec f x y = a * x + b * y in
Printf.printf "FP-style: %d\n" (f 5 6);;

(* Emultation of the C-style calling convention using the closure technique *)

(* Application of a function closure that takes
 *  - two arguments explicitly passed as function parameters (arg1, arg2) and
 *  - two arguments that correspond to free variables.  They are saved in the closure structure at the function calling site
 **)
let apply_2args_2freevars closure arg1 arg2 =
  let a_function_implementation, (fv1, fv2) = closure in
  a_function_implementation arg1 arg2 fv1 fv2 in

let rec f_implementation x y a b =
  a * x + b * y in

let a = 3 in
let b = 4 in
let closure = (f_implementation, (a, b)) in
Printf.printf "Closure-call: %d\n" (apply_2args_2freevars closure 5 6)
