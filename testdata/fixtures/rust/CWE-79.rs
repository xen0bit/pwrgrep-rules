// CWE-79: Cross-site Scripting via unescaped HTML write
//
// Writing user input directly to the response without escaping lets an
// attacker inject script. The sink is w.write / w.write_all with tainted data.

use std::io::Write;

fn vuln<W: Write>(mut w: W) {
    let input = std::env::var("USER_INPUT").unwrap();
    // ruleid: rust-xss
    w.write(input.as_bytes()).unwrap();
    let data = std::env::args().next().unwrap();
    // ruleid: rust-xss
    w.write_all(data.as_bytes()).unwrap();
    let propagated = input;
    // ruleid: rust-xss
    w.write(propagated.as_bytes()).unwrap();
}

fn safe<W: Write>(mut w: W) {
    // ok: rust-xss
    w.write("hello".as_bytes()).unwrap();
    // ok: rust-xss
    w.write_all("fixed".as_bytes()).unwrap();
    // ok: rust-xss
    let safe = "constant";
    w.write(safe.as_bytes()).unwrap();
}
