(* CWE-79: Cross-site Scripting via Dream.html
 * Untrusted input passed to Dream.html is rendered as HTML without escaping.
 *)

let vuln user_input =
  (* ruleid: ocaml-xss *)
  let _ = Dream.html user_input in
  (* ruleid: ocaml-xss *)
  let _ = Dream.html (user_input ^ "tail") in
  ()

let propagated x =
  let y = x in
  (* ruleid: ocaml-xss *)
  let _ = Dream.html y in
  ()

let safe () =
  (* ok: ocaml-xss *)
  let _ = Dream.html "fixed string" in
  (* ok: ocaml-xss *)
  let _ = Dream.html "<p>hello</p>" in
  (* ok: ocaml-xss *)
  let _ = Printf.printf "hello" in
  ()
