crypto = require('crypto');
function signData(data) {
  // ruleid: hardcoded-hmac-key
  const h1 = crypto.createHmac('sha256', 'hardcoded-secret');
  return h1.update(data);
}
function signAgain(data) {
  // ruleid: hardcoded-hmac-key
  const h2 = crypto.createHmac('sha512', 'another-key');
  return h2.update(data);
}
function signThird(data) {
  // ruleid: hardcoded-hmac-key
  const h3 = crypto.createHmac('sha256', 'key123');
  return h3;
}
function safeHash(data) {
  // ok: hardcoded-hmac-key
  const s1 = crypto.createHash('sha256');
  return s1.update(data);
}
function safeRandom(data) {
  // ok: hardcoded-hmac-key
  const s2 = crypto.randomBytes(16);
  return s2;
}
function safeOther(x) {
  // ok: hardcoded-hmac-key
  console.log(x);
}
