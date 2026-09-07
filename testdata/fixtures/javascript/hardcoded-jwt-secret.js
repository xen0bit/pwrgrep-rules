const jwt = require('jsonwebtoken');
const SECRET = 'hardcoded-secret';

function issueToken(data) {
  // ruleid: hardcoded-jwt-secret
  return jwt.sign(data, SECRET, { algorithm: 'HS256' });
}

function issueAgain(data) {
  // ruleid: hardcoded-jwt-secret
  return jwt.sign(data, 'other-secret', { algorithm: 'HS256' });
}

function issueThird(data) {
  // ruleid: hardcoded-jwt-secret
  return jwt.sign(data, SECRET);
}

function checkExpiry(token) {
  // ok: hardcoded-jwt-secret
  const payload = jwt.decode(token);
  return payload.exp;
}

function decodeToken(token) {
  // ok: hardcoded-jwt-secret
  return jwt.decode(token);
}

function plain(data) {
  // ok: hardcoded-jwt-secret
  console.log(data);
}
