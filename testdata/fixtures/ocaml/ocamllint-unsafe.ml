(* ocamllint-unsafe: unsafe array/bytes/string access skips bounds checks.
 * Use the checked `get`/`set` instead.
 *)

let vuln arr i s =
  (* ruleid: ocamllint-unsafe *)
  let _ = Array.unsafe_get arr i in
  (* ruleid: ocamllint-unsafe *)
  let _ = Bytes.unsafe_get s i in
  (* ruleid: ocamllint-unsafe *)
  let _ = String.unsafe_get s i in
  ()

let safe arr i s =
  (* ok: ocamllint-unsafe *)
  let _ = Array.get arr i in
  (* ok: ocamllint-unsafe *)
  let _ = Bytes.get s i in
  (* ok: ocamllint-unsafe *)
  let _ = String.get s i in
  ()
