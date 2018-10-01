let pi = 4.0 *. (atan 1.0);;

(* Q1 *)
let volume_of_cube a =
  0.0;;

(* Q2 *)
let edgelen_of_cube volume =
  0.0;;

(* Q3 *)
let volumes_of_cubes edgelens =
  [];;

(* Q4 *)
type number = Int of int | Float of float | Error;;
type sign = Positive | Negative;;

let sign_int n =
  if n >= 0 then Positive
  else Negative;;

let div_num n1 n2 =
  Error;;

(* Note: div_num (Int 4) (Int 2) should give (Int 2) rather than (Float 2.0) *)

let wc words word =
  0;;
