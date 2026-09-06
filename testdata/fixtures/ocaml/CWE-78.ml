(* CWE-78: OS Command Injection – user-controlled data passed to Sys.command
 * or Unix.system allows arbitrary OS command execution. Safe code uses
 * hard-coded literals which are excluded by the rule via not_at.
 *)

let vuln user_input =
  (* ruleid: ocamllint-exec *)
  let _ = Sys.command user_input in
  (* ruleid: ocamllint-exec *)
  let _ = Unix.system user_input in
  (* ruleid: ocamllint-exec *)
  let _ = Sys.command (user_input ^ " arg") in
  (* ruleid: ocamllint-exec *)
  let cmd = user_input in let _ = Unix.system cmd in
  ()

let safe () =
  (* ok: ocamllint-exec *)
  let _ = Sys.command "ls -la" in
  (* ok: ocamllint-exec *)
  let _ = Unix.system "echo hi" in
  (* ok: ocamllint-exec *)
  let _ = Sys.command "fixed --version" in
  ()
