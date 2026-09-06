// CWE-94: Code injection via Command::new with untrusted input
use std::process::Command;
fn vuln(input: String) {
    // ruleid: rust-code-injection
    let _ = Command::new(input).spawn();
    // ruleid: rust-code-injection
    let _ = std::process::Command::new(input).output();
    // ok: rust-code-injection
    let _ = Command::new("ls").spawn();
    // ok: rust-code-injection
    let _ = std::process::Command::new("fixed").output();
}
