crypto = require('crypto');
function decNoFinal(key, iv, data) {
  // ruleid: aead-no-final
  decipher = crypto.createDecipheriv('aes-128-gcm', key, iv);
  decipher.update(data);
}
function decNoFinal2(key, iv, data) {
  // ruleid: aead-no-final
  decipher2 = crypto.createDecipheriv('aes-256-gcm', key, iv);
  decipher2.update(data);
}
function decNoFinal3(key, iv, data) {
  // ruleid: aead-no-final
  d3 = crypto.createDecipheriv('chacha20-poly1305', key, iv);
  d3.update(data);
}
function safeWithFinal(key, iv, data) {
  dec = crypto.createDecipheriv('aes-128-gcm', key, iv);
  dec.update(data);
  // ok: aead-no-final
  dec.final();
}
function safeCbc(key, iv, data) {
  d = crypto.createDecipheriv('aes-128-cbc', key, iv);
  // ok: aead-no-final
  d.update(data);
}
function safeLog(x) {
  // ok: aead-no-final
  console.log(x);
}
