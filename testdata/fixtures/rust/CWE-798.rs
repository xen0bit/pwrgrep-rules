// CWE-798: Hardcoded credentials in Rust
fn main() {
    // ruleid: rust-hardcoded-credential
    let password = "SuperSecret123!";
    // ruleid: rust-hardcoded-credential
    let api_key = "aBcD1234EfGh5678IjKlMnOpQrStUvWx";
    // ruleid: rust-hardcoded-credential
    let secret = "MyHardcodedSecretKey123";
    // ok: rust-hardcoded-credential
    let password_placeholder = "changeme";
    // ok: rust-hardcoded-credential
    let api_key_env = std::env::var("API_KEY").unwrap();
    // ok: rust-hardcoded-credential
    let token = "test";
    // ok: rust-hardcoded-credential
    let short = "abc";
}
