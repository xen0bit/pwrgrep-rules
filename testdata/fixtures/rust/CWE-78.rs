// CWE-78: OS command injection via Command::new with untrusted input
use std::process::Command;

fn vuln() {
    let input = std::env::var("USER_INPUT").unwrap();
    // ruleid: rust-command-injection
    let _ = Command::new(input).spawn();
    let cmd = std::env::args().next().unwrap();
    // ruleid: rust-command-injection
    let _ = std::process::Command::new(cmd).output();
    let data = std::env::var("CMD").unwrap();
    let propagated = data;
    // ruleid: rust-command-injection
    let _ = Command::new(propagated).arg("x").spawn();
}

fn safe() {
    // ok: rust-command-injection
    let _ = Command::new("ls").arg("-l").spawn();
    // ok: rust-command-injection
    let _ = std::process::Command::new("fixed").output();
    // ok: rust-command-injection
    let safe = "echo";
    let _ = Command::new(safe).spawn();
}
