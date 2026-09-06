// CWE-532: Sensitive info into log — password reaches log::info! with taint.
use log::{info, debug};

fn leak(password: &str, secret: &str, api_key: &str) {
    // ruleid: rust-log
    log::info!("password={}", password);
    // ruleid: rust-log
    info!("secret {}", secret);
    // ruleid: rust-log
    log::debug!("api_key={}", api_key);
    // ruleid: rust-log
    println!("token {}", secret);
}

fn safe() {
    // ok: rust-log
    log::info!("user logged in");
    // ok: rust-log
    info!("request processed");
    // ok: rust-log
    println!("redacted");
}
