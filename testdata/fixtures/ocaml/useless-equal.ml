(* useless-equal: `x = x` is always true. Compare distinct values.
 *)

let vuln x y =
  (* ruleid: useless-equal *)
  let _ = x = x in
  (* ruleid: useless-equal *)
  let _ = y = y in
  (* ruleid: useless-equal *)
  let _ = (x + 1) = (x + 1) in
  ()

let safe x y =
  (* ok: useless-equal *)
  let _ = x = y in
  (* ok: useless-equal *)
  let _ = x = 1 in
  (* ok: useless-equal *)
  let _ = y = 2 in
  ()
