(* ocamllint-str-first-chars: `String.sub s 0 n` is `Str.first_chars s n`.
 * Use the named helper instead of the manual slice.
 *)

let vuln s n m =
  (* ruleid: ocamllint-str-first-chars *)
  let _ = String.sub s 0 n in
  (* ruleid: ocamllint-str-first-chars *)
  let _ = String.sub s 0 m in
  (* ruleid: ocamllint-str-first-chars *)
  let _ = String.sub s 0 3 in
  ()

let safe s n =
  (* ok: ocamllint-str-first-chars *)
  let _ = Str.first_chars s n in
  (* ok: ocamllint-str-first-chars *)
  let _ = String.length s in
  (* ok: ocamllint-str-first-chars *)
  let _ = s ^ "fixed" in
  ()
