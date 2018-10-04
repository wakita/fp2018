type 'a tree = Empty | Node of 'a * 'a tree * 'a tree

let a_binary_search_tree1 = Node(4, Node(2, Node(1, Empty, Empty), Node(3, Empty, Empty)), Node(5, Empty, Empty))
let not_a_binary_search_tree1 = Node(1, Node(2, Empty, Empty), Empty)
let not_a_binary_search_tree2 = Node(4, Node(2, Node(1, Empty, Empty), Node(5, Empty, Empty)), Node(6, Empty, Empty))


(* Inefficient solution: the worst case comptation complexity is a square of the size of the tree.  Can you guess the worst case scenario? *)
let rec values t =
  match t with
    | Empty -> []
    | Node(x, left, right) -> values left @ [x] @ values right;;

assert(values(a_binary_search_tree1) = [1; 2; 3; 4; 5]);;

(* Efficient solution: linear to the size of the tree *)
let values t =
  let rec traverse t values =
    match t with
      | Empty -> values
      | Node(x, left, right) ->
          traverse right (x :: traverse left values)
    in
  List.rev (traverse t []);;

assert(values(a_binary_search_tree1) = [1; 2; 3; 4; 5]);;

let rec mirror t =
  match t with
    | Empty -> Empty
    | Node(x, left, right) -> Node(x, mirror right, mirror left);;

assert(values(a_binary_search_tree1) = List.rev(values(mirror(a_binary_search_tree1))));;
assert(values(not_a_binary_search_tree1) = List.rev(values(mirror(not_a_binary_search_tree1))));;

let is_binary_search_tree t =
  let rec aux test t =
    match t with
      | Empty -> true
      | Node(y, left, right) ->
          test y &&
          aux (function x -> test x && x < y) left &&
          aux (function x -> test x && x > y) right in
  aux (function _ -> true) t;;
    
assert(is_binary_search_tree a_binary_search_tree1);;
assert(not (is_binary_search_tree not_a_binary_search_tree1));;
assert(not (is_binary_search_tree not_a_binary_search_tree2));;

let rec is_binary_search_tree t =
  let rec aux x values =
    match values with
      | [] -> true
      | y :: values' -> x < y && aux y values' in
  aux min_int (values t);;

assert(is_binary_search_tree a_binary_search_tree1);;
assert(not (is_binary_search_tree not_a_binary_search_tree1));;
assert(not (is_binary_search_tree not_a_binary_search_tree2));;

let rec is_binary_search_tree t =
  let rec aux (l, r) t =
    match t with
    | Empty -> true
    | Node(v, left, right) ->
        l < v && v < r && aux (l, v) left && aux(v, r) right in
  aux (min_int, max_int) t;;

assert(is_binary_search_tree a_binary_search_tree1);;
assert(not (is_binary_search_tree not_a_binary_search_tree1));;
assert(not (is_binary_search_tree not_a_binary_search_tree2));;
