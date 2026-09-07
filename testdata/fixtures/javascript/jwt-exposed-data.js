const jwt = require('jsonwebtoken');

// A request-derived object reaches the signed payload.
function issueToken(req, res) {
  // ruleid: jwt-exposed-data
  return jwt.sign(req.body, 'secret', { algorithm: 'HS256' });
}

// Three-argument handlers read the same way.
function issueAgain(req, res, next) {
  // ruleid: jwt-exposed-data
  return jwt.sign(req.query, 'secret', { algorithm: 'HS256' });
}

// One hop through a local still reaches the sink.
function issueThird(req, res) {
  const data = req.body;
  // ruleid: jwt-exposed-data
  return jwt.sign(data, 'secret', { algorithm: 'HS256' });
}

// A literal object has no flow behind it.
function issueConst(req, res) {
  // ok: jwt-exposed-data
  return jwt.sign({ sub: 1 }, 'secret', { algorithm: 'HS256' });
}

function plain(a, b, c) {
  // ok: jwt-exposed-data
  return 'nothing signed here';
}
