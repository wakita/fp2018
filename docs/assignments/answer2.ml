#load "type.cmo"
#load "id.cmo"
#load "m.cmo"
#load "s.cmo"
#load "parser.cmo"
#load "lexer.cmo"
#load "typing.cmo"

let parse s =
  Id.counter := 0;
  Parser.exp Lexer.token (Lexing.from_string s);;

(* The following is a totally wrong unparser implementation. Please ignore the definition and build an unparser from scratch. *)

let rec unparse (ast : Syntax.t) =
  match ast with
  | Syntax.Unit -> "()"
  | Syntax.Int n -> string_of_int n
  | Syntax.Not e -> "(not " ^ unparse e ^ ")"
  | Syntax.Eq(e1, e2) -> "(" ^ unparse e1 ^ " = " ^ unparse e2 ^ ")"
  | Syntax.Var v -> v
  | Syntax.App(f, args) ->
      "(" ^ (unparse f) ^ " " ^ String.concat " " (List.map unparse args) ^ ")"
  | _ -> "fix_me"

let small_test_programs = [
  "()"; "print(true)"; "print(5)"; "print(3.14)";
  "print(not (4 = 5))"; "print(1 + 2 - 3)";
  "print(-1.0 +. 2.0 -. 3.0 *. 4.0 /. 5.0)";
  "print(3 < 4)"; "print(5 < 6)";
  "print(let x = 1 in let y = x in x + y)";
  "print(let x = let y = 1 in let z = 2 in y + z in x)";
  "print(let x = let rec f x = x + 1 in f 1 in x)";
  "print(let x = (1, 2) in let (a, b) = x in a + b)";
  "print(let x = 1 in let y = 2 in if y - 1 = x then x + y else y)";
  "print(let rec f n = if n <= 1 then 1 else f(n - 2) + f(n - 1) in f 5)";
  "print(let rec f n = if n = 0 then 1 else n + f (n - 1) in f(10))";
  "print(let a = 1 in let rec incr x = x + a in incr 5)";
  "let rec f x = let x1 = x + 1 in let x2 = x + 2 in let x3 = x + 3 in let x4 = x + 4 in let x5 = x + 5 in x1 + x2 + x3 + x4 + x5 in print(f 1)";
  "print(let (a, b) = (1, 2) in a + b)";
  "print(let a = Array.make 5 1.0 in a.(0) <- a.(1))" ];;

let test_count = ref 1

let test label s =
  if label = "" then Printf.printf "Test case (%d): %s\n" (!test_count) s
  else Printf.printf "Test case (%d): [%s]\n" (!test_count) label;
  incr test_count;
  flush stdout;

  ignore (Typing.f (parse s));  (* Assert that the program is well typed *)
  let ast = parse s in            (* Parsing done again to refresh type annotations *)

  let s = try unparse ast with e ->
    print_endline "Failure during unparsing";
    raise e in

  let pus = try parse s with e ->
    print_endline "Failure during parsing the output of your unparser";
    print_endline s;
    raise e in

  if pus = ast then print_endline "Beautiful!"
  else begin
    print_endline "Unsuccessful: Your unparser gave:";
    print_endline s;
  end;
  print_newline();;

(* Small tests *)
List.iter (test "") small_test_programs;;

(* Large tests *)
List.iter (fun path ->
  let fin = open_in path in
  let lines = ref [] in
  let program =
    try while true do lines := (input_line fin) :: (!lines) done; ""
    with End_of_file -> String.concat "\n" (List.rev (!lines)) in
  test path program)
  [ "shootout/ack.ml";
    "shootout/fib.ml";
    "shootout/harmonic.ml";
    "shootout/mandelbrot.ml";
    "shootout/tak.ml" ];;

(* Todo
 * - type check the tests
 * - exception handling
 *)
