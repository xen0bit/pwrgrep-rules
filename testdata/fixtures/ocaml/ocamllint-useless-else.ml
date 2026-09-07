(* ocamllint-useless-else: a trailing unit else-branch does nothing;
 * drop the else branch. Keep a real else value instead of the no-op.
 *)

let vuln c =
  (* ruleid: ocamllint-useless-else *)
  let _ = if c then print_endline "hi" else () in
  (* ruleid: ocamllint-useless-else *)
  let _ = if c then print_int 1 else () in
  (* ruleid: ocamllint-useless-else *)
  let _ = if c then incr r else () in
  ()

let safe c =
  (* ok: ocamllint-useless-else *)
  let _ = if c then 1 else 2 in
  (* ok: ocamllint-useless-else *)
  let _ = if c then print_endline "hi" else print_endline "bye" in
  (* ok: ocamllint-useless-else *)
  let _ = if c then incr r else decr r in
  ()
