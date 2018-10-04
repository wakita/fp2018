let pi = 4.0 *. (atan 1.0);;

(* Q1 *)
let volume_of_cube (a: float) =
  0.0;;

(* Q2 *)
let edgelen_of_cube (volume: float) =
  0.0;;

(* Q3 *)
let volumes_of_cubes (edgelens: float list): float list =
  [];;

(* Q4 *)
type number = Int of int | Float of float | Error;;
type sign = Positive | Negative;;

let sign_int (n: int): sign =
  if n >= 0 then Positive
  else Negative;;

let ack (n1: int) (n2: int): int =
  0;;

(* Note: div_num (Int 4) (Int 2) should give (Int 2) rather than (Float 2.0) *)

let wc (words: string list) (word: string): int =
  0;;
