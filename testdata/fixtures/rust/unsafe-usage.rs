// Detected 'unsafe' usage: auditing the block is required because the
// compiler no longer checks memory safety inside it.
fn vuln() {
    // ruleid: unsafe-usage
    unsafe { println!("raw"); }
    // ruleid: unsafe-usage
    unsafe { let _x = 1; }
    // ruleid: unsafe-usage
    let _ = unsafe { 42 };
}

fn safe() {
    // ok: unsafe-usage
    println!("fixed");
    // ok: unsafe-usage
    let _x = 1;
    // ok: unsafe-usage
    let _ = 42;
}
