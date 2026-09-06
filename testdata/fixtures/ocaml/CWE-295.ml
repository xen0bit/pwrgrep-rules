(* CWE-295: Improper Certificate Validation – disabling verification.
 * Ssl.set_verify with Verify_none disables TLS verification, allowing MITM.
 *)

let vuln ctx =
  (* ruleid: ocamllint-tls *)
  let _ = Ssl.set_verify ctx Verify_none in
  (* ruleid: ocamllint-tls *)
  let _ = Ssl.set_verify ctx verify_none in
  ()

let safe ctx =
  (* ok: ocamllint-tls *)
  let _ = Ssl.set_verify ctx Verify_peer in
  (* ok: ocamllint-tls *)
  let _ = Ssl.set_verify ctx Verify_fail_if_no_peer_cert in
  ()
let vuln2 ctx =
  (* ruleid: ocamllint-tls *)
  let _ = Ssl.set_verify ctx Verify_none in
  (* ruleid: ocamllint-tls *)
  let _ = Ssl.set_verify ctx verify_none in
  ()

let safe2 ctx =
  (* ok: ocamllint-tls *)
  let _ = Ssl.set_verify ctx Verify_peer in
  ()
