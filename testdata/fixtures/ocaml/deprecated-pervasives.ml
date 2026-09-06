(* deprecated-pervasives: Pervasives was renamed to Stdlib in 4.07 and
 * removed after 4.10. Use Stdlib instead.
 *)

let vuln x y =
  (* ruleid: deprecated-pervasives *)
  let _ = Pervasives.compare x y in
  (* ruleid: deprecated-pervasives *)
  let _ = Pervasives.string_of_int 1 in
  (* ruleid: deprecated-pervasives *)
  let _ = Pervasives.print_endline "hi" in
  ()

let safe x y =
  (* ok: deprecated-pervasives *)
  let _ = Stdlib.compare x y in
  (* ok: deprecated-pervasives *)
  let _ = String.length "fixed" in
  (* ok: deprecated-pervasives *)
  let _ = Stdlib.string_of_int 1 in
  ()
