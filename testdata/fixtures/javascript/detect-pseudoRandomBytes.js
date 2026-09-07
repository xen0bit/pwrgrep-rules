const crypto = require('crypto');

function weakToken() {
  // ruleid: detect-pseudoRandomBytes
  return crypto.pseudoRandomBytes(16);
}

function weakTokenAgain(size) {
  // ruleid: detect-pseudoRandomBytes
  return crypto.pseudoRandomBytes(size);
}

function weakHex() {
  // ruleid: detect-pseudoRandomBytes
  return crypto.pseudoRandomBytes(32).toString('hex');
}

function strongToken() {
  // ok: detect-pseudoRandomBytes
  return crypto.randomBytes(16);
}

function strongInt() {
  // ok: detect-pseudoRandomBytes
  return crypto.randomInt(100);
}

function plain() {
  // ok: detect-pseudoRandomBytes
  return 'pseudoRandomBytes in a string is not a call';
}
