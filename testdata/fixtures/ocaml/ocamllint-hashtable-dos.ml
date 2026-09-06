(* ocamllint-hashtable-dos: Hashtbl without `~random:true` uses a fixed
 * seed, letting an attacker force collisions. Pass `~random:true`.
 *)

let vuln () =
  (* ruleid: ocamllint-hashtable-dos *)
  let _ = Hashtbl.create 16 in
  (* ruleid: ocamllint-hashtable-dos *)
  let _ = Hashtbl.create 32 in
  (* ruleid: ocamllint-hashtable-dos *)
  let _ = Hashtbl.create 64 in
  ()

let safe () =
  (* ok: ocamllint-hashtable-dos *)
  let _ = Hashtbl.create 16 ~random:true in
  (* ok: ocamllint-hashtable-dos *)
  let _ = Hashtbl.create 32 ~random:true in
  (* ok: ocamllint-hashtable-dos *)
  let _ = Hashtbl.create 64 ~random:true in
  ()
