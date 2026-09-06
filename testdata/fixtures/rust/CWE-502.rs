// CWE-502: Deserialization
fn vuln(data: &str) {
    // ruleid: rust-deserialization
    let _: String = bincode::deserialize(data).unwrap();
    // ruleid: rust-deserialization
    let _: String = serde_json::from_str(data).unwrap();
    // ok: rust-deserialization
    let _: String = bincode::deserialize("fixed").unwrap();
    // ok: rust-deserialization
    let _: String = serde_json::from_str("{\"a\":1}").unwrap();
}
