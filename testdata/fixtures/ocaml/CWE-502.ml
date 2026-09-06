(* CWE-502: Deserialization of Untrusted Data
 * Marshal.from_* and input_value are not type-safe and allow code execution.
 *)

let vuln_marshal str ch =
  (* ruleid: ocamllint-marshal *)
  let _ = Marshal.from_string str 0 in
  (* ruleid: ocamllint-marshal *)
  let v = Marshal.from_bytes (Bytes.of_string str) 0 in
  (* ruleid: ocamllint-marshal *)
  let y = input_value ch in
  ()

let safe_marshal () =
  (* ok: ocamllint-marshal *)
  let _ = Marshal.to_string "safe" [] in
  (* ok: ocamllint-marshal *)
  let _ = Marshal.to_bytes "safe" [] in
  ()
