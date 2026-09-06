(* broken-input-line: `input_line` leaves a trailing `\r` on Windows CRLF
 * input. Read in binary mode or strip the carriage return instead.
 *)

let vuln ch1 ch2 ch3 =
  (* ruleid: broken-input-line *)
  let _ = input_line ch1 in
  (* ruleid: broken-input-line *)
  let _ = input_line ch2 in
  (* ruleid: broken-input-line *)
  let _ = input_line ch3 in
  ()

let safe ch =
  (* ok: broken-input-line *)
  let _ = In_channel.input_all ch in
  (* ok: broken-input-line *)
  let _ = In_channel.length ch in
  (* ok: broken-input-line *)
  let _ = String.trim "fixed" in
  ()
