type print_item =
  | Int of int
  | Bool of bool
  | String of string
  | StringList of string list
  | IntList of int list
  | StringNDList of string list list

let ndlist_to_str list =
  let list_string = List.map (fun a -> String.concat " " a) list in
  let formatted = List.map (fun a -> "[" ^ a ^ "]") list_string in
  let final = String.concat ", " formatted in
  final
;;

let print = function
  | Int i -> Printf.printf "%d\n\n" i
  | Bool b -> if b then print_endline "True\n" else print_endline "False\n"
  | String s -> Printf.printf "%s\n\n" s
  | StringList l -> Printf.printf "[%s]\n\n" (String.concat "; " l)
  | IntList l -> Printf.printf "[%s]\n\n" (String.concat "; " (List.map string_of_int l))
  | StringNDList l -> Printf.printf "[%s]\n\n" (ndlist_to_str l)
;;

let print_answer answer n =
  Printf.printf "Answer %d: \n" n;
  print answer
;;
