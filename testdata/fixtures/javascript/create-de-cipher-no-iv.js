const crypto = require('crypto');
function makeCipher(key) {
  // ruleid: create-de-cipher-no-iv
  const c1 = crypto.createCipher('aes-128-ecb', key);
  return c1;
}
function makeDecipher(key) {
  // ruleid: create-de-cipher-no-iv
  const d1 = crypto.createDecipher('aes-128-ecb', key);
  return d1;
}
function makeAgain(crypto, key) {
  // ruleid: create-de-cipher-no-iv
  const c2 = crypto.createCipher('aes-256-ecb', key);
  return c2;
}
function safeIv(crypto, key, iv) {
  // ok: create-de-cipher-no-iv
  const s1 = crypto.createCipheriv('aes-128-cbc', key, iv);
  return s1;
}
function safeDecIv(crypto, key, iv) {
  // ok: create-de-cipher-no-iv
  const s2 = crypto.createDecipheriv('aes-128-cbc', key, iv);
  return s2;
}
function safeOther(x) {
  // ok: create-de-cipher-no-iv
  console.log(x);
}
