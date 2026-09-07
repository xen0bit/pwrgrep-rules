// Dangerous rustls client config disables certificate verification.
// Use a verified ClientConfig instead of the dangerous builder.
fn vuln(client: &mut rustls::client::ClientConfig) {
    // ruleid: rustls-dangerous
    client.dangerous().set_certificate_verifier(std::sync::Arc::new(NoVerifier));
}

fn vuln2() {
    // ruleid: rustls-dangerous
    let _x = rustls::client::DangerousClientConfig;
}

fn vuln3(client: &mut rustls::client::ClientConfig) {
    // ruleid: rustls-dangerous
    client.dangerous().set_certificate_verifier(std::sync::Arc::new(NoVerifier));
}

fn safe() {
    // ok: rustls-dangerous
    let _config = rustls::ClientConfig::builder().build();
    // ok: rustls-dangerous
    let _ = rustls::client::ClientConfig::builder();
    // ok: rustls-dangerous
    let _ = "fixed-config";
}

struct NoVerifier;
fn make_dangerous() -> rustls::client::DangerousClientConfig {
    todo!()
}
