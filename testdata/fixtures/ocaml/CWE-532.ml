(* CWE-532: Insertion of Sensitive Information into Log File
 * Logging a password or secret exposes it in log files which are often
 * world-readable or shipped to third parties.
 *)

let vuln password secret api_key =
  (* ruleid: ocaml-sensitive-log *)
  let _ = print_endline password in
  (* ruleid: ocaml-sensitive-log *)
  let _ = print_string secret in
  (* ruleid: ocaml-sensitive-log *)
  let _ = Logs.info (fun m -> m "%s" api_key) in
  ()

let safe () =
  (* ok: ocaml-sensitive-log *)
  let _ = print_endline "user logged in" in
  (* ok: ocaml-sensitive-log *)
  let _ = print_string "request processed" in
  (* ok: ocaml-sensitive-log *)
  let _ = Logs.info (fun m -> m "done") in
  ()
