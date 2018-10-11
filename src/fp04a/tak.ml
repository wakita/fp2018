(* Takeuchi's Tarai function
 * https://en.wikipedia.org/wiki/Tak_(function) *)

let rec t x y z =
  if x <= y then y
  else t (t(x - 1) y z) (t (y - 1) z x) (t (z - 1) x y)

let _ =
  print_endline "The benchmark may take surprisingly long time.  Be patient";
  let x, y, z = (15, 8, 0) in
  Printf.printf "Takeuchi(%d, %d, %d) = %t" x y z flush;
  Printf.printf "%d\n" (t x y z)
