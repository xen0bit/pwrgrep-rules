(* list-find-outside-try: List.find raises Not_found on missing elements.
 * Wrap it in try/with or use List.find_opt instead.
 *)

let vuln l1 l2 l3 =
  (* ruleid: list-find-outside-try *)
  let _ = List.find (fun x -> x > 0) l1 in
  (* ruleid: list-find-outside-try *)
  let _ = List.find (fun x -> x > 1) l2 in
  (* ruleid: list-find-outside-try *)
  let _ = List.find (fun x -> x > 2) l3 in
  ()

let safe l =
  (* ok: list-find-outside-try *)
  let _ = try List.find (fun x -> x > 0) l with Not_found -> 0 in
  (* ok: list-find-outside-try *)
  let _ = try List.find (fun x -> x > 0) l with Not_found -> 1 in
  (* ok: list-find-outside-try *)
  let _ = List.find_opt (fun x -> x > 0) l in
  ()
