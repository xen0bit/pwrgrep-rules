(* hashtbl-find-outside-try: Hashtbl.find raises Not_found on missing keys.
 * Wrap it in try/with or use Hashtbl.find_opt instead.
 *)

let vuln tbl k1 k2 k3 =
  (* ruleid: hashtbl-find-outside-try *)
  let _ = Hashtbl.find tbl k1 in
  (* ruleid: hashtbl-find-outside-try *)
  let _ = Hashtbl.find tbl k2 in
  (* ruleid: hashtbl-find-outside-try *)
  let _ = Hashtbl.find tbl k3 in
  ()

let safe tbl k =
  (* ok: hashtbl-find-outside-try *)
  let _ = try Hashtbl.find tbl k with Not_found -> 0 in
  (* ok: hashtbl-find-outside-try *)
  let _ = try Hashtbl.find tbl k with Not_found -> 1 in
  (* ok: hashtbl-find-outside-try *)
  let _ = Hashtbl.find_opt tbl k in
  ()
