(* CWE-89: SQL Injection – user input in DB query without sanitization.
 * Db.query with variable is vulnerable; literals are safe.
 *)

let vuln user_input =
  (* ruleid: ocamllint-sqli *)
  let _ = Db.query user_input in
  (* ruleid: ocamllint-sqli *)
  let _ = Mysql.query user_input in
  (* ruleid: ocamllint-sqli *)
  let _ = Db.query (user_input ^ " LIMIT 1") in
  (* ruleid: ocamllint-sqli *)
  let q = user_input in let _ = Mysql.query q in
  ()

let safe () =
  (* ok: ocamllint-sqli *)
  let _ = Db.query "SELECT * FROM users WHERE id = 1" in
  (* ok: ocamllint-sqli *)
  let _ = Mysql.query "SELECT 1" in
  (* ok: ocamllint-sqli *)
  let _ = Db.query "SELECT * FROM t WHERE name = ?" in
  ()
