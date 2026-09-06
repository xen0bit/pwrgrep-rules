// CWE-22: Path traversal via File::open with untrusted input
use std::fs::File;

fn vuln() {
    let p = std::env::var("PATH").unwrap();
    // ruleid: rust-path-traversal
    let _ = File::open(p);
    let q = std::env::args().next().unwrap();
    // ruleid: rust-path-traversal
    let _ = std::fs::File::open(q);
    let r = std::env::var("FILE").unwrap();
    let propagated = r;
    // ruleid: rust-path-traversal
    let _ = std::fs::read(propagated);
}

fn safe() {
    // ok: rust-path-traversal
    let _ = File::open("/tmp/fixed.txt");
    // ok: rust-path-traversal
    let _ = std::fs::read("/etc/hosts");
    // ok: rust-path-traversal
    let safe = "constant";
    let _ = std::fs::File::open(safe);
}
