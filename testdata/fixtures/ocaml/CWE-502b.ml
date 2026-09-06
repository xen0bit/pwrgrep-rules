(* CWE-502: Deserialization *)
let vuln str ch =
  (* ruleid: ocaml-deserialization *)
  let _ = Marshal.from_string str 0 in
  (* ruleid: ocaml-deserialization *)
  let _ = Marshal.from_bytes (Bytes.of_string str) 0 in
  (* ruleid: ocaml-deserialization *)
  let _ = input_value ch in
  ()
let safe () =
  (* ok: ocaml-deserialization *)
  let _ = Marshal.to_string "safe" [] in
  (* ok: ocaml-deserialization *)
  let _ = Marshal.to_bytes "safe" [] in
  ()
