// args_os should not be used for security operations: it yields
// platform-encoded arguments that bypass Unicode validation, so a check
// done on the String form can disagree with what the OS actually sees.
fn vuln() {
    // ruleid: args-os
    let _ = std::env::args_os();
    // ruleid: args-os
    let args: Vec<_> = std::env::args_os().collect();
    // ruleid: args-os
    for _arg in std::env::args_os() {}
}

fn safe() {
    // ok: args-os
    let _ = std::env::var("HOME").unwrap();
    // ok: args-os
    let fixed: Vec<String> = vec!["prog".to_string()];
    // ok: args-os
    let _ = fixed.len();
}
