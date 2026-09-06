(* CWE-327: Use of a Broken or Risky Cryptographic Algorithm
 * Digest.* in OCaml is MD5 and must not be used for security.
 * The rule flags any use of Digest.bytes / Digest.string etc.
 *)

let vuln_digest () =
  (* ruleid: ocamllint-digest *)
  let _ = Digest.string "hello" in
  (* ruleid: ocamllint-digest *)
  let _ = Digest.file "data.txt" in
  (* ruleid: ocamllint-digest *)
  let _ = Digest.bytes (Bytes.of_string "abc") in
  ()

let safe_digest () =
  (* ok: ocamllint-digest *)
  let _ = "hello" in
  (* ok: ocamllint-digest *)
  let _ = Printf.printf "safe\n" in
  ()
