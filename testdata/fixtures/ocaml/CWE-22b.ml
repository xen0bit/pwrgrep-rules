(* CWE-22: Path Traversal *)
let vuln user =
  (* ruleid: ocaml-path-traversal *)
  let _ = Filename.concat "/tmp" user in
  (* ruleid: ocaml-path-traversal *)
  let ch = open_in user in
  ()
let safe () =
  (* ok: ocaml-path-traversal *)
  let _ = Filename.concat "/tmp" "fixed.txt" in
  (* ok: ocaml-path-traversal *)
  let ch = open_in "/tmp/fixed.txt" in
  ()
let vuln2 user =
  (* ruleid: ocaml-path-traversal *)
  let _ = open_in ("/tmp/" ^ user) in
  (* ruleid: ocaml-path-traversal *)
  let _ = In_channel.input_all user in
  ()
let safe2 () =
  (* ok: ocaml-path-traversal *)
  let _ = Filename.concat "/tmp" "safe2.txt" in
  let _ = open_in "/tmp/safe2.txt" in
  ()
