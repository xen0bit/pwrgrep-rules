var jwt = require('jwt-simple');

function decodeNoVerify(token, secret) {
  // ruleid: jwt-simple-noverify
  return jwt.decode(token, secret, true);
}

function decodeNoVerifyAgain(token, secret) {
  // ruleid: jwt-simple-noverify
  return jwt.decode(token, secret, true);
}

function decodeNoVerifyThird(token, secret) {
  // ruleid: jwt-simple-noverify
  return jwt.decode(token, secret, true);
}

function decodeDefault(token, secret) {
  // ok: jwt-simple-noverify
  return jwt.decode(token, secret);
}

function encodeOnly(payload, secret) {
  // ok: jwt-simple-noverify
  return jwt.encode(payload, secret);
}

function plain(token) {
  // ok: jwt-simple-noverify
  console.log(token);
}
