// CWE-611: XXE
fn vuln(xml: &str) {
    // ruleid: rust-xxe
    let _ = quick_xml::Reader::from_str(xml);
    // ruleid: rust-xxe
    let _ = roxmltree::Document::parse(xml);
    // ok: rust-xxe
    let _ = quick_xml::Reader::from_str("<root>hi</root>");
    // ok: rust-xxe
    let _ = roxmltree::Document::parse("<a>fixed</a>");
}
