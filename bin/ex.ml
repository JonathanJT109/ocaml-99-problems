open Core

let test_list = [ "a"; "b"; "c"; "d" ]

(* let list_to_string list = String.concat ~sep:" " list *)

let rec last list =
  match list with
  | [] -> raise (Failure "")
  | [ last_item ] -> Some last_item
  | _ :: t -> last t
;;

let rec last_two list =
  match list with
  | [] | [ _ ] -> None
  | [ x; y ] -> Some (x, y)
  | _ :: t -> last_two t
;;

let rec nth list n =
  match n, list with
  | _, [] -> None
  | 0, h :: _ -> Some h
  | i, _ :: t -> nth t (i - 1)
;;

let rec length list =
  match list with
  | [] -> 0
  | _ :: t -> 1 + length t
;;

let () =
  let _ = last test_list in
  let _ = last_two test_list in
  let _ = nth test_list 3 in
  let _ = length test_list in
  ()
;;
