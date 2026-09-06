// CWE-295: Improper Certificate Validation - TLS verification disabled
//
// Disabling TLS verification (rejectUnauthorized:false, verify:false or
// NODE_TLS_REJECT_UNAUTHORIZED=0) makes the connection encrypted but not
// authenticated, so a man-in-the-middle can intercept it.
const https = require('https');

function insecure1() {
  // ruleid: js-unverified-ssl
  https.request({ rejectUnauthorized: false });
}

function insecure2(url) {
  // ruleid: js-unverified-ssl
  process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = 0;
}

function insecureVerify() {
  // ruleid: js-unverified-ssl
  https.request({ verify: false });
}

function safe1() {
  // ok: js-unverified-ssl
  https.request({ rejectUnauthorized: true });
}

function safe2() {
  // ok: js-unverified-ssl
  https.request({ hostname: 'example.com', port: 443 });
}
