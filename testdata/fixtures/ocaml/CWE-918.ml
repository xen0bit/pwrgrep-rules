(* CWE-918: SSRF – user-supplied URL passed to HTTP client without validation.
 * Http.get and Cohttp client with variable are vulnerable.
 *)

let vuln user_input =
  (* ruleid: ocamllint-ssrf *)
  let _ = Http.get user_input in
  (* ruleid: ocamllint-ssrf *)
  let _ = Cohttp_lwt_unix.Client.get user_input in
  ()

let safe () =
  (* ok: ocamllint-ssrf *)
  let _ = Http.get "https://example.com" in
  (* ok: ocamllint-ssrf *)
  let _ = Cohttp_lwt_unix.Client.get "https://safe.example.com" in
  ()
let vuln2 user_input =
  let url = user_input ^ "/api" in
  (* ruleid: ocamllint-ssrf *)
  let _ = Http.get url in
  (* ruleid: ocamllint-ssrf *)
  let _ = Cohttp_lwt_unix.Client.get user_input in
  ()

let safe2 () =
  (* ok: ocamllint-ssrf *)
  let _ = Http.get "https://allowlist.example.com/api" in
  ()
