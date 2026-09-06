(* bad-reraise: re-raising with `raise` loses the original backtrace.
 * Use `Printexc.raise_with_backtrace` or `raise_notrace` patterns instead.
 *)

let vuln () =
  (* ruleid: bad-reraise *)
  let _ = raise e in
  (* ruleid: bad-reraise *)
  let _ = raise exn in
  (* ruleid: bad-reraise *)
  let _ = raise err in
  ()

let safe () =
  (* ok: bad-reraise *)
  let _ = raise Not_found in
  (* ok: bad-reraise *)
  let _ = raise (Failure "fixed") in
  (* ok: bad-reraise *)
  let _ = failwith "fixed" in
  ()
