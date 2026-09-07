const crypto = require('crypto');
function decGcm(key, iv, data) {
  // ruleid: gcm-no-tag-length
  const d1 = crypto.createDecipheriv('aes-128-gcm', key, iv);
  return d1;
}
function decGcm256(key, iv) {
  // ruleid: gcm-no-tag-length
  const d2 = crypto.createDecipheriv('aes-256-gcm', key, iv);
  return d2;
}
function decAgain(crypto, key, iv) {
  // ruleid: gcm-no-tag-length
  const d3 = crypto.createDecipheriv('aes-128-gcm', key, iv);
  return d3;
}
function safeCbc(key, iv) {
  // ok: gcm-no-tag-length
  const s1 = crypto.createDecipheriv('aes-128-cbc', key, iv);
  return s1;
}
function safeOther(x) {
  // ok: gcm-no-tag-length
  console.log(x);
}
function safeEcb(key) {
  // ok: gcm-no-tag-length
  const s3 = crypto.createDecipher('aes-128-ecb', key);
  return s3;
}
