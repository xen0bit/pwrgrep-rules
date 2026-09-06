(* CWE-94: Code Injection – dynamic loading/eval with user input.
 * Dynlink.loadfile and Toploop.execute_phrase with variable are vulnerable.
 *)

let vuln user_input =
  (* ruleid: ocamllint-code-injection *)
  let _ = Dynlink.loadfile user_input in
  (* ruleid: ocamllint-code-injection *)
  let _ = Toploop.execute_phrase user_input in
  (* ruleid: ocamllint-code-injection *)
  let p = user_input in let _ = Dynlink.loadfile p in
  (* ruleid: ocamllint-code-injection *)
  let _ = Toploop.execute_phrase (user_input ^ ";;") in
  ()

let safe () =
  (* ok: ocamllint-code-injection *)
  let _ = Dynlink.loadfile "/tmp/fixed.cma" in
  (* ok: ocamllint-code-injection *)
  let _ = Toploop.execute_phrase "let x = 1;;" in
  (* ok: ocamllint-code-injection *)
  let _ = Dynlink.loadfile "/usr/lib/fixed.cma" in
  ()
