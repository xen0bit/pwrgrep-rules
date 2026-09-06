// CWE-327: insecure hashes — MD5, SHA1 etc are cryptographically broken
use md5::Md5;
use sha1::Sha1;
use sha2::Sha256;

fn main() {
    // ruleid: insecure-hashes
    let _ = md5::Md5::new();
    // ruleid: insecure-hashes
    let _ = sha1::Sha1::new();
    // ruleid: insecure-hashes
    let _ = md5::Md5::new();
    // ok: insecure-hashes
    let _ = Sha256::new();
    // ok: insecure-hashes
    let _ = sha2::Sha256::new();
    // ok: insecure-hashes
    let _ = 42;
}
