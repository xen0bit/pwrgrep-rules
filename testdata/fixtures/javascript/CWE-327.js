// CWE-327/328/338: the fast primitive where the unpredictable one was needed.
//
// The hashes are findings on sight. The `Math.random` calls are not: most uses
// of it are right, so what decides is the name the value is given.
const crypto = require('crypto');

function weakHashMd5() {
  // ruleid: js-weak-crypto
  crypto.createHash('md5');
}

function weakHashSha1() {
  // ruleid: js-weak-crypto
  crypto.createHash('sha1');
}

function sessionToken() {
  // ruleid: js-weak-crypto
  const token = Math.random().toString(36);
  return token;
}

function resetCode() {
  // ruleid: js-weak-crypto
  let csrf = Math.random();
  return csrf;
}

function deprecatedAlias() {
  // ruleid: js-weak-crypto
  crypto.pseudoRandomBytes(16);
}

function safeHash() {
  // ok: js-weak-crypto
  crypto.createHash('sha256');
  // ok: js-weak-crypto
  crypto.createHash('sha512');
}

function safeRandom() {
  // ok: js-weak-crypto
  const token = crypto.randomBytes(16);
  // ok: js-weak-crypto
  const code = crypto.randomInt(100);
  return [token, code];
}

function ordinaryUses() {
  // ok: js-weak-crypto
  const backoff = Math.random() * 1000;
  // ok: js-weak-crypto
  const pick = items[Math.floor(Math.random() * items.length)];
  return [backoff, pick];
}
