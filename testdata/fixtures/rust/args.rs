// args should not be used for security operations: command-line input
// is attacker-controlled, so branching a security decision on it without
// validation is unsafe.
fn vuln() {
    // ruleid: args
    let _ = std::env::args();
    // ruleid: args
    let args: Vec<_> = std::env::args().collect();
    // ruleid: args
    for _arg in std::env::args() {}
}

fn safe() {
    // ok: args
    let _ = std::env::var("HOME").unwrap();
    // ok: args
    let fixed: Vec<String> = vec!["prog".to_string()];
    // ok: args
    let _ = fixed.len();
}
