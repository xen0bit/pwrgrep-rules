// CWE-918: SSRF via reqwest with untrusted URL
use reqwest;

fn vuln() {
    let url = std::env::var("TARGET_URL").unwrap();
    // ruleid: rust-ssrf
    let _ = reqwest::get(url);
    let target = std::env::args().next().unwrap();
    // ruleid: rust-ssrf
    let _ = reqwest::blocking::get(target);
    let u = std::env::var("URL").unwrap();
    let propagated = u;
    // ruleid: rust-ssrf
    let _ = reqwest::get(propagated);
}

fn safe() {
    // ok: rust-ssrf
    let _ = reqwest::get("https://example.com");
    // ok: rust-ssrf
    let _ = reqwest::blocking::get("https://example.com");
    // ok: rust-ssrf
    let safe = "https://fixed.com";
    let _ = reqwest::get(safe);
}
