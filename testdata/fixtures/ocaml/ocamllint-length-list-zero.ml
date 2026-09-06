(* ocamllint-length-list-zero: `List.length l = 0` walks the whole list.
 * Match against `[]` instead, which is constant time.
 *)

let vuln l m n =
  (* ruleid: ocamllint-length-list-zero *)
  let _ = List.length l = 0 in
  (* ruleid: ocamllint-length-list-zero *)
  let _ = List.length m = 0 in
  (* ruleid: ocamllint-length-list-zero *)
  let _ = List.length n = 0 in
  ()

let safe l m n =
  (* ok: ocamllint-length-list-zero *)
  let _ = l = [] in
  (* ok: ocamllint-length-list-zero *)
  let _ = m <> [] in
  (* ok: ocamllint-length-list-zero *)
  let _ = n = [] in
  ()
