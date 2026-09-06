// Security headers must be marked sensitive so they are not logged.
// Inserting a HeaderValue without set_sensitive(true) leaves secrets
// visible in debug output.
use reqwest::header;

fn vuln() {
    // ruleid: reqwest-set-sensitive
    let mut headers = header::HeaderMap::new();
    let header_value = header::HeaderValue::from_str("secret").unwrap();
    headers.insert("Authorization", header_value);
}

fn vuln2() {
    // ruleid: reqwest-set-sensitive
    let mut headers = header::HeaderMap::new();
    let header_value = header::HeaderValue::from_str("token123").unwrap();
    headers.insert("X-Api-Key", header_value);
}

fn vuln3() {
    // ruleid: reqwest-set-sensitive
    let mut headers = header::HeaderMap::new();
    let header_value = header::HeaderValue::from_static("fixed-secret");
    headers.insert("Authorization", header_value);
}

fn safe() {
    // ok: reqwest-set-sensitive
    let mut headers = header::HeaderMap::new();
    let mut header_value = header::HeaderValue::from_str("secret").unwrap();
    header_value.set_sensitive(true);
    headers.insert("Authorization", header_value);
    // ok: reqwest-set-sensitive
    let mut headers2 = header::HeaderMap::new();
    let mut header_value2 = header::HeaderValue::from_static("fixed-secret");
    header_value2.set_sensitive(true);
    headers2.insert("X-Api-Key", header_value2);
    // ok: reqwest-set-sensitive
    let _ = header::HeaderValue::from_str("no-insert");
}
