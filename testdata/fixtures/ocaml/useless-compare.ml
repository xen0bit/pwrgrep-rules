(* useless-compare: comparing a value to itself always yields zero.
 * Compare distinct values instead.
 *)

let vuln x y s =
  (* ruleid: useless-compare *)
  let _ = compare x x in
  (* ruleid: useless-compare *)
  let _ = compare y y in
  (* ruleid: useless-compare *)
  let _ = compare s s in
  ()

let safe x y s t =
  (* ok: useless-compare *)
  let _ = compare x y in
  (* ok: useless-compare *)
  let _ = String.compare s t in
  (* ok: useless-compare *)
  let _ = x = y in
  ()
