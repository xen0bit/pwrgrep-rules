(* CWE-352: CSRF - Dream.post without token *)
let vuln1 =
  (* ruleid: ocaml-csrf *)
  Dream.post "/transfer" (fun req -> Dream.html "transferred")

let vuln2 =
  (* ruleid: ocaml-csrf *)
  Dream.post "/update" (fun req -> Dream.html "updated")

let vuln3 =
  (* ruleid: ocaml-csrf *)
  Dream.post "/delete" (fun _ -> Dream.html "deleted")

let safe1 =
  (* ok: ocaml-csrf *)
  Dream.post "/safe" (fun req ->
    match Dream.header req "X-CSRF-Token" with
    | Some t when t = Dream.csrf_token req -> Dream.html "ok"
    | _ -> Dream.html "forbidden")

let safe2 =
  (* ok: ocaml-csrf *)
  Dream.post "/safe2" (fun req ->
    let token = Dream.csrf_token req in
    Dream.html token)
