// temp_dir should not be used for security operations: the shared temp
// directory is writable by other users, so security-sensitive files must
// use a private directory instead.
fn vuln() {
    // ruleid: temp-dir
    let _ = std::env::temp_dir();
    // ruleid: temp-dir
    let dir = std::env::temp_dir();
    // ruleid: temp-dir
    let _ = std::env::temp_dir().join("data");
}

fn safe() {
    // ok: temp-dir
    let _ = std::env::var("HOME").unwrap();
    // ok: temp-dir
    let fixed = "/var/lib/app/data";
    // ok: temp-dir
    let _ = std::path::Path::new(fixed).join("data");
}
