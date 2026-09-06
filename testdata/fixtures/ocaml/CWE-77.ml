(* CWE-77: OCaml Unix.system shell metachar [|;&$`] *)
let vuln1 user_input =
  (* ruleid: ocaml-77-shell *)
  let _ = Unix.system user_input in
  ()

let vuln2 cmd =
  (* ruleid: ocaml-77-shell *)
  let _ = Sys.command cmd in
  ()

let vuln3 arg =
  let cmd = arg in
  (* ruleid: ocaml-77-shell *)
  let _ = Unix.system cmd in
  ()

let safeAllowlist () =
  let allowlist = read_line () in
  if not (String.contains allowlist 'l') then () else
  (* ok: ocaml-77-shell *)
  let _ = Unix.system allowlist in
  ()

let safeFixed () =
  (* ok: ocaml-77-shell *)
  let _ = Unix.system "ls -la" in
  ()
