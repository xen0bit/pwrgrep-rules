(* not-portable-tmp-string: hard-coding the system temp dir breaks on
 * systems with a different temp location (Windows, sandboxes). Use
 * Filename.get_temp_dirname() instead.
 *)

let vuln () =
  (* ruleid: not-portable-tmp-string *)
  let _ = "/tmp/foo" in
  (* ruleid: not-portable-tmp-string *)
  let _ = "/tmp/bar/baz" in
  (* ruleid: not-portable-tmp-string *)
  let _ = open_in "/tmp/data" in
  ()

let safe () =
  (* ok: not-portable-tmp-string *)
  let _ = Filename.get_temp_dirname () in
  (* ok: not-portable-tmp-string *)
  let _ = Filename.concat (Filename.get_temp_dirname ()) "foo" in
  (* ok: not-portable-tmp-string *)
  let _ = "fixed-relative-path" in
  ()
