(* CWE-22: Path Traversal via Filename.concat
 * Any user-controlled data passed to Filename.concat can lead to directory traversal.
 *)

let vuln_concat user_input base =
  (* ruleid: ocamllint-filenameconcat *)
  let _ = Filename.concat "/tmp" user_input in
  (* ruleid: ocamllint-filenameconcat *)
  let p = Filename.concat base user_input in
  (* ruleid: ocamllint-filenameconcat *)
  let _ = Filename.concat base user_input in
  (* ruleid: ocamllint-filenameconcat *)
  let q = Filename.concat "/var/data" user_input in
  p

let safe_concat () =
  (* ok: ocamllint-filenameconcat *)
  let _ = "/tmp/fixed.txt" in
  (* ok: ocamllint-filenameconcat *)
  let _ = Printf.sprintf "/tmp/%s" "fixed" in
  (* ok: ocamllint-filenameconcat *)
  let base = Filename.basename "/tmp/fixed.txt" in
  ()
