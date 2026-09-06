// CWE-295: Improper Certificate Validation – setting rejectUnauthorized:false
// disables TLS certificate verification, allowing MITM attacks.

import https from "https";

function vuln() {
  // ruleid: typescript-tls-verification-disabled
  const opts = { rejectUnauthorized: false };
  https.request("https://example.com", opts);
  // ruleid: typescript-tls-verification-disabled
  let opts2 = { rejectUnauthorized: false };
  const _ = opts2;
  // ruleid: typescript-tls-verification-disabled
  var opts3 = { rejectUnauthorized: false };
  const __ = opts3;
}

function safe() {
  // ok: typescript-tls-verification-disabled
  const opts = { rejectUnauthorized: true };
  // ok: typescript-tls-verification-disabled
  let opts2 = { secure: true };
  // ok: typescript-tls-verification-disabled
  const x = "rejectUnauthorized: false";
  // ok: typescript-tls-verification-disabled
  const y = { rejectUnauthorized: true, ca: "cert" };
}
