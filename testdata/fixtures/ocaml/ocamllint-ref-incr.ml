(* ocamllint-ref-incr: `r := !r + 1` is just `incr r`.
 * Use the dedicated primitive instead of the manual update.
 *)

let vuln r s t =
  (* ruleid: ocamllint-ref-incr *)
  let _ = r := !r + 1 in
  (* ruleid: ocamllint-ref-incr *)
  let _ = s := !s + 1 in
  (* ruleid: ocamllint-ref-incr *)
  let _ = t := !t + 1 in
  ()

let safe r s t =
  (* ok: ocamllint-ref-incr *)
  let _ = incr r in
  (* ok: ocamllint-ref-incr *)
  let _ = incr s in
  (* ok: ocamllint-ref-incr *)
  let _ = incr t in
  ()
