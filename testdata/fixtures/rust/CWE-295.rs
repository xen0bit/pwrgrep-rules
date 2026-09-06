// CWE-295: improper certificate validation — accepting invalid certs
use reqwest;

fn main() {
    // ruleid: reqwest-accept-invalid
    let client = reqwest::Client::builder().danger_accept_invalid_certs(true).build().unwrap();
    // ruleid: reqwest-accept-invalid
    let client2 = reqwest::Client::builder().danger_accept_invalid_hostnames(true).build().unwrap();
    // ruleid: reqwest-accept-invalid
    let c = reqwest::Client::builder().danger_accept_invalid_certs(true).build().unwrap();
    // ok: reqwest-accept-invalid
    let ok = reqwest::Client::builder().build().unwrap();
    // ok: reqwest-accept-invalid
    let ok2 = reqwest::Client::new();
}
