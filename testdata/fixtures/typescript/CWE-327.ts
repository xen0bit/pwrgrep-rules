// CWE-327: Weak Crypto – crypto.createHash with MD5/SHA1 is broken
// and must not be used for security. Safe hashes are SHA-256 etc.

import crypto from "crypto";

function vuln() {
  // ruleid: typescript-weak-crypto
  crypto.createHash("md5");
  // ruleid: typescript-weak-crypto
  crypto.createHash("sha1");
  // ruleid: typescript-weak-crypto
  crypto.createHash("MD5");
}

function safe() {
  // ok: typescript-weak-crypto
  crypto.createHash("sha256");
  // ok: typescript-weak-crypto
  crypto.createHash("sha512");
  // ok: typescript-weak-crypto
  crypto.createHash("sha256").update("data");
}
