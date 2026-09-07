// SSL verification disabled: VERIFY_NONE accepts any certificate, which
// allows man-in-the-middle attacks. Use VERIFY_PEER with a proper store.
use openssl::ssl::{SslMethod, SslVerifyMode, SslConnector};

fn vuln(builder: &mut openssl::ssl::SslContextBuilder) {
    // ruleid: ssl-verify-none
    builder.set_verify(openssl::ssl::SSL_VERIFY_NONE);
}

fn vuln2(builder: &mut openssl::ssl::SslContextBuilder) {
    // ruleid: ssl-verify-none
    builder.set_verify(openssl::ssl::SSL_VERIFY_NONE);
}

fn vuln3(builder: &mut openssl::ssl::SslContextBuilder) {
    // ruleid: ssl-verify-none
    builder.set_verify(openssl::ssl::SSL_VERIFY_NONE);
}

fn safe(builder: &mut openssl::ssl::SslContextBuilder) {
    // ok: ssl-verify-none
    builder.set_verify(SslVerifyMode::PEER);
    // ok: ssl-verify-none
    builder.set_verify(openssl::ssl::SslVerifyMode::PEER);
    // ok: ssl-verify-none
    let _ = SslConnector::builder(SslMethod::tls());
}
