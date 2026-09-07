const jwt = require('jsonwebtoken');

function issueToken(a, payload, c) {
  // ruleid: jwt-exposed-data
  return jwt.sign(payload, 'secret', { algorithm: 'HS256' });
}

function issueAgain(a, payload, c) {
  // ruleid: jwt-exposed-data
  return jwt.sign(payload, 'secret', { algorithm: 'HS256' });
}

function issueThird(a, payload, c) {
  // ruleid: jwt-exposed-data
  return jwt.sign(payload, 'secret', { algorithm: 'HS256' });
}

function issueConst(a, b, c) {
  // ok: jwt-exposed-data
  return jwt.sign({ sub: 1 }, 'secret', { algorithm: 'HS256' });
}

function issueTwo(payload, opts) {
  // ok: jwt-exposed-data
  return jwt.sign(payload, 'secret', { algorithm: 'HS256' });
}

function plain(a, b, c) {
  // ok: jwt-exposed-data
  return 'nothing signed here';
}
