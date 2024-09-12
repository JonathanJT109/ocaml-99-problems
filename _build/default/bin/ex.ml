open Core

let test_list = [ "a"; "b"; "c"; "d" ]

(* let print_results results = *)
(*   match results with *)
(*   | Some x -> "ehllo" *)
(*   | _ -> print_endline "Did not work" () *)
(* ;; *)

let list_to_string list = String.concat ~sep:" " list

let rec last list =
  match list with
  | [] -> None
  | [ last_item ] -> Some last_item
  | _ :: t -> last t
;;

(* let rec last_two list = *)
(*   match list with *)
(*   | [] | [ _ ] -> None *)
(*   | [ x; y ] -> Some (x, y) *)
(*   | _ :: t -> last_two t *)
(* ;; *)

let _ = print_endline (Option.value (last test_list) ~default:"Something wrong") in
print_endline (list_to_string test_list)

(* let _ = *)
(*   print_endline (list_to_string (Option.value (last_two test_list) ~default:[ "Error" ])) *)
(* ;; *)
