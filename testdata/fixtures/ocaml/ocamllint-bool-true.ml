(* ocamllint-bool-true: comparing a boolean to `true` is redundant.
 * Just use the boolean itself; `x = true` is `x`.
 *)

let vuln x y z =
  (* ruleid: ocamllint-bool-true *)
  let _ = x = true in
  (* ruleid: ocamllint-bool-true *)
  let _ = y == true in
  (* ruleid: ocamllint-bool-true *)
  let _ = z != false in
  ()

let safe x y z =
  (* ok: ocamllint-bool-true *)
  let _ = x in
  (* ok: ocamllint-bool-true *)
  let _ = if y then 1 else 2 in
  (* ok: ocamllint-bool-true *)
  let _ = x && y in
  ()
