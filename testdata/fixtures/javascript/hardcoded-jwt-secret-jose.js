var {JWT} = require("jose");

function signHardcoded(payload) {
  // ruleid: hardcoded-jwt-secret
  return JWT.sign(payload, "hardcoded");
}

function signAgain(payload) {
  // ruleid: hardcoded-jwt-secret
  return JWT.sign(payload, "s3cret");
}

function verifyHardcoded(token) {
  // ruleid: hardcoded-jwt-secret
  return JWT.verify(token, "hardcoded");
}

function signEnv(payload, secret) {
  // ok: hardcoded-jwt-secret
  return JWT.sign(payload, secret);
}

function verifyEnv(token, secret) {
  // ok: hardcoded-jwt-secret
  return JWT.verify(token, secret);
}

function plain(payload) {
  // ok: hardcoded-jwt-secret
  console.log(payload);
}
