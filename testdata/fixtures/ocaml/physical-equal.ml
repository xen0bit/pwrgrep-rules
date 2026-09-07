(* physical-equal: `==` is physical equality; you almost always want
 * structural `=`. Use `=` unless identity is intended.
 *)

let vuln x y a b =
  (* ruleid: physical-equal *)
  let _ = x == y in
  (* ruleid: physical-equal *)
  let _ = a == b in
  (* ruleid: physical-equal *)
  let _ = x == x in
  ()

let safe x y a =
  (* ok: physical-equal *)
  let _ = x = y in
  (* ok: physical-equal *)
  let _ = x <> y in
  (* ok: physical-equal *)
  let _ = Stdlib.compare x y = 0 in
  ()
