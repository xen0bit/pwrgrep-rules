jose = require('jose');

async function signToken(payload, secret) {
  const key = new TextEncoder().encode(secret);
  // ruleid: jose-exposed-data
  return await new jose.SignJWT(payload).sign(key);
}

async function signAgain(payload, secret) {
  const key = new TextEncoder().encode(secret);
  // ruleid: jose-exposed-data
  return await new jose.SignJWT(payload).sign(key);
}

async function signThird(payload, secret) {
  const key = new TextEncoder().encode(secret);
  // ruleid: jose-exposed-data
  return await new jose.SignJWT(payload).sign(key);
}

async function verifyToken(token, secret) {
  const key = new TextEncoder().encode(secret);
  // ok: jose-exposed-data
  return await jose.jwtVerify(token, key);
}

function plain(payload) {
  // ok: jose-exposed-data
  console.log(payload);
}

function helper(secret) {
  // ok: jose-exposed-data
  return new TextEncoder().encode(secret);
}
