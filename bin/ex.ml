type 'a node =
  | One of 'a
  | Many of 'a node list

let test_list1 = [ "a"; "b"; "c"; "d" ]
let test_list2 = [ 1; 1; 1; 1 ]
let test_list3 = [ One "a"; Many [ One "b"; Many [ One "c"; One "d" ]; One "e" ] ]
let test_list4 = [ "a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e" ]

(* 1. Tail of a list *)
let rec last list =
  match list with
  | [] -> raise (Failure "")
  | [ last_item ] -> Some last_item
  | _ :: t -> last t
;;

(* 2. Last Two Elements of a List *)
let rec last_two list =
  match list with
  | [] | [ _ ] -> None
  | [ x; y ] -> Some [ x; y ]
  | _ :: t -> last_two t
;;

(* 3. N'th Element of a List *)
let rec nth list n =
  match n, list with
  | _, [] -> None
  | 0, h :: _ -> Some h
  | i, _ :: t -> nth t (i - 1)
;;

(* 4. Length of a List *)
let rec length list =
  match list with
  | [] -> 0
  | _ :: t -> 1 + length t
;;

(* 5. Reverse a List *)
let rec rev list =
  match list with
  | [] -> []
  | h :: t -> rev t @ [ h ]
;;

(* 6. Palindrome *)
let is_palindrome list = list = rev list

(* 7. Flatten a List *)
let rec flatten list =
  match list with
  | [] -> []
  | One h :: t -> [ h ] @ flatten t
  | Many h :: t -> flatten h @ flatten t
;;

(* 8. Eliminate Duplicates *)
let duplicates = Hashtbl.create 100

let rec compress list =
  match list with
  | [] -> []
  | h :: t ->
    if Hashtbl.mem duplicates h
    then [] @ compress t
    else (
      let _ = Hashtbl.add duplicates h [] in
      [ h ] @ compress t)
;;

(* 9. Pack Consecutive Duplicates *)
let pack list =
  let rec aux final prev = function
    | h :: (l :: _ as t) ->
      if h = l then aux final ([ h ] @ prev) t else aux (final @ [ h :: prev ]) [] t
    | [ x ] -> final @ [ prev @ [ x ] ]
    | [] -> final
  in
  aux [] [] list
;;

(* 10. Run - Length Encoding *)
let encode list =
  let rec aux (prev : (int * string) list) n = function
    | h :: (l :: _ as t) -> if h = l then aux prev (n + 1) t else aux ((n, h) :: prev) 1 t
    | [ x ] -> (n, x) :: prev
    | [] -> prev
  in
  List.rev (aux [] 1 list)
;;

(* TODO: Print question 10 *)
let () =
  Practice.print_answer (String (Option.value ~default:"Not fuond" (last test_list1))) 1;
  Practice.print_answer (StringList (Option.value ~default:[] (last_two test_list1))) 2;
  Practice.print_answer (String (Option.value ~default:"Not fuond" (nth test_list1 3))) 3;
  Practice.print_answer (Int (length test_list1)) 4;
  Practice.print_answer (StringList (rev test_list1)) 5;
  Practice.print_answer (Bool (is_palindrome test_list2)) 6;
  Practice.print_answer (StringList (flatten test_list3)) 7;
  Practice.print_answer (StringList (compress test_list4)) 8;
  Practice.print_answer (StringNDList (pack test_list4)) 9;
  ()
;;
