(* CWE-377: Insecure Temporary File
 * Filename.temp_file can race with symlink attacks.
 *)

let vuln_temp () =
  (* ruleid: ocamllint-tempfile *)
  let _ = Filename.temp_file "prefix" "suffix" in
  (* ruleid: ocamllint-tempfile *)
  let tmp = Filename.temp_file "pre" ".tmp" in
  ()

let safe_temp () =
  (* ok: ocamllint-tempfile *)
  let _ = Filename.open_temp_file ~mode:[Open_creat] "pre" "suf" in
  (* ok: ocamllint-tempfile *)
  let _ = "fixed_path.tmp" in
  ()
let vuln2 () =
  (* ruleid: ocamllint-tempfile *)
  let _ = Filename.temp_file "tmp" ".log" in
  (* ruleid: ocamllint-tempfile *)
  let _ = Filename.temp_file "pre2" "suf2" in
  ()

let safe2 () =
  (* ok: ocamllint-tempfile *)
  let _ = Filename.open_temp_file ~mode:[Open_text] "safe" "tmp" in
  ()
