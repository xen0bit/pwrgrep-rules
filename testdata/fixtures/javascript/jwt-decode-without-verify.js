const jwt = require('jsonwebtoken');

function readIt(token) {
  // ruleid: jwt-decode-without-verify
  return jwt.decode(token);
}

function readAgain(token) {
  // ruleid: jwt-decode-without-verify
  const payload = jwt.decode(token);
  return payload.sub;
}

function helper(x) {
  // ok: jwt-decode-without-verify
  return String(x);
}

function version() {
  // ok: jwt-decode-without-verify
  return '1.0.0';
}
