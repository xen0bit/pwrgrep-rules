// current_exe should not be used for security operations: the path of
// the running binary is attacker-influenced (symlinks, renames), so it
// must not anchor trust decisions.
fn vuln() {
    // ruleid: current-exe
    let _ = std::env::current_exe();
    // ruleid: current-exe
    let exe = std::env::current_exe().unwrap();
    // ruleid: current-exe
    let _ = std::env::current_exe().unwrap().parent();
}

fn safe() {
    // ok: current-exe
    let _ = std::env::var("HOME").unwrap();
    // ok: current-exe
    let fixed = "/usr/bin/fixed";
    // ok: current-exe
    let _ = std::path::Path::new(fixed).parent();
}
