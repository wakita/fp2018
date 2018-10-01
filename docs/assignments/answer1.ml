let pi = 4.0 *. (atan 1.0);;

(* Q1 *)
let area_of_circle radius =
  pi *. radius *. radius;;

(* Q2 *)
let radius_of_circle area =
  sqrt(area /. pi);;

(* Q3 *)
let circle_areas radii =
  List.map area_of_circle radii;;

(* Q4 *)
type number = Int of int | Float of float | Error;;
type sign = Positive | Negative;;

let sign_int n =
  if n >= 0 then Positive
  else Negative;;

let div_num n1 n2 =
  match (n1, n2) with
      (_, Int 0) -> Error
    | (_, Float 0.0) -> Error
    | (Int i1, Int i2) ->
        if i1 mod i2 == 0 then Int (i1 / i2) else Float (float i1 /. float i2)
    | (Int i1, Float f2) -> Float (float i1 /. f2)
    | (Float f1, Int i2) -> Float (f1 /. float i2)
    | (Float f1, Float f2) -> Float (f1 /. f2)
    | (Error, _) -> Error
    | (_, Error) -> Error;;

(* Note: div_num (Int 4) (Int 2) should give (Int 2) rather than (Float 2.0) *)

(* Q5 *)

type mutable_point = { mutable x: float; mutable y: float };;

let rotate p theta =
  let x = p.x and y = p.y in
  let s = sin theta and c = cos theta in
  { x = c *. x -. s *. y; y = s *. x +. c *. y }
